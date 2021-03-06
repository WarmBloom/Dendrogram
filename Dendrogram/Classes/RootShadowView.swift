//  RootShadowView.swift
//  Dendrogram
//
//  Created by 唐佳诚 on 2020/11/23.
//

import yoga

struct RootShadowView {

    // 单元测试需要 internal
    let shadowView: ShadowView

    /**
     * Minimum size to layout all views.
     * Defaults to CGSizeZero
     */
    var minimumSize: CGSize

    /**
     * Available size to layout all views.
     * Defaults to {INFINITY, INFINITY}
     */
    var availableSize: CGSize

    /**
     * Layout direction (LTR or RTL) inherited from native environment and
     * is using as a base direction value in layout engine.
     * Defaults to value inferred from current locale.
     */
    private var baseDirection: YGDirection

    init(shadowView: ShadowView) {
        self.shadowView = shadowView
        baseDirection = .LTR
        minimumSize = .zero
        availableSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    }

    // Unit Test
    func layout(affectedShadowViews: NSHashTable<ShadowView>) {
        let other = NSHashTable<NSString>()

        var layoutContext = LayoutContext(absolutePosition: .zero, affectedShadowViews: affectedShadowViews, other: other)

        shadowView.layout(minimumSize: minimumSize, maximumSize: availableSize, layoutDirection: UIKitLayoutDirectionFromYogaLayoutDirection(baseDirection), layoutContext: &layoutContext)
    }
}
