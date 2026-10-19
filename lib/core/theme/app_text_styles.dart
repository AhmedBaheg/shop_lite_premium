import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography system for ShopLite. All styles use Google Font Cairo.
/// الألوان غير مثبتة هنا؛ اللون يُحدد من Theme حتى يعمل كل style مع Light/Dark.
abstract final class AppTextStyles {
  // ---------------------------------------------------------------------------
  // DISPLAY — عناوين كبيرة ونادرة الاستخدام
  // ---------------------------------------------------------------------------

  /// 32px / Bold — استخدمه لكلمة ShopLite في Splash أو عنوان ترويجي واحد كبير.
  /// لا تستخدمه لعناوين الصفحات العادية حتى تظل الواجهة هادئة.
  static TextStyle get displayLarge => GoogleFonts.cairo(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  /// 28px / Bold — عنوان كبير لشاشة نجاح الطلب أو الترحيب عند توافر المساحة.
  /// مثال: "A good find. All yours." في شاشة تأكيد الطلب.
  static TextStyle get displayMedium => GoogleFonts.cairo(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.25,
      );

  // ---------------------------------------------------------------------------
  // HEADLINES — عناوين الصفحات والأقسام
  // ---------------------------------------------------------------------------

  /// 24px / Bold — العنوان الرئيسي لصفحة مهمة مثل Welcome back أو Shopping cart.
  /// استخدمه مرة واحدة غالبًا في أعلى الشاشة، وليس لكل قسم.
  static TextStyle get headlineLarge => GoogleFonts.cairo(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  /// 22px / SemiBold — عنوان صفحة أصغر أو عنوان رئيسي عند ضيق المساحة.
  /// بديل متوازن لـ headlineLarge، ولا تجمع الاثنين في نفس المستوى البصري.
  static TextStyle get headlineMedium => GoogleFonts.cairo(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  /// 20px / SemiBold — عناوين أقسام مثل Featured finds وOrder summary وPayment method.
  /// استخدمه لتقسيم الشاشة إلى مجموعات مفهومة دون إضافة كروت كثيرة.
  static TextStyle get headlineSmall => GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  // ---------------------------------------------------------------------------
  // TITLES — أسماء المنتجات والعناصر
  // ---------------------------------------------------------------------------

  /// 18px / Bold — اسم المنتج في صفحة Product Details أو قيمة مهمة مثل إجمالي الطلب.
  /// مناسب لاسم المنتج الكبير والسعر الأساسي على صفحة التفاصيل.
  static TextStyle get titleLarge => GoogleFonts.cairo(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.35,
      );

  /// 16px / SemiBold — اسم المنتج في قائمة/شبكة، وعناوين صفوف الحساب والعناوين.
  /// هذا هو الخيار الافتراضي لمعظم العناوين الصغيرة داخل المحتوى.
  static TextStyle get titleMedium => GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  /// 14px / SemiBold — أسماء المنتجات داخل البطاقات الصغيرة أو أسماء التصنيفات.
  /// استخدمه للعناوين القصيرة فقط وليس للوصف الطويل.
  static TextStyle get titleSmall => GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  // ---------------------------------------------------------------------------
  // BODY — أوصاف ومحتوى مقروء
  // ---------------------------------------------------------------------------

  /// 16px / Regular — الفقرات الأساسية والتعليمات التي تحتاج قراءة مريحة.
  /// مثال: وصف المنتج في صفحة التفاصيل أو شرح سبب طلب البريد الإلكتروني.
  static TextStyle get bodyLarge => GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  /// 14px / Regular — النص الأساسي لمعظم الوصف ومعلومات المنتج والشحن والنماذج.
  /// استخدمه افتراضيًا لمحتوى الشاشة لأنه يوازن بين الوضوح وعدم الزحام.
  static TextStyle get bodyMedium => GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.55,
      );

  /// 12px / Regular — بيانات مساعدة قصيرة مثل عدد التقييمات، ملاحظات الحقول، والتفاصيل الثانوية.
  /// لا تستخدمه للمعلومات المهمة أو الفقرات الطويلة؛ تأكد من وضوحه في شاشات صغيرة.
  static TextStyle get bodySmall => GoogleFonts.cairo(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.45,
      );

  // ---------------------------------------------------------------------------
  // LABELS — نصوص الأزرار والشرائح والتحكم
  // ---------------------------------------------------------------------------

  /// 14px / Bold — نص الزر الأساسي مثل Log in وCreate account وAdd to cart وPlace order.
  /// يناسب الإجراءات المهمة، ويُفضّل أن يكون زر الشاشة الرئيسي هو الأوضح.
  static TextStyle get labelLarge => GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.3,
      );

  /// 12px / SemiBold — فلاتر التصنيفات والشرائح القصيرة وأزرار الإجراءات الثانوية.
  /// مناسب لكلمات مثل Audio وStyle وSee all عندما يكون المكان محدودًا.
  static TextStyle get labelMedium => GoogleFonts.cairo(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.35,
      );

  /// 11px / SemiBold — نصوص التنقل الصغيرة أو Metadata غير الأساسية جدًا.
  /// استخدمه باعتدال؛ ارفع المقاس إلى 12px إن كان النص مهمًا أو كثيفًا.
  static TextStyle get labelSmall => GoogleFonts.cairo(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 1.3,
      );

  /// TextTheme ملوّن وفق الثيم النشط؛ استخدمه داخل AppTheme بدل تثبيت ألوان داخل styles.
  static TextTheme themed({
    required Color primaryText,
    required Color secondaryText,
  }) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: primaryText),
      displayMedium: displayMedium.copyWith(color: primaryText),
      headlineLarge: headlineLarge.copyWith(color: primaryText),
      headlineMedium: headlineMedium.copyWith(color: primaryText),
      headlineSmall: headlineSmall.copyWith(color: primaryText),
      titleLarge: titleLarge.copyWith(color: primaryText),
      titleMedium: titleMedium.copyWith(color: primaryText),
      titleSmall: titleSmall.copyWith(color: primaryText),
      bodyLarge: bodyLarge.copyWith(color: primaryText),
      bodyMedium: bodyMedium.copyWith(color: primaryText),
      bodySmall: bodySmall.copyWith(color: secondaryText),
      labelLarge: labelLarge.copyWith(color: primaryText),
      labelMedium: labelMedium.copyWith(color: secondaryText),
      labelSmall: labelSmall.copyWith(color: secondaryText),
    );
  }
}
