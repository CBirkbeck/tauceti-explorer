# DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII

Issue #3459. Agent: Codex. Session: codex-MJAcmR. Date: 2026-10-19.

## Result and status

This is a complete target-level design pass, submitted for independent review,
not a checkpoint or an implementation. The roadmap definition, packet, reader
document and suggested signatures cover PD.0–PD.5. All six layers are
**planned**, none is **closed**, and every implementation status is
**unchecked**. Seven supplier gaps and ten exact requests remain explicit.
The packet has 27 nodes: four definitions, two constructions, nineteen
theorems, one comparison and one application. Its six objects have 35 API
items and 24 discriminating definition tests; nineteen nodes are planets.
Ten pinned Mathlib declarations are recorded as baseline inputs.

The new mathematics is the BIP §6 application: component detection and
faithfulness of the unrestricted local deformation ring on the patched
module, the three arithmetic density theorems, and qualified benign,
prescribed-type and minimal-stratum variants. The proof retains p∤2d.
The character-root lemma itself needs no such prime restriction. Density is
in the scheme spectrum, and does not assert fixed-weight rigid density.

## Ownership and scope decisions

The current parent R31.5 already plans arbitrary GL_d(F) CEGGPS patching,
fixed-central-character projectivity, type-specialised modules and the EP
support theorem. Those exact nodes are imported, never recreated here.
The corrected crystalline-character lift belongs to PadicHodgeTheory R06.2.
The packet maps every one of the twenty BIP-route items to its owner.

The issue permits splitting independent directions. The first restructure
proposal preserves all 64 item ids from Ding-25, Newton–Thorne-21 and
Breuil–Hellmann–Schraen-19 under the separate owner
**LocalGlobalCompatibilityPartIIEigenvarietyCompanions**. Its retained route
records give all three extraction paths and briefs. The separate design
must reconcile these briefs and import parent R31.5. No companion theorem
is claimed planned in the present density document.

All 216 Pan-26 item ids remain with the existing
**LocallyAnalyticCompletedCohomology**, LA.0–LA.12. Its modular-curve
geometry is not designed again. The companion and Pan papers were screened
through their extraction briefs for this ownership decision, not read as
sources for new mathematical targets in this pass.

Additional proposals preserve the local unrestricted components/normality
route and commission the missing smooth-type and finite-coefficient
algebraic-representation extensions under their existing owners. There is
no upward ownership move into this automorphic application and no edit to
another roadmap. The maintainer applies accepted restructuring proposals.

## Exact boundaries for review and the supplier jobs

1. **Unrestricted local components:** R08.1 does not yet supply BIP
   Corollaries 4.19, 4.21–4.22. Their owner is the proposed
   LocalGaloisDeformationRingsPartIIComponentsAndNormality. The existing
   tame/Kisin-chart Part II is a different direction. Supply reducedness,
   O-flatness, equidimensionality and geometrically integral component
   quotients indexed by determinant restrictions to μ_{p∞}(F).
2. **Finite-coefficient algebraic representations:** current upstream
   ClassicalGroups Layer 3 is over C. Supply rational representations of
   split restriction-of-scalars GL_d over finite L, semisimplicity,
   highest-weight duals and arbitrary labelled central-character
   realization. LieHighestWeight alone is insufficient.
3. **Smooth types:** SR.3 has the Bernstein framework, not the CEGGPS
   crystalline types or EP principal/simple-stratum families. Supply the
   structures, finite coefficient fields, distinct-isomorphism indexing,
   intertwiners, dimensions and N=0 recognition listed in the request.
   Parent local–global compatibility then supplies the arithmetic test
   quotients. SR.5 integral Whittaker theory is not this input. The
   Bushnell–Kutzko book proofs behind EP were not inspected.
4. **Categorical and analytic bridges:** L1 needs general and fixed-centre
   compact-projective decomposition; LR.0 needs continuous finite-index
   induction for nonsmooth algebraic factors; LR.1 needs density of
   locally Q_p-analytic vectors in an admissible unitary Banach space.
   DPS Corollary 7.8 only supplies the preceding locally analytic density.
5. **Completed tensors and generic fibres:** extend R03.4 by the finite
   splitting, reduced equidimensional tensor-product and Jacobson
   generic-fibre interfaces specified in the packet. Its geometric-domain
   component-pair node is already imported.
