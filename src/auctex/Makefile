# Makefile for AUCTeX

# Maintainer: auctex-devel@gnu.org

# Copyright (C) 2003, 2004, 2005, 2006, 2007 Free Software Foundation, Inc.

# This file is part of AUCTeX.

# AUCTeX is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.

# AUCTeX is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with AUCTeX; see the file COPYING.  If not, write to the Free
# Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.



prefix = /usr/local$(null)
exec_prefix = ${prefix}$(null)
libdir = ${exec_prefix}/lib$(null)
packagedatadir = /usr/share/emacs/site-lisp/auctex$(null)
datarootdir = ${prefix}/share$(null)
datadir = ${datarootdir}$(null)
localstatedir = ${prefix}/var$(null)
infodir = ${datarootdir}/info$(null)
lispdir = /usr/share/emacs/site-lisp$(null)
auctexstartfile=/usr/share/emacs/site-lisp/auctex.el
packagelispdir = /usr/share/emacs/site-lisp/auctex$(null)
packagedatadir = /usr/share/emacs/site-lisp/auctex$(null)
packagedir = no$(null)
autodir = ${localstatedir}/auctex$(null)
preview_enabled=yes
subdirs= preview
styledir = $(packagedatadir)/style
AUCTEXDATE = 2008-02-10
AUCTEXVERSION = 11.85

INSTALL = /bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
MKINSTALLDIRS = ./mkinstalldirs
DESTDIR=

PACKAGE=auctex
PACKAGE_INFO=auctex preview-latex
EMACS=/usr/bin/emacs
ELCC=$(EMACS) -batch -q -no-site-file -no-init-file -l lpath.el
AUTOLOAD=--eval '(let ((generated-autoload-file (expand-file-name "$@"))) \
  (mapcar (function update-file-autoloads) command-line-args-left) \
  (save-buffers-kill-emacs t))'
DESCEND=test -z "$(subdirs)" || (OLDPWD="`pwd`";for i in ""$(subdirs);do cd $$i;echo "Descending into `pwd`";$(MAKE) 'DESTDIR=$(DESTDIR)' PACKAGE=$(PACKAGE) $@ || exit $$?;cd "$$OLDPWD";echo "Ascending into $$OLDPWD";done)

CVSFILES=autogen.sh .cvsignore doc/.cvsignore preview/.cvsignore \
	preview/latex/.cvsignore README.CVS

.SUFFIXES: .el .elc .texi

SHELL = /bin/sh
CP = cp -p
CP_A = $(CP) -R

DIST_PREFIX = /home/tmp/auctex-
FTPDIR = $(DIST_PREFIX)ftp
WWWDIR = $(DIST_PREFIX)www
XEMACS_BUILD_DIR = xemacs-build
PREVIEW_BUILD_DIR = preview-build
COMMITTER_NAME="David Kastrup"
COMMITTER_EMAIL=dak@gnu.org
RPMROOT = /usr/src/redhat
RPM_SIGN = --sign

MULESRC = tex-jp.el
MULEELC = tex-jp.elc

AUCSRC = tex.el tex-buf.el tex-style.el latex.el tex-info.el \
	texmathp.el multi-prompt.el tex-mik.el font-latex.el tex-font.el \
	context.el context-en.el context-nl.el tex-fold.el \
	toolbar-x.el tex-bar.el bib-cite.el tex-fptex.el
AUCELC = $(AUCSRC:.el=.elc)

