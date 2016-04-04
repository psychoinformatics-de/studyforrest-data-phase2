An Extension of studyforrest.org Dataset
****************************************

|license| |access| |doi|

Simultaneous fMRI/eyetracking while movie watching, plus visual localizers
==========================================================================

This is an extension of the studyforrest project, all participants previously
volunteered for the audio-only Forrest Gump study. The datset is structured in
BIDS format, details of the files and metadata can be found at:

     Ayan Sengupta, Falko R. Kaule, J. Swaroop Guntupalli, Michael B. Hoffmann,
     Christian Häusler, Jörg Stadler, Michael Hanke. `An extension of the
     studyforrest dataset for vision research
     <http://biorxiv.org/content/early/2016/03/31/046573>`_. (submitted for
     publication)

     Michael Hanke, Nico Adelhöfer, Daniel Kottke, Vittorio Iacovella,
     Ayan Sengupta, Falko R. Kaule, Roland Nigbur, Alexander Q. Waite,
     Florian J. Baumgartner & Jörg Stadler. `Simultaneous fMRI and eye gaze
     recordings during prolonged natural stimulation – a studyforrest extension
     <http://biorxiv.org/content/early/2016/03/31/046581>`_. (submitted for
     publication)


For more information about the project visit: http://studyforrest.org


How to obtain the data files
----------------------------

This repository contains metadata and information on the identity of all
included files. However, the actual content of the (sometime large) data
files is stored elsewhere. To obtain any dataset component, git-annex_ is
required in addition to Git_.

1. Clone this repository to the desired location.
2. Enter the directory with the local clone and run::

     git annex init

   Older versions of git-annex may require you to run the following
   command immediately afterwards::

     git annex enableremote mddatasrc

Now any desired dataset component can be obtained by using the ``git annex get``
command. To obtain the entire dataset content run::

     git annex get .

Keep data up-to-date
--------------------

If updates to this dataset are made in the future, update any local clone by
running::

     git pull

followed by::

     git annex get .

to fetch all new files.




.. _Git: http://www.git-scm.com

.. _git-annex: http://git-annex.branchable.com/

.. |license|
   image:: https://img.shields.io/badge/license-PDDL-blue.svg
    :target: http://opendatacommons.org/licenses/pddl/summary
    :alt: PDDL-licensed

.. |access|
   image:: https://img.shields.io/badge/data_access-unrestricted-green.svg
    :alt: No registration or authentication required

.. |doi|
   image:: https://zenodo.org/badge/14167/psychoinformatics-de/studyforrest-data-phase2.svg
    :target: https://zenodo.org/badge/latestdoi/14167/psychoinformatics-de/studyforrest-data-phase2
    :alt: DOI



