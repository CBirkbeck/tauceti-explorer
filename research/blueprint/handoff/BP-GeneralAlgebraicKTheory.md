# BP-GeneralAlgebraicKTheory

Issue #10912. Agent: Codex; session `codex-6LTqFf`; 19 October 2026.
This is a completed target-level planning pass, submitted for independent review.
It is not an accepted plan or an implementation. No review verdict from an
input part is inherited.

## Deliverables and accounting

The main packet has `part: null`, exactly the ten issue scope IDs, `status:
complete`, and ten `planned` coverage records. None is `closed`. All
implementation statuses remain `unchecked`.

The main packet imports the 83 canonical K.1-part targets and 73 canonical
K.6-part targets by their unchanged IDs. It adds 19 targets. Importing rather
than copying is necessary: the packet checker rejects the same blueprint ID
being declared in two packets, and this issue does not authorize editing the
part packets. The main reader renders the full composite, not just the 19
additions. Its 58 `importRefinements` are explicit replacement fields on the
imported contracts, including editorial normalization and the substantive
corrections described below. They are reviewable metadata, not an assumption
that the existing integration scripts automatically apply overlays. The
reviewer/integrator must preserve these replacements when producing a single
upstream package. The two part files themselves remain unchanged, including
their historical review/status metadata.

| Measure | Main additions | Full reader, imports with refinements |
| --- | ---: | ---: |
| Nodes | 19 | 175 |
| Definitions | 1 | 14 |
| Constructions | 5 | 35 |
| Lemmas | 0 | 58 |
| Theorems | 10 | 53 |
| Comparisons | 1 | 12 |
| Applications | 2 | 3 |
| API items | 26 | 269 |
| Unit-test specifications | 20 | 187 |
| Planets | 5 | 30 |

There are 61 distinct pinned baseline declarations, 27 routed-source coverage
records, two proof-source gaps and 43 supplier requests. Planet counts by
current parent stage are K.1: 3; K.2:plus: 2; K.3: 5; K.4:construction: 4;
K.4: 3; K.5: 5; K.6: 6; K.7: 2. K.2 and the comparison register add no planets.
All names have at most 60 characters.

The reader is the complete mathematical specification, including statements,
hypotheses, proof routes, API contracts, Checks, dependencies and locators.
The suggested Lean file is 111 lines and contains only light definitions over
existing carriers, selected milestones and examples. The WORKERS compact-file
rule takes precedence over the issue's obsolete exhaustive-signature wording.

## Mathematical additions and repairs

- Compare the symmetric monoidal finite-projective core completion with the
  Q/plus/S models, preserving object classes and automorphism loops; add
  filtered continuity of these compared ring models. General symmetric
  monoidal recognition remains H.4/H.5's input. Global support continuity is
  an outgoing SchemeKTheoryOperations interface, not an input to ring
  continuity.
- Define excision data, the Milnor square and its fibre criterion separately
  from K-excision. Prove preservation under base change to an integral domain
  in the commutative case; do not assert arbitrary base change.
- Define integral Tor-unitality via the existing integer unitization, retain
  the flatness-over-the-actual-unital-model hypothesis, and give all-degree
  nonconnective excision using Tamme's read proof. Reuse the Part II
  `KII.2/amalgam` replacement-algebra target; do not create a second generic
  derived Milnor-patching construction. The Berkovich consumer must verify its
  actual flat model and comparison with canonical unitization.
- Specify affine principal perfect support, its nonconnective localization
  fibre and ordinary noetherian principal-completion gluing. The support
  fibres are vertical. The proof uses the Koszul generator and equivalence of
  its derived endomorphisms after flat noetherian completion. TT 7.4, printed
  p.365, is the nonconnective localization statement; TT 5.1–5.2, printed
  pp.337–339, is proto-localization with a degree-zero correction. Neither
  is cited as a separate unrestricted completion theorem.
- Specify Dedekind valuation localization, finite torsion and support
  categories, Poincaré localization, the shifted linking duality, symmetric
  devissage, the L companion sequence, lattice boundary, second residue and
  ramified-map compatibility. Import the exact existing GN.6 residue-line and
  symmetric GW localization IDs. Symmetric devissage includes dyadic primes;
  quadratic residue devissage does not. Residue restriction is not asserted
  fully faithful on enhanced derived categories.