STYLESRC = style/prosper.el \
	   style/slides.el    style/foils.el     style/amstex.el \
	   style/article.el   style/book.el      style/letter.el \
	   style/report.el    style/amsart.el    style/amsbook.el \
	   style/epsf.el      style/psfig.el     style/latexinfo.el \
	   style/dutch.el     style/german.el    style/dk.el \
	   style/j-article.el style/j-book.el    style/j-report.el \
	   style/jarticle.el  style/jbook.el     style/jreport.el \
	   style/dinbrief.el  style/virtex.el    style/plfonts.el \
	   style/plhb.el      style/harvard.el	 style/swedish.el \
	   style/danish.el    style/slovak.el    style/czech.el \
	   style/amsmath.el   style/amstext.el   style/amsbsy.el \
	   style/amsopn.el    style/amsthm.el	 style/natbib.el \
	   style/index.el     style/makeidx.el   style/multind.el \
	   style/varioref.el  style/fancyref.el	 style/mdwlist.el \
	   style/ngerman.el   style/graphicx.el	 style/graphics.el \
	   style/verbatim.el  style/scrbase.el   style/scrartcl.el \
	   style/scrbook.el   style/scrreprt.el	 style/scrlttr2.el \
	   style/scrpage2.el  style/captcont.el  style/subfigure.el \
	   style/paralist.el  style/booktabs.el  style/emp.el \
	   style/jura.el      style/alphanum.el	 style/beamer.el \
	   style/alltt.el     style/italian.el   style/doc.el \
	   style/ltxdoc.el    style/ltx-base.el	 style/units.el \
	   style/nicefrac.el  style/url.el       style/listings.el \
	   style/jurabib.el   style/csquotes.el  style/jsarticle.el \
	   style/jsbook.el    style/babel.el     style/dk-bib.el \
	   style/inputenc.el  style/frenchb.el   style/francais.el \
	   style/MinionPro.el style/pdfsync.el   style/polish.el \
	   style/polski.el    style/icelandic.el style/comment.el \
	   style/flashcards.el style/pstricks.el style/nomencl.el
STYLEELC = $(STYLESRC:.el=.elc)

CLEANFILES = $(AUCELC) $(STYLEELC) $(MULEELC)
DISTCLEANFILES = Makefile tex-site.el tex-site.el.out auctex.el \
	auto-loads.el config.*
DISTTEXTS = FAQ INSTALL INSTALL.windows README TODO

NOSEARCH = style/.nosearch

all: lisp docs
	$(DESCEND)

.PHONY: all lisp info dvi some install install-el install-lisp \
	docs install-docs install-auto \
	install-metadata install-startup install-man \
	clean distclean snapshot check-dist release-commit \
	dist patch tar-ball rpm-packages full-release tar-ball-clean \
	wc xemacs-package preview-ball

lisp:	tex-site.el $(AUCSRC) $(STYLESRC) $(MULESRC)
	$(ELCC) -f batch-byte-compile $(AUCSRC) $(STYLESRC) $(MULESRC)

docs:
	cd doc ; $(MAKE) all

info:
	cd doc ; $(MAKE) info

dvi:
	cd doc ; $(MAKE) dvi

tex-site.el: tex-site.el.out auto-loads.el Makefile
	cat tex-site.el.out >$@
	test X$(packagedir) != Xno || cat auto-loads.el >>$@
	echo "(provide 'tex-site)" >>$@ ; \
	test X$(packagedir) != Xno || echo ";;; tex-site.el ends here" >>$@

tex-site.el.out: tex-site.el.in Makefile config.status
	./config.status

auctex.el: auctex.el.in config.status
	./config.status

configure: configure.ac aclocal.m4
	autoconf

Makefile: Makefile.in config.status
	./config.status

doc/Makefile: doc/Makefile.in config.status ChangeLog
	./config.status

config.status: configure
	./config.status --recheck

auto-loads.el: $(AUCSRC) $(MULESRC) Makefile
	test X$(packagedir) != Xno || { \
	  rm -f $@ ; \
	  $(ELCC) $(AUTOLOAD) $(AUCSRC) $(MULESRC) || : ; \
	  test -r $@ || { \
	    echo ";; Auto-generated part of tex-site.el" > $@ ; \
	    echo "" >> $@ ; \
	    $(ELCC) $(AUTOLOAD) $(AUCSRC) $(MULESRC) ; \
	  } ; \
	}

some:	$(AUCELC) $(STYLEELC)

install: install-lisp install-docs install-images install-startup
	$(DESCEND)
	$(MAKE) 'DESTDIR=$(DESTDIR)' install-metadata

install-man: doc/Makefile
	cd doc && $(MAKE) 'DESTDIR=$(DESTDIR)' install-man
	$(INSTALL_DATA) RELEASE $(DESTDIR)$(packagedir)/man/auctex

install-startup:
	test $(packagedir) != no || \
	  $(INSTALL_DATA) auctex.el $(DESTDIR)$(auctexstartfile)

