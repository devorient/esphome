.SECONDEXPANSION:
.esphome/build/%/firmware.uf2: $$(notdir %).yaml
	esphome compile $<


.PHONY: smartplug-wifip130fwt
.SECONDEXPANSION:
smartplug-wifip130fwt: .esphome/build/$$@/.pioenvs/$$@/firmware.uf2 $$@.dev
	@for dev in $$(cat $@.dev); do \
		echo "Flashing $$dev"; \
		esphome upload $@.yaml --device $$dev; \
	done

.PHONY: clean
clean:
	rm -rf .esphome/
