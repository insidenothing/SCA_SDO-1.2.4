srcdir = /root/G/SCA_SDO-1.2.4
builddir = /root/G/SCA_SDO-1.2.4
top_srcdir = /root/G/SCA_SDO-1.2.4
top_builddir = /root/G/SCA_SDO-1.2.4
EGREP = /bin/grep -E
SED = /bin/sed
CONFIGURE_COMMAND = './configure'
CONFIGURE_OPTIONS =
SHLIB_SUFFIX_NAME = so
SHLIB_DL_SUFFIX_NAME = so
ZEND_EXT_TYPE = zend_extension
RE2C = exit 0;
AWK = gawk
SDO_SHARED_LIBADD = -lxml2 -lz -lm
shared_objects_sdo = sdo.lo SDO_CPPException.lo SDO_DAS_ChangeSummary.lo SDO_DAS_DataFactory.lo SDO_DAS_Setting.lo SDO_DataObject.lo SDO_Exception.lo SDO_List.lo SDO_Model_Type.lo SDO_Model_Property.lo SDO_Model_ReflectionDataObject.lo SDO_Sequence.lo sdo_utils.lo xmldas_utils.lo SDO_DAS_XML.lo SDO_DAS_XML_Document.lo commonj/sdo/ChangedDataObjectListImpl.lo commonj/sdo/ChangeSummary.lo commonj/sdo/ChangeSummaryBuilder.lo commonj/sdo/ChangeSummaryImpl.lo commonj/sdo/CopyHelper.lo commonj/sdo/DASProperty.lo commonj/sdo/DASType.lo commonj/sdo/DASValue.lo commonj/sdo/DASValues.lo commonj/sdo/DataFactory.lo commonj/sdo/DataFactoryImpl.lo commonj/sdo/DataGraph.lo commonj/sdo/DataGraphImpl.lo commonj/sdo/DataObject.lo commonj/sdo/DataObjectImpl.lo commonj/sdo/DataObjectInstance.lo commonj/sdo/DataObjectList.lo commonj/sdo/DataObjectListImpl.lo commonj/sdo/DataTypeInfo.lo commonj/sdo/DefaultLogWriter.lo commonj/sdo/EqualityHelper.lo commonj/sdo/GroupDefinition.lo commonj/sdo/GroupEvent.lo commonj/sdo/HelperProvider.lo commonj/sdo/Logger.lo commonj/sdo/LogWriter.lo commonj/sdo/ParserErrorSetter.lo commonj/sdo/Property.lo commonj/sdo/PropertyDefinition.lo commonj/sdo/PropertyDefinitionImpl.lo commonj/sdo/PropertyImpl.lo commonj/sdo/PropertyList.lo commonj/sdo/PropertySetting.lo commonj/sdo/RefCountingObject.lo commonj/sdo/RefCountingPointer.lo commonj/sdo/SAX2Attribute.lo commonj/sdo/SAX2Attributes.lo commonj/sdo/SAX2Namespaces.lo commonj/sdo/SAX2Parser.lo commonj/sdo/SchemaInfo.lo commonj/sdo/SdoCheck.lo commonj/sdo/SDODate.lo commonj/sdo/SDODataConverter.lo commonj/sdo/SdoRuntime.lo commonj/sdo/SDORuntimeException.lo commonj/sdo/SDOSAX2Parser.lo commonj/sdo/SDOSchemaSAX2Parser.lo commonj/sdo/SDOUtils.lo commonj/sdo/SDOValue.lo commonj/sdo/SDOXMLBufferWriter.lo commonj/sdo/SDOXMLFileWriter.lo commonj/sdo/SDOXMLStreamWriter.lo commonj/sdo/SDOXMLString.lo commonj/sdo/SDOXMLWriter.lo commonj/sdo/SDOXSDBufferWriter.lo commonj/sdo/SDOXSDFileWriter.lo commonj/sdo/SDOXSDStreamWriter.lo commonj/sdo/SDOXSDWriter.lo commonj/sdo/Sequence.lo commonj/sdo/SequenceImpl.lo commonj/sdo/Setting.lo commonj/sdo/SettingList.lo commonj/sdo/Type.lo commonj/sdo/TypeDefinition.lo commonj/sdo/TypeDefinitionImpl.lo commonj/sdo/TypeDefinitions.lo commonj/sdo/TypeDefinitionsImpl.lo commonj/sdo/TypeImpl.lo commonj/sdo/TypeList.lo commonj/sdo/XMLDocument.lo commonj/sdo/XMLDocumentImpl.lo commonj/sdo/XMLHelper.lo commonj/sdo/XMLHelperImpl.lo commonj/sdo/XMLQName.lo commonj/sdo/XpathHelper.lo commonj/sdo/XSDHelper.lo commonj/sdo/XSDHelperImpl.lo commonj/sdo/XSDPropertyInfo.lo commonj/sdo/XSDTypeInfo.lo
PHP_PECL_EXTENSION = sdo
PHP_MODULES = $(phplibdir)/sdo.la
PHP_ZEND_EX =
all_targets = $(PHP_MODULES) $(PHP_ZEND_EX)
install_targets = install-modules install-headers
prefix = /usr
exec_prefix = $(prefix)
libdir = ${exec_prefix}/lib
prefix = /usr
phplibdir = /root/G/SCA_SDO-1.2.4/modules
phpincludedir = /usr/include/php
CC = cc
CFLAGS = -g -O2
CFLAGS_CLEAN = $(CFLAGS)
CPP = cc -E
CPPFLAGS = -DHAVE_CONFIG_H
CXX = g++
CXXFLAGS = -g -O2
CXXFLAGS_CLEAN = $(CXXFLAGS)
EXTENSION_DIR = /usr/lib64/php/modules
PHP_EXECUTABLE = /usr/bin/php
EXTRA_LDFLAGS =
EXTRA_LIBS =
INCLUDES = -I/usr/include/php -I/usr/include/php/main -I/usr/include/php/TSRM -I/usr/include/php/Zend -I/usr/include/php/ext -I/usr/include/php/ext/date/lib -I/usr/include/libxml2
LFLAGS =
LDFLAGS =
SHARED_LIBTOOL =
LIBTOOL = $(SHELL) $(top_builddir)/libtool
SHELL = /bin/sh
INSTALL_HEADERS =
mkinstalldirs = $(top_srcdir)/build/shtool mkdir -p
INSTALL = $(top_srcdir)/build/shtool install -c
INSTALL_DATA = $(INSTALL) -m 644

