//
//  WG_VIEW+wg_AutoLayout.m
//  Github <https://github.com/netyouli/wg_AutoLayoutKit>
//
//  Created by 吴海超 on 16/2/17.
//  Copyright © 2016年 吴海超. All rights reserved.
//

//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIView+WG_AutoLayout.h"
#import <objc/runtime.h>

static inline WG_CLASS_LGUIDE * layout_guide(WG_VIEW * view) {
    if (view && [view isKindOfClass:WG_CLASS_LGUIDE.self]) {
        return (WG_CLASS_LGUIDE *)view;
    }
    return nil;
}

static inline WG_CLASS_VIEW * view(WG_VIEW * view) {
    if (view && [view isKindOfClass:WG_CLASS_VIEW.self]) {
        return (WG_CLASS_VIEW *)view;
    }
    return nil;
}

static inline WG_CLASS_VIEW * owningView(WG_VIEW * view) {
    if (view) {
        if ([view isKindOfClass:WG_CLASS_VIEW.self]) {
            return (WG_CLASS_VIEW *)view;
        }
        if ([view isKindOfClass:WG_CLASS_LGUIDE.self]) {
            return ((WG_CLASS_LGUIDE *)view).owningView;
        }
    }
    return nil;
}

#pragma mark - UI自动布局 -

@interface wg_Line : WG_CLASS_VIEW
@end

@implementation wg_Line
@end

@interface wg_Data: NSObject
@property (nonatomic, assign) BOOL isSameSuper;
@property (nonatomic, strong) WG_CLASS_VIEW * superView;
@end

@implementation wg_Data
@end

@implementation WG_CLASS_VIEW (wg_AutoLayout)

- (void)setCurrentConstraint:(NSLayoutConstraint *)currentConstraint {
    objc_setAssociatedObject(self, @selector(currentConstraint), currentConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)currentConstraint {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setLeftLessConstraint:leftConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setLeftGreaterConstraint:leftConstraint];
        default:
            [self setLeftConstraint:leftConstraint];
            break;
    }
}

- (NSLayoutConstraint *)leftConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self leftGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self leftLessConstraint];
        default:
            return [self leftConstraint];
    }
}

- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeftLessConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftLessConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeftGreaterConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftGreaterConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setRightLessConstraint:rightConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setRightGreaterConstraint:rightConstraint];
        default:
            [self setRightConstraint:rightConstraint];
            break;
    }
}

- (NSLayoutConstraint *)rightConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self rightGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self rightLessConstraint];
        default:
            return [self rightConstraint];
    }
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightLessConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightLessConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightGreaterConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightGreaterConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setTopLessConstraint:topConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setTopGreaterConstraint:topConstraint];
        default:
            [self setTopConstraint:topConstraint];
            break;
    }
}

- (NSLayoutConstraint *)topConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self topGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self topLessConstraint];
        default:
            return [self topConstraint];
    }
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopLessConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topLessConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopGreaterConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topGreaterConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setBottomLessConstraint:bottomConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setBottomGreaterConstraint:bottomConstraint];
        default:
            [self setBottomConstraint:bottomConstraint];
            break;
    }
}

- (NSLayoutConstraint *)bottomConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self bottomGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self bottomLessConstraint];
        default:
            return [self bottomConstraint];
    }
}


- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomLessConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomLessConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomGreaterConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomGreaterConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeadingConstraint:(NSLayoutConstraint *)leadingConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setLeadingLessConstraint:leadingConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setLeadingGreaterConstraint:leadingConstraint];
        default:
            [self setLeadingConstraint:leadingConstraint];
            break;
    }
}

- (NSLayoutConstraint *)leadingConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self leadingGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self leadingLessConstraint];
        default:
            return [self leadingConstraint];
    }
}

- (void)setLeadingConstraint:(NSLayoutConstraint *)leadingConstraint {
    objc_setAssociatedObject(self, @selector(leadingConstraint), leadingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leadingConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeadingLessConstraint:(NSLayoutConstraint *)leadingConstraint {
    objc_setAssociatedObject(self, @selector(leadingLessConstraint), leadingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leadingLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeadingGreaterConstraint:(NSLayoutConstraint *)leadingConstraint {
    objc_setAssociatedObject(self, @selector(leadingGreaterConstraint), leadingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leadingGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTrailingConstraint:(NSLayoutConstraint *)trailingConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setTrailingLessConstraint:trailingConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setTrailingGreaterConstraint:trailingConstraint];
        default:
            [self setTrailingConstraint:trailingConstraint];
            break;
    }
}

- (NSLayoutConstraint *)trailingConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self trailingGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self trailingLessConstraint];
        default:
            return [self trailingConstraint];
    }
}

- (void)setTrailingConstraint:(NSLayoutConstraint *)trailingConstraint {
    objc_setAssociatedObject(self, @selector(trailingConstraint), trailingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)trailingConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTrailingLessConstraint:(NSLayoutConstraint *)trailingConstraint {
    objc_setAssociatedObject(self, @selector(trailingLessConstraint), trailingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)trailingLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTrailingGreaterConstraint:(NSLayoutConstraint *)trailingConstraint {
    objc_setAssociatedObject(self, @selector(trailingGreaterConstraint), trailingConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)trailingGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setWidthLessConstraint:widthConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setWidthGreaterConstraint:widthConstraint];
        default:
            [self setWidthConstraint:widthConstraint];
            break;
    }
}

- (NSLayoutConstraint *)widthConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self widthGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self widthLessConstraint];
        default:
            return [self widthConstraint];
    }
}


- (void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthLessConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthLessConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthGreaterConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthGreaterConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setHeightLessConstraint:heightConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setHeightGreaterConstraint:heightConstraint];
        default:
            [self setHeightConstraint:heightConstraint];
            break;
    }
}

- (NSLayoutConstraint *)heightConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self heightGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self heightLessConstraint];
        default:
            return [self heightConstraint];
    }
}

- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightLessConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightLessConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightGreaterConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightGreaterConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setCenterXLessConstraint:centerXConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setCenterXGreaterConstraint:centerXConstraint];
        default:
            [self setCenterXConstraint:centerXConstraint];
            break;
    }
}

- (NSLayoutConstraint *)centerXConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self centerXGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self centerXLessConstraint];
        default:
            return [self centerXConstraint];
    }
}


- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXLessConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXLessConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXGreaterConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXGreaterConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setCenterYLessConstraint:centerYConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setCenterYGreaterConstraint:centerYConstraint];
        default:
            [self setCenterYConstraint:centerYConstraint];
            break;
    }
}

- (NSLayoutConstraint *)centerYConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self centerYGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self centerYLessConstraint];
        default:
            return [self centerYConstraint];
    }
}

- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYLessConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYLessConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYGreaterConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYGreaterConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineConstraint:(NSLayoutConstraint *)lastBaselineConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setLastBaselineLessConstraint:lastBaselineConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setLastBaselineGreaterConstraint:lastBaselineConstraint];
        default:
            [self setLastBaselineConstraint:lastBaselineConstraint];
            break;
    }
}

- (NSLayoutConstraint *)lastBaselineConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self lastBaselineGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self lastBaselineLessConstraint];
        default:
            return [self lastBaselineConstraint];
    }
}


- (void)setLastBaselineConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineLessConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineLessConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineGreaterConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineGreaterConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineConstraint:(NSLayoutConstraint *)firstBaselineConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setFirstBaselineLessConstraint:firstBaselineConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setFirstBaselineGreaterConstraint:firstBaselineConstraint];
        default:
            [self setFirstBaselineConstraint:firstBaselineConstraint];
            break;
    }
}

- (NSLayoutConstraint *)firstBaselineConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self firstBaselineGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self firstBaselineLessConstraint];
        default:
            return [self firstBaselineConstraint];
    }
}

- (void)setFirstBaselineConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineLessConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineLessConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineGreaterConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineGreaterConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSafe:(BOOL)safe {
    objc_setAssociatedObject(self, @selector(isSafe), @(safe), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isSafe {
    NSNumber * value = objc_getAssociatedObject(self, _cmd);
    if (value) {
        return value.boolValue;
    }
    return NO;
}

#pragma mark - removeConstraint api v2.0 -

- (IsSafe)wg_IsSafe {
    __weak typeof(self) weakSelf = self;
    return ^(BOOL safe) {
        [weakSelf setSafe:safe];
        return weakSelf;
    };
}

- (LessOrEqual)wg_LessOrEqual {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_HandleConstraintsRelation:NSLayoutRelationLessThanOrEqual];
        return weakSelf;
    };
}

- (GreaterOrEqual)wg_GreaterOrEqual {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_HandleConstraintsRelation:NSLayoutRelationGreaterThanOrEqual];
        return weakSelf;
    };
}

