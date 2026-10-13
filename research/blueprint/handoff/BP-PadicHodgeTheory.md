# BP-PadicHodgeTheory — handoff

Codex, session `codex-B5fK6x`, 13 October 2026. Refs #9427. The bot confirmed the claim at 15:44 UTC. This is a completed target-level planning pass, ready for independent review, rather than a checkpoint. No implementation is claimed.

The self-contained main packet contains **242 targets**: 38 definitions, 68 constructions, 130 theorems, four comparisons and two applications. It has **736 API items, 455 unit tests, 57 planets and 77 baseline declarations**. All 218 assigned items from 28 paper extractions have explicit destinations in `paperCoverage`. There are **34 proof gaps and 63 precise supplier requests**. All ten stages have been planned; annulus-foundations is closed, and the other nine remain planned with their exact obligations below.

## Deliverables and continuation

- [Packet](../packets/PadicHodgeTheory.json): `part: null`, `status: complete`, exactly the issue’s ten stages. All 242 targets are ordinary `nodes`, so standard checking and promotion see the full plan.
- [Reader](../readmes/PadicHodgeTheory.md): full statements, hypotheses, proofs/constructions, APIs, tests, uses, Checks, prerequisites and source locators for all 242 targets; ten worked examples and the 73 proof-ingredient contracts.
- [Suggested Lean](../suggested/PadicHodgeTheory.lean): 151 lines, three light definitions on existing submodule carriers, nine API statements, nine filtration examples, the unit-p and classical de Rham DVR milestones, and one period example. Heavy objects remain mathematical specifications in the reader.

The two earlier packets, `PadicHodgeTheory--P7.json` and `PadicHodgeTheory--R06.5.json`, are unaccepted partial drafts. They were read and continued, and their files remain unchanged. Their 262 identifiers are accounted for as 175 continued targets, 73 proof-sized lemmas, seven replaced targets and seven outgoing consumer targets. `imports` records input hashes; `predecessorTargets` maps the 175 continued identifiers to corrected ordinary main-packet nodes under the `/plan/` namespace. `proofDependencies`, `supersededTargets` and `outgoingTargets` account for the rest. Sixty-seven targets complete the main plan.

**Promotion must use this main packet alone after its independent review.** Do not accept/promote the obsolete partial drafts beside it. No custom continuation loader is required. Existing consumers of predecessor identifiers should be pointed to `predecessorTargets` or `supersededTargets`; proof-sized names are represented by their enclosing targets, and outgoing arithmetic names by the owners listed below.

## Current structure and ownership

The latest review object on RS-01 is `needs_changes` (REV-FIX-RT-RS-01, 10 October), despite its earlier accepted review. Per this issue, this pass therefore uses the current integrated structure. It does not pretend to accept or apply the remaining RS-01 restructuring. The explicit corrected owner records and verified findings are respected, and the decisions needed to avoid hidden prerequisite cycles are recorded here.

- The general Colmez–Fontaine theorem is supplied in R06.2 from the primary analytic construction over a complete discretely valued field with perfect residue. It does not use R06.3 monodromy. R07.4 imports this general implication and retains its Kisin finite-height construction.
- The integral Fontaine–Laffaille classification and its early admissibility proof remain supplied by R07.3. R06.4 states the rational period interface and exact small-weight/endpoint consequences. It does not reverse the R07.3→R06.4 order or assert an unrestricted integral essential image. These are the two local decisions relevant to RT-RS-01/30; the R07 and RS-01 files need their separate authorized update.
- The early primitive comparison, its relative form, mod-p/pro-étale agreement, finiteness and coefficient B_dR^+ comparison are inside P8:local-rational/P8. The primitive proof uses nested affinoids, almost finite generation and Artin–Schreier, rather than a later CP.3 or AΩ comparison.
- Integral theta/special elements and untilt patching are imported from AI.0:integral/AI.2; PD envelopes and log-crystalline objects from CR.0/CR.6. The classical Witt sheaf and derived-p-completed A_inf sheaf remain distinct until their completion comparison is proved.
- Rational constant-coefficient geometric comparison is supplied in R06.5 within the current tier-13 bundle; CP.2/CP.3 are higher-tier consumers. Only the required rational formal crystalline interface moves down from CP.2. The later BMS comparison agreements and integral good-reduction lattice identification are not replanned here.
- P7 owns the exact norm-field, overconvergent realization and Herr/duality interfaces used by period functors. PG.4–PG.5 retain ψ, Iwasawa and reciprocity theory. The integral Wach classifier is R07.4’s input.
- R06.2 owns the general almost-C and Banach–Colmez period interfaces needed before the curve theory. VB3 imports these; its geometric bundle theory remains with VB3. The packet’s restructuring proposal records that consumer update.
- The existing field curve of TauCetiRoadmap AdicSpaces is imported. Relative Witt/Robba sheaves, their local-system realization and two-period patching are here; RF1/VB1 own the relative curve and its geometric realization.
- The degree-one abelian specialization goes to HodgeTateAndCanonicalSubgroups T1. Four modular/cohomological specializations go to R19.1; two automorphic local-global statements go to R19.5. General local geometric comparison, Hodge–Tate weights and Weil–Deligne conventions stay here.

## Baseline and upstream audit

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library-coverage record was inspected first. Every cited baseline declaration has its exact module, limited role, checked signature and source-file SHA-256 in `baseline.declarations`; earlier audit provenance is preserved separately.

The read-only current TauCetiRoadmap checkout was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine additions beyond the atlas snapshot were screened: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Relevant current AdicSpaces, LocalFieldsRamification, ClassFieldTheory and EllipticCurves roadmap interfaces were also read. No build or edit was run in either checkout.

