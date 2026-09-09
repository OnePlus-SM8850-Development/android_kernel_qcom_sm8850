def register_modules(registry):
    registry.register(
        name = "drivers/video/backlight/qcom-spmi-wled",
        out = "qcom-spmi-wled.ko",
        config = "CONFIG_BACKLIGHT_QCOM_SPMI_WLED",
        srcs = [
            # do not sort
            "drivers/video/backlight/qcom-spmi-wled.c",
        ],
        deps = [
            # do not sort
            "//vendor/qcom/sm8850-modules/oplus/kernel/charger/bazel:{target_variant}_oplus_chg_v2",
        ],
    )