- Supply the exact-versus-split IK fibre with Schlichting §10 and the fully
  exact criteria of Keller 11.7/12.1. This closes the previous third
  proof-source gap, while retaining the generic exact-category supplier
  contract. Do not infer all-negative vanishing for arbitrary abelian
  categories; the 2003 conjecture is historical, and Neeman gives
  counterexamples.
- Import the current StablePeriodicCurved Frobenius data, stable quotient and
  generic complex structures. The refined K.6 target owns only Frobenius
  pairs, their derived quotients and their K-theoretic comparisons. The
  current DGAInfinity derived-module/perfect-envelope and quotient interfaces
  are also imports.
- Refine component representatives to points of the group completion, not
  projective representatives for every possibly negative K0 class. Build
  pairings through iterated S grids and the Q–S comparison, rather than
  assuming a functor on the product of Q categories alone supplies the
  degree-additive product. Expose the early K0/K1 adapter in unit
  multiplication. Replace two vocabulary-only flasque tests by finite-field
  dimension obstructions.

## Confirmed red-team findings

| Finding | Treatment in this packet and reader |
| --- | --- |
| RT-AREA-ktheory-1/4 | Import the additivity, relative-S and delooping nodes under K.4:construction; H.5 assembles after these. K.7 owns the single S-grid product construction. Keep the inherited stage-change proposal, since atlas files are outside scope. |
| /15 | Retain the explicit H.2 realization request, connected/good simplicial-space or precise Bousfield–Friedlander hypotheses, and the verification at the S-delooping use. No arbitrary levelwise-fibre realization claim. |
| /17 | Import the associative-ring projective line, canonical resolution, Nil comparison and four-summand Laurent theorem in K.6. Global scheme agreement, projective bundles and negative G-theory are outgoing S.2/S.5 interfaces. |
| /18 | Import early K.5 Milnor K1–K0 patching and relative pi0 excision, Bass contractions and the K.6 nonpositive Mayer–Vietoris continuation. The stronger relative pi1 comparison is a U.6 obligation and does not feed K.5/K.6. |
| /19 | Keep the early ring model single-owned at K.2:plus/functorial-K-theory-of-a-ring, with its historical ID retained. K.1 stays generic; relative and nonconnective consumers import the ring functor. |
| /20 | Keep early Q-theoretic additivity/resolution/devissage/Serre localization separate from late cofinality. The latter imports K.4. The new hermitian component is another explicit component after GN.6/HK and K.6, with no reverse edge. |
| /21 | Import the pinned ExactStructure, ExactK0, finite-projective exact structure and smallness. No replacement exact-category carrier or additional obscure-axiom assumption is introduced. Preserve the kernel/cokernel restriction on any use of the obscure axiom. |
| /31 | Preserve the doubled affine plane test and source correction. The doubled line has Pic=Z and cannot have vector-bundle K0 given by rank alone. |

## Remaining proof sources and supplier contracts

The two gaps are precise and do not certify the affected assertions:

1. The imported `K.5/excision-and-its-failure` finite-degree converse,
   truncated Tor criterion and degree-one necessity are quoted in Weibel
   IV.1.11.2 from Suslin/Suslin–Wodzicki. Tamme supplies all-degree
   Tor-unital sufficiency, not those converses. Read the original proofs or
   supply a direct classical proof, including the square-zero failure test.
2. The `K.7/naked-triangulated-invariance-counterexample` proof in Schlichting
   2002 was read, but the separate Evens–Friedlander and
   Aisbett–Lluis-Puebla–Snaith finite-Artin K3 computations were not obtained
   and independently read. The AMS PDF attempt failed. Verify the precise
   prime range, especially the p=3 test, in those originals. The supplier is
   KTheoryFiniteLocalFields, Part II, not the old self-request to K.5.

The 43 requests retain the exact statements and their consumers in the main
packet and reader. They are not declarations that the requested result is
already supplied. The main additional obligations are:

- H.4/H.5 model recognition and filtered spectra; the inherited requests also
  specify Theorems A/B, realization, covering and bar-space inputs.
- DGAInfinity, Part II, if the current enhanced API does not cover Keller's
  exact-category fully-exact/resolution criteria with C1/C2 and their dual.
  EnhancedDerivedSheaves supplies derived tensor/Hom carriers and Tor, not a
  second K-theoretic excision theorem.