The local cyclotomic character and its normalization are imported from LocalGaloisGroups, not redefined. The field curve is imported from AdicSpaces; local Artin normalization from ClassFieldTheory; the Tate curve and quadratic descent from EllipticCurves. A generic analytic coefficient ring or vector-bundle category does not supply the specific relative period comparison automatically. The pinned abelian-variety carrier supplies the geometric object and base change, not its Tate module or crystalline realization. Mathlib BDeRham supplies a completion/localization carrier, not the missing DVR, Galois or period-functor theorems. Its one-sided power-series Gauss norm is only a compatibility input to the bilateral annulus norm.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory.json --json`: 242 nodes, zero errors and zero warnings, including the full own-node DAG and all 77 baseline references against the available declaration index.
- Additional agreement checks: all target IDs unique; every own prerequisite resolves to an actual main node; every request/gap names actual target nodes; all 218 paper items have destinations; every definition/construction has an API and at least three tests; every reader target and anchor matches the packet; at most six planets per stage.
- `lean-check research/blueprint/suggested/PadicHodgeTheory.lean`: exit 0 at the pins, **21 declaration-uses-sorry warnings and no others**. Available memory exceeded the required threshold. No language server, Lake build, dependency update or cache download was started.
- JSON/source-issue and intake file checks, Lean shape/line checks, and Git whitespace/path checks are included in the submitted PR validation. The source-checking ledger contains own-word descriptions and no source-excerpt fields.

## Stage status

| Stage | Targets | Status | Proof-gap entries | Supplier-request entries |
|---|---:|---|---:|---:|
| `PadicHodgeTheory:P7` | 32 | planned | 6 | 8 |
| `PadicHodgeTheory:P7:annulus-foundations` | 19 | closed | 0 | 0 |
| `PadicHodgeTheory:P8` | 29 | planned | 4 | 17 |
| `PadicHodgeTheory:P8:local-rational` | 37 | planned | 5 | 18 |
| `PadicHodgeTheory:R06.1` | 36 | planned | 2 | 7 |
| `PadicHodgeTheory:R06.2` | 51 | planned | 9 | 9 |
| `PadicHodgeTheory:R06.3` | 10 | planned | 3 | 3 |
| `PadicHodgeTheory:R06.4` | 10 | planned | 4 | 9 |
| `PadicHodgeTheory:R06.5` | 9 | planned | 4 | 17 |
| `PadicHodgeTheory:R06.6` | 9 | planned | 5 | 16 |

A gap/request can affect several stages, so those columns are not disjoint counts. The packet’s `coverage.remaining` lists the exact obligations for each stage. A complete planning pass does not assert proof closure.

## Sources and source issues

All reading relevant to a target is located in its `sources` and the reader bibliography. Newly read public copies have URLs, access date 13 October 2026 and SHA-256 values in `sourceVersions`; the earlier reading receipts remain historical provenance. Cleared Scholze 2013, BMS, KL I and KL II references were read in the maintainer’s library without copying their files or passages. The additions below describe inspected theorem inputs, not claims of rereading every unrelated theorem in those papers.

Primary passages include Colmez–Fontaine §§1–5 and §6.2; Fontaine period rings and almost-C representations; Brinon–Conrad period and filtration arguments; Brinon 2008 §§6.1–6.2 (including Proposition 6.2.1); Breuil’s completed log-PD coordinates; Conrad Appendix B crystalline characters; Berger’s B-pair and differential realizations; Liu’s Herr/cohomology/duality theorems and §3.3 Wach–Kisin comparison; Scholze §§4–8 and the entire corrected structural-period construction; KL I §§4, 8, 9 and KL II Appendix A; Fargues–Fontaine Préface §§2.5–2.9; Betts–Stix de Rham-pair pushforward, trace normalization and Appendix A. Each assigned extraction is tied to its specific consumer interface and source locator in `paperCoverage`.

For added source conventions: Breuil’s polynomial variable is distinct from Fontaine’s t; the full tensor-category automorphism group is the full algebraic image closure, not its identity component; regular ordinary descent retains its uniqueness hypothesis; nonzero acyclic HN slopes use the corrected degree convention; the enhanced coefficient category is not an unrestricted derived endomorphism-module category. The reader separates cohomology-sheaf calculations from a derived splitting assertion and restricts the LF sequence criterion to its cited coefficient-field setting.

There are 56 in-scope source-issue records, preserving predecessor numbering and audit history. Three further automorphic issues are routed in `outgoingSourceIssues`. New records E52–E59 cover the crystalline-character uniformizer, full versus connected monodromy group, acyclic degree sign, ordinary-lifting index bound, descending-filtration cone, positive-Frobenius acyclicity proof gap, finite coefficient enhancement and high-index filtration boundedness. They are corrected contracts or explicit proof gaps, not blanket claims that the sources are wrong in other settings. Scholze’s corrigendum, Berger’s current errata, KL II’s author corrections, Niziol’s publication page and relevant arXiv histories were checked.

Fontaine’s 1982 Barsotti–Tate book, the primary BBM crystalline–Dieudonné treatment, Breuil–Mézard comparison details and Coleman–Iovita Chapter II were not read. No uncleared book copy was used. The precise remaining primary-proof needs, including Colmez’s Witt-ideal cohomology input, Tsuji/Kato completed-period arguments and integral saturation, are listed below. Saito/Scholl automorphic-source needs belong to the outgoing consumer work.

## Remaining proof obligations

Independent review should verify the stated contracts first, then close these exact proof boundaries. No new target-level planning is needed merely to continue from the first stage.

### G01 — Completed-period flatness and inverse-limit proof

The cited proof of Lemma B.13 depends on Tsuji (1999) Propositions 4.1.3 and 4.1.5 and Kato (1994) Corollary 3.6. Breuil’s coordinate construction was read, but these two flatness and derived-limit inputs require a directly checked primary proof before closure.

**Affected targets:** `PadicHodgeTheory:R06.1/breuil-nilpotent-period-comparison`.

### G02 — Intrinsic uniqueness in ordinary descent

Write out the uniqueness argument for the regular ordinary flag with the precise de Rham and embedding hypotheses; Qian’s brief invocation is not a proof of the general nonregular triangular case.

**Affected targets:** `PadicHodgeTheory:R06.2/regular-ordinarity-finite-extension-descent`.

### G03 — Fixed-bound torsor obstruction proof

GLX cites Dat–Orlik–Rapoport (2010), Proposition 11.4.3 and its preceding paragraph. That book is not in the cleared library. The target statement and exact use were read in GLX, but the primary proof and its full Kottwitz hypotheses must be checked in an authorized source before closure.

**Affected targets:** `PadicHodgeTheory:R06.2/bounded-crystalline-g-torsor-triviality`.

### G04 — Crystalline open-image and inner-form proofs

Check the primary Serre/Sen and Chen results quoted in GLX Theorem 5.2 and paragraph 14, including connected-category conventions. The read GLX assertion cannot replace these proofs.

**Affected targets:** `PadicHodgeTheory:R06.2/crystalline-monodromy-group-interface`.

### G05 — HN tensor theorem for nonzero slopes

Provide a primary proof of tensor compatibility and the comparison of this filtered-isocrystal HN structure with the modified curve bundle. CN §5 invokes this structure without proving it. Weak-admissible tensor compatibility follows independently from Colmez–Fontaine.

**Affected targets:** `PadicHodgeTheory:R06.2/filtered-isocrystal-harder-narasimhan`.

### G06 — Sen blocks and logarithmic indecomposables

The finite-Q_p Sen module target is inherited, but the full Kbar/Z simple-block classification, division algebras and regular-singular decompletion required by Fontaine §§2.6 and 3.2–3.7 must be expanded at target level before claiming this classification closed.

**Affected targets:** `PadicHodgeTheory:P7/fontaine-bdr-indecomposable-classification`.

### G07 — Horizontal purity and imperfect-residue monodromy

Read and plan the primary imperfect-residue horizontal monodromy input, Ohkubo Theorem 7.4, and the target-level purity argument of Shimizu Theorem 6.1. Shimizu Remark 7.3 rules out using Ohkubo Theorem 7.6’s stronger descent claim.

**Affected targets:** `PadicHodgeTheory:P8/horizontal-and-local-system-monodromy`.

### G08 — Invariant-to-quotient sheaf exactness

Prove pro-étale local surjectivity B_cris^{φ=1}→B_dR/B_dR^+ for the specified relative crystalline sheaf. Brinon Proposition 6.2.24 is a relative scalar ring theorem and does not alone provide a sheaf proof. Shimizu Remark 2.42 shows that a scalar Frobenius sequence on an arbitrary perfectoid algebra can fail.

**Affected targets:** `PadicHodgeTheory:P8:local-rational/fundamental-period-sheaf-sequences`.

### G09 — Primary local Fontaine–Messing and dimension inputs

The scheme/formal comparison proof and Proposition 5.20 were read. Closure additionally requires the local nearby-cycle proof of Colmez–Nizioł Theorem 5.4 and the primary finite-dimensional Banach–Colmez dimension theorem [Colmez 2002, Theorem 0.4] used in Proposition 5.16; specify their exact supplier interfaces instead of treating the introductory comparison as a proof.

**Affected targets:** `PadicHodgeTheory:R06.5/proper-semistable-model-comparison`.

### G10 — First-order crystalline local lifting

Write the pro-étale local lifting proof of θ:(B_cris^+)^{φ=p}→Ô for the all-C sheaf; the source uses this sequence without proving that step. Do not invoke pointwise surjectivity on an arbitrary perfectoid ring.

**Affected targets:** `PadicHodgeTheory:P8:local-rational/first-order-fundamental-period-diagram`.

### G11 — Relative Frobenius descent inputs

KL Theorems 8.5.5 and 8.5.12 and their proofs, pp.171–175, were read. Closure requires the exact lower-tier RD.1 slope-zero descent, relative localization and pseudocoherent descent contracts used there. Integral local systems use integral Frobenius lattices; rational unit-root vector bundles require the local invariant sheaf realization and must not assume a global unit-root lattice, as shown by Examples 8.5.17–8.5.18. The complete-subring correction to Theorem 8.5.8(b) is retained.

**Affected targets:** `PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules`.

### G12 — Relative B-pair ring and patching interface

KL Definition 8.9.4 and Theorem 8.9.6, pp.187–188, were read. Supply from the shared-tier AI.2 bundle the complement ring R_1, the completed untilt ring R_2, R_3=R_2[1/z], finite-projective triple descent and the difference complex for flat coefficients. KL Remark 8.9.5 does not establish unconditional flatness of R_2 over the original ring. General relative-curve equivalence remains an outgoing realization; this target uses only the two-period patching interface.

**Affected targets:** `PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison`.

### G13 — Resolution supplier for constructible comparison

The source’s descent argument was read. Resolution of pairs is not certified by the current A0 contract; its precise lower-tier Part II interface must be supplied before closure.

**Affected targets:** `PadicHodgeTheory:P8:local-rational/constructible-primitive-comparison`.

### G14 — Analytic coefficient Sen hypotheses

The BCGP local models and application proof were read; the primary strong-decomposability theorem and the Rodríguez Camargo geometric decompletion proof must be checked at the stated supplier interfaces. The generic constructor is conditional on those exact hypotheses.

**Affected targets:** `PadicHodgeTheory:R06.2/arithmetic-sen-descent-for-coefficients`.

### G15 — Primary field-of-norms proof

The explicit construction and uses in Berger’s survey were read. Closure requires the Fontaine–Wintenberger finite-extension theorem and the Cohen-lifting proof, with the parameter and ramification estimates at this precise cyclotomic tower.

**Affected targets:** `PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface`.

### G16 — Primary overconvergence estimates

The realization and overconvergence statements and their use were checked in Berger’s survey. The complete Cherbonnier–Colmez finite-radius construction and normalized-trace estimates must be checked directly before this target is closed.

**Affected targets:** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`.

### G17 — Primary Banach–Colmez category theorem

