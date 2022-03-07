//
//  ButtonStyles.swift
//  TipJar
//
//  Created by Jackie Ramos on 3/5/22.
//

import SwiftUI

public extension ButtonStyle {
    func customOpacity(_ config: Configuration) -> CGFloat {
        config.isPressed ? 0.5 : 1
    }
}

struct CircularButtonStyle: ButtonStyle {
    enum Style {
        case `default`

        var backgroundColor: Color {
            switch self {
            case .default:
                return .clear
            }
        }

        var isBordered: Bool {
            switch self {
            case .default:
                return true
            }
        }

        var borderColor: Color {
            switch self {
            case .default:
                return Color("d2d2d2")
            }
        }
    }

    public var size: CGFloat
    public var style: Style = .default

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size)
            .opacity(customOpacity(configuration))
            .background(style.backgroundColor)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(style.borderColor, lineWidth: style.isBordered ? 1 : 0)
            )
    }
}

struct CheckboxButtonStyle: ButtonStyle {
    enum Style {
        case `default`

        var cornerRadius: CGFloat {
            switch self {
            case .default:
                return .radius7
            }
        }

        var backgroundColor: Color {
            switch self {
            case .default:
                return .clear
            }
        }

        var isBordered: Bool {
            switch self {
            case .default:
                return true
            }
        }

        func borderColor(_ isSelected: Bool) -> Color {
            switch self {
            case .default:
                return isSelected ? Color("f1790a") : Color("e5e5e5")
            }
        }
    }

    public var style: Style = .default
    public var isSelected: Bool = false

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 31, height: 31)
            .opacity(customOpacity(configuration))
            .background(style.backgroundColor)
            .cornerRadius(style.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .stroke(style.borderColor(isSelected), lineWidth: style.isBordered ? 1 : 0)
            )
    }
}

struct CallToActionGradientButtonStyle: ButtonStyle {

    enum CTAStyle {
        case `default`

        var cornerRadius: CGFloat {
            switch self {
            case .default:
                return .radius12
            }
        }

        var background: LinearGradient {
            switch self {
            case .default:
                return LinearGradient(gradient: Gradient(colors: [Color("f27a0a"), Color("d26e11")]), startPoint: .top, endPoint: .bottom)
            }
        }

        var isBordered: Bool {
            switch self {
            case .default:
                return true
            }
        }

        var border: LinearGradient {
            switch self {
            case .default:
                return LinearGradient(gradient: Gradient(colors: [.white.opacity(0.1936), .black.opacity(0.198)]), startPoint: .top, endPoint: .bottom)
            }
        }
    }

    public var ctaStyle: CTAStyle = .default

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, .spacing16)
            .opacity(customOpacity(configuration))
            .foregroundColor(.white)
            .background(ctaStyle.background)
            .cornerRadius(ctaStyle.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: .radius12)
                    .stroke(ctaStyle.border, lineWidth: ctaStyle.isBordered ? 1 : 0)
            )
    }
}