DEFS = -DPHP_ATOM_INC -I$(top_builddir)/include -I$(top_builddir)/main -I$(top_srcdir)
COMMON_FLAGS = $(DEFS) $(INCLUDES) $(EXTRA_INCLUDES) $(CPPFLAGS) $(PHP_FRAMEWORKPATH)

all: $(all_targets) 
	@echo
	@echo "Build complete."
	@echo "Don't forget to run 'make test'."
	@echo
	
build-modules: $(PHP_MODULES) $(PHP_ZEND_EX)

build-binaries: $(PHP_BINARIES)

libphp$(PHP_MAJOR_VERSION).la: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(LIBTOOL) --mode=link $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -rpath $(phptempdir) $(EXTRA_LDFLAGS) $(LDFLAGS) $(PHP_RPATHS) $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@
	-@$(LIBTOOL) --silent --mode=install cp $@ $(phptempdir)/$@ >/dev/null 2>&1

libs/libphp$(PHP_MAJOR_VERSION).bundle: $(PHP_GLOBAL_OBJS) $(PHP_SAPI_OBJS)
	$(CC) $(MH_BUNDLE_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS) $(PHP_GLOBAL_OBJS:.lo=.o) $(PHP_SAPI_OBJS:.lo=.o) $(PHP_FRAMEWORKS) $(EXTRA_LIBS) $(ZEND_EXTRA_LIBS) -o $@ && cp $@ libs/libphp$(PHP_MAJOR_VERSION).so

install: $(all_targets) $(install_targets)

