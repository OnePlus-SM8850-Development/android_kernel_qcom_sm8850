load(":soc_repo_path.bzl", "SOC_MODULES_REPO_PATH")
load("@rules_pkg//pkg:install.bzl", "pkg_install")
load("@rules_pkg//pkg:mappings.bzl", "pkg_files", "strip_prefix")

def define_techpack_modules(target, msm_target, variant):
    techpack_targets = [
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/fingerprint:{}_qbt_handler".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_btpower".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_radio-i2c-rtc6226-qca".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_btfm_slim_codec".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_btfmcodec".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_bt_fm_swr".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/bt-kernel:{}_spi_cnss_proto".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/camera-kernel:{}_camera".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/dsp-kernel:{}_frpc-adsprpc".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/eva-kernel:{}_eva_modules".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_smcinvoke_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_qcrypto-msm_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_tz_log_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_qseecom_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_hdcp_qseecom_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_qce50_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_qcedev-mod_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_qrng_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_smmu_proxy_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_tmecom-intf_dlkm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_seccam_test_driver".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_hdcp2p2_test".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_si_core_test".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/securemsm-kernel:{}_tornado_mod".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/spu-kernel:{}_spcom".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/spu-kernel:{}_spss_utils".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/synx-kernel:{}_modules".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/touch-drivers:{}_touch_modules".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet:{}_rmnet_ctl".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet:{}_rmnet_core".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/aps:{}_aps".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/offload:{}_offload".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/perf:{}_perf".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/perf_tether:{}_perf_tether".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/mem:{}_rmnet_mem".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/sch:{}_sch".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/shs:{}_shs".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/datarmnet-ext/wlan:{}_wlan".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/mm-drivers/sync_fence:{}_sync_fence".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/mm-drivers/hw_fence:{}_msm_hw_fence".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/mm-drivers/hfi_core:{}_msm_hfi_core".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/mm-drivers/msm_ext_display:{}_msm_ext_display".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/mmrm-driver:{}_mmrm_driver".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/audio-kernel:{}_modules".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/dataipa:{}_gsim".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/dataipa:{}_ipam".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/dataipa:{}_ipanetm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/data-kernel/drivers/smem-mailbox:{}_smem_mailbox".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/graphics-kernel:{}_msm_kgsl".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/video-driver:{}_video_modules".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/display-drivers:{}_msm_drm".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_peach-v2".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_kiwi-v2".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_wcn7750".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_cnss2".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_cnss_plat_ipc_qmi_svc".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_icnss2".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_cnss_nl".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_cnss_prealloc".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_cnss_utils".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/qcom/opensource/wlan/platform:{}_wlan_firmware_service".format(target),
        "//" + SOC_MODULES_REPO_PATH + "/nxp/opensource/driver:{}_stm_nfc_i2c".format(target),
    ]

      # 1. Define how files are packaged (permissions + flattening)
    pkg_files(
        name = "{}_all_vendor_module_dist_files".format(target),
        srcs = techpack_targets,
        strip_prefix = strip_prefix.files_only(),  # Equivalent to flat = True
        visibility = ["//visibility:private"],
    )

    # 2. Define the installation to the distribution directory
    pkg_install(
        name = "{}_all_vendor_module_dist".format(target),
        srcs = [":{}_all_vendor_module_dist_files".format(target)],
        destdir = "out/msm-kernel-{}/techpack",  # Equivalent to dist_dir
    )

    return techpack_targets
