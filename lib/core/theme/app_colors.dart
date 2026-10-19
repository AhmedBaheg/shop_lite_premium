import 'package:flutter/material.dart';

/// ألوان ShopLite المستخرجة من لقطتي Figma المرفقتين (English Light / Dark).
/// الألوان المشار إليها بأنها "مقترحة" هي حالات مساعدة لم تظهر كـ token واضح في الصورة.
abstract final class AppColors {
  // ---------------------------------------------------------------------------
  // BRAND — ألوان الهوية الأساسية
  // ---------------------------------------------------------------------------

  /// #1463F3 — اللون الأزرق الأساسي، ظاهر في الأزرار الرئيسية والتبويب النشط.
  /// استخدمه في: Log in، Create account، Send reset link، Add to cart، Checkout،
  /// الروابط، الاختيارات النشطة، مؤشرات التركيز والأيقونات المهمة.
  static const Color primary = Color(0xFF1463F3);

  /// #1356D1 — درجة ضغط مقترحة مشتقة من الأزرق الأساسي وليست token مؤكدًا من Figma.
  /// استخدمها لحالة pressed فقط عند الحاجة، ولا تستبدل بها اللون الأساسي.
  static const Color primaryPressed = Color(0xFF1356D1);

  /// #EAF1FF — تدرّج أزرق باهت ظاهر خلف حالات التحديد في Light Mode.
  /// استخدمه خلف العنصر النشط في Bottom Navigation أو خلف اختيار/فلتر محدد.
  static const Color primarySoft = Color(0xFFEAF1FF);

  /// #233A5F — خلفية زرقاء داكنة ظاهرة لحالة العنصر النشط في Dark Mode.
  /// استخدمها كتظليل خلف أيقونة أو تبويب نشط؛ لا تستخدمها كلون نص صغير.
  static const Color primarySoftDark = Color(0xFF233A5F);

  /// #FFFFFF — الأبيض الصريح، للنص فوق الزر الأزرق ولأسطح Light Mode البيضاء.
  static const Color white = Color(0xFFFFFFFF);

  // ---------------------------------------------------------------------------
  // LIGHT MODE — درجات مأخوذة من الصورة أو قريبة من درجاتها
  // ---------------------------------------------------------------------------

  /// #FFFFFF — خلفية الشاشة الفعلية في لقطات Light Mode.
  /// استخدمها في Scaffold وخلفيات الصفحات الرئيسية.
  static const Color lightBackground = Color(0xFFFFFFFF);

  /// #FFFFFF — سطح الكروت والقوائم وAppBar وBottom Navigation في Light Mode.
  static const Color lightSurface = Color(0xFFFFFFFF);

  /// #F5F7FA — لون حقول الإدخال والأسطح الثانوية الظاهر في التصميم.
  /// استخدمه في Search Bar، حقول Email/Password، الشرائح الهادئة وملخصات الدفع.
  static const Color lightSurfaceVariant = Color(0xFFF5F7FA);

  /// #142238 — لون النص الداكن الأساسي المستخرج من النصوص في التصميم الفاتح.
  /// استخدمه للعناوين، أسماء المنتجات، الأسعار، إجمالي الطلب والنص الأساسي.
  static const Color lightTextPrimary = Color(0xFF142238);

  /// #465162 — رمادي مزرق ظاهر في تفاصيل وأيقونات ثانوية؛ مناسب للنص المساند.
  /// استخدمه للوصف، Subtitle، معلومات المنتجات، التقييمات والتفاصيل الأقل أولوية.
  static const Color lightTextSecondary = Color(0xFF465162);

  /// #848B97 — رمادي ظاهر في الأيقونات/النصوص الهادئة؛ استخدمه للتلميحات فقط.
  /// مناسب لـ Placeholder البحث، النصوص الإرشادية والبيانات الثانوية جدًا.
  static const Color lightTextHint = Color(0xFF848B97);

  /// #E6E8EB — حد فاصل مقترح قريب من درجات الخطوط الخفيفة في الصورة.
  /// استخدمه للفواصل وحدود الحقول والكروت عند الحاجة فقط، بدون زيادة كثافة الحدود.
  static const Color lightBorder = Color(0xFFE6E8EB);

  /// #C1C5CB — لون معطل مقترح من الدرجات الرمادية الظاهرة في اللقطة.
  /// استخدمه للأيقونات والأزرار غير المتاحة فقط، وليس للمحتوى المهم.
  static const Color lightDisabled = Color(0xFFC1C5CB);