install-sapi: $(OVERALL_TARGET)
	@echo "Installing PHP SAPI module:       $(PHP_SAPI)"
	-@$(mkinstalldirs) $(INSTALL_ROOT)$(bindir)
	-@if test ! -r $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME); then \
		for i in 0.0.0 0.0 0; do \
			if test -r $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME).$$i; then \
				$(LN_S) $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME).$$i $(phptempdir)/libphp$(PHP_MAJOR_VERSION).$(SHLIB_DL_SUFFIX_NAME); \
				break; \
			fi; \
		done; \
	fi
	@$(INSTALL_IT)

install-binaries: build-binaries $(install_binary_targets)

install-modules: build-modules
	@test -d modules && \
	$(mkinstalldirs) $(INSTALL_ROOT)$(EXTENSION_DIR)
	@echo "Installing shared extensions:     $(INSTALL_ROOT)$(EXTENSION_DIR)/"
	@rm -f modules/*.la >/dev/null 2>&1
	@$(INSTALL) modules/* $(INSTALL_ROOT)$(EXTENSION_DIR)

install-headers:
	-@if test "$(INSTALL_HEADERS)"; then \
		for i in `echo $(INSTALL_HEADERS)`; do \
			i=`$(top_srcdir)/build/shtool path -d $$i`; \
			paths="$$paths $(INSTALL_ROOT)$(phpincludedir)/$$i"; \
		done; \
		$(mkinstalldirs) $$paths && \
		echo "Installing header files:          $(INSTALL_ROOT)$(phpincludedir)/" && \
		for i in `echo $(INSTALL_HEADERS)`; do \
			if test "$(PHP_PECL_EXTENSION)"; then \
				src=`echo $$i | $(SED) -e "s#ext/$(PHP_PECL_EXTENSION)/##g"`; \
			else \
				src=$$i; \
			fi; \
			if test -f "$(top_srcdir)/$$src"; then \
				$(INSTALL_DATA) $(top_srcdir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			elif test -f "$(top_builddir)/$$src"; then \
				$(INSTALL_DATA) $(top_builddir)/$$src $(INSTALL_ROOT)$(phpincludedir)/$$i; \
			else \
				(cd $(top_srcdir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i; \
				cd $(top_builddir)/$$src && $(INSTALL_DATA) *.h $(INSTALL_ROOT)$(phpincludedir)/$$i) 2>/dev/null || true; \
			fi \
		done; \
	fi

PHP_TEST_SETTINGS = -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1'
PHP_TEST_SHARED_EXTENSIONS =  ` \
	if test "x$(PHP_MODULES)" != "x"; then \
		for i in $(PHP_MODULES)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d extension=$$dlname"; \
		done; \
	fi; \
	if test "x$(PHP_ZEND_EX)" != "x"; then \
		for i in $(PHP_ZEND_EX)""; do \
			. $$i; $(top_srcdir)/build/shtool echo -n -- " -d $(ZEND_EXT_TYPE)=$(top_builddir)/modules/$$dlname"; \
		done; \
	fi`
PHP_DEPRECATED_DIRECTIVES_REGEX = '^(magic_quotes_(gpc|runtime|sybase)?|(zend_)?extension(_debug)?(_ts)?)[\t\ ]*='

test: all
	-@if test ! -z "$(PHP_EXECUTABLE)" && test -x "$(PHP_EXECUTABLE)"; then \
		INI_FILE=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r 'echo php_ini_loaded_file();' 2> /dev/null`; \
		if test "$$INI_FILE"; then \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_FILE" > $(top_builddir)/tmp-php.ini; \
		else \
			echo > $(top_builddir)/tmp-php.ini; \
		fi; \
		INI_SCANNED_PATH=`$(PHP_EXECUTABLE) -d 'display_errors=stderr' -r '$$a = explode(",\n", trim(php_ini_scanned_files())); echo $$a[0];' 2> /dev/null`; \
		if test "$$INI_SCANNED_PATH"; then \
			INI_SCANNED_PATH=`$(top_srcdir)/build/shtool path -d $$INI_SCANNED_PATH`; \
			$(EGREP) -h -v $(PHP_DEPRECATED_DIRECTIVES_REGEX) "$$INI_SCANNED_PATH"/*.ini >> $(top_builddir)/tmp-php.ini; \
		fi; \
		TEST_PHP_EXECUTABLE=$(PHP_EXECUTABLE) \
		TEST_PHP_SRCDIR=$(top_srcdir) \
		CC="$(CC)" \
			$(PHP_EXECUTABLE) -n -c $(top_builddir)/tmp-php.ini $(PHP_TEST_SETTINGS) $(top_srcdir)/run-tests.php -n -c $(top_builddir)/tmp-php.ini -d extension_dir=$(top_builddir)/modules/ $(PHP_TEST_SHARED_EXTENSIONS) $(TESTS); \
		rm $(top_builddir)/tmp-php.ini; \
	else \
		echo "ERROR: Cannot run tests without CLI sapi."; \
	fi

clean:
	find . -name \*.gcno -o -name \*.gcda | xargs rm -f
	find . -name \*.lo -o -name \*.o | xargs rm -f
	find . -name \*.la -o -name \*.a | xargs rm -f 
	find . -name \*.so | xargs rm -f
	find . -name .libs -a -type d|xargs rm -rf
	rm -f libphp$(PHP_MAJOR_VERSION).la $(SAPI_CLI_PATH) $(OVERALL_TARGET) modules/* libs/*

distclean: clean
	rm -f Makefile config.cache config.log config.status Makefile.objects Makefile.fragments libtool main/php_config.h stamp-h sapi/apache/libphp$(PHP_MAJOR_VERSION).module buildmk.stamp
	$(EGREP) define'.*include/php' $(top_srcdir)/configure | $(SED) 's/.*>//'|xargs rm -f

.PHONY: all clean install distclean test
.NOEXPORT:
sdo.lo: /root/G/SCA_SDO-1.2.4/sdo.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/sdo.cpp -o sdo.lo 
SDO_CPPException.lo: /root/G/SCA_SDO-1.2.4/SDO_CPPException.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_CPPException.cpp -o SDO_CPPException.lo 
SDO_DAS_ChangeSummary.lo: /root/G/SCA_SDO-1.2.4/SDO_DAS_ChangeSummary.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DAS_ChangeSummary.cpp -o SDO_DAS_ChangeSummary.lo 
SDO_DAS_DataFactory.lo: /root/G/SCA_SDO-1.2.4/SDO_DAS_DataFactory.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DAS_DataFactory.cpp -o SDO_DAS_DataFactory.lo 
SDO_DAS_Setting.lo: /root/G/SCA_SDO-1.2.4/SDO_DAS_Setting.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DAS_Setting.cpp -o SDO_DAS_Setting.lo 
SDO_DataObject.lo: /root/G/SCA_SDO-1.2.4/SDO_DataObject.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DataObject.cpp -o SDO_DataObject.lo 
SDO_Exception.lo: /root/G/SCA_SDO-1.2.4/SDO_Exception.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_Exception.cpp -o SDO_Exception.lo 
SDO_List.lo: /root/G/SCA_SDO-1.2.4/SDO_List.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_List.cpp -o SDO_List.lo 
SDO_Model_Type.lo: /root/G/SCA_SDO-1.2.4/SDO_Model_Type.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_Model_Type.cpp -o SDO_Model_Type.lo 
SDO_Model_Property.lo: /root/G/SCA_SDO-1.2.4/SDO_Model_Property.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_Model_Property.cpp -o SDO_Model_Property.lo 
SDO_Model_ReflectionDataObject.lo: /root/G/SCA_SDO-1.2.4/SDO_Model_ReflectionDataObject.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_Model_ReflectionDataObject.cpp -o SDO_Model_ReflectionDataObject.lo 
SDO_Sequence.lo: /root/G/SCA_SDO-1.2.4/SDO_Sequence.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_Sequence.cpp -o SDO_Sequence.lo 
sdo_utils.lo: /root/G/SCA_SDO-1.2.4/sdo_utils.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/sdo_utils.cpp -o sdo_utils.lo 
xmldas_utils.lo: /root/G/SCA_SDO-1.2.4/xmldas_utils.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/xmldas_utils.cpp -o xmldas_utils.lo 
SDO_DAS_XML.lo: /root/G/SCA_SDO-1.2.4/SDO_DAS_XML.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DAS_XML.cpp -o SDO_DAS_XML.lo 
SDO_DAS_XML_Document.lo: /root/G/SCA_SDO-1.2.4/SDO_DAS_XML_Document.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/SDO_DAS_XML_Document.cpp -o SDO_DAS_XML_Document.lo 
commonj/sdo/ChangedDataObjectListImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangedDataObjectListImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangedDataObjectListImpl.cpp -o commonj/sdo/ChangedDataObjectListImpl.lo 
commonj/sdo/ChangeSummary.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummary.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummary.cpp -o commonj/sdo/ChangeSummary.lo 
commonj/sdo/ChangeSummaryBuilder.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummaryBuilder.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummaryBuilder.cpp -o commonj/sdo/ChangeSummaryBuilder.lo 
commonj/sdo/ChangeSummaryImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummaryImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/ChangeSummaryImpl.cpp -o commonj/sdo/ChangeSummaryImpl.lo 
commonj/sdo/CopyHelper.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/CopyHelper.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/CopyHelper.cpp -o commonj/sdo/CopyHelper.lo 
commonj/sdo/DASProperty.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DASProperty.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DASProperty.cpp -o commonj/sdo/DASProperty.lo 
commonj/sdo/DASType.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DASType.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DASType.cpp -o commonj/sdo/DASType.lo 
commonj/sdo/DASValue.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DASValue.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DASValue.cpp -o commonj/sdo/DASValue.lo 
commonj/sdo/DASValues.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DASValues.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DASValues.cpp -o commonj/sdo/DASValues.lo 
commonj/sdo/DataFactory.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataFactory.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataFactory.cpp -o commonj/sdo/DataFactory.lo 
commonj/sdo/DataFactoryImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataFactoryImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataFactoryImpl.cpp -o commonj/sdo/DataFactoryImpl.lo 
commonj/sdo/DataGraph.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataGraph.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataGraph.cpp -o commonj/sdo/DataGraph.lo 
commonj/sdo/DataGraphImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataGraphImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataGraphImpl.cpp -o commonj/sdo/DataGraphImpl.lo 
commonj/sdo/DataObject.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObject.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObject.cpp -o commonj/sdo/DataObject.lo 
commonj/sdo/DataObjectImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectImpl.cpp -o commonj/sdo/DataObjectImpl.lo 
commonj/sdo/DataObjectInstance.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectInstance.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectInstance.cpp -o commonj/sdo/DataObjectInstance.lo 
commonj/sdo/DataObjectList.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectList.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectList.cpp -o commonj/sdo/DataObjectList.lo 
commonj/sdo/DataObjectListImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectListImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataObjectListImpl.cpp -o commonj/sdo/DataObjectListImpl.lo 
commonj/sdo/DataTypeInfo.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DataTypeInfo.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DataTypeInfo.cpp -o commonj/sdo/DataTypeInfo.lo 
commonj/sdo/DefaultLogWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/DefaultLogWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/DefaultLogWriter.cpp -o commonj/sdo/DefaultLogWriter.lo 
commonj/sdo/EqualityHelper.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/EqualityHelper.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/EqualityHelper.cpp -o commonj/sdo/EqualityHelper.lo 
commonj/sdo/GroupDefinition.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/GroupDefinition.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/GroupDefinition.cpp -o commonj/sdo/GroupDefinition.lo 
commonj/sdo/GroupEvent.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/GroupEvent.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/GroupEvent.cpp -o commonj/sdo/GroupEvent.lo 
commonj/sdo/HelperProvider.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/HelperProvider.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/HelperProvider.cpp -o commonj/sdo/HelperProvider.lo 
commonj/sdo/Logger.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/Logger.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/Logger.cpp -o commonj/sdo/Logger.lo 
commonj/sdo/LogWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/LogWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/LogWriter.cpp -o commonj/sdo/LogWriter.lo 
commonj/sdo/ParserErrorSetter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/ParserErrorSetter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/ParserErrorSetter.cpp -o commonj/sdo/ParserErrorSetter.lo 
commonj/sdo/Property.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/Property.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/Property.cpp -o commonj/sdo/Property.lo 
commonj/sdo/PropertyDefinition.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyDefinition.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyDefinition.cpp -o commonj/sdo/PropertyDefinition.lo 
commonj/sdo/PropertyDefinitionImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyDefinitionImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyDefinitionImpl.cpp -o commonj/sdo/PropertyDefinitionImpl.lo 
commonj/sdo/PropertyImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyImpl.cpp -o commonj/sdo/PropertyImpl.lo 
commonj/sdo/PropertyList.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyList.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertyList.cpp -o commonj/sdo/PropertyList.lo 
commonj/sdo/PropertySetting.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertySetting.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/PropertySetting.cpp -o commonj/sdo/PropertySetting.lo 
commonj/sdo/RefCountingObject.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/RefCountingObject.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/RefCountingObject.cpp -o commonj/sdo/RefCountingObject.lo 
commonj/sdo/RefCountingPointer.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/RefCountingPointer.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/RefCountingPointer.cpp -o commonj/sdo/RefCountingPointer.lo 
commonj/sdo/SAX2Attribute.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Attribute.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Attribute.cpp -o commonj/sdo/SAX2Attribute.lo 
commonj/sdo/SAX2Attributes.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Attributes.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Attributes.cpp -o commonj/sdo/SAX2Attributes.lo 
commonj/sdo/SAX2Namespaces.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Namespaces.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Namespaces.cpp -o commonj/sdo/SAX2Namespaces.lo 
commonj/sdo/SAX2Parser.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Parser.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SAX2Parser.cpp -o commonj/sdo/SAX2Parser.lo 
commonj/sdo/SchemaInfo.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SchemaInfo.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SchemaInfo.cpp -o commonj/sdo/SchemaInfo.lo 
commonj/sdo/SdoCheck.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SdoCheck.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SdoCheck.cpp -o commonj/sdo/SdoCheck.lo 
commonj/sdo/SDODate.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDODate.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDODate.cpp -o commonj/sdo/SDODate.lo 
commonj/sdo/SDODataConverter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDODataConverter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDODataConverter.cpp -o commonj/sdo/SDODataConverter.lo 
commonj/sdo/SdoRuntime.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SdoRuntime.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SdoRuntime.cpp -o commonj/sdo/SdoRuntime.lo 
commonj/sdo/SDORuntimeException.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDORuntimeException.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDORuntimeException.cpp -o commonj/sdo/SDORuntimeException.lo 
commonj/sdo/SDOSAX2Parser.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOSAX2Parser.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOSAX2Parser.cpp -o commonj/sdo/SDOSAX2Parser.lo 
commonj/sdo/SDOSchemaSAX2Parser.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOSchemaSAX2Parser.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOSchemaSAX2Parser.cpp -o commonj/sdo/SDOSchemaSAX2Parser.lo 
commonj/sdo/SDOUtils.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOUtils.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOUtils.cpp -o commonj/sdo/SDOUtils.lo 
commonj/sdo/SDOValue.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOValue.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOValue.cpp -o commonj/sdo/SDOValue.lo 
commonj/sdo/SDOXMLBufferWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLBufferWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLBufferWriter.cpp -o commonj/sdo/SDOXMLBufferWriter.lo 
commonj/sdo/SDOXMLFileWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLFileWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLFileWriter.cpp -o commonj/sdo/SDOXMLFileWriter.lo 
commonj/sdo/SDOXMLStreamWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLStreamWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLStreamWriter.cpp -o commonj/sdo/SDOXMLStreamWriter.lo 
commonj/sdo/SDOXMLString.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLString.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLString.cpp -o commonj/sdo/SDOXMLString.lo 
commonj/sdo/SDOXMLWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXMLWriter.cpp -o commonj/sdo/SDOXMLWriter.lo 
commonj/sdo/SDOXSDBufferWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDBufferWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDBufferWriter.cpp -o commonj/sdo/SDOXSDBufferWriter.lo 
commonj/sdo/SDOXSDFileWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDFileWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDFileWriter.cpp -o commonj/sdo/SDOXSDFileWriter.lo 
commonj/sdo/SDOXSDStreamWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDStreamWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDStreamWriter.cpp -o commonj/sdo/SDOXSDStreamWriter.lo 
commonj/sdo/SDOXSDWriter.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDWriter.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SDOXSDWriter.cpp -o commonj/sdo/SDOXSDWriter.lo 
commonj/sdo/Sequence.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/Sequence.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/Sequence.cpp -o commonj/sdo/Sequence.lo 
commonj/sdo/SequenceImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SequenceImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SequenceImpl.cpp -o commonj/sdo/SequenceImpl.lo 
commonj/sdo/Setting.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/Setting.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/Setting.cpp -o commonj/sdo/Setting.lo 
commonj/sdo/SettingList.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/SettingList.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/SettingList.cpp -o commonj/sdo/SettingList.lo 
commonj/sdo/Type.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/Type.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/Type.cpp -o commonj/sdo/Type.lo 
commonj/sdo/TypeDefinition.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinition.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinition.cpp -o commonj/sdo/TypeDefinition.lo 
commonj/sdo/TypeDefinitionImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitionImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitionImpl.cpp -o commonj/sdo/TypeDefinitionImpl.lo 
commonj/sdo/TypeDefinitions.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitions.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitions.cpp -o commonj/sdo/TypeDefinitions.lo 
commonj/sdo/TypeDefinitionsImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitionsImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeDefinitionsImpl.cpp -o commonj/sdo/TypeDefinitionsImpl.lo 
commonj/sdo/TypeImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeImpl.cpp -o commonj/sdo/TypeImpl.lo 
commonj/sdo/TypeList.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeList.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/TypeList.cpp -o commonj/sdo/TypeList.lo 
commonj/sdo/XMLDocument.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLDocument.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLDocument.cpp -o commonj/sdo/XMLDocument.lo 
commonj/sdo/XMLDocumentImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLDocumentImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLDocumentImpl.cpp -o commonj/sdo/XMLDocumentImpl.lo 
commonj/sdo/XMLHelper.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLHelper.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLHelper.cpp -o commonj/sdo/XMLHelper.lo 
commonj/sdo/XMLHelperImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLHelperImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLHelperImpl.cpp -o commonj/sdo/XMLHelperImpl.lo 
commonj/sdo/XMLQName.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLQName.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XMLQName.cpp -o commonj/sdo/XMLQName.lo 
commonj/sdo/XpathHelper.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XpathHelper.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XpathHelper.cpp -o commonj/sdo/XpathHelper.lo 
commonj/sdo/XSDHelper.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDHelper.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDHelper.cpp -o commonj/sdo/XSDHelper.lo 
commonj/sdo/XSDHelperImpl.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDHelperImpl.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDHelperImpl.cpp -o commonj/sdo/XSDHelperImpl.lo 
commonj/sdo/XSDPropertyInfo.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDPropertyInfo.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDPropertyInfo.cpp -o commonj/sdo/XSDPropertyInfo.lo 
commonj/sdo/XSDTypeInfo.lo: /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDTypeInfo.cpp
	$(LIBTOOL) --mode=compile $(CXX) -I/root/G/SCA_SDO-1.2.4 -I. -I/root/G/SCA_SDO-1.2.4 $(COMMON_FLAGS) $(CXXFLAGS_CLEAN) $(EXTRA_CXXFLAGS)  -c /root/G/SCA_SDO-1.2.4/commonj/sdo/XSDTypeInfo.cpp -o commonj/sdo/XSDTypeInfo.lo 
$(phplibdir)/sdo.la: ./sdo.la
	$(LIBTOOL) --mode=install cp ./sdo.la $(phplibdir)

./sdo.la: $(shared_objects_sdo) $(SDO_SHARED_DEPENDENCIES)
	$(LIBTOOL) --mode=link $(CXX) $(COMMON_FLAGS) $(CFLAGS_CLEAN) $(EXTRA_CFLAGS) $(LDFLAGS) -o $@ -export-dynamic -avoid-version -prefer-pic -module -rpath $(phplibdir) $(EXTRA_LDFLAGS) $(shared_objects_sdo) $(SDO_SHARED_LIBADD)

