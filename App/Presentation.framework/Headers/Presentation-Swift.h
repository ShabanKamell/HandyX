// Generated by Apple Swift version 5.1 (swiftlang-1100.0.270.13 clang-1100.0.33.7)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="Presentation",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC12Presentation18BaseViewController")
@interface BaseViewController : UIViewController
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12Presentation14ButtetinAction")
@interface ButtetinAction : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class UIColor;
@class UIFont;

/// A beautiful and flexible textfield implementation with support for title label, error message and placeholder.
SWIFT_CLASS("_TtC12Presentation22FloatingLabelTextField")
@interface FloatingLabelTextField : UITextField
/// A Boolean value that determines if the language displayed is LTR.
/// Default value set automatically from the application language settings.
@property (nonatomic) BOOL isLTRLanguage;
/// The value of the title appearing duration
@property (nonatomic) NSTimeInterval titleFadeInDuration;
/// The value of the title disappearing duration
@property (nonatomic) NSTimeInterval titleFadeOutDuration;
/// A UIColor value that determines the text color of the editable text
@property (nonatomic, strong) UIColor * _Nullable textColor;
/// A UIColor value that determines text color of the placeholder label
@property (nonatomic, strong) UIColor * _Nonnull placeholderColor;
/// A UIFont value that determines text color of the placeholder label
@property (nonatomic, strong) UIFont * _Nullable placeholderFont;
/// A UIFont value that determines the text font of the title label
@property (nonatomic, strong) UIFont * _Nonnull titleFont;
/// A UIColor value that determines the text color of the title label when in the normal state
@property (nonatomic, strong) UIColor * _Nonnull titleColor;
/// A UIColor value that determines the color of the bottom line when in the normal state
@property (nonatomic, strong) UIColor * _Nonnull lineColor;
/// A UIColor value that determines the color used for the title label and line when the error message is not <code>nil</code>
@property (nonatomic, strong) UIColor * _Nonnull errorColor;
/// A UIColor value that determines the color used for the line when error message is not <code>nil</code>
@property (nonatomic, strong) UIColor * _Nullable lineErrorColor;
/// A UIColor value that determines the color used for the text when error message is not <code>nil</code>
@property (nonatomic, strong) UIColor * _Nullable textErrorColor;
/// A UIColor value that determines the color used for the title label when error message is not <code>nil</code>
@property (nonatomic, strong) UIColor * _Nullable titleErrorColor;
/// A UIColor value that determines the color used for the title label and line when text field is disabled
@property (nonatomic, strong) UIColor * _Nonnull disabledColor;
/// A UIColor value that determines the text color of the title label when editing
@property (nonatomic, strong) UIColor * _Nonnull selectedTitleColor;
/// A UIColor value that determines the color of the line in a selected state
@property (nonatomic, strong) UIColor * _Nonnull selectedLineColor;
/// A CGFloat value that determines the height for the bottom line when the control is in the normal state
@property (nonatomic) CGFloat lineHeight;
/// A CGFloat value that determines the height for the bottom line when the control is in a selected state
@property (nonatomic) CGFloat selectedLineHeight;
/// Identifies whether the text object should hide the text being entered.
@property (nonatomic, getter=isSecureTextEntry) BOOL secureTextEntry;
/// A String value for the error message to display.
@property (nonatomic, copy) NSString * _Nullable error;
/// A Boolean value that determines whether the receiver is highlighted.
/// When changing this value, highlighting will be done with animation
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
/// The text content of the textfield
@property (nonatomic, copy) NSString * _Nullable text;
/// The String to display when the input field is empty.
/// The placeholder can also appear in the title label when both <code>title</code> <code>selectedTitle</code> and are <code>nil</code>.
@property (nonatomic, copy) NSString * _Nullable placeholder;
/// The String to display when the textfield is editing and the input is not empty.
@property (nonatomic, copy) NSString * _Nullable selectedTitle;
/// The String to display when the textfield is not editing and the input is not empty.
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, getter=isSelected) BOOL selected;
/// Initializes the control
/// \param frame the frame of the control 
///
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
/// Intialzies the control by deserializing it
/// \param coder the object to deserialize the control from 
///
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// Invoked when the editing state of the textfield changes. Override to respond to this change.
- (void)editingChanged;
/// Attempt the control to become the first responder
///
/// returns:
/// True when successfull becoming the first responder
- (BOOL)becomeFirstResponder;
/// Attempt the control to resign being the first responder
///
/// returns:
/// True when successful resigning being the first responder
- (BOOL)resignFirstResponder;
/// update colors when is enabled changed
@property (nonatomic, getter=isEnabled) BOOL enabled;
/// Calculate the rectangle for the textfield when it is not being edited
/// \param bounds The current bounds of the field
///
///
/// returns:
/// The rectangle that the textfield should render in
- (CGRect)textRectForBounds:(CGRect)bounds SWIFT_WARN_UNUSED_RESULT;
/// Calculate the rectangle for the textfield when it is being edited
/// \param bounds The current bounds of the field
///
///
/// returns:
/// The rectangle that the textfield should render in
- (CGRect)editingRectForBounds:(CGRect)bounds SWIFT_WARN_UNUSED_RESULT;
/// Calculate the rectangle for the placeholder
/// \param bounds The current bounds of the placeholder
///
///
/// returns:
/// The rectangle that the placeholder should render in
- (CGRect)placeholderRectForBounds:(CGRect)bounds SWIFT_WARN_UNUSED_RESULT;
/// Invoked when the interface builder renders the control
- (void)prepareForInterfaceBuilder;
/// Invoked by layoutIfNeeded automatically
- (void)layoutSubviews;
/// Calculate the content size for auto layout
///
/// returns:
/// the content size to be used for auto layout
@property (nonatomic, readonly) CGSize intrinsicContentSize;
@end