The exact definitions and dimension identities were read in Colmez–Nizioł §§2–3. Closure needs the primary Colmez analytic dimension theorem and Fontaine’s almost-C category theorem, including the stated evaluation-separated sympathetic hypothesis. Their proof cannot be replaced by bare Banach-space dimension.

**Affected targets:** `PadicHodgeTheory:R06.2/banach-colmez-period-spaces`, `PadicHodgeTheory:R06.2/almost-c-representation-category`.

### G18 — Acyclic reconstruction without the curve supplier

Colmez–Nizioł Theorem 5.8 uses the acyclic period-space/curve dictionary. Since the general curve roadmap is outside this tier, its minimal local analytic surjectivity and continuous-Hom reconstruction must be proved at this target, or derived from the existing field-curve theorem with all equivariant topological details checked. It is not a closed consequence of ordinary Colmez–Fontaine.

**Affected targets:** `PadicHodgeTheory:R06.2/acyclic-period-reconstruction`.

### G19 — Log-period transcendence over the annular image

Fontaine §4.3.2, pp.87–88, proves u∉Frac S for S consisting of bounded A_inf-coefficient power series in β=ξ/p, assuming S is p-adically separated. Berger Proposition 2.25 uses this for injectivity of the annular logarithmic embedding. The remaining obligation is the separatedness proof for this actual S and the inclusion of the annular image in its fraction field; transcendence over Frac B_cris alone does not supply the larger-ring claim.

**Affected targets:** `PadicHodgeTheory:P7/plan/extended-localisation-maps`, `PadicHodgeTheory:P7/plan/semistable-periods-in-extended-robba-ring`.

### G20 — Witt-ideal Galois-cohomology vanishing

Prove H^1(H_K,W(m_{C^flat}))=0 with continuous cochains and the p-adic topology, as used by Berger Lemma 2.27. Almost purity gives almost vanishing on the valuation ring; obtaining actual vanishing on its maximal ideal and passing through W_n and the inverse limit require separate dévissage and derived-limit arguments. Colmez (1998), IV.2.4 is the cited primary input.

**Affected targets:** `PadicHodgeTheory:P7/plan/decompletion-operators`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, `PadicHodgeTheory:P7/plan/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/plan/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/plan/berger-comparison-isomorphisms`, `PadicHodgeTheory:P7/plan/connection-on-robba-realisation`, `PadicHodgeTheory:P7/plan/semistability-criterion-unipotent-connection`, `PadicHodgeTheory:P7/plan/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`, `PadicHodgeTheory:R06.3/plan/de-rham-differential-equation`, `PadicHodgeTheory:R06.3/plan/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/plan/weil-deligne-descent`, `PadicHodgeTheory:R06.3/plan/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/plan/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.4/plan/ordinary-implies-semistable`, `PadicHodgeTheory:R06.4/plan/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`.

### G21 — Integral saturation for the Wach–Kisin comparison

The missing comparison target is supplied by the new Wach–Kisin theorem, from Liu §3.3, pp.11–12. Its remaining primary boundary is Liu (2010) Lemma 3.2.2, quoted as Liu Lemma 3.1.3, and the integral Kisin/Wach realization inclusions. Supply these through R07.4 before closing the comparison.

**Affected targets:** `PadicHodgeTheory:P7/wach-kisin-lattice-comparison`.

### G22 — Relative period computations requiring proof verification

Verify the profinite-product section formula with its topology, the bounded-degree Cartan–Leray argument over completed cyclotomic tensors, and the passage from the complete t^{-j}OB_dR^+ pieces to ν_*OB_dR=O_X. Check normalized-trace descent in every twist and continuity of the extended connection on the erratum’s completed carrier. Tensor and cup compatibility must be proved at chain level, rather than inferred from equality of dimensions.

**Affected targets:** `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf-connection`.

### G23 — Separatedness of the bounded logarithmic coefficient ring

Fontaine §4.3.2, pp.87–88 and Fontaine–Ouyang Lemma 6.12 assume p-adic separatedness of S⊂B_dR^+ consisting of Σ a_n(ξ/p)^n with a_n∈A_inf. The proposed coefficient-expansion proof must establish the existence of the required θ-section, stability of the recursion inside S, compatibility with multiplication by p and injectivity into O_C[[X]]. A discontinuous algebraic section on Kbar cannot supply these bounded-coefficient properties.

**Affected targets:** `PadicHodgeTheory:R06.1/plan/log-p-flat-transcendental`.

### G24 — Filtration comparison for Fontaine–Laffaille rational periods

Verify Fil^i S_K=S_K∩Fil^i B_dR for the Fontaine–Laffaille period carrier before identifying U_{S_K} with the contravariant crystalline realization. The primary Barsotti–Tate ring argument in Fontaine (1982), §4 has not been read. General small-weight admissibility is already supplied independently by Colmez–Fontaine; only this explicit period-carrier comparison retains the obligation.

**Affected targets:** `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/plan/small-weight-admissibility`.

### G25 — Weil–Deligne choice and monodromy-rescaling proof

The target gives the embedding-transport map through Frobenius and the finite-extension descent map. Verify their compatibility with the chosen geometric-Frobenius relation FNF^{-1}=q^{-1}N and the R01.2 monodromy-rescaling isomorphism. Breuil–Mézard §2.2.1 remains a primary comparison boundary; no claim is made that that text has been read.

**Affected targets:** `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/plan/weil-deligne-descent`, `PadicHodgeTheory:R06.3/plan/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/plan/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.4/plan/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.3/plan/fontaine-weil-deligne-functor`.

### G26 — Correct constant field for differential solution spaces

Require the RD.2 solution-space theorem over F′_L=L_∞∩K_0^nr, not merely L∩K_0^nr. The constants can enlarge in the cyclotomic tower: K=Q_3(√−6) acquires √2 in K(ζ_3). The monodromy application enlarges L until its unramified part contains this constant field. The supplier contract needs this correction before closure.

**Affected targets:** `PadicHodgeTheory:R06.3/plan/p-adic-monodromy-theorem`.

### G27 — Integral Fontaine–Laffaille essential image

Supply from R07.3/R07.4 the exact classification of stable crystalline lattices in the supported weight interval, including boundary and nilpotence restrictions. Fontaine–Laffaille Remark 6.13(a) does not classify arbitrary lattices, and Brinon–Conrad Theorem 12.4.8 has incomplete proof notes. The rational period theorem here does not assert that every lattice lies in the integral essential image.

**Affected targets:** `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`.

### G28 — Good-reduction converse and semistable lattice interface

The read Coleman–Iovita arXiv version omits Chapter II. The chosen proof of crystallinity implying good reduction instead uses Grothendieck’s criterion and R07.4’s integral lattice classification; verify this route at its actual group-scheme and reduction hypotheses. An explicit Hyodo–Kato lattice description would require the Chapter II proof and is not used in this target.

**Affected targets:** `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`.

### G29 — Crystalline–Dieudonné identification for an abelian special fiber

The equality H^1_cris(A_0/W(k))≃D(A_0[p^∞])^(p), with the correct Dieudonné variance and Frobenius, is cited through Brinon–Conrad Remark 7.3.3. Supply its primary proof and exact CR.6/p-divisible-group interface. The ordinary/supersingular characteristic-polynomial computation uses Katz–Messing separately and does not certify this integral identification.

**Affected targets:** `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`.

### G30 — Tate-curve uniformization and quadratic descent

Import the actual G_K-equivariant Tate uniformization and the classification by split, nonsplit unramified quadratic and potentially multiplicative ramified quadratic twists from TauCetiRoadmap EllipticCurves Layer 4. Check the minimal-model and finite-extension hypotheses, including p=2,3. Berger’s unqualified identification with a Tate curve is insufficient for the nonsplit branch.

**Affected targets:** `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/tate-curve-tate-module`.

### G31 — Canonical trace twist normalization

The geometric comparison and its tensor operations are constructed. For the trace and cycle clauses, Betts–Stix Proposition 3.20 proves compatibility after the P¹ normalization a; Remark 3.21 does not prove equality of this a with the t-normalized twist comparison. Verify this equality before asserting that stronger normalization.

**Affected targets:** `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`.

### G32 — Perfectoid adaptation of crystalline separation

Brinon Proposition 6.2.1, pp.69–70, has now been read directly and supplies the field closed-PD-ideal separation argument. For arbitrary affinoid perfectoid R^+, verify the mod-p PD presentation, p-torsion-freeness and equality of inverse-image closed ideals on the actual sheaf section carrier. Tan–Tong Proposition 2.23 leaves this adaptation implicit. Merely citing the smooth relative ring theorem does not discharge it.

**Affected targets:** `PadicHodgeTheory:P8:local-rational/plan/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`.

### G33 — Analytic neighbouring-lattice fundamental lemma