- (ResetConstraintAttribute)wg_ResetConstraint {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_ResetConstraints];
        return weakSelf;
    };
}

- (RemoveConstraintAttribute)wg_RemoveLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [weakSelf wg_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [weakSelf wg_SwitchRemoveAttr:attributes view:weakSelf.superview to:nil removeSelf:YES];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (RemoveConstraintFromViewAttribute)wg_RemoveFromLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(WG_CLASS_VIEW * view,NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [weakSelf wg_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [weakSelf wg_SwitchRemoveAttr:attributes view:view to:nil removeSelf:NO];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (RemoveConstraintToViewAttribute)wg_RemoveToLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * toView, NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [self wg_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [weakSelf wg_SwitchRemoveAttr:attributes view:self.superview to:toView removeSelf:NO];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (ClearConstraintAttribute)wg_ClearLayoutAttr {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_ClearLayoutAttrs];
        return weakSelf;
    };
}

#pragma mark - constraintsPriority api v2.0 -

- (PriorityLow)wg_PriorityLow {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_priorityLow];
        return weakSelf;
    };
}

- (PriorityHigh)wg_PriorityHigh {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_priorityHigh];
        return weakSelf;
    };
}

- (PriorityRequired)wg_PriorityRequired {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_priorityRequired];
        return weakSelf;
    };
}

- (PriorityFitting)wg_PriorityFitting {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_priorityFitting];
        return weakSelf;
    };
}

- (PriorityValue)wg_Priority {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_priority:value];
        return weakSelf;
    };
}

- (ContentCompressionResistancePriority)wg_ContentCompressionResistancePriority {
    __weak typeof(self) weakSelf = self;
    return ^(WG_LayoutPriority priority, WG_ConstraintAxis axis) {
        #if TARGET_OS_IPHONE || TARGET_OS_TV
        [weakSelf setContentCompressionResistancePriority:priority forAxis:axis];
        #elif TARGET_OS_MAC
        [weakSelf setContentCompressionResistancePriority:priority forOrientation:axis];
        #endif
        return weakSelf;
    };
}

- (ContentHuggingPriority)wg_ContentHuggingPriority {
    __weak typeof(self) weakSelf = self;
    return ^(WG_LayoutPriority priority, WG_ConstraintAxis axis) {
        #if TARGET_OS_IPHONE || TARGET_OS_TV
        [weakSelf setContentHuggingPriority:priority forAxis:axis];
        #elif TARGET_OS_MAC
        [weakSelf setContentHuggingPriority:priority forOrientation:axis];
        #endif
        return weakSelf;
    };
}

#pragma mark - api version 2.0 -
- (LeftSpace)wg_LeftSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_LeftSpace:space];
        return weakSelf;
    };
}

- (LeftSpaceToView)wg_LeftSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space, WG_VIEW * toView) {
        [weakSelf wg_LeftSpace:space toView:toView];
        return weakSelf;
    };
}

- (LeftSpaceEqualView)wg_LeftSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_LeftSpaceEqualView:view];
        return weakSelf;
    };
}

- (LeftSpaceEqualViewOffset)wg_LeftSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_LeftSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

- (LeadingSpace)wg_LeadingSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_LeadingSpace:space];
        return weakSelf;
    };
}

- (LeadingSpaceToView)wg_LeadingSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_LeadingSpace:value toView:toView];
        return weakSelf;
    };
}

- (LeadingSpaceEqualView)wg_LeadingSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_LeadingSpaceEqualView:view];
        return weakSelf;
    };
}

- (LeadingSpaceEqualViewOffset)wg_LeadingSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_LeadingSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

- (TrailingSpace)wg_TrailingSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_TrailingSpace:space];
        return weakSelf;
    };
}

- (TrailingSpaceToView)wg_TrailingSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_TrailingSpace:value toView:toView];
        return weakSelf;
    };
}

- (TrailingSpaceEqualView)wg_TrailingSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_TrailingSpaceEqualView:view];
        return weakSelf;
    };
}

- (TrailingSpaceEqualViewOffset)wg_TrailingSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_TrailingSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
- (BaseLineSpace)wg_FirstBaseLine {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_FirstBaseLine:space];
        return weakSelf;
    };
}

- (BaseLineSpaceToView)wg_FirstBaseLineToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_FirstBaseLine:value toView:toView];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualView)wg_FirstBaseLineEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_FirstBaseLineEqualView:view];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualViewOffset)wg_FirstBaseLineEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_FirstBaseLineEqualView:view offset:offset];
        return weakSelf;
    };
}

#endif

- (BaseLineSpace)wg_LastBaseLine {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_LastBaseLine:space];
        return weakSelf;
    };
}

- (BaseLineSpaceToView)wg_LastBaseLineToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_LastBaseLine:value toView:toView];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualView)wg_LastBaseLineEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_LastBaseLineEqualView:view];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualViewOffset)wg_LastBaseLineEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_LastBaseLineEqualView:view offset:offset];
        return weakSelf;
    };
}

- (RightSpace)wg_RightSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_RightSpace:space];
        return weakSelf;
    };
}

- (RightSpaceToView)wg_RightSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_RightSpace:value toView:toView];
        return weakSelf;
    };
}

- (RightSpaceEqualView)wg_RightSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * toView) {
        [weakSelf wg_RightSpaceEqualView:toView];
        return weakSelf;
    };
}

- (RightSpaceEqualViewOffset)wg_RightSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * toView, CGFloat offset) {
        [weakSelf wg_RightSpaceEqualView:toView offset:offset];
        return weakSelf;
    };
}

- (TopSpace)wg_TopSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_TopSpace:space];
        return weakSelf;
    };
}

- (TopSpaceToView)wg_TopSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_TopSpace:value toView:toView];
        return weakSelf;
    };
}

- (TopSpaceEqualView)wg_TopSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_TopSpaceEqualView:view];
        return weakSelf;
    };
}

- (TopSpaceEqualViewOffset)wg_TopSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view, CGFloat offset) {
        [weakSelf wg_TopSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

- (BottomSpace)wg_BottomSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf wg_BottomSpace:space];
        return weakSelf;
    };
}

- (BottomSpaceToView)wg_BottomSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , WG_VIEW * toView) {
        [weakSelf wg_BottomSpace:value toView:toView];
        return weakSelf;
    };
}

- (BottomSpaceEqualView)wg_BottomSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * toView) {
        [weakSelf wg_BottomSpaceEqualView:toView];
        return weakSelf;
    };
}

- (BottomSpaceEqualViewOffset)wg_BottomSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * toView, CGFloat offset) {
        [weakSelf wg_BottomSpaceEqualView:toView offset:offset];
        return weakSelf;
    };
}

- (Width)wg_Width {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_Width:value];
        return weakSelf;
    };
}

- (WidthAuto)wg_WidthAuto {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_AutoWidth];
        return weakSelf;
    };
}

- (WidthEqualView)wg_WidthEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_WidthEqualView:view];
        return weakSelf;
    };
}

- (WidthEqualViewRatio)wg_WidthEqualViewRatio {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view , CGFloat value) {
        [weakSelf wg_WidthEqualView:view ratio:value];
        return weakSelf;
    };
}

- (WidthHeightRatio)wg_WidthHeightRatio {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_WidthHeightRatio:value];
        return weakSelf;
    };
}

- (Height)wg_Height {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_Height:value];
        return weakSelf;
    };
}

- (HeightAuto)wg_HeightAuto {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf wg_AutoHeight];
        return weakSelf;
    };
}

- (HeightEqualView)wg_HeightEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_HeightEqualView:view];
        return weakSelf;
    };
}

- (HeightEqualViewRatio)wg_HeightEqualViewRatio {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view , CGFloat value) {
        [weakSelf wg_HeightEqualView:view ratio:value];
        return weakSelf;
    };
}

- (HeightWidthRatio)wg_HeightWidthRatio {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_HeightWidthRatio:value];
        return weakSelf;
    };
}

- (CenterX)wg_CenterX {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_CenterX:value];
        return weakSelf;
    };
}

- (CenterXToView)wg_CenterXToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value,WG_VIEW * toView) {
        [weakSelf wg_CenterX:value toView:toView];
        return weakSelf;
    };
}

- (CenterY)wg_CenterY {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf wg_CenterY:value];
        return weakSelf;
    };
}

- (CenterYToView)wg_CenterYToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value,WG_VIEW * toView) {
        [weakSelf wg_CenterY:value toView:toView];
        return weakSelf;
    };
}

- (Center)wg_Center {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat x, CGFloat y) {
        [weakSelf wg_Center:CGPointMake(x, y)];
        return weakSelf;
    };
}

- (CenterToView)wg_CenterToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGPoint center,WG_VIEW * toView) {
        [weakSelf wg_Center:center toView:toView];
        return weakSelf;
    };
}

