Volume API
++++++++++

This repository is now frozen-in-time and will not accept new patches. To
update Block Storage API information, please submit patches to
http://git.openstack.org/cgit/openstack/cinder-specs for a new API feature
and to http://git.openstack.org/cgit/openstack/api-site for implemented API
information.

It was the original holder for API information for the OpenStack
Block Storage, also known as Cinder. The Cinder project provides open
source block-based storage component for cloud computing.

For more details, see the `OpenStack Documentation wiki page
<http://wiki.openstack.org/Documentation>`_.

It includes these manuals:

 * Block Storage Service API v1 Reference
 * Block Storage Service API v2 Reference


Prerequisites
=============
`Apache Maven <http://maven.apache.org/>`_ must be installed to build the
documentation.

To install Maven 3 for Ubuntu 12.04 and later,and Debian wheezy and later::

    apt-get install maven

On Fedora 20 and later::

    yum install maven

Building
========

The manuals are in the ``v1`` and ``v2`` directories.

To build a specific guide, look for a ``pom.xml`` file within a subdirectory,
then run the ``mvn`` command in that directory. For example::

    cd v2
    mvn clean generate-sources

The generated PDF documentation file is::

    api-quick-start/target/docbkx/webhelp/api-quick-start-onepager-external/api-quick-start-onepager.pdf

The root of the generated HTML documentation is::

    api-quick-start/target/docbkx/webhelp/api-quick-start-onepager-external/content/index.html

Testing of changes and building of the manual
=============================================

Install the python tox package and run ``tox`` from the top-level
directory to use the same tests that are done as part of our Jenkins
gating jobs.

If you like to run individual tests, run:

 * ``tox -e checkniceness`` - to run the niceness tests
 * ``tox -e checksyntax`` - to run syntax checks
 * ``tox -e checkdeletions`` - to check that no deleted files are referenced
 * ``tox -e checkbuild`` - to actually build the manual

tox will use the `openstack-doc-tools package
<https://github.com/openstack/openstack-doc-tools>`_ for execution of
these tests. openstack-doc-tools has a requirement on maven for the
build check.


Contributing
============

Our community welcomes all people interested in open source cloud
computing, and encourages you to join the `OpenStack Foundation
<http://www.openstack.org/join>`_.

The best way to get involved with the community is to talk with others online
or at a meetup and offer contributions through our processes, the `OpenStack
wiki <http://wiki.openstack.org>`_, blogs, or on IRC at ``#openstack``
on ``irc.freenode.net``.

We welcome all types of contributions, from blueprint designs to documentation
to testing to deployment scripts.

If you would like to contribute to the documents, please see the
`Documentation HowTo <https://wiki.openstack.org/wiki/Documentation/HowTo>`_.

Bugs
====

Bugs should be filed on Launchpad, not GitHub:

   https://bugs.launchpad.net/openstack-api-site/


Installing
==========
Refer to http://docs.openstack.org to see where these documents are published
and to learn more about the OpenStack project.
