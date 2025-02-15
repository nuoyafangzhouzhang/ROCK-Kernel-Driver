AC_DEFUN([AC_AMDGPU_DRM_DISPLAY_INFO_HDMI_SCDC_SCRAMBLING], [
	AC_KERNEL_DO_BACKGROUND([
		AC_KERNEL_TRY_COMPILE([
			#include <drm/drm_connector.h>
		], [
			struct drm_display_info *display_info = NULL;
			display_info->hdmi.scdc.scrambling.low_rates = 0;
		], [
			AC_DEFINE(HAVE_DRM_DISPLAY_INFO_HDMI_SCDC_SCRAMBLING, 1,
				[display_info->hdmi.scdc.scrambling are available])
		])
	])
])

dnl #
dnl # commit v4.8-rc8-1381-g2a272ca9b8f7
dnl # drm/edid: Move dvi_dual/max_tmds_clock to drm_display_info
dnl #
AC_DEFUN([AC_AMDGPU_DRM_DISPLAY_INFO_MAX_TMDS_CLOCK], [
	AC_KERNEL_DO_BACKGROUND([
		AC_KERNEL_TRY_COMPILE([
			#include <drm/drm_connector.h>
		], [
			struct drm_display_info *display_info = NULL;
			display_info->max_tmds_clock = 0;
		], [
			AC_DEFINE(HAVE_DRM_DISPLAY_INFO_MAX_TMDS_CLOCK, 1,
				[display_info->max_tmds_clock is available])
		])
	])
])

AC_DEFUN([AC_AMDGPU_DRM_DISPLAY_INFO], [
	AC_AMDGPU_DRM_DISPLAY_INFO_HDMI_SCDC_SCRAMBLING
	AC_AMDGPU_DRM_DISPLAY_INFO_MAX_TMDS_CLOCK
])