  // ---------------------------------------------------------------------------
  // DARK MODE — درجات مأخوذة من لقطة English Dark
  // ---------------------------------------------------------------------------

  /// #0E1624 — الخلفية الداكنة الأساسية الدقيقة الظاهرة داخل شاشات التطبيق.
  /// استخدمها في Scaffold وخلفية معظم الشاشات الداكنة.
  static const Color darkBackground = Color(0xFF0E1624);

  /// #0E1624 — الأسطح الرئيسية في Dark Mode بنفس لون خلفية الشاشة للحفاظ على البساطة.
  /// استخدمها في AppBar وBottom Navigation عندما لا يحتاج التصميم إلى سطح منفصل.
  static const Color darkSurface = Color(0xFF0E1624);

  /// #172234 — لون الحقول والحاويات الثانوية الظاهر في لقطة Dark Mode.
  /// استخدمه في Search/Email/Password fields، عناصر الدفع، الصفوف المحددة والحاويات.
  static const Color darkSurfaceVariant = Color(0xFF172234);

  /// #F3F6FC — لون النص الفاتح الظاهر في التصميم الداكن.
  /// استخدمه للعناوين، أسماء المنتجات، الأسعار والمحتوى الأساسي.
  static const Color darkTextPrimary = Color(0xFFF3F6FC);

  /// #B3B9C3 — رمادي فاتح مقترح مبني على الدرجات المحايدة الظاهرة في الصورة.
  /// استخدمه للأوصاف والتفاصيل الثانوية على الخلفيات الداكنة.
  static const Color darkTextSecondary = Color(0xFFB3B9C3);

  /// #868B95 — لون رمادي ظاهر في عناصر muted؛ للـ placeholders والتلميحات الهادئة.
  static const Color darkTextHint = Color(0xFF868B95);

  /// #313843 — درجة حد/فاصل موجودة في لوحة الألوان الداكنة للصورة.
  /// استخدمها لفواصل الصفوف وحدود الحقول عند الحاجة، وتجنب الحدود الثقيلة.
  static const Color darkBorder = Color(0xFF313843);

  /// #4A515D — درجة رمادية داكنة مساعدة للأيقونات أو المحتوى غير النشط في Dark Mode.
  static const Color darkDisabled = Color(0xFF4A515D);

  // ---------------------------------------------------------------------------
  // PRESENTATION CANVAS — خلفيات لوحة العرض فقط، وليست خلفية التطبيق
  // ---------------------------------------------------------------------------

  /// #F0F2F7 — مساحة الخلفية خارج إطارات الموبايل في لوحة Light المرفقة.
  /// غالبًا لا تستخدمها في Scaffold؛ أُضيفت فقط لو أردت مطابقة لوحة العرض نفسها.
  static const Color lightPresentationCanvas = Color(0xFFF0F2F7);

  /// #1F2633 — مساحة الخلفية خارج إطارات الموبايل في لوحة Dark المرفقة.
  /// ليست خلفية شاشة التطبيق؛ استخدم darkBackground داخل التطبيق.
  static const Color darkPresentationCanvas = Color(0xFF1F2633);

  // ---------------------------------------------------------------------------
  // SEMANTIC COLORS — ألوان مساعدة مقترحة وليست مستخرجة كـ tokens مؤكدة
  // ---------------------------------------------------------------------------

  /// أخضر مقترح لحالة نجاح الطلب أو الدفع أو توفر المنتج.
  static const Color success = Color(0xFF22C55E);

  /// كهرماني مقترح للتحذيرات وحالات المخزون المنخفض.
  static const Color warning = Color(0xFFF59E0B);

  /// أحمر مقترح لأخطاء النماذج وإزالة العناصر والإجراءات المدمرة.
  static const Color error = Color(0xFFEF4444);

  /// أزرق فاتح مقترح للمعلومات غير المرتبطة بالنجاح أو الخطأ.
  static const Color info = Color(0xFF60A5FA);

  /// كهرماني مقترح لنجوم تقييم المنتجات.
  static const Color rating = Color(0xFFF5B84B);

  /// أحمر مقترح للقلب النشط أو علامة حذف المنتج عند ظهورها بحالة واضحة.
  static const Color favorite = Color(0xFFF04452);

  /// طبقة تعتيم مقترحة خلف Dialog/Modal.
  static const Color scrim = Color(0x99000000);
}