6. **Benign charts:** the refined-crystalline-space node is reused, but
   relative Dcris/filtration base change and the generic-position
   argument of Nakamura Lemma 4.2 need an exact supplier interface.
7. **Inherited patching leaves:** the parent retains adequate CM
   globalisation and definite-unitary completed-homology boundaries.
   Emerton–Gee lift existence removes the separate potentially
   diagonalizable-lift hypothesis; it does not establish those leaves.

The ten requests also record the existing ClassFieldTheory Layer 7
normalizations and the source-bound Emerton–Gee input through PL.1.
They are dependency records, not messages or changes to supplier files.
Each layer's remaining list and reader acceptance paragraph says which
boundaries it consumes. Independent review should examine these precise
interfaces before deciding closure; no stage is silently promoted.

## Source and mathematical checks

All mathematical statements and source-issue descriptions are in our own
words. Source URLs, read dates, versions, hashes and theorem/page locators
are retained in the packet and roadmap. The public primary texts read were:

- BIP, published 2023 PDF: §6, pp. 45–50, and the component corollaries
  through their application in Lemma 6.3.
- Emerton–Paškūnas, published JEP 2020: capture §§2.1–2.2,
  pp. 342–346; numerical criterion §2.5, pp. 349–350; algebraic and smooth
  capture §3, pp. 351–359; density/support §§5.2–6, pp. 362–370.
- CEGGPS, arXiv v5: conventions §1.8, pp. 12–15; patching setup
  §2.1, pp. 15–17; Theorem 3.7, p. 41; §4 setup, pp. 49–50;
  Lemma 4.18, pp. 65–66; §4.22–Corollary 4.26, pp. 67–70.
- Dospinescu–Paškūnas–Schraen, arXiv v1: Remark 5.14,
  pp. 37–38, and §7, pp. 40–43, including Corollary 7.8.
- Emerton–Gee, author monograph copy: Theorem 1.2.2, p. 3;
  Definition 6.4.2 and Theorem 6.4.4, pp. 168–169. It is an explicitly
  source-bound existence input; the stack proof is not claimed read.
- Schneider–Teitelbaum, arXiv author copy: Lemma 2.1,
  Corollary 2.2 and Theorem 2.3, pp. 10–12.
- Nakamura, published 2014 PDF: Lemma 4.2 and its proof,
  pp. 120–122.

Three source issues are recorded. E1 reuses the independently confirmed
BIP Lemma 6.5 correction: retain the residual unramified factor when
constructing the crystalline character. E2 flags a whole-test-support
containment step in BIP Theorem 6.8; the plan instead chooses a supported
component through a characteristic-zero point. E3 adds W≠0 to tensor
stability of capture in EP Lemmas 2.6/2.9 and Corollary 3.2. E2 and E3 are
new findings requiring independent assessment. Correction searches and
counterexamples are in the packet. The Cambridge BIP corrigendum concerns
an affiliation and does not correct these mathematical passages.

The reviewed AUDIT-31, relevant link records and parent supplier statements
were read. Current Tau Ceti and current upstream roadmaps were screened,
including all nine post-snapshot roadmaps listed in WORKERS.md. Existing
LocalGaloisGroups roots-of-unity infrastructure is reused. The library
baseline remains Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

## Validation and suggested-file shape

The packet validator passed with **0 errors and 0 warnings**, using the
complete pinned declaration index. The suggested file elaborated through
`lean-check`, with only seven declaration-uses-sorry warnings. It has
82 lines, three theorem signatures and four native-carrier examples;
no data definitions or surrogate arithmetic carriers. The initial
identity-map notation error was corrected before the successful check.

The compact signature shape follows the 2026-10-12 WORKERS override.
The two common-kernel detection forms use actual module carriers. The
third signature gives the spectrum-density conclusion once arithmetic
testing computes a contracted vanishing ideal. The README and packet
omission ledgers account for every arithmetic target and its missing
carriers, API and tests. Successful elaboration establishes signature
well-formedness, not the arithmetic results.

The next step is independent review of this complete design, followed by
the named supplier extensions and package work in dependency order.
There is no unfinished writing task in this pass and no second issue is
claimed by this session.
