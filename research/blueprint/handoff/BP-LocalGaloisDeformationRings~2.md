# BP-LocalGaloisDeformationRings~2: revision round 2

Claude, session `claude-K2J36W`, 7 October 2026. Refs #6933. **Status: complete**, ready for its independent review.

The independent review REV-LocalGaloisDeformationRings (Codex, codex-Co5mlT) returned *needs_changes*. Its review
object is left in the packet for the next reviewer to replace. This round works through the review's demands, its
remaining lists and its reader-consistency table, and reads the sources the review found missing.

## The packet now

- **157 nodes** (153 before): 95 theorems, 14 lemmas, 14 definitions, 29 constructions, 4 comparisons and
  1 application.
- 245 API items, 162 unit tests and 43 planets (at most six per layer); 9 baseline declarations.
- 22 requests, 9 gaps and 7 restructure proposals.
- **All eight stages are `planned`.** Each `remaining` list names the lemma-level refinements and the recorded gaps.
- `check_blueprint.py`: 0 errors, 0 warnings.

## What this round changed

**Duplicated integral categories removed (review: "Remove duplicated FL/Kisin category declarations").** Four nodes
are now deformation-theoretic wrappers around FiniteFlatGroupsAndIntegralPadicHodgeTheory. They cite its node ids as
prerequisites, and their APIs and tests are rewritten.

- `L7/finite-height-lattices`: the functor B ↦ {lattices of E-height ≤ h in M(V_A) ⊗ B} of a deformation family.
  It is built on R07.4/finite-height-lattices, R07.4/kisin-modules and R07.4/etale-phi-modules-with-coefficients.
  `HeightLattice` and `HasEHeightLE` are replaced by `heightLatticeFunctor` with its map, ext, subsingleton,
  nonempty_iff and mono.
- `L7/fontaine-laffaille-deformation-condition`: only the condition 𝒟_ṽ. The Fontaine–Laffaille category, its
  functor and full faithfulness are R07.3's (`FLModule`, `flFunctor` and `flFunctor_fullyFaithful` removed). New API
  items: `isLocalDeformationProblem`, `mem_iff` and `tangentSpace`.
- `L7/kisin-modules-tame-descent`: GL₃ eigenbasis charts (`GL3KisinChart` with its frobMatrix, changeBasis, shape and
  unique) on R07.4's Kisin modules. R07.4 plans no Kisin modules with tame descent data, so a **new request** to R07.4
  asks for them.
- `R08.5/connected-kisin-modules-with-coefficients`: the groupoids D_{𝔖,M_𝔽} ⊇ D^c and the forgetful map. The
  categories, connectedness and étale/multiplicative objects are R07.4's.

**A review over-correction repaired.** The review replaced the statement of `R08.3/pst-deformation-ring` by a single
sentence about components. That dropped Kisin's Theorem 2.7.6, Corollary 2.7.7 and the reduced flat closure, which
the node's own hypotheses still referred to. The node states them again as (1)–(3). The reviewer's valid point is
kept as (4): the (τ, v) loci are unions of components of the bounded semistable-over-L quotient, not of R^□[1/p].
No other statement was shortened by more than a quarter in the review's change ledger.

