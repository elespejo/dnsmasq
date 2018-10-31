
import confgenerator.generator.basic as basic

class Gen_dhcp_range(basic.JustEqual):
    """Generate dhcp-range configuration."""

class Gen_cache_size(basic.JustEqual):
    """Generate cache-size configuration."""

class Gen_domain(basic.JustEqual):
    """Generate domain configuration."""

class Gen_dhcp_option(basic.JustEqual):
    """Generate dhcp-option configuration."""

class Gen_local(basic.JustEqual):
    """Generate local configuration."""

class Gen_dns_server(basic.basic):
    """Generate dns server configuration."""
    def write(self):
        f = open(self.file, 'a')
        f.write("no resolve\n")
        f.write("no hosts\n")
        for server in self.value_list:
            ip = server['ip']
            start_port = server['ports']['start-port']
            end_port = server['ports']['end-port']
            for port in range(start_port, end_port):
                f.write("server=%s#%s\n" % (ip, port))