- (size)wg_Size {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat width, CGFloat height) {
        [weakSelf wg_Size:CGSizeMake(width, height)];
        return weakSelf;
    };
}

- (SizeEqual)wg_SizeEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_SizeEqualView:view];
        return weakSelf;
    };
}

- (FrameEqual)wg_FrameEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(WG_VIEW * view) {
        [weakSelf wg_FrameEqualView:view];
        return weakSelf;
    };
}

#pragma mark - removeConstraint api v1.0 -

- (WG_CLASS_VIEW *)wg_IsSafe:(BOOL)safe {
    [self setSafe:safe];
    return self;
}

- (NSLayoutAttribute)wg_GetMaxLayoutAttribute {
    NSLayoutAttribute maxAttr = NSLayoutAttributeNotAnAttribute;
#if TARGET_OS_IPHONE || TARGET_OS_TV
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)
    maxAttr = NSLayoutAttributeCenterYWithinMargins;
#else
    maxAttr = NSLayoutAttributeLastBaseline;
#endif
    
#elif TARGET_OS_MAC
#if (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    maxAttr = NSLayoutAttributeFirstBaseline;
#else
    maxAttr = NSLayoutAttributeLastBaseline;
#endif
    
#endif
    return maxAttr;
}

- (WG_CLASS_VIEW *)wg_MainViewConstraint:(NSLayoutConstraint *)constraint {
    WG_CLASS_VIEW * view = nil;
    if (constraint) {
        if (constraint.secondAttribute == NSLayoutAttributeNotAnAttribute ||
            constraint.secondItem == nil) {
            view = constraint.firstItem;
        }else if (constraint.firstAttribute == NSLayoutAttributeNotAnAttribute ||
                  constraint.firstItem == nil){
            view = constraint.firstItem;
        }else {
            id firstItem = constraint.firstItem;
            id secondItem = constraint.secondItem;
            view = [self mainSuperView:secondItem view2:firstItem];
            if (!view) {
                view = [self mainSuperView:firstItem view2:secondItem];
            }
        }
    }
    return view;
}

- (void)wg_CommonRemoveConstraint:(NSLayoutAttribute)attribute view:(WG_CLASS_VIEW *)mainView to:(WG_VIEW *)toView {
    NSLayoutConstraint * constraint = nil;
    WG_CLASS_VIEW * view = nil;
    switch (attribute) {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:
            constraint = [self firstBaselineConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineConstraint:nil];
            }
            constraint = [self firstBaselineLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineLessConstraint:nil];
            }
            constraint = [self firstBaselineGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineGreaterConstraint:nil];
            }
            break;
#endif
        case NSLayoutAttributeLastBaseline:
            constraint = [self lastBaselineConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineConstraint:nil];
            }
            constraint = [self lastBaselineLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineLessConstraint:nil];
            }
            constraint = [self lastBaselineGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeCenterY:
            constraint = [self centerYConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYConstraint:nil];
            }
            constraint = [self centerYLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYLessConstraint:nil];
            }
            constraint = [self centerYGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeCenterX:
            constraint = [self centerXConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXConstraint:nil];
            }
            constraint = [self centerXLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXLessConstraint:nil];
            }
            constraint = [self centerXGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeTrailing:
            constraint = [self trailingConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTrailingConstraint:nil];
            }
            constraint = [self trailingLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTrailingLessConstraint:nil];
            }
            constraint = [self trailingGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTrailingGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeLeading:
            constraint = [self leadingConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeadingConstraint:nil];
            }
            constraint = [self leadingLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeadingLessConstraint:nil];
            }
            constraint = [self leadingGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeadingGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeBottom:
            constraint = [self bottomConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomConstraint:nil];
            }
            constraint = [self bottomLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomLessConstraint:nil];
            }
            constraint = [self bottomGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeTop:
            constraint = [self topConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopConstraint:nil];
            }
            constraint = [self topLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopLessConstraint:nil];
            }
            constraint = [self topGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeRight:
            constraint = [self rightConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightConstraint:nil];
            }
            constraint = [self rightLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightLessConstraint:nil];
            }
            constraint = [self rightGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeLeft:
            constraint = [self leftConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftConstraint:nil];
            }
            constraint = [self leftLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftLessConstraint:nil];
            }
            constraint = [self leftGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeWidth:
            constraint = [self widthConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthConstraint:nil];
            }
            constraint = [self widthLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthLessConstraint:nil];
            }
            constraint = [self widthGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthGreaterConstraint:nil];
            }
            break;
        case NSLayoutAttributeHeight:
            constraint = [self heightConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightConstraint:nil];
            }
            constraint = [self heightLessConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightLessConstraint:nil];
            }
            constraint = [self heightGreaterConstraint];
            if (constraint) {
                view = [self wg_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightGreaterConstraint:nil];
            }
            break;
        default:
            break;
    }
    if (mainView) {
        NSArray<NSLayoutConstraint *> * constraints = mainView.constraints;
        [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id linkView = (toView != nil ? toView : mainView);
            if ((obj.firstItem == self &&
                 obj.firstAttribute == attribute &&
                 (obj.secondItem == linkView || obj.secondItem == nil)) ||
                (obj.firstItem == linkView &&
                 obj.secondItem == self &&
                 obj.secondAttribute == attribute)) {
                    [mainView removeConstraint:obj];
                }
        }];
    }
}

- (void)wg_SwitchRemoveAttr:(NSLayoutAttribute)attr view:(WG_CLASS_VIEW *)view to:(WG_VIEW *)toView removeSelf:(BOOL)removeSelf {
    switch (attr) {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:
#endif
#if ((TARGET_OS_IPHONE || TARGET_OS_TV) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000))
        case NSLayoutAttributeLeftMargin:
        case NSLayoutAttributeRightMargin:
        case NSLayoutAttributeTopMargin:
        case NSLayoutAttributeBottomMargin:
        case NSLayoutAttributeLeadingMargin:
        case NSLayoutAttributeTrailingMargin:
        case NSLayoutAttributeCenterXWithinMargins:
        case NSLayoutAttributeCenterYWithinMargins:
#endif
        case NSLayoutAttributeLastBaseline:
        case NSLayoutAttributeCenterY:
        case NSLayoutAttributeCenterX:
        case NSLayoutAttributeTrailing:
        case NSLayoutAttributeLeading:
        case NSLayoutAttributeBottom:
        case NSLayoutAttributeTop:
        case NSLayoutAttributeRight:
        case NSLayoutAttributeLeft:
            [self wg_CommonRemoveConstraint:attr view:view to:toView];
            break;
        case NSLayoutAttributeWidth:
        case NSLayoutAttributeHeight:
            if (removeSelf) {
                [self wg_CommonRemoveConstraint:attr view:self to:toView];
            }
            [self wg_CommonRemoveConstraint:attr view:view to:toView];
            break;
        default:
            break;
    }
}

- (WG_VIEW *)wg_ResetConstraints {

    NSLayoutConstraint * constraint = [self firstBaselineConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setFirstBaselineConstraint:nil];
    }
    constraint = [self firstBaselineLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setFirstBaselineLessConstraint:nil];
    }
    constraint = [self firstBaselineGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setFirstBaselineGreaterConstraint:nil];
    }
    
    constraint = [self lastBaselineConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLastBaselineConstraint:nil];
    }
    constraint = [self lastBaselineLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLastBaselineLessConstraint:nil];
    }
    constraint = [self lastBaselineGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLastBaselineGreaterConstraint:nil];
    }
    
    constraint = [self centerYConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterYConstraint:nil];
    }
    constraint = [self centerYLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterYLessConstraint:nil];
    }
    constraint = [self centerYGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterYGreaterConstraint:nil];
    }
    
    constraint = [self centerXConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterXConstraint:nil];
    }
    constraint = [self centerXLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterXLessConstraint:nil];
    }
    constraint = [self centerXGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setCenterXGreaterConstraint:nil];
    }
    
    constraint = [self trailingConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTrailingConstraint:nil];
    }
    constraint = [self trailingLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTrailingLessConstraint:nil];
    }
    constraint = [self trailingGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTrailingGreaterConstraint:nil];
    }
    
    constraint = [self leadingConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeadingConstraint:nil];
    }
    constraint = [self leadingLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeadingLessConstraint:nil];
    }
    constraint = [self leadingGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeadingGreaterConstraint:nil];
    }
    
    constraint = [self bottomConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setBottomConstraint:nil];
    }
    constraint = [self bottomLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setBottomLessConstraint:nil];
    }
    constraint = [self bottomGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setBottomGreaterConstraint:nil];
    }
    
    constraint = [self topConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTopConstraint:nil];
    }
    constraint = [self topLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTopLessConstraint:nil];
    }
    constraint = [self topGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setTopGreaterConstraint:nil];
    }

    constraint = [self rightConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setRightConstraint:nil];
    }
    constraint = [self rightLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setRightLessConstraint:nil];
    }
    constraint = [self rightGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setRightGreaterConstraint:nil];
    }

    constraint = [self leftConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeftConstraint:nil];
    }
    constraint = [self leftLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeftLessConstraint:nil];
    }
    constraint = [self leftGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setLeftGreaterConstraint:nil];
    }
    
    constraint = [self widthConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setWidthConstraint:nil];
    }
    constraint = [self widthLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setWidthLessConstraint:nil];
    }
    constraint = [self widthGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setWidthGreaterConstraint:nil];
    }
    
    constraint = [self heightConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setHeightConstraint:nil];
    }
    constraint = [self heightLessConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setHeightLessConstraint:nil];
    }
    constraint = [self heightGreaterConstraint];
    if (constraint) {
        [self removeCacheConstraint:constraint];
        [self setHeightGreaterConstraint:nil];
    }
    return self;
}