**Exact supplier statements, read in the sources** (the review's "unverifiable" targets):

- **GL₃ (LLHLM).**
  - `L7/gl3-explicit-rings` gives the identity and α charts with all their relations.
  - New `L7/gl3-explicit-ring-rows` gives every row of Tables 3–4: matrix, relations, minimal primes and labels.
  - `L7/gl3-component-labelling` gives the six minimal primes of the α and identity shapes, the 15-edge weight graph
    behind Lemma 3.6.10, and the gauge normalisation (3.12).
  - The table misprints are corrected, citing the reviewed extraction's issues E05–E09, E46–E49 and E118–E119; our
    reading found the same misprints independently. The "GL3 explicit presentation" gap is closed.
- **Geraghty** (Math. Ann. 2019).
  - The published text could not be obtained, so the 2010 preprint was read, with a numbering concordance checked
    against five citing papers.
  - New `L7/ordinary-flag-scheme-local-structure` states Lemmas 3.5, 3.7 and Corollary 3.6.
  - New `L7/geraghty-fixed-weight-ordinary-rings` states Lemmas 3.10, 3.13 and 3.14.
  - `L7/trivial-residual-flag-ring` now states Thorne's Lemma 3.11, Corollary 3.12, Lemma 3.13 and Proposition 3.14
    exactly, with those nodes as prerequisites. The "Completed-local flag geometry imported from Geraghty" gap is
    closed.
- **BCGP21 §7.3.**
  - `L7/gsp4-ordinary-generic-fibres` (4) is Lemma 7.3.14's exact list of character exclusions.
  - `L7/gl2-borel-ordinary-ring` (3) gives Lemma 7.3.7's four presentations, with the εχ² cocycle orientation.
- **BCGP25 Lemma 6.2.5.** Its rank-four input is the formal smoothness of G_v^flat, a rank-four analogue of Kisin's
  2-adic Proposition 2.4.4. It is neither Geraghty nor Thorne, and the source asserts it without proof. New node
  `L7/gsp4-flat-ordinary-smoothness` carries it, with a dévissage outline marked as the planned argument; the gap is
  new source issue **E4**.
- **KW II §2.8.** `R08.6/smooth-resolution-criterion` now states the smooth-algebraization condition precisely
  (completions along the closed fibre against a smooth finite-type scheme) and records Kisin's variant.
- **Booher.** `R08.2/g-valued-generic-fibre-away-from-p` (2) is restricted to what Booher proves:
  - G = GSp_{2n} with p > 2n, after enlarging 𝒪;
  - liftable fixed-similitude condition with tangent dimension h⁰(ad⁰);
  - framed ring formally smooth of relative dimension dim Lie G^der.

  Booher does not treat general reductive G, and the sources in scope do not need it.
- **Dotto** (Algebra Number Theory 2025, free).
  - `R08.2/dotto-division-algebra-cycles` states the characteristic-zero cycle maps cyc and cyc_{D^×}, Definition 5.2
    (JL_K) and Theorem 6.3.
  - New source issue **E5**: Theorem 6.3 assumes "p ≠ 2", but its only parity-sensitive input, Shotton's Theorem 4.6,
    needs the coefficient characteristic ℓ to be odd. Shotton was re-read to confirm this.
  - New source issue **E6**: a typo in the Hom subscript of cyc_{D^×}.
  - The gap is narrowed to the Jacquet–Langlands transfer of types, which no roadmap plans.
- **Sign dictionary.** `L7/ordinary-of-weight-lambda` had its Hodge–Tate sign backwards. With geometric Artin,
  ε∘Art_K = N on units. So in R06.2's convention HT(ε) = +1 the sub-objects carry the larger weights, as in R06.4's
  definition of ordinary, with no dualisation. Khare–Wintenberger's ρ_f is the dual with the flag reversed; the
  hypotheses now say this, with a worked case.
- **Canonical torus.** Tau Ceti ReductiveGroups has Borels and tori over fields (Layer 7) and split groups over ℤ
  (Layer 9); requests for both were added. The relative statement over coefficient rings (SGA3 XXII 5.8.3) remains
  the gap, now limited to general G. An `upstreamNotes` entry asks Tau Ceti for a split relative version.
- **Routing (review's orchestrator decision 2).** Two new restructure proposals:
  - "Algebraic moduli for arithmetic geometry, Part II: local models for Weil restrictions of GL_d", for
    Pappas–Rapoport, shared with HilbertModularVarietiesAndShimuraCurves H2;
  - "Finite flat groups and integral p-adic Hodge theory, Part II: moduli stacks of Breuil–Kisin modules and (φ, Γ)-
    modules", for the Caraiani–Emerton–Gee–Savitt generic reducedness.
- **Housekeeping.** Thirty `sourceVersions` entries had the kind "public source"; they are mapped to preprint,
  author copy or published.

## The five red-team findings

The packet and the document handle each one, and none needed to be reopened.

- **/14:** `R08.3/pst-quotient-in-families` exports Kisin's (2.5.5), (2.7.6) and (2.7.7) over any complete local
  base; restructure proposes R08.3 → R19.5. `R08.3/pst-deformation-ring` again states (2.7.6) itself.
- **/16:** every dimension and smoothness node cites ClassFieldTheory Layer 5 (`tateDualityPairing_perfect_mixed`,
  `eulerCharacteristic_finrank_fp`), including the new Geraghty and GSp₄ nodes; the request lists all consumers.
- **/17:** KW II Lemma 3.5 is imported from PadicHodgeTheory R06.4, through a request and a single-owner proposal.
- **/18:** potentially semistable rings are planned once, in R08.3, in every rank. L7 and R08.5 keep only wrappers
  around R07.3/R07.4, as above.
- **/22:** L7's and L8's ACC+ §6.2 consumers are PotentialAutomorphyInfrastructure PA.3; restructure proposes the
  links L7, L8, G8 → PA.3.

## The suggested Lean file

`research/blueprint/suggested/LocalGaloisDeformationRings.lean` **compiles** with `lean-check`, against the shared
build at Mathlib 082e2d3 (Mathlib imports only). Exit status 0; the only warnings are 127 "declaration uses `sorry`".
The style linters `overlappingInstances`, `unusedSectionVars` and `unusedVariables` are switched off in the file.

- **Carriers.**
  - `Lift` (restated from GlobalGaloisDeformations R04.1);
  - `LiftingRing` with its universal lift, `pointRep` and `ConditionRing`;
  - `GenericFibre`, `IsPowerSeriesOver`, `IsEquidimensional` and `flatClosure`;
  - `TameGroup` with `IsTamePair`.
- **Elaborated.** 73 of 245 API items, 54 of 162 unit tests and 54 of 114 theorem-type nodes have real Lean
  statements: theorems, examples, and Prop-valued definitions with actual bodies. Among them:
  - minimal ramification, Steinberg and q-chain (`IsInPol`) conditions;
  - determinant-ordinary versus flag conditions;
  - `Connects` with symmetry and transitivity, proved;
  - ρ_{n,m,0};
  - GSp₄ exp₂/log₂, nilpotent strata and Siegel shape;
  - the explicit GL₃ ideals of the identity and α charts;
  - Hodge types with `adQuotDim`, Galois types, Kisin-ring dimension and regularity statements;
  - the KW condition kinds and the odd point criterion.

  The earlier round's proved computations (Snowden's presentation, the ℤ/9 counterexample, the characteristic-three
  cubic term, Kisin's 2-adic equations) are kept.
- **Statements restated to stay true.** Away-from-p statements are made for the tame group T_q, and unobstructedness
  pins the cyclotomic character. Theorems that had been stated for an arbitrary group or arbitrary ideals were
  restated or removed.
- **Inventory.** Every other API name, test name and theorem node appears in the final comment inventory, with its
  statement and the supplier stages its prerequisites name. A coverage script confirmed that all 245 API names and
  162 test names occur in the file. 42 nodes have inventory entries that use only this roadmap's own local data;
  their items are still to be given Lean statements, recorded as the gap "Suggested Lean file: items still in the
  comment inventory".

## Gaps (9)

1. Pappas–Rapoport local models (Part II proposed).
2. Caraiani–Emerton–Gee–Savitt generic reducedness (Part II proposed).
3. Natural-topology Galois cohomology over κ (requested from ClassFieldTheory Layer 5).
4. Integral reductive group-scheme and Lie API (requested from ArithmeticStatistics ST.5).
5. Endpoint crystalline classification and KW Lemma 3.5 (requested from R07.4 and R06.4).
6. Jacquet–Langlands transfer of types for D^×.
7. Relative Borel subgroups for general G.
8. Suggested Lean file items still in the inventory.
9. The Colmez–Fontaine proof (requested from R06.3).

## Requests (22)

All the earlier ones stand. New ones:

- R07.4: Kisin modules with tame descent data;
- Tau Ceti ReductiveGroups Layers 7 and 9.

No supplier packet has changed since the review: R06.3/R06.4 and R07.3/R07.4 are unreviewed and partial.

## What a follow-up does

- **Lean:** give signatures to the 42 inventory nodes that use only local data. These are the R08.2 type quotients,
  Taylor–Wiles blocks, GSp₄ minimal conditions and rigidity, among others. Write them against `TameGroup` and ideals
  of `LiftingRing`.
- **Lemma level:**
  - split PQ26 Lemmas 3.3–3.5 and BIP Corollary 3.42;
  - split BCGP21 Propositions 7.4.14–7.4.18;
  - one node per LLHLM matching (§3.6.2) and per ideal identity (Lemmas 3.6.11–3.6.16).
- **Maintainer:**
  - the seven restructure proposals;
  - the two Part II routes;
  - the atlas links of findings /14, /16, /17 and /22.
- **Sources:** read Geraghty's published text when a copy is available, and compare it with the preprint concordance.

## Sources read in this round (7 October 2026, scratch only)

- LLHLM, arXiv:1608.06570v4: §3.6 and Tables 3–4, from page images.
- Geraghty, preprint of 12 March 2010 (citeseerx/Wayback). The published version was not obtained.
- Thorne 2015, Cambridge accepted manuscript: §3.2–3.3, Lemmas 3.11–3.14.
- Booher, arXiv:1807.10743v1.
- Dotto, Algebra Number Theory 19 (2025), and arXiv:1808.06851v3.
- Shotton, arXiv:1608.01784v2: abstract and Theorem 4.6.
- BCGP21 v3, §7.3.
- BCGP25 v1: §5.6 and §6.2.
- KW II, authors' copy: §2.8 and §3.2.5.
- Kisin, Annals and 2-adic author DVIs: §2.4.

Their URLs and hashes are in the packet's `sources` and `sourceVersions`.