- Geometry of numbers, quadratic forms and homogeneous arithmetic, Part II:
  stable Poincaré carriers and structure family, Poincaré–Verdier criterion,
  symmetric-heart/surgery and finite-length Witt devissage, fundamental
  K/GW/L comparison and filtered continuity. The existing exact-category
  nodes alone do not prove these stable assertions. HK.0/HK.6/HK.7 and
  arithmetic Part II DA.3 supply the named flavour and quadratic inputs.
- The finite-Artin source audit above. The earlier low-degree, symbol and
  Bloch-group requests retain their existing owners.

Apply the proposed ordering before packaging: early K.3 is independent of
S-theory; cofinality follows K.4; early products precede Bass/transfer
consumers; hermitian K.3 follows K.6 and GN.6/HK; Tor-unital K.5 follows K.6
and GeneralAlgebraicKTheoryPartII KII.2. Neither specialization feeds its
supplier. Restructuring proposals are specifications only; no atlas or
upstream roadmap file was edited.

## Source and library inspection boundary

The reviewed audit, every scoped stage description, relevant link entries,
both part packets and their open inputs were inspected. All 61 baseline
statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Smallness, exact versus
split K0, general versus projective resolution and noncommutative scalar
extension were checked at their actual strength.

Current read-only roadmap main was 0d144d044dacebca17b654695b6f1ad58f159b27;
current Tau Ceti was a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. AlgebraicTopology
and GrothendieckEulerForms were read as models. DGAInfinity Layers 5/7 and
StablePeriodicCurved Layers 0–3 supplied the relevant current upstream
boundaries. The nine newer roadmaps listed in WORKERS were screened for
K-theory overlap; this is not a full reading claim. No current upstream code
was built or edited.

The main source additions were read at the exact slices recorded in their
`readSections`: Calmès III Theorem 7 and §§2.1–2.2, preprint pp.33–41 with
proofs; Bhatt–Scholze §5 and the §12 group-completion model, pp.54–59;
Bhatt–Mathew excision definitions/Lemma 4.13 and Example 6.1; Scholze's
Tor-unital footnote and flat-ideal application; Tamme's proof route through
§§1–2, pp.4–14; Keller 11.7/12.1, printed pp.15–16; Schlichting §10,
pp.18–19, and the 2002 triangulated counterexample proof. Relevant primary
Q/S, projective-line/Nil, negative-comparison and finite-domination locators
were checked during reconciliation. The imported source-version and reading
records retain their original provenance: they do not assert that this pass
independently read every page of every cited source.

No restricted book was used. No source file, verbatim passage, source excerpt
field, or section-by-section source summary is included. Four additional
source issues are recorded in our own words: Bhatt–Mathew's fibre direction,
Calmès' fibre quotient and inverse-ideal ambient field, and Bhatt–Scholze's
loop-space fundamental-group index. Novelty is not claimed. Existing source
issues remain visible, with the source's historical general-abelian
conjecture correctly distinguished from present knowledge.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralAlgebraicKTheory.json --json`:
  zero errors and zero warnings, using the shared pinned declaration index.
  This checker reports the 19 new nodes; it does not count imported targets
  or apply the explicit refinement overlays.
- A separate scratch validation loaded all 156 exact import IDs, applied
  the 58 refinements, and checked the 175-node composite: unique IDs,
  resolved prerequisite references against the atlas/packets/pinned index,
  acyclic own-node prerequisite graph, baseline/source references,
  API/uses/three-test coverage for every definition and construction,
  planet bounds, all 27 routed items, and exact reader statement/API/test
  agreement. All passed. The counts above are its output. This check does
  not establish that every external supplier contract has been proved.
- `lean-check research/blueprint/suggested/GeneralAlgebraicKTheory.lean`:
  elaborated at the pins, exit 0, with only the intended two proposition-proof
  admission warnings (`homotopyIdempotent` and `transport_exists`). No
  admitted data. The initial universe/explicit-argument errors were fixed.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/GeneralAlgebraicKTheory.lean`:
  passed. `git diff --check`: passed.

Next action: independently review this completed plan, including the import
refinements and late-component ordering. Close the two proof-source gaps and
discharge the exact supplier contracts before calling stages closed or
packaging for upstream. Do not treat all-stage target coverage as acceptance
of the partial input packets.