- (WG_CLASS_VIEW *)wg_ClearLayoutAttrs {
    @autoreleasepool {
        NSArray<NSLayoutConstraint *> * constraints = self.constraints;
        if (constraints) {
            [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.firstItem == self &&
                    obj.secondAttribute == NSLayoutAttributeNotAnAttribute) {
                    [self removeConstraint:obj];
                }
            }];
        }
        WG_CLASS_VIEW * superView = self.superview;
        if (superView) {
            constraints = superView.constraints;
            if (constraints) {
                [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (obj.firstItem == self || obj.secondItem == self) {
                        [superView removeConstraint:obj];
                    }
                }];
            }
        }
        [self wg_ResetConstraints];
    }
    return self;
}

- (WG_CLASS_VIEW *)wg_RemoveFrom:(WG_CLASS_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self wg_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self wg_SwitchRemoveAttr:attributes view:view to:nil removeSelf:NO];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

- (WG_CLASS_VIEW *)wg_RemoveFrom:(WG_CLASS_VIEW *)view layoutAttr:(NSLayoutAttribute)attribute {
    return [self wg_RemoveFrom:view layoutAttrs:attribute];
}

- (WG_CLASS_VIEW *)wg_RemoveLayoutAttr:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self wg_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self wg_SwitchRemoveAttr:attributes view:self.superview to:nil removeSelf:YES];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

- (WG_CLASS_VIEW *)wg_RemoveLayoutOneAttr:(NSLayoutAttribute)attribute {
    NSLayoutAttribute maxAttr = [self wg_GetMaxLayoutAttribute];
    if (attribute > NSLayoutAttributeNotAnAttribute && attribute <= maxAttr) {
        [self wg_SwitchRemoveAttr:attribute view:self.superview to:nil removeSelf:YES];
    }
    return self;
}

- (WG_CLASS_VIEW *)wg_RemoveTo:(WG_VIEW *)view attr:(NSLayoutAttribute)attribute {
    return [self wg_RemoveTo:view layoutAttrs:attribute];
}

- (WG_CLASS_VIEW *)wg_RemoveTo:(WG_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self wg_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self wg_SwitchRemoveAttr:attributes view:self.superview to:view removeSelf:NO];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

#pragma mark - constraintsPriority api v1.0 -

- (WG_CLASS_VIEW *)wg_HandleConstraintsRelation:(NSLayoutRelation)relation {
    NSLayoutConstraint * constraints = [self currentConstraint];
    if (constraints && constraints.relation != relation) {
        NSLayoutConstraint * tmpConstraints = [NSLayoutConstraint constraintWithItem:constraints.firstItem attribute:constraints.firstAttribute relatedBy:relation toItem:constraints.secondItem attribute:constraints.secondAttribute multiplier:constraints.multiplier constant:constraints.constant];
        WG_CLASS_VIEW * mainView = [self wg_MainViewConstraint:constraints];
        if (mainView) {
            [mainView removeConstraint:constraints];
            [self setCacheConstraint:nil attribute:constraints.firstAttribute relation:constraints.relation];
            [mainView addConstraint:tmpConstraints];
            [self setCacheConstraint:tmpConstraints attribute:tmpConstraints.firstAttribute relation:tmpConstraints.relation];
            [self setCurrentConstraint:tmpConstraints];
        }
    }
    return self;
}

- (WG_CLASS_VIEW *)wg_HandleConstraintsPriority:(WG_LayoutPriority)priority {
    NSLayoutConstraint * constraints = [self currentConstraint];
    if (constraints && constraints.priority != priority) {
#if TARGET_OS_IPHONE || TARGET_OS_TV
        if (constraints.priority == UILayoutPriorityRequired) {
#elif TARGET_OS_MAC
        if (constraints.priority == NSLayoutPriorityRequired) {
#endif
            WG_CLASS_VIEW * mainView = [self wg_MainViewConstraint:constraints];
            if (mainView) {
                NSLayoutConstraint * tmpConstraints = [NSLayoutConstraint constraintWithItem:constraints.firstItem attribute:constraints.firstAttribute relatedBy:constraints.relation toItem:constraints.secondItem attribute:constraints.secondAttribute multiplier:constraints.multiplier constant:constraints.constant];
                tmpConstraints.priority = priority;
                [self setCacheConstraint:nil attribute:constraints.firstAttribute relation:constraints.relation];
                [mainView removeConstraint:constraints];
                [mainView addConstraint:tmpConstraints];
                [self setCacheConstraint:tmpConstraints attribute:tmpConstraints.firstAttribute relation:tmpConstraints.relation];
                [self setCurrentConstraint:tmpConstraints];
            }
        }else if (constraints) {
            constraints.priority = priority;
        }
    }
    return self;
}

- (WG_CLASS_VIEW *)wg_priorityLow {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self wg_HandleConstraintsPriority:UILayoutPriorityDefaultLow];
#elif TARGET_OS_MAC
    return [self wg_HandleConstraintsPriority:NSLayoutPriorityDefaultLow];
#endif
}

- (WG_CLASS_VIEW *)wg_priorityHigh {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self wg_HandleConstraintsPriority:UILayoutPriorityDefaultHigh];
#elif TARGET_OS_MAC
    return [self wg_HandleConstraintsPriority:NSLayoutPriorityDefaultHigh];
#endif
}

- (WG_CLASS_VIEW *)wg_priorityRequired {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self wg_HandleConstraintsPriority:UILayoutPriorityRequired];
#elif TARGET_OS_MAC
    return [self wg_HandleConstraintsPriority:NSLayoutPriorityRequired];
#endif
}

- (WG_CLASS_VIEW *)wg_priorityFitting {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self wg_HandleConstraintsPriority:UILayoutPriorityFittingSizeLevel];
#elif TARGET_OS_MAC
    return [self wg_HandleConstraintsPriority:NSLayoutPriorityFittingSizeCompression];
#endif
}
    
- (WG_CLASS_VIEW *)wg_priority:(CGFloat)value {
    return [self wg_HandleConstraintsPriority:value];
}

#pragma mark - api version 1.0



- (WG_CLASS_VIEW *)wg_LeftSpace:(CGFloat)leftSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeLeft
                        constant:leftSpace];
}

- (WG_CLASS_VIEW *)wg_LeftSpace:(CGFloat)leftSpace toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeRight;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeLeft;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeft
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:leftSpace];
}

- (WG_CLASS_VIEW *)wg_LeftSpaceEqualView:(WG_VIEW *)view {
    return [self wg_LeftSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_LeftSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeft
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeLeft
                      multiplier:1
                        constant:offset];
}

- (WG_CLASS_VIEW *)wg_RightSpace:(CGFloat)rightSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeRight
                        constant:0.0 - rightSpace];
}

- (WG_CLASS_VIEW *)wg_RightSpace:(CGFloat)rightSpace toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeLeft;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeRight;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeRight
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:0.0 - rightSpace];
}

- (WG_CLASS_VIEW *)wg_RightSpaceEqualView:(WG_VIEW *)view {
    return [self wg_RightSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_RightSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeRight
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeRight
                      multiplier:1
                        constant:0.0 - offset];
}

- (WG_CLASS_VIEW *)wg_LeadingSpace:(CGFloat)leadingSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeLeading
                        constant:leadingSpace];
}

- (WG_CLASS_VIEW *)wg_LeadingSpace:(CGFloat)leadingSpace
            toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeTrailing;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeLeading;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:leadingSpace];
}

- (WG_CLASS_VIEW *)wg_LeadingSpaceEqualView:(WG_VIEW *)view {
    return [self wg_LeadingSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_LeadingSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeading
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeLeading
                      multiplier:1
                        constant:offset];
}

- (WG_CLASS_VIEW *)wg_TrailingSpace:(CGFloat)trailingSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeTrailing
                        constant:0.0 - trailingSpace];
}

