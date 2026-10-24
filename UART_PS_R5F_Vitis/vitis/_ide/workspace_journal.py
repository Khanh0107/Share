# 2026-10-23T22:52:38.152081222
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis")

platform = client.create_platform_component(name = "kv260_r5_platform",hw_design = "$COMPONENT_LOCATION/../../build/kv260_ps.xsa",os = "standalone",cpu = "psu_cortexr5_0",domain_name = "standalone_psu_cortexr5_0",no_boot_bsp = True,compiler = "gcc")

platform = client.get_component(name="kv260_r5_platform")
status = platform.build()

comp = client.create_app_component(name="hello_r5",platform = "$COMPONENT_LOCATION/../kv260_r5_platform/export/kv260_r5_platform/kv260_r5_platform.xpfm",domain = "standalone_psu_cortexr5_0")

comp = client.get_component(name="hello_r5")
status = comp.import_files(from_loc="", files=["/home/bo/linux/KV260/UART_PS_R5F_Vitis/src/main.c"], is_skip_copy_sources = False)

comp.build()

