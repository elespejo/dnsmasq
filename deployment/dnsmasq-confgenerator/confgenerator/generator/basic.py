
class basic():
    """Basic class for generator configuration"""
    def __init__(self, value_list, path):
        """
        Argument:
            value_list: the content of configuration need to write to file.
            path: the directory of configuration file.
        """
        self.option = self.__class__.__name__[4:].replace('_', '-')
        self.path = path
        self.value_list = value_list
        self.file = self.path+'/'+self.option+'.conf'

    def write(self):
        """Write configuration in [path]/[option].conf"""
        pass

class JustEqual(basic):
    """The config option is eqaul with list key """
    def write(self):
        """
        """
        f = open(self.file, 'w')
        f.write("%s=%s" % (self.option, self.value_list))
        f.close