- (WG_CLASS_VIEW *)wg_TrailingSpace:(CGFloat)trailingSpace
             toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeLeading;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeTrailing;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:0.0 - trailingSpace];
}

- (WG_CLASS_VIEW *)wg_TrailingSpaceEqualView:(WG_VIEW *)view {
    return [self wg_TrailingSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_TrailingSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTrailing
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeTrailing
                      multiplier:1
                        constant:0.0 - offset];
}

- (WG_CLASS_VIEW *)wg_TopSpace:(CGFloat)topSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeTop
                        constant:topSpace];
}

- (WG_CLASS_VIEW *)wg_TopSpace:(CGFloat)topSpace toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeBottom;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeTop;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:topSpace];
}

- (WG_CLASS_VIEW *)wg_TopSpaceEqualView:(WG_VIEW *)view {
    return [self wg_TopSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_TopSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeTop
                      multiplier:1
                        constant:offset];
}

- (WG_CLASS_VIEW *)wg_BottomSpace:(CGFloat)bottomSpace {
    return [self wg_ConstraintWithItem:[self getSview]
                       attribute:NSLayoutAttributeBottom
                        constant:0.0 - bottomSpace];
}

- (WG_CLASS_VIEW *)wg_BottomSpace:(CGFloat)bottomSpace toView:(WG_VIEW *)toView {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:NSLayoutAttributeTop
                      multiplier:1
                        constant:bottomSpace];
}

- (WG_CLASS_VIEW *)wg_BottomSpaceEqualView:(WG_VIEW *)view {
    return [self wg_BottomSpaceEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_BottomSpaceEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeBottom
                      multiplier:1
                        constant:0.0 - offset];
}

- (WG_CLASS_VIEW *)wg_Width:(CGFloat)width{
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:0
                        constant:width];
}

- (WG_CLASS_VIEW *)wg_WidthEqualView:(WG_VIEW *)view {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeWidth
                        constant:0];
}

- (WG_CLASS_VIEW *)wg_WidthEqualView:(WG_VIEW *)view ratio:(CGFloat)ratio {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeWidth
                        constant:0
                      multiplier:ratio];

}

- (WG_CLASS_VIEW *)wg_AutoWidth {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel * selfLabel = (UILabel *)self;
        if (selfLabel.numberOfLines == 0) {
            selfLabel.numberOfLines = 1;
        }
    }
#endif
    if ([self widthConstraint] != nil ||
        [self widthLessConstraint] != nil) {
        return self.wg_Width(0).wg_GreaterOrEqual();
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationGreaterThanOrEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:1
                        constant:0];
}

- (WG_CLASS_VIEW *)wg_WidthHeightRatio:(CGFloat)ratio {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                          toItem:self
                       attribute:NSLayoutAttributeHeight
                      multiplier:ratio
                        constant:0];
}

- (WG_CLASS_VIEW *)wg_Height:(CGFloat)height{
    return [self wg_ConstraintWithItem:nil
                       attribute:NSLayoutAttributeHeight
                        constant:height];
}

- (WG_CLASS_VIEW *)wg_HeightEqualView:(WG_VIEW *)view {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeHeight
                        constant:0];
}

- (WG_CLASS_VIEW *)wg_HeightEqualView:(WG_VIEW *)view ratio:(CGFloat)ratio {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeHeight
                        constant:0
                      multiplier:ratio];
}

- (WG_CLASS_VIEW *)wg_AutoHeight {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    if ([self isKindOfClass:[UILabel class]]) {
        if (((UILabel *)self).numberOfLines != 0) {
            ((UILabel *)self).numberOfLines = 0;
        }
    }
#endif
    if ([self heightConstraint] != nil ||
        [self heightLessConstraint] != nil) {
        return self.wg_Height(0).wg_GreaterOrEqual();
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeHeight
                       relatedBy:NSLayoutRelationGreaterThanOrEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:1
                        constant:0];

}

- (WG_CLASS_VIEW *)wg_HeightWidthRatio:(CGFloat)ratio {
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeHeight
                       relatedBy:NSLayoutRelationEqual
                          toItem:self
                       attribute:NSLayoutAttributeWidth
                      multiplier:ratio
                        constant:0];
}

- (WG_CLASS_VIEW *)wg_CenterX:(CGFloat)centerX {
    return [self wg_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeCenterX
                        constant:centerX];
}

- (WG_CLASS_VIEW *)wg_CenterX:(CGFloat)centerX toView:(WG_VIEW *)toView {
    return [self wg_ConstraintWithItem:toView
                       attribute:NSLayoutAttributeCenterX
                        constant:centerX];
}

- (WG_CLASS_VIEW *)wg_CenterY:(CGFloat)centerY {
    return [self wg_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeCenterY
                        constant:centerY];
}

- (WG_CLASS_VIEW *)wg_CenterY:(CGFloat)centerY toView:(WG_VIEW *)toView {
    return [self wg_ConstraintWithItem:toView
                       attribute:NSLayoutAttributeCenterY
                        constant:centerY];
}

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
- (WG_VIEW *)wg_FirstBaseLine:(CGFloat)space {
    return [self wg_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeFirstBaseline
                        constant:0.0 - space];
}

- (WG_CLASS_VIEW *)wg_FirstBaseLine:(CGFloat)space toView:(WG_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeLastBaseline;
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeFirstBaseline;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeFirstBaseline
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:space];
}

- (WG_CLASS_VIEW *)wg_FirstBaseLineEqualView:(WG_VIEW *)view {
    return [self wg_FirstBaseLineEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_FirstBaseLineEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeFirstBaseline
                        constant:0.0 - offset];
}

#endif

- (WG_CLASS_VIEW *)wg_LastBaseLine:(CGFloat)space {
    return [self wg_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeLastBaseline
                        constant:0.0 - space];
}

- (WG_CLASS_VIEW *)wg_LastBaseLine:(CGFloat)space toView:(WG_VIEW *)toView {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    NSLayoutAttribute toAttribute = NSLayoutAttributeFirstBaseline;
#else
    NSLayoutAttribute toAttribute = NSLayoutAttributeTop;
#endif
    wg_Data * data = [self sameSuperviewWithView1:toView view2:self];
    if (!data.isSameSuper) {
        toAttribute = NSLayoutAttributeLastBaseline;
    }
    return [self wg_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLastBaseline
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:0.0 - space];
}

- (WG_CLASS_VIEW *)wg_LastBaseLineEqualView:(WG_VIEW *)view {
    return [self wg_LastBaseLineEqualView:view offset:0];
}

- (WG_CLASS_VIEW *)wg_LastBaseLineEqualView:(WG_VIEW *)view offset:(CGFloat)offset {
    return [self wg_ConstraintWithItem:view
                       attribute:NSLayoutAttributeLastBaseline
                        constant:0.0 - offset];
}


- (WG_CLASS_VIEW *)wg_Center:(CGPoint)center {
    [self wg_CenterX:center.x];
    return [self wg_CenterY:center.y];
}

- (WG_CLASS_VIEW *)wg_Center:(CGPoint)center toView:(WG_VIEW *)toView {
    [self wg_CenterX:center.x toView:toView];
    return [self wg_CenterY:center.y toView:toView];
}
    
- (WG_CLASS_VIEW *)wg_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    [self wg_LeftSpace:left];
    [self wg_TopSpace:top];
    [self wg_Width:width];
    return [self wg_Height:height];
}

- (WG_CLASS_VIEW *)wg_Size:(CGSize)size {
    [self wg_Width:size.width];
    return [self wg_Height:size.height];
}

- (WG_CLASS_VIEW *)wg_SizeEqualView:(WG_VIEW *)view {
    [self wg_WidthEqualView: view];
    return [self wg_HeightEqualView: view];
}

- (WG_CLASS_VIEW *)wg_FrameEqualView:(WG_VIEW *)view {
    [self wg_LeftSpaceEqualView: view];
    [self wg_TopSpaceEqualView: view];
    return [self wg_SizeEqualView:view];
}

- (WG_CLASS_VIEW *)wg_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height toView:(WG_VIEW *)toView {
    [self wg_LeftSpace:left toView:toView];
    [self wg_TopSpace:top toView:toView];
    [self wg_Width:width];
    return [self wg_Height:height];
}

- (WG_CLASS_VIEW *)wg_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom {
    [self wg_LeftSpace:left];
    [self wg_TopSpace:top];
    [self wg_RightSpace:right];
    return [self wg_BottomSpace:bottom];
}

- (WG_CLASS_VIEW *)wg_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height {
    [self wg_LeftSpace:left];
    [self wg_TopSpace:top];
    [self wg_RightSpace:right];
    return [self wg_Height:height];
}

- (WG_CLASS_VIEW *)wg_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom {
    [self wg_LeftSpace:left];
    [self wg_TopSpace:top];
    [self wg_Width:width];
    return [self wg_BottomSpace:bottom];
}

