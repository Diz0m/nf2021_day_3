Distribution: {{hostvars[inventory_hostname]['ansible_facts']['lsb']['description']}}
Kernel: {{hostvars[inventory_hostname]['ansible_facts']['kernel']}}
vCPUs: {{hostvars[inventory_hostname]['ansible_facts']['processor_vcpus']}}
RAM_MB: {{hostvars[inventory_hostname]['ansible_facts']['memory_mb']['real']['total']}}
Boot_image: {{hostvars[inventory_hostname]['ansible_facts']['proc_cmdline']['BOOT_IMAGE']}}
Python3: {{hostvars[inventory_hostname]['ansible_facts']['python_version']}}
