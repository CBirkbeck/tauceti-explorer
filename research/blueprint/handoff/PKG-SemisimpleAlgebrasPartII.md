# PKG-SemisimpleAlgebrasPartII — checkpoint

Issue: [#7595](https://github.com/CBirkbeck/tauceti-explorer/issues/7595).
Agent: Codex, session codex-IgGo7c. Date: 2026-10-10.
Branch: codex-IgGo7c-pkg-semisimple-algebras-part-ii.
[Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7595#issuecomment-6098110272).

**This is a checkpoint, not a complete package.** The README draft retains
all 55 accepted targets, all 30 API items and all 31 definition tests. The
suggested file elaborates, but it does not represent the whole accepted
plan. Do not submit it for complete-package acceptance on the strength of
the successful Lean check.

## Why this run stops

The input's acceptance explicitly means a completed target-level pass:
five stages planned, zero stages closed, 11 gaps and 10 supplier requests.
It does not certify the missing suppliers. The original suggested file
also explicitly omits their declarations. This package job permits changes
only to its three package files and this handoff.

The immediate obstruction to a complete suggested file is the missing
shared scheme interface, followed by the missing shared Higgs and relative
Cartier interfaces. Replacing them with private carriers, an arbitrary
category equivalence or proposition-valued fields would violate the
accepted ownership and PROTOCOL sections 13 and 15. Completing their owners
would require editing other jobs' deliverables.

The obstruction is concrete:

- SchemeAndStackFoundations, SF.2, reserves the scheme-Brauer key, but its
  package Suggested.lean still gives azumayaClass an arbitrary Type
  argument. Its surrounding comment says that the sheaf-algebra carrier
  and the relevant API are omitted. It supplies no importable sheaf
  Azumaya object with its algebra modules, positive-rank splitting,
  stabilization, pullback and injective comparison to étale H².
- HodgeStructuresPartII, H.0, has a substantial affine coordinate
  connection prototype. Its omission ledger explicitly leaves the
  sheaf-valued objects out. It supplies no importable shared spectral
  Higgs module with all universal symmetric determinant coefficients,
  restriction, frame change and finite pushforward.
- SA.4 requests a characteristic-p Cartier successor but gives no named
  roadmap/layer owning its full relative exact diagrams, the
  differential-operator Azumaya algebra and the chosen OV/BB comparison
  bimodules. Generic crystalline cohomology cannot stand in for those
  interfaces.

These are specification/interface gaps, rather than failed elaboration
of existing imports. The current Tau Ceti library was also checked; the
scheme Azumaya/relative Cartier interfaces were not found there.

## Work retained

[README](../packages/SemisimpleAlgebrasPartII/README.md) is a fresh
77,114-byte draft grouped by mathematical targets rather than individual
packet entries. It states conventions, dependencies, hypotheses, sources,
API and discriminating tests. No source passage is reproduced. It preserves
the independently accepted corrections:

- all finite splitting extensions in SA.0, including inseparable ones;
- separability for field transfer and the separate exact-index separable
  splitting request used by SA.1;
- actual scalar-tower data for the division-column action;
- actual annihilator ideals on arbitrary, possibly nonreduced, schemes;
- the correct dual direction of the splitting-transition line;
- characteristic coefficients chosen from the action, rather than a
  purported unique monic Frobenius root;
- spectral lines on the finite cover, including lines not pulled back
  from its base;
- a fixed positive splitting rank on the whole inverse image of a base
  chart for the power law, with the mixed-rank counterexample;
- the two short exact sequences through the actual middle image of dlog;
- an injective Azumaya-to-H² comparison, without assuming surjectivity;
- an actual connection and its de Rham Hitchin invariant in the relative
  application, and chosen categorical evaluation/coherence data.

The relative vanishing is explicitly a target needing a valid argument.
The draft does not certify EG's fibre-to-zero-section support inference.

[Suggested.lean](../packages/SemisimpleAlgebrasPartII/Suggested.lean)
uses native field Brauer groups, matrix modules, annihilators, dual numbers
and continuous units-coefficient cohomology. In particular:

- classIndex is a quotient lift of the existing algebra index;
- splittingDegrees explicitly quantifies over actual finite extension data;
- divisionColumnModule is Module.compHom applied to the specified matrix
  representation, and its coordinate formula is definitional;
- the field corestriction has a native homomorphism signature, restriction,
  tower and identity APIs, and four named tests;
- transportedCorestriction is a separate concrete transport helper using
  TauCeti.ContCohomology.explicitCor2, with full supplied additive comparison
  isomorphisms on the actual H2 and UnitsCoeff carriers;
- the helper's cohomology equation and degree formula are stated. The latter
  takes the explicit all-class restriction square and subgroup-index equality
  as hypotheses.

**The helper does not normalize or supply the comparisons.** The admitted
brauerCorestriction signature is not yet identified with this helper, and
the accepted embedding-independence and normalization APIs remain absent.
Arbitrary additive equivalences are insufficient to assert those APIs.

The metadata is topic = "math.RA".

## Exact remaining Lean scope

| Layer | README | Native target signatures in this checkpoint |
| --- | --- | --- |
| SA.0 | All 20 targets | All 20, including all four classIndex APIs, five splitting-degree APIs, four column APIs and fourteen named tests |
| SA.1 | All 10 targets | Nine signatures; the corestriction constructor still lacks its full normalization and embedding APIs |
| SA.2 | All five targets | matrixSupport and nilpotentSupportBoundary; three geometric targets omitted |
| SA.3 | All thirteen targets | distinctMonicFrobeniusRoots; twelve geometric targets omitted |
| SA.4 | All seven targets | No native geometric signatures |

There are 32 represented target signatures out of 55. This is a count of
signatures, not proofs or certified implementation. Of the 30 accepted API
items, 16 have their native named signatures; of the 31 definition tests,
18 have corresponding named examples. The counts do not credit substring
matches such as column_rank_one as the sheaf-Morita rank_one test.

Missing target signatures, using the accepted short node ids:

- SA.1: comparison-basechange-units.
- SA.2: sheaf-morita, coherent-morita, sheaf-support-morita.
- SA.3: splitting-transition-line, charpoly-line-twist,
  morita-characteristic-polynomial, finite-pushforward-morita,
  spectral-line-trivialization, finite-pushforward-line-invariant,
  morita-higgs-overlap, morita-higgs-invariant, higgs-invariant-local,
  higgs-invariant-change, higgs-invariant-basechange, higgs-invariant-power.
- SA.4: cartier-brauer-comparison, relative-brauer-equality,
  cartier-middle-image, cartier-boundary-additivity,
  cartier-boundary-naturality, relative-class-vanishing-input,
  relative-morita-refinement.

Missing accepted API items: brauerCorestriction_embedding,
brauerCorestriction_cohomology; all four sheafMorita APIs; all four
moritaCharpoly APIs; all four moritaHiggsInvariant APIs. The corresponding
omitted tests are the four sheaf-Morita, four Morita-polynomial and five
Higgs tests. All remain specified in the README.

## Baseline and ownership findings

Read both the current SemisimpleAlgebras and AlgebraicVectorBundles
READMEs in full, and the relevant current suggested declarations.
Read the accepted packet, its reader and prototype; the packet is
authoritative where the older reader/prototype predates review corrections.

The atlas checkout began at eb32c2d3450f60e02c9a82733aa7e25339e2eb99.
The current read-only TauCetiRoadmap checkout was
3c18d9fbfceed0dc5c1edb1070a3927152d19e28, and its Tau Ceti dependency
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No Lake operation was run there.

Elaboration uses the prescribed pins: Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369 and Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174.

Relevant native declarations were read at the pins:

- the algebra index, exact-degree finite splitter, finite separable
  splitter, division representatives and Brauer baseChange_comp;
- Matrix.Module.matrixModule, Module.compHom, scalar towers and
  finrank/finiteness APIs;
- TauCeti.UnitsCoeff, its discrete topology and genuine Galois action;
- TauCeti.ContCohomology.H2, explicitRes2, explicitMap2, explicitCor2
  and explicitCor2_comp_res2;
- Scheme.Modules, native sheaf module restriction/change of rings,
  quasicoherence and local freeness; the sheafified tensor product;
- native étale/abelian sheaf cohomology and invertible-sheaf interfaces.

The imported finite splitter has exact index degree without separability.
The separate separable splitter does not have an index-degree conclusion.
Their two existential statements do not give the conjunction used by SA.1.

QuadraticFormInvariants 7B already plans brauerCohomologyEquiv on the full
units coefficients; its current Suggested.lean explicitly normalizes it by
crossed products. Do not plan that comparison again here. The missing work
is its all-class base-change compatibility and an importable adapter at the
pin, then the identity between the canonical field transfer and the concrete
transport helper.

Update the accepted dependency mapping when the maintainer permits packet
changes: AlgebraicVectorBundles L0A–L0C owns the sheaf tensor/Hom, finite
locally free rank, symmetric/exterior powers and determinant inputs now
assigned coarsely to SF.0. The README uses that current owner. This run
changed no packet and moved no definition between owner files. Its
determinant supplies the characteristic polynomial through polynomial
scalar extension; no pre-existing named global charpoly interface was
found in that roadmap.

GeneralAlgebraicKTheory K.7 retains generic projective-generator Morita
ownership. The accepted plan itself says that the more specific incoming
moritaStructure locator is stale; the missing tensor/Hom and localization
interfaces need a precise owner contract, rather than a private replacement.

## Source reading receipts

Freshly acquired public versions and selected passages:

| Source | Passage read | SHA-256 |
| --- | --- | --- |
| EG, arXiv:1707.00752v4 | Theorem 2.17 and Remark 2.18, pp. 13–14; Proposition A.2 and Remark A.3, pp. 40–41, including their arguments | bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb |
| OV, published IHÉS 106 (2007) | Theorem 2.8/Corollary 2.9, pp. 33–34; §4.2, equation (4.1.1)/Proposition 4.2, pp. 85–86; Proposition 4.4, pp. 87–88 | 2266595d31d3ee482d7fffefaf86ad8f50767804059bbde9ccaaf3b27c4f1035 |
| BB, arXiv:math/0602255v2 | §2.2, p. 3; Proposition 3.11/Corollary 3.12, p. 11 | a94800bee9fcbb4ea99b6d945b4e8c24b99a80fd957021d6f5ca530ca38b0b1c |
| GS author errata, 4 December 2020 | p. 3, corrections to book pp. 101 and 105 | db7cea507d8aa13060aeff424845bbfd74e12fd71faceb4c374dbc7e815f3d04 |
| Benoist, published IHÉS 130 (2019) | §0.1, printed p. 63, general period/index conventions | 8dfc0f221ab510ba1ecfe7c5b5fde12c217019f33d704ea89ce1a0c144398d3b |

Public URLs are in the README bibliography. The passages, rather than
whole papers, were read for the stated purpose. No source excerpt or
download is committed.

The institutional GS book URL and its older institutional hostname timed
out this run. The arithmetic statement/locator transcription therefore
remains inherited from the accepted plan and its independent review;
the book was not freshly read or freshly hashed by this worker. The errata
were freshly read. Do not treat the inherited GS receipt as a fresh one.
No journal/preprint identity is asserted for EG or BB.

The checked source boundaries remain material:

- EG's monic-root uniqueness step fails on the characteristic-two dual
  numbers. The roadmap descends coefficients instead.
- Vanishing of a relative form at t = 1 does not locate its support on the
  cotangent zero section. The counterexample in the README is independent
  of the nilpotent-ideal annihilator example.
- OV's chosen splitting is on the bounded zero-section neighborhood,
  rather than on an arbitrary spectral thickening.
- A splitting-module category can have nontrivial automorphisms.
  The categorical refinement needs specified evaluation and coherence.
- The BB preprint's differential-operator rank and the contact-section
  composition are used with their corrected dimension and arrow direction.

## Resume in this order

1. Resolve the shared SF.2 sheaf Azumaya/splitting/module carrier and K.7
   tensor/Hom localization contract, with owner changes authorized by the
   maintainer. Use Scheme.Modules and the current AlgebraicVectorBundles
   interfaces, rather than duplicating them.
2. Add SA.2 and the transition-line/single-endomorphism signatures and
   tests. Keep exact annihilator ideals and positive local rank.
3. Obtain H.0's shared sheaf-valued Higgs/spectral coefficient interface.
   Add the finite-pushforward and Higgs declarations with all thirteen
   omitted definition tests accounted for. Retain the whole-inverse-image
   fixed-rank condition and spectral-line descent.
4. Obtain the normalized full QFI comparison adapter, the actual Galois
   subgroup/closure transport, and its all-class restriction square.
   Identify brauerCorestriction with transportedCorestriction and add the
   embedding-independence and cohomology APIs.
5. Name and supply the relative Cartier owner interface. Prove the
   relative vanishing through a valid ambient-relative diagram before
   asserting the resulting class equality or chosen bimodule refinement.
   A candidate to investigate is the cotangent difference map
   (v,t) ↦ (t−1)v: its factorization through the bounded zero-section
   neighborhood still requires a proved identification of its pulled-back
   Brauer class with the desired difference. This checkpoint does not
   establish that identification.
6. Reconcile the final README against the 55-node packet and complete all
   omitted signatures, API and examples. Run lean-check again and submit
   a complete package only when that correspondence is honest.

## Checks

- The unchanged packet passes scripts/check_blueprint.py: 0 errors,
  0 warnings; 55 nodes, 30 API items, 31 tests.
- Every accepted API and test name appears in the README; the mathematical
  target sections were checked against all 55 accepted statements.
- metadata.toml parses and has only topic = "math.RA".
- Staged git diff --check passes, and the changed-path list contains only
  the four issue-authorized files. Private-path/control-character scans pass.
- Final lean-check of research/blueprint/packages/SemisimpleAlgebrasPartII/Suggested.lean
  exits 0: 0 errors, 66 warnings, all declaration uses sorry; no other
  warning category. Available memory before the check was 103 GiB.
- Compiled Suggested.lean SHA-256:
  1695494c091a9a157b6815923bf6ebcb6e5d053701e214e158f90ef3ccdbf46c.
  README SHA-256:
  1db38c82e1c1d8c3837bd2cae7a11aef0f4101f519ba0751cb24b38357eeb454.

No claim of formalized proofs is made. Only the four issue-authorized
deliverable paths change; the accepted packet, original reader and original
prototype are unchanged. Scratch source downloads and logs are deleted
after PR submission; the receipts and continuation instructions needed by
the next worker are retained here.