install-el:
	-$(MKINSTALLDIRS) $(DESTDIR)$(lispdir)
	rm -f $(DESTDIR)$(packagelispdir)/tex-site.el # Remove old (CVS-version) mistakes
	test ! -f $(DESTDIR)$(lispdir)/tex-site.el || { \
	   if grep -q "tex-site.*Don't edit." $(DESTDIR)$(lispdir)/tex-site.el; then \
	    echo "Overwriting old tex-site.el" ; \
	   else \
	    echo "Renaming old tex-site.el to tex-site.el.save" ; \
	    mv $(DESTDIR)$(lispdir)/tex-site.el $(DESTDIR)$(lispdir)/tex-site.el.save ; \
	   fi; \
	}
	if test X$(packagedir) = Xno; \
	then $(INSTALL_DATA) tex-site.el $(DESTDIR)$(lispdir) ; \
	else rm -f $(DESTDIR)$(lispdir)/tex-site.el ; \
	fi
	-$(MKINSTALLDIRS) $(DESTDIR)$(packagelispdir)
	@: $(MAKE) ; for x in $(AUCSRC) $(MULESRC); do \
	  echo '$(INSTALL_DATA)' $$x '$(DESTDIR)$(packagelispdir)' ; \
	done
	@for x in $(AUCSRC) $(MULESRC); do \
	  $(INSTALL_DATA) $$x $(DESTDIR)$(packagelispdir) ; \
	done;
	-$(MKINSTALLDIRS) $(DESTDIR)$(styledir)
	$(INSTALL_DATA) $(NOSEARCH) $(DESTDIR)$(styledir)
	@: $(MAKE) ; for x in $(STYLESRC) ; do \
	  echo '$(INSTALL_DATA)' $$x '$(DESTDIR)$(styledir)' ; \
	done;
	@for x in $(STYLESRC) ; do \
	  $(INSTALL_DATA) $$x $(DESTDIR)$(styledir) ; \
	done;
	-$(MKINSTALLDIRS) $(DESTDIR)$(autodir)
	-$(INSTALL_DATA) $(NOSEARCH) $(DESTDIR)$(autodir)

install-lisp: some install-el
	@: $(MAKE) ; for x in $(AUCSRC) $(MULESRC); do \
	  echo '$(INSTALL_DATA)' $${x}c '$(DESTDIR)$(packagelispdir)' ; \
	done
	@for x in $(AUCSRC) $(MULESRC); do \
	  $(INSTALL_DATA) $${x}c $(DESTDIR)$(packagelispdir) ; \
	done
	@: $(MAKE) ; for x in $(STYLESRC) ; do \
	  echo '$(INSTALL_DATA)' $${x}c '$(DESTDIR)$(styledir)' ; \
	done
	@for x in $(STYLESRC) ; do \
	  $(INSTALL_DATA) $${x}c $(DESTDIR)$(styledir) ; \
	done