The exact assertions and irreducibility argument in Fargues–Fontaine Préface pp.13–15 were read. The analytic tensor/trace-kernel lemmas Theorems 2.5 and 2.8, pp.11–13, require a complete proof on the chosen continuous period-space carrier. Do not deduce the degenerate-case dimension claim from ordinary algebraic exactness.

**Affected targets:** `PadicHodgeTheory:R06.2/neighbouring-representation-modification`.

### G34 — Enhanced finite coefficient comparison

The finite isocrystal enhancement is a specified convention, not the unrestricted category of literal endomorphism modules in BKV Definition 3.1. Prove the filtered-unramified colimit comparison and realized factorization; the accepted extraction records this as G11. Beilinson §1.15 is a supporting source to verify rather than an unchecked automatic category equivalence.

**Affected targets:** `PadicHodgeTheory:R06.2/enhanced-finite-frobenius-monodromy-coefficients`.

The separate open question in `openQuestions` is Disegni–Liu Remark B.15, concerning the invariant image of monodromy. It is not needed for the Frobenius-isotypic edge factorization, and must not become an unproved theorem or a prerequisite for it.

## Supplier requests

These are mathematical interface requests in the packet, not messages sent to other workers. They name their exact hypotheses and consumers in `requests`; the numbering here is the same one-based array order. Multiple entries for an owner are distinct contracts, not duplicate carrier definitions. The next worker can address them by owner without reconstructing the source reading.

### Q01 — `AInfCohomology:AI.0:integral`

For every O_C as above, identify the existing fontaineTheta with the untilt map; prove its kernel is principal, generated by a regular primitive element, and its localization has residue C.

**Used by:** `PadicHodgeTheory:R06.1/complete-algebraically-closed-bdr`.

### Q02 — `CrystallineCohomology:CR.0`

PD envelopes with a prescribed PD base, reduction modulo p^l and p-adic completion, applied to W[t]→O_K.

**Used by:** `PadicHodgeTheory:R06.1/breuil-completed-semistable-rings`.

### Q03 — `CrystallineCohomology:CR.6`

The log-crystalline H^0 object P_l with the Witt-PD-coordinate identification and compatible transition maps in Breuil §2.

**Used by:** `PadicHodgeTheory:R06.1/breuil-completed-semistable-rings`.

### Q04 — `ArithmeticGaloisDuality:R02.1`

Functorial continuous-cohomology connecting maps for the topological period modules in the two exact monodromy rows, with the relevant strictness/completeness hypotheses.

**Used by:** `PadicHodgeTheory:R06.1/breuil-frobenius-edge-factorization`.

### Q05 — `ReductiveGroupsPartII:RG2.1`

Neutral Tannakian fiber-functor reconstruction and the tensor-Isom G-torsor for Rep(G); use the existing Tau Ceti roadmap, not a second theory of tensor categories.

**Used by:** `PadicHodgeTheory:R06.2/crystalline-g-fiber-functor`.

### Q06 — `PadicDifferentialEquationsAndRigidCohomology:RD.2`

Extended Robba slope decomposition and finite-radius gluing needed in Berger Propositions 2.2.5–2.2.6, without using representation-theoretic monodromy as a prerequisite.

**Used by:** `PadicHodgeTheory:P7/b-pair-robba-equivalence`.

### Q07 — `PerfectoidSpaces:P0`

Foundational almost modules and Scholze Lemma 2.12: tilted flat inverse limits with almost finite-generation control give the free almost module needed in Theorem 5.1; this is independent of AΩ cohomology.

**Used by:** `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`.

### Q08 — `PerfectoidSpaces:P3`

Almost purity for finite étale perfectoid covers and almost integral local acyclicity of O^+/p on affinoid perfectoids, independent of primitive comparison.

**Used by:** `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`.

### Q09 — `AdicEtaleGeometry:A1`

The pro-étale site, perfectoid root towers and affinoid basis used by Scholze §§3–5.

**Used by:** `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`.

### Q10 — `ClassicalAdicEtaleCohomology:H0`

Finite covers, geometric proper base change for finite locally constant coefficients, and the qcqs site-cohomology formalism used in the primitive theorem.

**Used by:** `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`.

### Q11 — `DiamondsAndVStacks:D3`

Finite-projective B_dR^+ descent on perfectoid diamonds and agreement with pro-étale period modules, in Scholze–Weinstein Corollary 17.1.9; import the diamond/site construction rather than rebuild it.