- (WG_CLASS_VIEW *)wg_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom toView:(WG_VIEW *)toView {
    [self wg_LeftSpace:left toView:toView];
    [self wg_TopSpace:top toView:toView];
    [self wg_RightSpace:right toView:toView];
    return [self wg_BottomSpace:bottom toView:toView];
}

- (WG_CLASS_VIEW *)wg_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height toView:(WG_VIEW *)toView {
    [self wg_LeftSpace:left toView:toView];
    [self wg_TopSpace:top toView:toView];
    [self wg_RightSpace:right toView:toView];
    return [self wg_Height:height];
}

- (WG_CLASS_VIEW *)wg_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom toView:(WG_VIEW *)toView {
    [self wg_LeftSpace:left toView:toView];
    [self wg_TopSpace:top toView:toView];
    [self wg_Width:width];
    return [self wg_BottomSpace:bottom toView:toView];
}

- (WG_CLASS_VIEW *)wg_ConstraintWithItem:(WG_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                      constant:(CGFloat)constant {
    return [self wg_ConstraintWithItem:self
                       attribute:attribute
                          toItem:item
                       attribute:attribute
                        constant:constant];
}

- (WG_CLASS_VIEW *)wg_ConstraintWithItem:(WG_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                      constant:(CGFloat)constant
                    multiplier:(CGFloat)multiplier {
    return [self wg_ConstraintWithItem:self
                       attribute:attribute
                          toItem:item
                       attribute:attribute
                        constant:constant
                      multiplier:multiplier];
}

- (WG_CLASS_VIEW *)wg_ConstraintWithItem:(WG_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                        toItem:(WG_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                      constant:(CGFloat)constant {
    return [self wg_ConstraintWithItem:item
                       attribute:attribute
                       relatedBy:NSLayoutRelationEqual
                          toItem:toItem
                       attribute:toAttribute
                      multiplier:1
                        constant:constant];
}

- (WG_CLASS_VIEW *)wg_ConstraintWithItem:(WG_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                        toItem:(WG_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                      constant:(CGFloat)constant
                    multiplier:(CGFloat)multiplier {
    return [self wg_ConstraintWithItem:item
                       attribute:attribute
                       relatedBy:NSLayoutRelationEqual
                          toItem:toItem
                       attribute:toAttribute
                      multiplier:multiplier
                        constant:constant];
}

- (WG_CLASS_VIEW *)wg_ConstraintWithItem:(WG_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                     relatedBy:(NSLayoutRelation)related
                        toItem:(WG_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                    multiplier:(CGFloat)multiplier
                      constant:(CGFloat)constant {
                          
    if (!toItem) toAttribute = NSLayoutAttributeNotAnAttribute;
    if (!item) attribute = NSLayoutAttributeNotAnAttribute;
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (item) {
        if ([item isKindOfClass:WG_CLASS_VIEW.self]) {
            view(item).translatesAutoresizingMaskIntoConstraints = NO;
        }
    }
    switch (attribute) {
        case NSLayoutAttributeLeft: {
            NSLayoutConstraint * leading = [self leadingConstraint];
            if (leading) {
                [self removeCacheConstraint:leading];
                [self setLeadingConstraint:nil];
            }
            leading = [self leadingLessConstraint];
            if (leading) {
                [self removeCacheConstraint:leading];
                [self setLeadingLessConstraint:nil];
            }
            leading = [self leadingGreaterConstraint];
            if (leading) {
                [self removeCacheConstraint:leading];
                [self setLeadingGreaterConstraint:nil];
            }
            NSLayoutConstraint * left = [self leftConstraintRelation:related];
            if (left) {
                if (left.firstAttribute == attribute &&
                    left.secondAttribute == toAttribute &&
                    left.firstItem == item &&
                    left.secondItem == toItem &&
                    left.relation == related &&
                    left.multiplier == multiplier) {
                    left.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:left];
                [self setLeftConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeRight: {
            NSLayoutConstraint * trailing = [self trailingConstraint];
            if (trailing) {
                [self removeCacheConstraint:trailing];
                [self setTrailingConstraint:nil];
            }
            trailing = [self trailingLessConstraint];
            if (trailing) {
                [self removeCacheConstraint:trailing];
                [self setTrailingLessConstraint:nil];
            }
            trailing = [self trailingGreaterConstraint];
            if (trailing) {
                [self removeCacheConstraint:trailing];
                [self setTrailingGreaterConstraint:nil];
            }
            NSLayoutConstraint * right = [self rightConstraintRelation:related];
            if (right) {
                if (right.firstAttribute == attribute &&
                    right.secondAttribute == toAttribute &&
                    right.firstItem == item &&
                    right.secondItem == toItem &&
                    right.relation == related &&
                    right.multiplier == multiplier) {
                    right.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:right];
                [self setRightConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeTop: {
            NSLayoutConstraint * firstBaseline = [self firstBaselineConstraint];
            if (firstBaseline) {
                [self removeCacheConstraint:firstBaseline];
                [self setFirstBaselineConstraint:nil];
            }
            firstBaseline = [self firstBaselineLessConstraint];
            if (firstBaseline) {
                [self removeCacheConstraint:firstBaseline];
                [self setFirstBaselineLessConstraint:nil];
            }
            firstBaseline = [self firstBaselineGreaterConstraint];
            if (firstBaseline) {
                [self removeCacheConstraint:firstBaseline];
                [self setFirstBaselineGreaterConstraint:nil];
            }
            NSLayoutConstraint * top = [self topConstraintRelation:related];
            if (top) {
                if (top.firstAttribute == attribute &&
                    top.secondAttribute == toAttribute &&
                    top.firstItem == item &&
                    top.secondItem == toItem &&
                    top.relation == related &&
                    top.multiplier == multiplier) {
                    top.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:top];
                [self setTopConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeBottom: {
            NSLayoutConstraint * lastBaseline = [self lastBaselineConstraint];
            if (lastBaseline) {
                [self removeCacheConstraint:lastBaseline];
                [self setLastBaselineConstraint:nil];
            }
            lastBaseline = [self lastBaselineLessConstraint];
            if (lastBaseline) {
                [self removeCacheConstraint:lastBaseline];
                [self setLastBaselineLessConstraint:nil];
            }
            lastBaseline = [self lastBaselineGreaterConstraint];
            if (lastBaseline) {
                [self removeCacheConstraint:lastBaseline];
                [self setLastBaselineGreaterConstraint:nil];
            }
            NSLayoutConstraint * bottom = [self bottomConstraintRelation:related];
            if (bottom) {
                if (bottom.firstAttribute == attribute &&
                    bottom.secondAttribute == toAttribute &&
                    bottom.firstItem == item &&
                    bottom.secondItem == toItem &&
                    bottom.relation == related &&
                    bottom.multiplier == multiplier) {
                    bottom.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:bottom];
                [self setBottomConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeLeading: {
            NSLayoutConstraint * left = [self leftConstraint];
            if (left) {
                [self removeCacheConstraint:left];
                [self setLeftConstraint:nil];
            }
            left = [self leftLessConstraint];
            if (left) {
                [self removeCacheConstraint:left];
                [self setLeftLessConstraint:nil];
            }
            left = [self leftGreaterConstraint];
            if (left) {
                [self removeCacheConstraint:left];
                [self setLeftGreaterConstraint:nil];
            }
            NSLayoutConstraint * leading = [self leadingConstraintRelation:related];
            if (leading) {
                if (leading.firstAttribute == attribute &&
                    leading.secondAttribute == toAttribute &&
                    leading.firstItem == item &&
                    leading.secondItem == toItem &&
                    leading.relation == related &&
                    leading.multiplier == multiplier) {
                    leading.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:leading];
                [self setLeadingConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeTrailing: {
            NSLayoutConstraint * right = [self rightConstraint];
            if (right) {
                [self removeCacheConstraint:right];
                [self setRightConstraint:nil];
            }
            right = [self rightLessConstraint];
            if (right) {
                [self removeCacheConstraint:right];
                [self setRightLessConstraint:nil];
            }
            right = [self rightGreaterConstraint];
            if (right) {
                [self removeCacheConstraint:right];
                [self setRightGreaterConstraint:nil];
            }
            NSLayoutConstraint * trailing = [self trailingConstraintRelation:related];
            if (trailing) {
                if (trailing.firstAttribute == attribute &&
                    trailing.secondAttribute == toAttribute &&
                    trailing.firstItem == item &&
                    trailing.secondItem == toItem &&
                    trailing.relation == related &&
                    trailing.multiplier == multiplier) {
                    trailing.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:trailing];
                [self setTrailingConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeWidth: {
            NSLayoutConstraint * width = [self widthConstraintRelation:related];
            if (width) {
                if (width.firstAttribute == attribute &&
                    width.secondAttribute == toAttribute &&
                    width.firstItem == item &&
                    width.secondItem == toItem &&
                    width.relation == related &&
                    width.multiplier == multiplier) {
                    width.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:width];
                [self setWidthConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeHeight: {
            NSLayoutConstraint * height = [self heightConstraintRelation:related];
            if (height) {
                if (height.firstAttribute == attribute &&
                    height.secondAttribute == toAttribute &&
                    height.firstItem == item &&
                    height.secondItem == toItem &&
                    height.relation == related &&
                    height.multiplier == multiplier) {
                    height.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:height];
                [self setHeightConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeCenterX: {
            NSLayoutConstraint * centerX = [self centerXConstraintRelation:related];
            if (centerX) {
                if (centerX.firstAttribute == attribute &&
                    centerX.secondAttribute == toAttribute &&
                    centerX.firstItem == item &&
                    centerX.secondItem == toItem &&
                    centerX.relation == related &&
                    centerX.multiplier == multiplier) {
                    centerX.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:centerX];
                [self setCenterXConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeCenterY: {
            NSLayoutConstraint * centerY = [self centerYConstraintRelation:related];
            if (centerY) {
                if (centerY.firstAttribute == attribute &&
                    centerY.secondAttribute == toAttribute &&
                    centerY.firstItem == item &&
                    centerY.secondItem == toItem &&
                    centerY.relation == related &&
                    centerY.multiplier == multiplier) {
                    centerY.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:centerY];
                [self setCenterYConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeLastBaseline: {
            NSLayoutConstraint * bottom = [self bottomConstraint];
            if (bottom) {
                [self removeCacheConstraint:bottom];
                [self setBottomConstraint:nil];
            }
            bottom = [self bottomLessConstraint];
            if (bottom) {
                [self removeCacheConstraint:bottom];
                [self setBottomLessConstraint:nil];
            }
            bottom = [self bottomGreaterConstraint];
            if (bottom) {
                [self removeCacheConstraint:bottom];
                [self setBottomGreaterConstraint:nil];
            }
            NSLayoutConstraint * lastBaseline = [self lastBaselineConstraintRelation:related];
            if (lastBaseline) {
                if (lastBaseline.firstAttribute == attribute &&
                    lastBaseline.secondAttribute == toAttribute &&
                    lastBaseline.firstItem == item &&
                    lastBaseline.secondItem == toItem &&
                    lastBaseline.relation == related &&
                    lastBaseline.multiplier == multiplier) {
                    lastBaseline.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:lastBaseline];
                [self setLastBaselineConstraint:nil relation:related];
            }
        }
            break;
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline: {
            NSLayoutConstraint * top = [self topConstraint];
            if (top) {
                [self removeCacheConstraint:top];
                [self setTopConstraint:nil];
            }
            top = [self topLessConstraint];
            if (top) {
                [self removeCacheConstraint:top];
                [self setTopLessConstraint:nil];
            }
            top = [self topGreaterConstraint];
            if (top) {
                [self removeCacheConstraint:top];
                [self setTopGreaterConstraint:nil];
            }
            NSLayoutConstraint * firstBaseline = [self firstBaselineConstraintRelation:related];
            if (firstBaseline) {
                if (firstBaseline.firstAttribute == attribute &&
                    firstBaseline.secondAttribute == toAttribute &&
                    firstBaseline.firstItem == item &&
                    firstBaseline.secondItem == toItem &&
                    firstBaseline.relation == related &&
                    firstBaseline.multiplier == multiplier) {
                    firstBaseline.constant = constant;
                    return self;
                }
                [self removeCacheConstraint:firstBaseline];
                [self setFirstBaselineConstraint:nil relation:related];
            }
        }
            break;
#endif
        default:
            break;
    }
    WG_CLASS_VIEW * superView = [self mainSuperView:toItem view2:item];
    if (!superView) return self;
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item
                                             attribute:attribute
                                             relatedBy:related
                                                toItem:toItem
                                             attribute:toAttribute
                                            multiplier:multiplier
                                              constant:constant];
    [self setCacheConstraint:constraint attribute:attribute relation:related];
    [superView addConstraint:constraint];
    [self setCurrentConstraint:constraint];
    return self;
}

- (void)removeCacheConstraint:(NSLayoutConstraint *)constraint {
    WG_CLASS_VIEW * mainView = [self wg_MainViewConstraint:constraint];
    if (mainView) {
        [mainView removeConstraint:constraint];
    }
}
    
- (NSObject *)getSview {
    id sview = self.superview;
#if TARGET_OS_IPHONE
    if (@available(iOS 11.0, *)) {
        if ([self isSafe] && self.superview) {
            sview = self.superview.safeAreaLayoutGuide;
        }
    }
#endif
    return sview;
}

- (WG_CLASS_VIEW *)mainSuperView:(WG_VIEW *)view1 view2:(WG_VIEW *)view2 {
    BOOL isView1 = !(view1 && [view1 isKindOfClass:WG_CLASS_LGUIDE.self]);
    BOOL isView2 = !(view2 && [view2 isKindOfClass:WG_CLASS_LGUIDE.self]);
    if (isView1 && isView2) {
        WG_CLASS_VIEW * s_view1 = view(view1);
        WG_CLASS_VIEW * s_view2 = view(view2);
        if (!s_view1 && s_view2) {
            return s_view2;
        }
        if (s_view1 && !s_view2) {
            return view(s_view1);
        }
        if (s_view1.superview && !s_view2.superview) {
            return s_view2;
        }
        if (!s_view1.superview && s_view2.superview) {
            return s_view1;
        }
        wg_Data * data = [self sameSuperviewWithView1:view1 view2:view2];
        if (data && data.superView) {
            return data.superView;
        }else if (data && data.isSameSuper && !data.superView) {
            return s_view1;
        }
        data = [self sameSuperviewWithView1:view2 view2:view1];
        if (data && data.superView) {
            return data.superView;
        }else if (data && data.isSameSuper && !data.superView) {
            return s_view2;
        }
    }else {
        if (isView1 && !isView2) {
            if (view1) {
                WG_CLASS_VIEW * s_view = view(view1);
                WG_CLASS_LGUIDE * guide1 = layout_guide(view2);
                if (s_view == guide1.owningView) {
                    return s_view;
                }else {
                    if (s_view.superview == guide1.owningView) {
                        return s_view.superview;
                    }
                    return [self mainSuperView:s_view.superview view2:guide1.owningView];
                }
            }else {
                return owningView(view2);
            }
        }else if (!isView1 && isView2) {
            if (view2) {
                WG_CLASS_VIEW * s_view = view(view2);
                WG_CLASS_LGUIDE * guide1 = layout_guide(view1);
                if (s_view == guide1.owningView) {
                    return s_view;
                }else {
                    if (s_view.superview == guide1.owningView) {
                        return s_view.superview;
                    }
                    return [self mainSuperView:s_view.superview view2:guide1.owningView];
                }
            }else {
                return owningView(view1);
            }
        }else {
            if (owningView(view1) == owningView(view2)) {
                return owningView(view1);
            }
            return [self mainSuperView:owningView(view1) view2:owningView(view2)];
        }
    }
    return nil;
}

- (WG_CLASS_VIEW *)checkSubSuperView:(WG_CLASS_VIEW *)superv subv:(WG_CLASS_VIEW *)subv {
    WG_CLASS_VIEW * superView;
    if (superv && subv && subv != superv) {
        WG_CLASS_VIEW * sbvspv = subv.superview;
        if (sbvspv) {
            WG_CLASS_VIEW * (^__block scanSubv)(NSArray<WG_CLASS_VIEW *> *) = ^WG_CLASS_VIEW * (NSArray<WG_CLASS_VIEW *> * subvs) {
                __block WG_CLASS_VIEW * superView;
                if (subvs && subvs.count > 0) {
                    if ([subvs containsObject:sbvspv]) {
                        superView = sbvspv;
                    }
                    if (!superView) {
                        NSMutableArray<WG_CLASS_VIEW *> * sumSubv = [NSMutableArray array];
                        [subvs enumerateObjectsUsingBlock:^(WG_CLASS_VIEW * _Nonnull sv, NSUInteger idx, BOOL * _Nonnull stop) {
                            [sumSubv addObjectsFromArray:sv.subviews];
                        }];
                        superView = scanSubv(sumSubv);
                    }
                }
                return superView;
            };
            if (scanSubv(@[superv])) {
                superView = superv;
            }
        }
    }
    return superView;
}
    

- (wg_Data *)sameSuperviewWithView1:(WG_VIEW *)view1 view2:(WG_VIEW *)view2 {
    wg_Data * data = [wg_Data new];
    data.isSameSuper = YES;
    BOOL isView1 = !(view1 && [view1 isKindOfClass:WG_CLASS_LGUIDE.self]);
    BOOL isView2 = !(view2 && [view2 isKindOfClass:WG_CLASS_LGUIDE.self]);
    if (isView1 && isView2) {
        WG_CLASS_VIEW * tempToItem = view(view1);
        WG_CLASS_VIEW * tempItem = view(view2);
        if (tempToItem && tempItem) {
            if ([self checkSubSuperView:tempToItem subv:tempItem]) {
                data.superView = tempToItem;
                data.isSameSuper = NO;
                return data;
            }
        }
        BOOL (^checkSameSuperview)(WG_CLASS_VIEW *, WG_CLASS_VIEW *) = ^(WG_CLASS_VIEW * tmpSuperview, WG_CLASS_VIEW * singleView) {
            WG_CLASS_VIEW * tmpSingleView = singleView;
            if (tmpSingleView) {
                WG_CLASS_VIEW * tempSingleSuperview = tmpSingleView.superview;
                while (tempSingleSuperview) {
                    if (tmpSuperview == tempSingleSuperview) {
                        return YES;
                    }else {
                        tempSingleSuperview = tempSingleSuperview.superview;
                    }
                }
            }
            return NO;
        };
        if (tempToItem && tempItem) {
            WG_CLASS_VIEW * toItemSuperview = tempToItem.superview;
            WG_CLASS_VIEW * itemSuperview = tempItem.superview;
            while (toItemSuperview && itemSuperview) {
                if (toItemSuperview == itemSuperview) {
                    data.superView = toItemSuperview;
                    return data;
                }else {
                    tempToItem = toItemSuperview;
                    tempItem = itemSuperview;
                    if (!tempToItem.superview && tempItem.superview) {
                        if (checkSameSuperview(tempToItem, tempItem)) {
                            data.superView = tempToItem;
                            return data;
                        }
                    }else if (tempToItem.superview && !tempItem.superview) {
                        if (checkSameSuperview(tempItem, tempToItem)) {
                            data.superView = tempItem;
                            return data;
                        }
                    }else {
                        toItemSuperview = toItemSuperview.superview;
                        itemSuperview = itemSuperview.superview;
                    }
                }
            }
            if ([self checkSubSuperView:view(view2) subv:view(view1)]) {
                data.superView = view(view2);
                data.isSameSuper = NO;
                return data;
            }
        }
    }else {
        if (isView1 && !isView2) {
            if (view1) {
                WG_CLASS_VIEW * s_view = view(view1);
                WG_CLASS_LGUIDE * guide1 = layout_guide(view2);
                if (s_view == guide1.owningView) {
                    data.superView = s_view;
                    data.isSameSuper = NO;
                }else {
                    if (s_view.superview == guide1.owningView) {
                        #if TARGET_OS_IPHONE || TARGET_OS_TV
                        if (@available(iOS 11.0, tvOS 11.0, *)) {
                            data.isSameSuper = s_view.superview.safeAreaLayoutGuide != guide1;
                        } else {
                            data.isSameSuper = YES;
                        }
                        #elif TARGET_OS_MAC
                        data.isSameSuper = YES;
                        #endif
                        data.superView = s_view.superview;
                        return data;
                    }
                    return [self sameSuperviewWithView1:s_view.superview view2:guide1.owningView];
                }
            }else {
                data.superView = owningView(view2);
                data.isSameSuper = NO;
            }
        }else if (!isView1 && isView2) {
            if (view2) {
                WG_CLASS_VIEW * s_view = view(view2);
                WG_CLASS_LGUIDE * guide1 = layout_guide(view1);
                if (s_view == guide1.owningView) {
                    data.superView = s_view;
                    data.isSameSuper = NO;
                }else {
                    if (s_view.superview == guide1.owningView) {
                        #if TARGET_OS_IPHONE || TARGET_OS_TV
                        if (@available(iOS 11.0, tvOS 11.0, *)) {
                            data.isSameSuper = s_view.superview.safeAreaLayoutGuide != guide1;
                        } else {
                            data.isSameSuper = YES;
                        }
                        #elif TARGET_OS_MAC
                        data.isSameSuper = YES;
                        #endif
                        data.superView = s_view.superview;
                        return data;
                    }
                    return [self sameSuperviewWithView1:s_view.superview view2:guide1.owningView];
                }
            }else {
                data.superView = owningView(view1);
                data.isSameSuper = NO;
            }
        }else {
            if (owningView(view1) == owningView(view2)) {
                data.superView = owningView(view1);
                #if TARGET_OS_IPHONE || TARGET_OS_TV
                if (@available(iOS 11.0, tvOS 11.0, *)) {
                    data.isSameSuper = !(owningView(view1).safeAreaLayoutGuide == layout_guide(view2) || owningView(view2).safeAreaLayoutGuide == layout_guide(view1));
                } else {
                    data.isSameSuper = YES;
                }
                #elif TARGET_OS_MAC
                data.isSameSuper = YES;
                #endif
            }else {
                return [self sameSuperviewWithView1:owningView(view1) view2:owningView(view2)];
            }
        }
    }
    return data;
}

- (void)setCacheConstraint:(NSLayoutConstraint *)constraint attribute:(NSLayoutAttribute) attribute relation:(NSLayoutRelation)relation {
    switch (attribute) {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:
            [self setFirstBaselineConstraint:constraint relation:relation];
            break;
#endif
        case NSLayoutAttributeLastBaseline:
            [self setLastBaselineConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeCenterY:
            [self setCenterYConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeCenterX:
            [self setCenterXConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeTrailing:
            [self setTrailingConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeLeading:
            [self setLeadingConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeBottom:
            [self setBottomConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeTop:
            [self setTopConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeRight:
            [self setRightConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeLeft:
            [self setLeftConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeWidth:
            [self setWidthConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeHeight:
            [self setHeightConstraint:constraint relation:relation];
            break;
        default:
            break;
    }
}

#pragma mark - 自动加边线模块 -
    
#if TARGET_OS_IPHONE || TARGET_OS_TV

static const int kLeft_Line_Tag = 100000;
static const int kRight_Line_Tag = kLeft_Line_Tag + 1;
static const int kTop_Line_Tag = kRight_Line_Tag + 1;
static const int kBottom_Line_Tag = kTop_Line_Tag + 1;

- (wg_Line *)createLineWithTag:(int)lineTag {
    wg_Line * line = nil;
    for (WG_CLASS_VIEW * view in self.subviews) {
        if ([view isKindOfClass:[wg_Line class]] &&
            view.tag == lineTag) {
            line = (wg_Line *)view;
            break;
        }
    }
    if (line == nil) {
        line = [wg_Line new];
        line.tag = lineTag;
        [self addSubview:line];
    }
    return line;
}

- (WG_CLASS_VIEW *)wg_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color {
    return [self wg_AddBottomLine:value lineColor:color pading:0];
}

- (WG_CLASS_VIEW *)wg_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading {
    wg_Line * line = [self createLineWithTag:kBottom_Line_Tag];
    line.backgroundColor = color;
    [line wg_RightSpace:pading];
    [line wg_LeftSpace:pading];
    [line wg_Height:value];
    [line wg_BottomSpace:0];
    return line;
}

- (WG_CLASS_VIEW *)wg_AddTopLine:(CGFloat)value lineColor:(UIColor *)color {
    return [self wg_AddTopLine:value lineColor:color pading:0];
}

- (WG_CLASS_VIEW *)wg_AddTopLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading {
    wg_Line * line = [self createLineWithTag:kTop_Line_Tag];
    line.backgroundColor = color;
    [line wg_RightSpace:pading];
    [line wg_LeftSpace:pading];
    [line wg_Height:value];
    [line wg_TopSpace:0];
    return line;
}

- (WG_CLASS_VIEW *)wg_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding
{
    wg_Line * line = [self createLineWithTag:kLeft_Line_Tag];
    line.backgroundColor = color;
    [line wg_Width:value];
    [line wg_LeftSpace:0];
    [line wg_TopSpace:padding];
    [line wg_BottomSpace:padding];
    return line;
}

- (WG_CLASS_VIEW *)wg_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color {
    wg_Line * line = [self createLineWithTag:kLeft_Line_Tag];
    line.backgroundColor = color;
    [line wg_Width:value];
    [line wg_LeftSpace:0];
    [line wg_TopSpace:0];
    [line wg_BottomSpace:0];
    return line;
}

- (WG_CLASS_VIEW *)wg_AddRightLine:(CGFloat)value lineColor:(UIColor *)color {
    wg_Line * line = [self createLineWithTag:kRight_Line_Tag];
    line.backgroundColor = color;
    [line wg_Width:value];
    [line wg_TrailingSpace:0];
    [line wg_TopSpace:0];
    [line wg_BottomSpace:0];
    return line;
}

- (WG_CLASS_VIEW *)wg_AddRightLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding
{
    wg_Line * line = [self createLineWithTag:kRight_Line_Tag];
    line.backgroundColor = color;
    [line wg_Width:value];
    [line wg_TrailingSpace:0];
    [line wg_TopSpace:padding];
    [line wg_BottomSpace:padding];
    return line;
}
#endif
@end