install-images:
	-$(MKINSTALLDIRS) $(DESTDIR)$(packagedatadir)/images
	@: $(MAKE) ; for x in images/*.xpm ; do \
	  echo '$(INSTALL_DATA)' $${x} '$(DESTDIR)$(packagedatadir)/images' ; \
	done
	@for x in images/*.xpm ; do \
	  $(INSTALL_DATA) $${x} $(DESTDIR)$(packagedatadir)/images ; \
	done

install-docs:	doc/Makefile
	cd doc ; $(MAKE) DESTDIR=$(DESTDIR) install-auctex
	test "x$(preview_enabled)" != xyes || { \
		cd doc ; $(MAKE) DESTDIR=$(DESTDIR) install-preview; }

install-auto:
	@echo "Use \"M-x TeX-auto-generate-global RET\" instead."

install-metadata:
	test "x$(packagedir)" = xno || { \
	  $(MKINSTALLDIRS) $(DESTDIR)$(packagedir)/pkginfo || : ; \
	  if test "x$(preview_enabled)" = xyes; then \
	    $(ELCC) -l preview/prv-install -f preview-make-package $(DESTDIR)$(packagedir) "$(PACKAGE)" \"`echo $(AUCTEXDATE)|sed 's/\(.*\)-\(.*\)-\(.*\)/\1.\2\3/'`\" \"$(AUCTEXVERSION)\" tex-site.el preview/auto.el; \
	  else \
	    $(ELCC) -l preview/prv-install -f preview-make-package $(DESTDIR)$(packagedir) "$(PACKAGE)" \"`echo $(AUCTEXDATE)|sed 's/\(.*\)-\(.*\)-\(.*\)/\1.\2\3/'`\" \"$(AUCTEXVERSION)\" tex-site.el; \
	  fi && \
	  cd $(DESTDIR)$(packagedir) && \
	  find "etc/$(PACKAGE)" "lisp/$(PACKAGE)" -print >"pkginfo/MANIFEST.$(PACKAGE)" && \
	  for i in $(PACKAGE_INFO); do \
	    test -r "info/$$i.info" && echo "info/$$i.info" >> "pkginfo/MANIFEST.$(PACKAGE)" ; \
	  done && \
	  echo "pkginfo/MANIFEST.$(PACKAGE)" >> "pkginfo/MANIFEST.$(PACKAGE)" ; \
	}

.el.elc:
	$(ELCC) -f batch-byte-compile $<

clean:	doc/Makefile
	rm -f $(CLEANFILES)
	cd doc && $(MAKE) clean
	$(DESCEND)

distclean:	doc/Makefile
	rm -f $(CLEANFILES) $(DISTCLEANFILES)
	cd doc && $(MAKE) distclean
	$(DESCEND)

maintainer-clean: distclean
	rm -f $(DISTTEXTS)
	rm -rf autom4te.cache

extraclean: maintainer-clean
	rm -f *~ \#*\#

tar-ball-clean:
	@if [ "X$(TAG)" = "X" ]; then echo "*** No tag ***"; exit 1; fi
	rm -rf auctex-$(TAG)/
	rm -rf $(XEMACS_BUILD_DIR)/

wc:
	wc $(AUCSRC) $(STYLESRC)

# The targets below are intened to be used only by the maintainers.

snapshot: check-dist tar-ball

dist:	check-dist release-commit tar-ball

check-dist:
	@if [ "X$(TAG)" = "X" ]; then echo "*** No tag ***"; exit 1; fi
	if [ "X$(OLD)" = "X" ]; then echo "No patch"; exit 1; fi

release-commit:
	@echo "**********************************************************"
	@echo "** Making distribution of auctex for release $(TAG)"
	@echo "**********************************************************"
	sleep 3
	mv ChangeLog ChangeLog.old
	echo `date "+%Y-%m-%d "` \
	     " "${COMMITTER_NAME}"  <"${COMMITTER_EMAIL}">" > ChangeLog
	echo >> ChangeLog
	echo "	* Version" $(TAG) released. >> ChangeLog
	echo >> ChangeLog
	cat ChangeLog.old >> ChangeLog
	cvs commit -m 'Release_$(TAG)' ChangeLog
	cvs tag release_`echo $(TAG) | sed -e 's/[.]/_/g'`

tar-ball:	doc/Makefile
	test ! -d auctex-$(TAG) || rm -r auctex-$(TAG)
	mkdir auctex-$(TAG)
# Use TAG_EXPORT if set (for snapshots)
	cvs export -d auctex-$(TAG) \
          `echo $${TAG_EXPORT:=$(TAG)} | \
	  sed -e '/^\([-0-9]*[0-9]\)[-a-z]*$$/s//-D \1/' \
              -e '/[.]/{s/^/-r release_/;s/[.]/_/g}'` auctex
	cd auctex-$(TAG) && AUCTEXVERSION=$(TAG) AUCTEXDATE=$(AUCTEXDATE) ./autogen.sh && rm $(CVSFILES)
	chmod -R go-w+rX auctex-$(TAG)
	rm -rf $(FTPDIR)
	mkdir -p $(FTPDIR)
	tar -cf - --owner=root --group=root auctex-$(TAG) | gzip --best > $(FTPDIR)/auctex-$(TAG).tar.gz
	-zip -r $(FTPDIR)/auctex-$(TAG).zip auctex-$(TAG)
	$(CP) auctex-$(TAG)/CHANGES $(FTPDIR)/CHANGES
	$(CP) auctex-$(TAG)/RELEASE $(FTPDIR)/RELEASE-$(TAG)
# The following files aren't produced in auctex-$(TAG) since they
# are not in the tarball and should not become part of the patch target.
	$(CP) auctex-$(TAG)/doc/version.texi doc/version.texi
	cd doc && $(MAKE) extradist
	rm -f doc/version.texi
	$(CP) doc/auctex.ps doc/auctex.pdf doc/tex-ref.ps doc/tex-ref.pdf $(FTPDIR)
	$(CP) ChangeLog $(FTPDIR)

rpm-packages:
	rpmbuild -ta $(RPM_SIGN) $(FTPDIR)/auctex-$(TAG).tar.gz
	$(CP) $(RPMROOT)/{RPMS/noarch/{auctex-emacs,preview-tetex},SRPMS/auctex}-$(TAG)[.-]* $(FTPDIR)
	@echo "If you need to prepare RPM on some other system, you need to add"
	@echo "them in $(FTPDIR) before 'make full-release'."
	sleep 2

preview-ball:
	test ! -d $(PREVIEW_BUILD_DIR) || rm -r $(PREVIEW_BUILD_DIR)
	mkdir $(PREVIEW_BUILD_DIR)
# Use TAG_EXPORT if set (for snapshots)
	cvs export -d $(PREVIEW_BUILD_DIR) \
          `echo $${TAG_EXPORT:=$(TAG)} | \
	  sed -e '/^\([-0-9]*[0-9]\)[-a-z]*$$/s//-D \1/' \
              -e '/[.]/{s/^/-r release_/;s/[.]/_/g}'` auctex/preview/latex
	cd $(PREVIEW_BUILD_DIR) && make -f ../preview/latex/Makefile preview.ins preview.pdf
	chmod -R go-w+rX $(PREVIEW_BUILD_DIR)
	test -d $(FTPDIR) || mkdir -p $(FTPDIR)
	cd $(PREVIEW_BUILD_DIR) && \
	tar -cf - --owner=root --group=root README preview.dtx preview.ins preview.pdf | gzip --best > $(FTPDIR)/preview-$(TAG).tar.gz

full-release:
	rm -f $(FTPDIR)/*.{directive,asc,sig}
	if [ "x$$GPG_AGENT_INFO" = "x" ]; then \
	  read -sp "Enter pass phrase: " phrase ; \
	  gpg_opt="--passphrase-fd 0"; \
	else \
	  gpg_opt=""; phrase=""; \
	fi; \
	for i in $(FTPDIR)/*; do \
	   echo "$$phrase" | gpg --detach-sign $$gpg_opt $$i ; \
	   case $$i in *-$(TAG)*) echo "directory: auctex" >$$i.directive;; \
	      *) echo "directory: auctex/$(TAG)-extra" >$$i.directive ;; \
	   esac ; \
	   echo "$$phrase" | gpg $$gpg_opt --clearsign $$i.directive ; \
	done
	rm $(FTPDIR)/*.directive

patch:
	diff -u auctex-$(OLD) auctex-$(TAG) | gzip --best \
		>$(FTPDIR)/auctex-$(OLD)-to-$(TAG).patch.gz

xemacs-package:
	rm -rf $(XEMACS_BUILD_DIR)
	$(CP_A) auctex-$(TAG) $(XEMACS_BUILD_DIR)
	cd $(XEMACS_BUILD_DIR) \
	&& ./configure INSTALL_INFO=: TEXHASH=: --with-xemacs --with-packagedir=`pwd`/xemacs-package --without-texmf-dir --with-auto-dir=etc/auctex/auto \
	&& make all install-man install && cd xemacs-package && tar -cf - --owner=root --group=root . | gzip --best > $(FTPDIR)/auctex-$(TAG)-pkg.tar.gz

www-doc:
	rm -rf $(WWWDIR)
	mkdir -p $(WWWDIR)/manual
	$(CP) doc/*.texi $(WWWDIR)/manual
	cd $(WWWDIR)/manual \
	&& wget -O gendocs.sh 'http://savannah.gnu.org/cgi-bin/viewcvs/%2acheckout%2a/texinfo/texinfo/util/gendocs.sh?rev=HEAD' \
	&& patch <$(GENDOCSPATCH) \
	&& chmod u+x gendocs.sh \
	&& wget -O gendocs_template 'http://savannah.gnu.org/cgi-bin/viewcvs/%2acheckout%2a/texinfo/texinfo/util/gendocs_template?rev=HEAD' \
	&& sed -i -e 's/html_node\/index\.html/%%PACKAGE%%\/index.html/' gendocs_template \
	&& mkdir .texinfo \
	&& echo -e "emacs split http://www.gnu.org/software/emacs/manual/html_node/\nemacs mono http://www.gnu.org/software/emacs/manual/emacs.html\nreftex mono http://staff.science.uva.nl/~dominik/Tools/reftex/reftex.html\n" > .texinfo/htmlxref.cnf \
	&& ./gendocs.sh auctex "AUCTeX Manual" \
	&& ./gendocs.sh preview-latex "preview-latex Manual"