@class UITabBarController;

SWIFT_CLASS("_TtC12Presentation20NavigationController")
@interface NavigationController : UINavigationController
@property (nonatomic, readonly, strong) UIViewController * _Nullable childViewControllerForStatusBarStyle;
@property (nonatomic, readonly, strong) UITabBarController * _Nullable tabBarController;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)decoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init;
- (nonnull instancetype)initWithNavigationBarClass:(Class _Nullable)navigationBarClass toolbarClass:(Class _Nullable)toolbarClass SWIFT_UNAVAILABLE;
@end




@interface NavigationController (SWIFT_EXTENSION(Presentation)) <UINavigationControllerDelegate>
- (void)navigationController:(UINavigationController * _Nonnull)navigationController willShowViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
- (void)navigationController:(UINavigationController * _Nonnull)navigationController didShowViewController:(UIViewController * _Nonnull)viewController animated:(BOOL)animated;
@end


@interface NavigationController (SWIFT_EXTENSION(Presentation))
@property (nonatomic, readonly) UIStatusBarStyle preferredStatusBarStyle;
@property (nonatomic, readonly) UIStatusBarAnimation preferredStatusBarUpdateAnimation;
@end


SWIFT_CLASS("_TtC12Presentation7NibView")
@interface NibView : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC12Presentation14PagedTableView")
@interface PagedTableView : UITableView
- (nonnull instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style SWIFT_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder SWIFT_UNAVAILABLE;
@end



@class UITableViewCell;

@interface PagedTableView (SWIFT_EXTENSION(Presentation)) <UITableViewDataSource, UITableViewDelegate>
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView willDisplayCell:(UITableViewCell * _Nonnull)cell forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didEndDisplayingCell:(UITableViewCell * _Nonnull)cell forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSInteger)numberOfSectionsInTableView:(UITableView * _Nonnull)tableView SWIFT_WARN_UNUSED_RESULT;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_PROTOCOL("_TtP12Presentation26PaginatedTableViewDelegate_")
@protocol PaginatedTableViewDelegate
@optional
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAt:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAt:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView estimatedHeightForRowAt:(NSIndexPath * _Nonnull)indexPath SWIFT_WARN_UNUSED_RESULT;
- (void)tableView:(UITableView * _Nonnull)tableView willDisplay:(UITableViewCell * _Nonnull)cell forRowAt:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didEndDisplaying:(UITableViewCell * _Nonnull)cell forRowAt:(NSIndexPath * _Nonnull)indexPath;
- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (UIView * _Nullable)tableView:(UITableView * _Nonnull)tableView viewForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)tableView:(UITableView * _Nonnull)tableView titleForHeaderInSection:(NSInteger)section SWIFT_WARN_UNUSED_RESULT;
@required
- (void)loadMoreWithStart:(NSInteger)start pageCount:(NSInteger)pageCount onSuccess:(void (^ _Nullable)(NSInteger))onSuccess onError:(void (^ _Nullable)(NSError * _Nonnull))onError;
@end


SWIFT_CLASS("_TtC12Presentation18RootViewController")
@interface RootViewController : NavigationController
- (void)viewDidLoad;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)decoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRootViewController:(UIViewController * _Nonnull)rootViewController OBJC_DESIGNATED_INITIALIZER;
@end












SWIFT_CLASS("_TtC12Presentation25TabBarSplitViewController")
@interface TabBarSplitViewController : UISplitViewController
@property (nonatomic, readonly, strong) UITabBarController * _Nullable tabBarController;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil SWIFT_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder SWIFT_UNAVAILABLE;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)showViewController:(UIViewController * _Nonnull)vc sender:(id _Nullable)sender;
- (void)showDetailViewController:(UIViewController * _Nonnull)vc sender:(id _Nullable)sender;
@end


@interface TabBarSplitViewController (SWIFT_EXTENSION(Presentation)) <UISplitViewControllerDelegate>
- (BOOL)splitViewController:(UISplitViewController * _Nonnull)splitViewController collapseSecondaryViewController:(UIViewController * _Nonnull)secondaryViewController ontoPrimaryViewController:(UIViewController * _Nonnull)primaryViewController SWIFT_WARN_UNUSED_RESULT;
- (UIViewController * _Nullable)primaryViewControllerForCollapsingSplitViewController:(UISplitViewController * _Nonnull)splitViewController SWIFT_WARN_UNUSED_RESULT;
- (UIViewController * _Nullable)splitViewController:(UISplitViewController * _Nonnull)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController * _Nonnull)primaryViewController SWIFT_WARN_UNUSED_RESULT;
- (UIViewController * _Nullable)primaryViewControllerForExpandingSplitViewController:(UISplitViewController * _Nonnull)splitViewController SWIFT_WARN_UNUSED_RESULT;
@end















































































#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
