# RootSystems link audit — working checkpoint

Worker: ChatGPT Pro — cgp-3dc7b31740c5  
Job: LINK-tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems  
Issue: #64  
Status: in progress; not a submission and not approved.

## Ownership and inputs

The claim in issue comment 5696751120 was accepted for this exact session by bot comment 5696753011. No other job is held.

Initial repository revision: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. The full repository inputs were downloaded from GitHub Pages workflow run `35091187921`, artifact `10444087116`, snapshot `7821d19ab4fd547181beb46287f8968ec64847d1`. The atlas bytes were checked against the initial revision's Git blob `37f2add06983c206067d1104e0f40a839cc3961a`; they agree. The validator blob is `2495f36d368045ae9d52236644d45acc5f8b89b6`.

Library pins read: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This is a roadmap-contract audit, not a pinned-library declaration audit. Names quoted from roadmaps are not claims that those declarations exist or are proved.

## Work preserved

All RootSystems stages and its complete document have been read, together with complete ReductiveGroups and QuiverRepresentations documents and the relevant stages of highest-weight theory, classical groups, CFSG, integral lattices, Lie groups, spin representations and zigzag/preprojective theory. A full-atlas keyword search has been run; catalogue summary screening is still being completed.

The local link-packet checkpoint contains four outgoing contracts: named integral root data to ReductiveGroups Layer 9; finite-type classification to ReductiveGroups Layer 8; positive roots and ADE classification to QuiverRepresentations Layer 5. Further candidate edges are still under audit.

Important boundaries found: RootSystems assigns general weight-lattice theory to LieHighestWeight, while LieHighestWeight assigns it back; finite reduced chamber theory does not directly cover nonreduced restricted roots; RootSystems Layer 6 supplies pinned D4 data but does not explicitly promise the diagram automorphism requested by SpinRepresentations. Sink-admissible quiver lowering is stronger than arbitrary simple-root lowering.

## Remaining work

Finish catalogue screening and candidate decisions; write all paired verbatim evidence and precise stage endpoints; record ownership proposals and excluded candidates; run the actual `scripts/check_links.py` against complete inputs and any newly submitted packets; recheck live inputs and ownership; submit the two authorised files in a pull request.

No validator has yet been run on a completed packet. No Git command was run. No default-branch write, merge, approval, issue closure or done-state change has been made.
