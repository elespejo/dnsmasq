
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

class Gen_dns_server(basic.Server):
    """Generate dns server configuration."""