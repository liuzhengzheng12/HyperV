SWITCH_DIR = /home/lzz16/bmv2/targets/simple_switch
LOG = --log-console
//LOG = -L off
INTF = -i 1@veth3 -i 2@veth4


compile:
        @mkdir -p build
        @p4c-bmv2 src/hyperv.p4 --json build/hyperv.json

clean:
        @rm -rf build

run: compile
        @cp build/hyperv.json $(SWITCH_DIR)
        @cd $(SWITCH_DIR) && sudo bash simple_switch hyperv.json $(INTF) $(LOG)