**Used by:** `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### Q12 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

The strongly divisible-lattice ordinary-subobject argument on [0,p−1], including weight p, used in Khare–Wintenberger Lemma 3.5(i); retain contravariance.

**Used by:** `PadicHodgeTheory:R06.4/khare-wintenberger-ordinarity-branches`.

### Q13 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

The rank-two crystalline reduction branches of Berger–Li–Zhu Theorem 4.1.1 and Proposition 4.1.4 needed at k=p+1, rather than an integral Fontaine–Laffaille assertion there.

**Used by:** `PadicHodgeTheory:R06.4/khare-wintenberger-ordinarity-branches`.

### Q14 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

The potentially crystalline weight-two ordinary-lift input Conrad–Diamond–Taylor Lemma 2.1.2 used in Khare–Wintenberger Lemma 3.5(iii).

**Used by:** `PadicHodgeTheory:R06.4/khare-wintenberger-ordinarity-branches`.

### Q15 — `AInfCohomology:AI.5`

Proper-smooth A_inf cohomology with the étale specialization and the B_cris comparison of BMS Theorem 14.6(i), using the early P8 primitive comparison as an input.

**Used by:** `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`.

### Q16 — `CrystallineCohomology:CR.3`

Proper-smooth crystalline finiteness, Frobenius and rational base change, and agreement of its de Rham specialization with the transported filtration.

**Used by:** `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`.

### Q17 — `CrystallineCohomology:CR.6`

Hyodo–Kato complex for proper semistable models, the uniformizer-indexed de Rham map and its exponential monodromy transport; include the log-PD period evaluation map used in the rational semistable comparison.

**Used by:** `PadicHodgeTheory:R06.5/proper-semistable-model-comparison`.

### Q18 — `PerfectoidSpaces:P6`

Toric p-power root towers over small smooth affinoids, with the completed tensor product calculation of Scholze Lemma 4.5 and continuous Z_p^d-cohomology.

**Used by:** `PadicHodgeTheory:P8/early-primitive-comparison-and-finiteness`, `PadicHodgeTheory:P8/geometric-hodge-tate-direct-images`.

### Q19 — `ClassicalAdicEtaleCohomology:H2`

Geometric proper base change for finite locally constant p-power coefficient sheaves, used to promote absolute primitive comparison to relative comparison.

**Used by:** `PadicHodgeTheory:P8/early-relative-primitive-comparison`.

### Q20 — `DiamondsAndVStacks:D6`

The rigid-space diamond and its site comparison, with perfectoid toric covers agreeing on the pro-étale and v descriptions.

**Used by:** `PadicHodgeTheory:P8/diamond-period-local-system-equivalence`.

### Q21 — `AInfCohomology:AI.4`

Local B_cris specialization of the AΩ complex with the Frobenius-compatible map used in the proper-smooth comparison.

**Used by:** `PadicHodgeTheory:R06.5/proper-smooth-formal-crystalline-comparison`.

### Q22 — `CrystallineCohomology:CR.5`

Semistable logarithmic charts, their PD lifts and completed log-PD envelopes with the base and partial-PD-level conventions of Colmez–Nizioł §2.6.

**Used by:** `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`.

### Q23 — `PadicDifferentialEquationsAndRigidCohomology:RD.1`

Relative pure-locus and pointwise slope theory over perfect uniform Banach F_p-algebras in KL §7.3, including lift-independent slope tests and normalization slope(φ^d)=v_p/d. This extends the field slope theorem and must be supplied as Part II where not already present.

**Used by:** `PadicHodgeTheory:P8/relative-pure-and-etale-loci`.

### Q24 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

At e=p−1 a connected finite flat p-group with a generic constant subgroup has schematic closure μ_p in the CDT Lemma 2.1.2 situation; use Cartier duality and the canonical connected–étale sequence with coefficient action.

**Used by:** `PadicHodgeTheory:R06.4/khare-wintenberger-ordinarity-branches`.

### Q25 — `SchemeAndStackFoundations:SF.4`

Characteristic-zero resolution of a pair: for U smooth in a proper variety X/C, a proper modification that is an isomorphism on U with smooth source and strict normal-crossings boundary; exact forms and reference as an explicit Part II interface.

**Used by:** `PadicHodgeTheory:P8:local-rational/constructible-primitive-comparison`.

### Q26 — `EnhancedDerivedSheaves:E4`

The filtered sequence derived category, the completion functor and the graded-quasi-isomorphism criterion of Betts–Stix Appendix A, with small-site universe conventions and the distinction from termwise localization.

**Used by:** `PadicHodgeTheory:P8/filtered-derived-period-interface`.

### Q27 — `LocallyAnalyticDistributions:L0`

Locally analytic vectors in continuous semilinear Banach/LB representations, their normalized Lie action and completed coefficient-extension behavior under the strong decomposability hypotheses in BCGP §4.5.

**Used by:** `PadicHodgeTheory:R06.2/arithmetic-sen-descent-for-coefficients`.

### Q28 — `PerfectoidSpaces:P6`

The strongly decomposable toric/pro-Kummer tower hypotheses and continuous local Banach coefficient models used before arithmetic Sen descent; geometric Sen Lie calculations of Rodríguez Camargo are a precise Part II interface, not assumed from a generic perfectoid cover.

**Used by:** `PadicHodgeTheory:R06.2/arithmetic-sen-descent-for-coefficients`.

### Q29 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

For unramified K, the integral Wach module N(T), its rationalization N(V), Γ triviality modulo π, the q-height conditions and its filtration; comparison with Breuil–Kisin and Fontaine–Laffaille lattices in the precise supported intervals.

**Used by:** `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`.

### Q30 — `ReductiveGroupsPartII:RG2.1`

Part II interface: Rep(G) as a rigid tensor category, the Isom^⊗ torsor of fiber functors, reconstruction of G(Q_p)-valued continuous actions, and the connected versus full algebraic monodromy group. Root data and the Kottwitz homomorphism alone do not supply this.

**Used by:** `PadicHodgeTheory:R06.2/crystalline-g-fiber-functor`, `PadicHodgeTheory:R06.2/crystalline-monodromy-group-interface`.

### Q31 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

For F = W(k)[1/p] and V crystalline with Hodge–Tate weights in [a, b] (HT(chi) = +1) and T a G_F-stable lattice: the Wach modules N(T) (free of rank d over A^+_F, Gamma_F-stable with trivial action on N(T)/pi N(T), pi^r D^+(T) contained in N(T) for weights <= 0, phi-stable) and N(V) = B^+_F tensor N(T), N(T) = pi^{-b} N(T(-b)) in general, including the etaleness condition on B_F tensor N (Berger errata 2026 for Definition III.4.1); the inclusion D_cris(V) in B^+_{rig,F} tensor N(V) with D_cris(V) = (B^+_{rig,F} tensor N(V))^{Gamma_F} (Berger 2004 Proposition II.2.1); the elementary divisors of B^+_{rig,F} tensor_F D_cris(V) in B^+_{rig,F} tensor N(V) (Propositions II.3.1, III.2.1) and B^+[1/pi] tensor V = B^+[1/pi] tensor N(V) (Theorem III.3.1); the equivalence V |-> N(V) (Proposition III.4.2).

**Used by:** `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`.

### Q32 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

For K = K_0 unramified: strongly divisible lattices M of filtered phi-modules (sum_i p^{-i} phi(Fil^i M) = M, Fontaine–Laffaille 1982 Section 7.7-7.8) and the Fontaine–Laffaille correspondence between G_F-stable lattices of crystalline V with weights in an interval of length <= p - 2 and strongly divisible lattices of D_cris(V) (Fontaine–Laffaille 1982 Proposition 7.17), with its covariance and HT(chi) = +1 translation stated explicitly.

**Used by:** `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`.

### Q33 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

For K = K_0 unramified and crystalline V with weights in [0, h]: the Breuil–Kisin module of a lattice T over W(k)[[u]] with its phi and the identification of D_cris(V) with its reduction, in a form comparable with the Wach module N(T) over A^+_F (for the P7 Wach–Breuil–Kisin comparison).

**Used by:** `PadicHodgeTheory:P7/plan/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/plan/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/plan/berger-robba-identification`, `PadicHodgeTheory:P7/plan/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7/plan/extended-localisation-maps`, `PadicHodgeTheory:P7/plan/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/plan/log-extended-period-rings`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, `PadicHodgeTheory:P7/plan/decompletion-operators`, `PadicHodgeTheory:P7/plan/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/plan/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/plan/berger-comparison-isomorphisms`, `PadicHodgeTheory:P7/plan/connection-on-robba-realisation`, `PadicHodgeTheory:P7/plan/unipotent-crystal`, `PadicHodgeTheory:P7/plan/semistability-criterion-unipotent-connection`, `PadicHodgeTheory:P7/plan/sen-module`, `PadicHodgeTheory:P7/plan/fontaine-dif-module`, `PadicHodgeTheory:P7/plan/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`, `PadicHodgeTheory:P7/coefficient-b-pairs`, `PadicHodgeTheory:P7/b-pair-robba-equivalence`, `PadicHodgeTheory:P7/b-pair-cohomology-handoff`, `PadicHodgeTheory:P7/coefficient-bdr-representations`, `PadicHodgeTheory:P7/fontaine-bdr-indecomposable-classification`, `PadicHodgeTheory:P7/embedding-selective-crystalline-modification`, `PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface`, `PadicHodgeTheory:P7/phi-gamma-module-interface`, `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicHodgeTheory:P7/herr-complex-interface`, `PadicHodgeTheory:P7/wach-kisin-lattice-comparison`.

### Q34 — `PerfectoidSpaces:P6`

Perfectoid toric root-cover basis, tilde limits and the universal finite-étale cover of noetherian affinoids used by Scholze §4. This input is independent of AΩ and its cohomology.

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/plan/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8:local-rational/plan/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/plan/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8/plan/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/plan/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/plan/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/plan/relative-bdr-plus-local-system-comparison`.

### Q35 — `AdicEtaleGeometry:A1`

Scholze's pro-étale site X_proét of a locally noetherian adic space with the erratum's transfinite covers, ν: X_proét → X_ét, Lemma 3.10, Proposition 3.12 (U = lim of affinoids is qcqs; the topos is coherent, so cohomology of qcqs objects commutes with filtered colimits), Proposition 3.15 (X_{L,proét} ≅ X_proét/X_L), Lemma 3.16 and Corollary 3.17 (i)-(ii), the objects U × S for profinite S pulled back from the pro-finite-étale site of the base, Proposition 3.7 (ii)-(iii) with corrected covers (H^i(pt, F_M) = H^i_cont(G, M)), and Galois descent of sheaves along pro-finite-étale Galois covers such as X_K → X.

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/plan/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8:local-rational/plan/graded-de-rham-period-sheaf-tate-twist`, `PadicHodgeTheory:P8:local-rational/plan/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8/horizontal-relative-periods`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/plan/lisse-zp-sheaf`, `PadicHodgeTheory:P8/plan/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/plan/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/plan/relative-bdr-plus-local-system-comparison`.

### Q36 — `AdicEtaleGeometry:A2`

For smooth adic spaces over a complete nonarchimedean field: étale maps to the unit ball near a given point with the open set containing its closure (Huber, Étale cohomology of rigid analytic varieties, Corollary 1.6.10), the factorisation of an étale map over a rational subset as an open embedding into a finite étale cover (Huber Lemma 2.2.8), compatible local toric charts for smooth morphisms, and the sheaf Ω¹_{X_ét} of continuous Kähler differentials (locally free of rank dim X) with Ω^i = ∧^iΩ¹ and relative Ω¹_{X/Y}.

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/relative-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/bdr-plus-local-systems-and-integrable-connections`, `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8:local-rational/plan/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf-connection`.

### Q37 — `ClassicalAdicEtaleCohomology:H0`

Derived direct images Rν_* and Rf_* for sheaves of modules on pro-étale and étale sites, R^qν_* as the sheafification of U ↦ H^q(U, −), the Čech-to-derived comparison and the Cartan–Leray spectral sequence for a cover (SGA 4 V 3.3), and Leray spectral sequences.

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8/horizontal-relative-periods`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/affinoid-k-pi-one-for-p-torsion`.

### Q38 — `AdicSpacesPartII:R0`

Huber, Étale cohomology of rigid analytic varieties, Corollary 1.7.3 (iii) and Remark 1.2.6 (iii): an affinoid U = Spa(R, R^+) of finite type over Spa(W(κ)[1/p], W(κ)) with an étale map to Tⁿ has an algebraic model (R_0, R_0^+) with R_0 étale over W(κ)[1/p][T^{±1}], R_0^+ the integral closure in R_0 of a finitely generated W(κ)[T^{±1}]-algebra R_1^+ with R_1^+[1/p] = R_0, and R^+ the p-adic completion of R_0^+ (Sch13 Lemma 6.12).

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/relative-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/bdr-plus-local-systems-and-integrable-connections`, `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`.

### Q39 — `AdicSpacesPartII:R2`

