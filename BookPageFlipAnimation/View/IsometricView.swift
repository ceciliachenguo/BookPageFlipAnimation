//
//  IsometricView.swift
//  BookPageFlipAnimation
//
//  Created by Cecilia Chen on 8/4/23.
//

import SwiftUI

// MARK: Animatable Projection Transform
struct CustomProjection: GeometryEffect{
    var value: CGFloat
    
    var animatableData: CGFloat{
        get{
            return value
        }
        set{
            value = newValue
        }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        var transform = CATransform3DIdentity
        transform.m11 = (value == 0 ? 0.0001 : value)
        return .init(transform)
    }
}

// MARK: Custom View
struct IsometricView<Content: View,Bottom: View,Side: View>: View{
    var content: Content
    var bottom: Bottom
    var side: Side
    
    // MARK: Isometric Depth
    var depth: CGFloat
    
    init(depth: CGFloat,@ViewBuilder content: @escaping()->Content,@ViewBuilder bottom: @escaping()->Bottom,@ViewBuilder side: @escaping()->Side) {
        self.depth = depth
        self.content = content()
        self.bottom = bottom()
        self.side = side()
    }
    
    var body: some View{
        Color.clear
        // FOR GEOMETRY TO TAKE THE SPECIFIED SPACE
            .overlay {
                GeometryReader{
                    let size = $0.size
                    
                    ZStack{
                        content
                        
                        bottom
                            .scaleEffect(y: depth,anchor: .bottom)
                            .frame(height: depth,alignment: .bottom)
                            // MARK: Dimming Content With Blur
                            .overlay(content: {
                                Rectangle()
                                    .fill(.black.opacity(0.25))
                                    .blur(radius: 2.5)
                            })
                            .clipped()
                            // MARK: Applying Transforms
                            // MARK: Your Custom Projection Values
                            .projectionEffect(.init(.init(a: 1, b: 0, c: 1, d: 1, tx: 0, ty: 0)))
                            .offset(y: depth)
                            .frame(maxHeight: .infinity,alignment: .bottom)
                        
                        side
                            .scaleEffect(x: depth,anchor: .trailing)
                            .frame(width: depth,alignment: .trailing)
                            .overlay(content: {
                                Rectangle()
                                    .fill(.black.opacity(0.25))
                                    .blur(radius: 2.5)
                            })
                            .clipped()
                            // MARK: Applying Transforms
                            // MARK: Your Custom Projection Values
                            .projectionEffect(.init(.init(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
                            // MARK: Change Offset, Transform Values for your Wish
                            .offset(x: depth)
                            .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    .frame(width: size.width, height: size.height)
                }
            }
    }
}