Smooth formal schemes 𝔛 over W(κ), their étale sites and the rigid generic fibre functor Y ↦ Y_k (giving, with AdicEtaleGeometry A1, the morphism of topoi w: X_proét → 𝔛_ét used by Tan–Tong), Ω¹_{𝔛/W(κ)} locally free, and Frobenius lifts on formal schemes étale over the formal torus (unique lift with T_i ↦ T_i^p).

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`.

### Q40 — `AdicSpacesPartII:R3`

Kiehl's finiteness for proper morphisms (R^if_* of a coherent sheaf is coherent; Čech differentials have closed image), finite-dimensionality of coherent cohomology of proper adic spaces over a field and its compatibility with extension of the complete base field (Sch13 Lemma 7.13), base change of coherent cohomology of a proper f along étale T → S of affinoids (Sch13 Proposition 9.2 (ii)), and étale descent of finite projective modules along finite étale maps of affinoids (for Sch13 Lemma 7.3).

**Used by:** `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:P8/plan/relative-bdr-plus-local-system-comparison`.

### Q41 — `CrystallineCohomology:CR.0`

PD envelopes of a ring along an ideal compatible with the divided powers of p, their sheafification on a site and p-adic completion, the PD filtration, and the universal property used to extend ring maps (in particular Frobenius) to PD envelopes; applied to (A_inf, ker θ) and (O_X^{ur+} ⊗ A_inf, ker θ_X).

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`.

### Q42 — `AlgebraicModuliForArithmeticGeometry:A0-extension`

Finiteness of normalisation for finitely generated reduced flat W(κ)-algebras S^+ inside S^+[1/p] (W(κ) a complete discrete valuation ring, hence excellent), used in Sch13 Lemma 6.12.

**Used by:** `PadicHodgeTheory:P8:local-rational/plan/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/relative-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/bdr-plus-local-systems-and-integrable-connections`, `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`.

### Q43 — `CrystallineCohomology:CR.0`

For A_inf = W(O_C^♭) (O_C = 𝓞_ℂ_[p]) and J = ker(θ: A_inf → O_C) = ξA_inf (ξ = [p^♭] − p a nonzerodivisor): the divided-power envelope D_J(A_inf) over (Z_p, (p), γ) and its p-adic completion A_cris, with the PD map θ_cris: A_cris → O_C and the PD ideal ker θ_cris; p-torsion-freeness of A_cris; the explicit envelope of a regular principal ideal in a p-torsion-free ring, D_J(A_inf) = A_inf[ξ^m/m!]_{m≥1} ⊆ A_inf[1/p] (Brinon–Conrad Exercise 9.4.1(1)); the description A_cris/p ≅ (O_C^♭/(p^♭)^p)[Y_0, Y_1, …]/(Y_i^p) (Exercise 9.4.1(3)); functoriality of the envelope for ring maps preserving J up to (J, p) (used for the Frobenius lift and for the G_K-action).

**Used by:** `PadicHodgeTheory:R06.1/plan/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/plan/frobenius-on-acris`, `PadicHodgeTheory:R06.1/plan/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/plan/crystalline-period-ring`, `PadicHodgeTheory:R06.1/plan/k-tensor-bcris-injective`, `PadicHodgeTheory:R06.1/plan/crystalline-logarithm`, `PadicHodgeTheory:R06.1/plan/acris-embedding-injective`, `PadicHodgeTheory:R06.1/plan/bcris-twisted-frobenius-sequences`, `PadicHodgeTheory:R06.1/plan/fundamental-exact-sequence`, `PadicHodgeTheory:R06.1/plan/semistable-period-ring`, `PadicHodgeTheory:R06.1/plan/bst-embedding-into-bdr`, `PadicHodgeTheory:R06.1/plan/log-p-flat-transcendental`, `PadicHodgeTheory:R06.1/plan/k-tensor-bst-injective`, `PadicHodgeTheory:R06.1/plan/crystalline-semistable-invariants`, `PadicHodgeTheory:R06.1/plan/period-ring-invariants`, `PadicHodgeTheory:R06.1/plan/arithmetic-and-perfectoid-constructions-agree`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8/horizontal-relative-periods`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:R06.2/plan/period-rings-are-regular`, `PadicHodgeTheory:R06.2/plan/period-functors`, `PadicHodgeTheory:R06.2/plan/admissible-representations`, `PadicHodgeTheory:R06.2/plan/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.2/plan/hodge-tate-graded-equivalence`, `PadicHodgeTheory:R06.2/plan/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/plan/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/plan/de-rham-base-change`, `PadicHodgeTheory:R06.2/plan/induction-and-restriction-of-scalars`, `PadicHodgeTheory:R06.2/rank-one-de-rham-crystalline-classification`, `PadicHodgeTheory:R06.2/plan/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.2/plan/crystalline-semistable-de-rham-implications`, `PadicHodgeTheory:R06.2/plan/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/plan/crystalline-semistable-base-change`, `PadicHodgeTheory:R06.2/plan/potentially-unramified-and-characters`, `PadicHodgeTheory:R06.2/plan/coefficient-field-base-change`, `PadicHodgeTheory:R06.2/plan/admissible-implies-weakly-admissible`, `PadicHodgeTheory:R06.2/plan/colmez-fontaine-bigness-criterion`, `PadicHodgeTheory:R06.2/weak-admissibility-is-admissibility`, `PadicHodgeTheory:R06.2/plan/hodge-tate-weight-convention`, `PadicHodgeTheory:P7/plan/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/plan/berger-robba-identification`, `PadicHodgeTheory:P7/plan/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7/plan/extended-localisation-maps`, `PadicHodgeTheory:P7/plan/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/plan/log-extended-period-rings`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, `PadicHodgeTheory:P7/plan/decompletion-operators`, `PadicHodgeTheory:P7/plan/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/plan/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/plan/berger-comparison-isomorphisms`, `PadicHodgeTheory:P7/plan/connection-on-robba-realisation`, `PadicHodgeTheory:P7/plan/unipotent-crystal`, `PadicHodgeTheory:P7/plan/semistability-criterion-unipotent-connection`, `PadicHodgeTheory:P7/plan/sen-module`, `PadicHodgeTheory:P7/plan/fontaine-dif-module`, `PadicHodgeTheory:P7/plan/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`, `PadicHodgeTheory:R06.3/plan/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:R06.3/plan/de-rham-differential-equation`, `PadicHodgeTheory:R06.3/plan/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/plan/weil-deligne-descent`, `PadicHodgeTheory:R06.3/plan/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/plan/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/plan/small-weight-admissibility`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/plan/ordinary-representation`, `PadicHodgeTheory:R06.4/plan/ordinary-implies-semistable`, `PadicHodgeTheory:R06.4/plan/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/weil-pairing-duality`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/kummer-representations-semistable`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/tate-curve-l-invariant`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.1/plan/bmax-period-ring`.

### Q44 — `ArithmeticGaloisRepresentations:R01.1`

Continuous p-adic representations of profinite groups on finite-dimensional Q_p- (and E-) vector spaces with restriction to open subgroups, induction Ind_{G_{F'}}^{G_F} with its topology and Frobenius reciprocity/Shapiro isomorphism for invariants, duals, tensor products, exterior powers and twists by characters.

**Used by:** `PadicHodgeTheory:R06.2/plan/period-functors`, `PadicHodgeTheory:R06.2/plan/induction-and-restriction-of-scalars`.

### Q45 — `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`

For finite Galois extensions of p-adic fields: the upper numbering ramification filtration and Herbrand's theorem (compatibility with quotients), the formula v_K(D_{L/K}) = ∫_{−1}^{∞}(1 − |G^v|^{-1})dv for the different in terms of upper ramification groups, and the relation between the different and the image of the trace (Tr(O_L) ⊇ m_K^{r} when v(D_{L/K}) is small). Tate's estimates for Z_p-extensions (Brinon–Conrad §13.1, Fontaine–Ouyang A.4) are planned in R06.1 on top of these.

**Used by:** `PadicHodgeTheory:R06.1/plan/tate-trace-almost-surjective`, `PadicHodgeTheory:R06.1/plan/tate-sen-axioms-cyclotomic`.

### Q46 — `ArithmeticGaloisRepresentations:R01.2`

Weil–Deligne representations (r, N) of W_K over a field Ω of characteristic 0 in the arithmetic normalisation r(w)Nr(w)^{−1} = q^{v'(w)}N (Deligne 8.4.1), with morphisms, ⊗, duals, determinant, the twist by the unramified character ω (ω(arithmetic Frobenius) = q), Frobenius-semisimplification and restriction to I_K (inertial type); the lemma (r, N) ≅ (r, aN) for a ∈ Ω^× (Deligne, proof of Lemme 8.4.3); and the ℓ-adic Weil–Deligne representations of Q_ℓ(1) and of V_ℓ(E_q) for a Tate curve (ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor, whose acceptance asks for this Tate-curve check).

**Used by:** `PadicHodgeTheory:R06.3/plan/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/plan/weil-deligne-descent`, `PadicHodgeTheory:R06.3/plan/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/plan/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.4/plan/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`.

### Q47 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`

Fontaine–Laffaille integral theory at e = 1 (Fontaine–Laffaille 1982): the categories MF, MF_tor^{f,p} (abelian, artinian) and strongly divisible lattices MF^{fd,p} (FL 7.7, 7.12); the ring S, its completion Ŝ with filtration and divided Frobenii (FL §2) and the inclusion Ŝ ⊂ A_cris with Fil^iŜ_K = Ŝ_K ∩ Fil^iB_dR; the functors U_S (torsion: Ext^1(M, S); lattices: Hom(M, Ŝ)) and U_{S_K}; Théorème 3.3 (exact, faithful, length-preserving on MF_tor^{f,p}); the simple objects M(h; i) and Théorème 5.3 (tame inertia χ_h^{i_0 + p i_1 + …}); Théorème 6.1 (MF_tor^{f,p'} and MF_tor^{f,p''} stable under extensions and subquotients, U_S fully faithful on each) and the lemma that objects with M^{p−1} = 0 lie in MF_tor^{f,p'}; Propositions 7.8 (strongly divisible lattices exist iff weakly admissible), 7.14, 7.15 and 7.17; §9 (finite flat groups over W(k), p odd or unipotent, ↔ MF_tor^{f,2}, J(Ā) = U_S). If provable there: essential surjectivity of U_S onto all G_K-stable lattices of crystalline representations with Hodge–Tate weights in [0, p−2].

**Used by:** `PadicHodgeTheory:R06.4/plan/small-weight-admissibility`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-crystalline-comparison`.

### Q48 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

Breuil–Kisin classification: (a) for every p including p = 2 and every finite K/Q_p, G ↦ T_p(G) is an equivalence from p-divisible groups over O_K to G_K-stable Z_p-lattices in crystalline representations with Hodge–Tate weights in {0, 1} (Breuil, Kisin; Kisin for connected groups and Kim, Lau, Liu for all groups at p = 2), with V_p(G) crystalline; (b) the integral theory beyond Fontaine–Laffaille needed for crystalline representations of G_{Q_p} with Hodge–Tate weights {0, p−1} (lattices with both weight-0 and weight-(p−1) constituents mod p) and {0, p} (modular weights p and p + 1): Kisin modules of the relevant height with the full faithfulness of restriction to G_{K_∞}, and the reductions used in Khare–Wintenberger I, Theorem 4.1 — each with its exact hypotheses on p, e and the weights.

**Used by:** `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`.

### Q49 — `AInfCohomology:AI.0:integral`

For O_C = 𝓞_ℂ_[p] and A_inf = W(O_C^♭): the element ε ∈ O_C^♭ attached to a compatible system of primitive p-power roots of unity and its change under a change of system (ε ↦ ε^a, a ∈ Z_p^×); μ = [ε] − 1 and ξ_ε = μ/φ^{−1}(μ) = Σ_{i<p} [ε^{1/p}]^i with μ = ξ_ε·φ^{−1}(μ); the O_C instance of PerfectoidSpaces P1's primitive-kernel theorem (w ∈ ker θ generates ker θ if and only if its Witt coordinate r_1 (index 1) is a unit, and a generator is not a zero-divisor); and the theorem that ξ_ε generates ker θ. AI.0:integral supplies these shared coefficients; R06.1 adds p^♭, [p^♭] − p and the Galois action. The AInfCohomology packet plans the first items as AInfCohomology:AI.0/cyclotomic-coefficients.

**Used by:** `PadicHodgeTheory:R06.1/plan/tilt-of-cp-and-special-elements`, `PadicHodgeTheory:R06.1/plan/de-rham-period-ring`, `PadicHodgeTheory:R06.1/plan/bdr-natural-topology`, `PadicHodgeTheory:R06.1/plan/fontaine-element-t`, `PadicHodgeTheory:R06.1/plan/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/plan/frobenius-on-acris`, `PadicHodgeTheory:R06.1/plan/arithmetic-and-perfectoid-constructions-agree`, `PadicHodgeTheory:R06.1/complete-algebraically-closed-bdr`, `PadicHodgeTheory:R06.1/plan/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/plan/de-rham-invariants`, `PadicHodgeTheory:R06.1/plan/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/plan/acris-embedding-injective`, `PadicHodgeTheory:R06.1/plan/crystalline-period-ring`, `PadicHodgeTheory:R06.1/plan/bcris-twisted-frobenius-sequences`, `PadicHodgeTheory:R06.1/plan/fundamental-exact-sequence`, `PadicHodgeTheory:R06.1/plan/bmax-period-ring`, `PadicHodgeTheory:R06.1/plan/k-tensor-bmax-injective`, `PadicHodgeTheory:R06.1/plan/k-tensor-bcris-injective`, `PadicHodgeTheory:R06.1/plan/crystalline-logarithm`, `PadicHodgeTheory:R06.1/plan/semistable-period-ring`, `PadicHodgeTheory:R06.1/plan/bst-embedding-into-bdr`, `PadicHodgeTheory:R06.1/plan/log-p-flat-transcendental`, `PadicHodgeTheory:R06.1/plan/k-tensor-bst-injective`, `PadicHodgeTheory:R06.1/plan/crystalline-semistable-invariants`, `PadicHodgeTheory:R06.1/plan/period-ring-invariants`, `PadicHodgeTheory:P8:local-rational/plan/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/graded-de-rham-period-sheaf-tate-twist`, `PadicHodgeTheory:P8:local-rational/plan/structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/faltings-extension`, `PadicHodgeTheory:P8:local-rational/plan/relative-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/plan/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/plan/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/plan/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/plan/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8/horizontal-relative-periods`, `PadicHodgeTheory:P8:local-rational/model-relative-log-pd-period-complex`, `PadicHodgeTheory:P8/plan/bdr-plus-local-systems-and-integrable-connections`, `PadicHodgeTheory:P8/plan/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/plan/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/plan/position-of-associated-local-system`, `PadicHodgeTheory:P8/plan/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/plan/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/plan/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:P8/de-rham-pair-derived-pushforward`, `PadicHodgeTheory:R06.2/plan/period-rings-are-regular`, `PadicHodgeTheory:R06.2/plan/period-functors`, `PadicHodgeTheory:R06.2/plan/admissible-representations`, `PadicHodgeTheory:R06.2/plan/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.2/plan/hodge-tate-graded-equivalence`, `PadicHodgeTheory:R06.2/plan/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/plan/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/plan/de-rham-base-change`, `PadicHodgeTheory:R06.2/plan/induction-and-restriction-of-scalars`, `PadicHodgeTheory:R06.2/rank-one-de-rham-crystalline-classification`, `PadicHodgeTheory:R06.2/plan/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.2/plan/crystalline-semistable-de-rham-implications`, `PadicHodgeTheory:R06.2/plan/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/plan/crystalline-semistable-base-change`, `PadicHodgeTheory:R06.2/plan/potentially-unramified-and-characters`, `PadicHodgeTheory:R06.2/plan/coefficient-field-base-change`, `PadicHodgeTheory:R06.2/plan/admissible-implies-weakly-admissible`, `PadicHodgeTheory:R06.2/plan/colmez-fontaine-bigness-criterion`, `PadicHodgeTheory:R06.2/weak-admissibility-is-admissibility`, `PadicHodgeTheory:R06.2/plan/hodge-tate-weight-convention`, `PadicHodgeTheory:P7/plan/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/plan/berger-robba-identification`, `PadicHodgeTheory:P7/plan/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7/plan/extended-localisation-maps`, `PadicHodgeTheory:P7/plan/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/plan/log-extended-period-rings`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, `PadicHodgeTheory:P7/plan/decompletion-operators`, `PadicHodgeTheory:P7/plan/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/plan/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/plan/berger-comparison-isomorphisms`, `PadicHodgeTheory:P7/plan/connection-on-robba-realisation`, `PadicHodgeTheory:P7/plan/unipotent-crystal`, `PadicHodgeTheory:P7/plan/semistability-criterion-unipotent-connection`, `PadicHodgeTheory:P7/plan/sen-module`, `PadicHodgeTheory:P7/plan/fontaine-dif-module`, `PadicHodgeTheory:P7/plan/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, `PadicHodgeTheory:P7/plan/integral-dcris-lattice`, `PadicHodgeTheory:P7/plan/wach-fontaine-laffaille-comparison`, `PadicHodgeTheory:R06.3/plan/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:R06.3/plan/de-rham-differential-equation`, `PadicHodgeTheory:R06.3/plan/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/plan/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/plan/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/plan/weil-deligne-descent`, `PadicHodgeTheory:R06.3/plan/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/plan/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/plan/small-weight-admissibility`, `PadicHodgeTheory:R06.4/plan/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/plan/ordinary-representation`, `PadicHodgeTheory:R06.4/plan/ordinary-implies-semistable`, `PadicHodgeTheory:R06.4/plan/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/plan/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/plan/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/plan/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/weil-pairing-duality`, `PadicHodgeTheory:R06.5/plan/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/plan/kummer-representations-semistable`, `PadicHodgeTheory:R06.6/plan/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/plan/tate-curve-l-invariant`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`.

### Q50 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

For K complete discretely valued (in particular K/Q_p finite) and q ∈ K^× with 0 < |q| < 1: the Tate curve E_q: y² + xy = x³ + a_4(q)x + a_6(q), with j(E_q) = 1/q + 744 + 196884q + ⋯ and split multiplicative reduction; the G_K-equivariant uniformisation K̄^×/q^Z ≅ E_q(K̄), compatible with finite extensions; Tate's theorem: for E/K with v(j(E)) < 0 there is a unique such q with j(E_q) = j(E), E ≅ E_q over K iff E has split multiplicative reduction, and otherwise E is the quadratic twist of E_q by a quadratic character that is unramified iff E has multiplicative reduction; E has potentially good reduction iff v(j(E)) ≥ 0.

**Used by:** `PadicHodgeTheory:R06.6/plan/tate-curve-tate-module`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`.

### Q51 — `ArithmeticGaloisRepresentations:R01.6`

For an abelian variety A over a field F of characteristic 0 (K/Q_p finite, or a number field) and any prime ℓ: T_ℓ(A) = lim A[ℓ^n](F̄) as a continuous Z_ℓ[G_F]-module, free of rank 2 dim A, and V_ℓ(A); the identification T_ℓ(A) = Hom_{Z_ℓ}(H^1_et(A_F̄, Z_ℓ), Z_ℓ); det V_ℓ(E) ≅ Q_ℓ(1) for elliptic curves (Weil pairing); for A with good reduction at v ∤ ℓ: V_ℓ(A) is unramified at v, det(X − Frob_v | V_ℓ(A)) (arithmetic Frobenius) is the characteristic polynomial P_v of the Frobenius endomorphism of the reduction, lies in Z[X] and is independent of ℓ, and smooth proper base change H^1_et(A_{F̄_v}, Q_ℓ) ≅ H^1_et(A_{v,k̄_v}, Q_ℓ) holds.

**Used by:** `PadicHodgeTheory:R06.6/plan/tate-curve-tate-module`, `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/plan/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/plan/weil-pairing-duality`.

### Q52 — `AbelianSchemesAndArithmeticModuli:A3`

The Weil pairing A[n] × A^∨[n] → μ_n of an abelian scheme: perfect, compatible in n and with base change (hence G_K-equivariant over a field); for a polarization λ, the induced alternating pairing on A[n] and T_p(A).

**Used by:** `PadicHodgeTheory:R06.5/plan/weil-pairing-duality`.

### Q53 — `AbelianSchemesAndArithmeticModuli:A4`

For an abelian scheme f: A → S of relative dimension g: relative H^1_dR(A/S) locally free of rank 2g with the Hodge exact sequence 0 → f_*Ω^1 → H^1_dR(A/S) → R^1f_*O_A → 0 (ranks g, 2g, g), f_*Ω^1 = Lie(A)^∨ and R^1f_*O_A ≅ Lie(A^∨), compatible with base change.

**Used by:** `PadicHodgeTheory:R06.5/plan/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`.

### Q54 — `NeronModelsAndSemistableAbelianVarieties:R11.1`

Néron models of abelian varieties over O_K; A has good reduction iff its Néron model is an abelian scheme iff A extends to an abelian scheme over O_K; for elliptic curves, agreement with Mathlib's HasGoodReduction of a minimal Weierstrass equation.

**Used by:** `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`.

### Q55 — `NeronModelsAndSemistableAbelianVarieties:R11.3`

(i) Grothendieck's criterion for ℓ = p (SGA 7 IX Theorem 5.13, as in Brinon–Conrad Theorem 7.1.13): A/K has good reduction iff A[p^∞] extends to a p-divisible group over O_K; (ii) the semistable reduction theorem (after a finite extension); (iii) Raynaud's uniformisation for semistable A, with the G_K-equivariant exact sequences 0 → G[p^n](K̄) → A[p^n](K̄) → Γ/p^nΓ → 0 and 0 → T[p^n](K̄) → G[p^n](K̄) → B[p^n](K̄) → 0, compatible in n (T a torus split by an unramified extension, B with good reduction, Γ a lattice with unramified action).

**Used by:** `PadicHodgeTheory:R06.6/plan/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/plan/semistable-reduction-semistable`.

### Q56 — `ClassicalAdicEtaleCohomology:H5`

For X proper smooth over K (K/Q_p finite; not only curves): Huber's comparison H^i_et(X_K̄, Z/p^n) ≅ H^i_et(X^ad_C, Z/p^n) (Hub96 3.7.2/3.8.1), G_K-equivariant and compatible with cup products, so that the algebraic étale cohomology is the one compared in CohomologyComparisons CP.2–CP.4 and PadicHodgeTheory P8.

**Used by:** `PadicHodgeTheory:R06.5/plan/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/plan/abelian-variety-hodge-tate-weights`.

### Q57 — `ArithmeticGaloisDuality:R02.1`

Continuous cohomology of G_K with coefficients Z_p(1), Q_p(1) and the Kummer isomorphism lim K^×/(K^×)^{p^n} ≅ H^1(G_K, Z_p(1)) (hence Q_p ⊗ K̂^× ≅ H^1(G_K, Q_p(1))), with the explicit cocycle g ↦ c_q(g); Ext^1(Q_p, Q_p(1)) in continuous representations ≅ H^1(G_K, Q_p(1)).

**Used by:** `PadicHodgeTheory:R06.6/plan/kummer-representation`, `PadicHodgeTheory:R06.6/plan/kummer-representations-semistable`, `PadicHodgeTheory:R06.6/plan/tate-curve-l-invariant`.

### Q58 — `AInfCohomology:AI.2`

Part II interface in the shared tier-13 bundle: the minimal untilt two-period patching of KL Definitions 8.9.4 and Theorem 8.9.6, pp.187–188. Construct the complement ring R_1, completed ring R_2=ker θ-adic completion of R̃_R^{int,1}; the completed ring has p invertible through its untilt quotient, and R_3=R_2[1/z]; prove finite-projective triple descent and the difference complex for flat coefficients. This extends the bundle’s existing RF4 patching move and does not import a higher relative-curve roadmap.

**Used by:** `PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison`.

### Q59 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Supply the exact interface used in Locally algebraic coefficient characters: Use the restriction-of-scalars tori and the local reciprocity map from ClassFieldTheory. Over a splitting field classify torus morphisms by integer exponents. Descend exponents along the factor decomposition of E⊗K; compute weights with Lubin–Tate characters and tensor products.

**Used by:** `PadicHodgeTheory:R06.2/locally-algebraic-coefficient-characters`.

### Q60 — `EnhancedDerivedSheaves:E0`

Supply the exact interface used in Filtered derived completion for period comparisons: Import the sequence and localization formalism from EnhancedDerivedSheaves. Identify gr by the displayed cone orientation. Degeneration kills the boundary maps in the long exact sequences and hence proves injectivity. Compare successive finite quotients by induction on the filtration interval, using Cone(F^k→F^j) for j≤k. Pass to inverse limits only after checking the R^1lim condition or using derived completion.

**Used by:** `PadicHodgeTheory:P8/filtered-derived-period-interface`.

### Q61 — `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

The integral Kisin, (φ,Ĝ) and Wach classifications in the common unramified crystalline weight interval {0,…,r}; include R̂, the natural inclusions into T^∨⊗W(R), and I^[1]-saturation of B_cris^+∩a^{-1}W(R) for a a generator of I^[1], as used in Liu Lemma 3.1.3.

**Used by:** `PadicHodgeTheory:P7/wach-kisin-lattice-comparison`.

### Q62 — `EnhancedDerivedSheaves:E0`

Bounded dg enhancement of a specified small abelian category, idempotent completion, Ind and its compact-object theorem, with finite-unramified scalar extension preserving the enhanced localization.

**Used by:** `PadicHodgeTheory:R06.2/enhanced-finite-frobenius-monodromy-coefficients`.

### Q63 — `AInfCohomology:AI.2`

In the common bundle, the minimal untilt-patching rings and finite-projective triple equivalence of KL Definition 8.9.4/Theorem 8.9.6, with exact identification of θ-adic rational and integral-radius completions.

**Used by:** `PadicHodgeTheory:P8/relative-two-period-pairs`.

## Resume after review

Review the full main packet and reader, then resolve each G/Q entry at its stated owner and generality. Update R07 and higher consumer references under their own authorized jobs. A packaging pass must translate external interfaces into accepted lower-tier packages or current TauCetiRoadmap layers and preserve the same filtered maps, completions and normalizations. Keep the 151-line suggested file compact: mathematical specifications whose carriers are absent at the pins stay in the reader. This run takes no second job; its scratch files are disposable because every continuing obligation, source locator and predecessor mapping is preserved above and in the packet.
