# Handoff: BP-GL2AutomorphicRepresentationsAndTransfer--R16.1

Job #733, completed target-level pass by Codex, session `codex-CT9yBM`, 7 October 2026. The claim was confirmed by the swarm bot. This run takes no second job. Branch: `codex-CT9yBM-gl2-blueprint`.

## Deliverables and coverage

The packet, reader and suggested signature file share the stem `GL2AutomorphicRepresentationsAndTransfer--R16.1`. The packet has status `complete`, meaning a complete target-level planning pass, and goes to independent review. Every implementation status is `unchecked`. No stage is closed.

| Stage | Status | Nodes |
| --- | --- | --- |
| R16.1 | planned | 6 |
| R16.2 | planned | 12 |
| R16.3 | planned | 9 |
| R16.4 | planned | 6 |
| R16.5 | planned | 4 |
| R16.6 | planned | 6 |
| R17.1 | planned | 5 |
| R17.2 | planned | 6 |

There are 54 nodes: 5 definitions, 7 constructions, 37 theorems, 4 comparisons and 1 application. The twelve definitions/constructions have 47 API items and 37 discriminating tests, with uses recorded before API design. There are 42 planets, at most six per stage, and 17 pinned baseline declarations. The reader includes the exact statements, hypotheses, proof/construction steps, direct prerequisites, source locators, APIs, tests and acceptance conditions. Node identifiers are stable within this part. The existing reviewed R17.3 part supplies other scopes; it is not overwritten.

The extension parent is the upstream ModularForms roadmap, with the exact Part II title. Classical forms, primitive newspace, coefficient fields, symmetric powers and L-functions remain imports. SR/AF/AL/AS/ET own the generic carriers and theorems. The plan supplies rank-two comparisons rather than replacement representation or automorphic structures.

## Mathematical decisions to preserve

- Use lower-left K₀ and last-row K₁. At level zero both are the full integral matrix group. Transport Casselman’s printed top-left ω(a) line through the contragredient/determinant twist to obtain ω(d); do not silently identify these conventions.
- Use normalized induction with δ_B^{1/2}. Include one-dimensional constituents in the classification, but require infinite-dimensionality in the oldform/newvector assertions. Correct CG20’s printed “not trivial” hypothesis: a nontrivial unramified determinant character is a counterexample.
- Fix geometric Artin reciprocity, ν(Φ)=q⁻¹, and the rank-two Tate half-twist. The Steinberg parameter has Ne₂=e₁ and r(Φ)=diag(αq⁻¹ᐟ²,αq¹ᐟ²). Preserve N in every local factor/conductor and ramified comparison. Do not describe all dyadic supercuspidals as quadratic inductions.
- Include the full O(2) archimedean module, real limit boundary, complex places and Γℂ’s factor 2. Weight-one primitive forms use D₁(0), parameter 1⊕sgn and Casimir −1/4; they do not use a negative symmetric power or the regular algebraic coefficient-field theorem.
- Put the global Whittaker expansion in R16.4 before multiplicity. Strong multiplicity requires all finite places outside one finite set and recovers infinity via the requested Rankin–Selberg pole criterion. The pinned classical result alone has insufficient generality.
- Compare coefficient fields using π_alg=π_unitary⊗|det|^{−(k−2)/2}, with spherical T₁ eigenvalue a_p. State the Galois arithmetic/geometric Frobenius and dual conversion explicitly. R19 must match its nebentypus and ramified WD data.
- Keep the full CDT Θ(θ) compact type, its chosen stable coefficient lattice and its selector restriction distinct. The multiplicity-one test concerns the full Θ-type. Preserve Henniart typicality and the fixed-central-character restriction in supercuspidal projectivity.
- Normalize the Iwahori and spherical idempotents separately. The center uses U₀^{±1} and U₁+qU₀U₁⁻¹; spherical projection requires q+1 invertible as well as q. The BCGP rank-two symbol correction is recorded.
- The explicit Steinberg function is e_H^ξ−e_K^χ with compact-mod-center support, quotient volumes and ξ(a)=(-1)^{v(a)}χ(a). It has Steinberg trace 1 and matching determinant-character trace −1. Retain that residual correction. A trace-zero assertion is weaker than operator vanishing.
- Ordinary quaternionic orbital matching has the rank-two minus sign and common elliptic-centralizer measure. Cyclic spherical transfer satisfies b(h)(α,β)=h(α^d,β^d), and central characters pull back by the norm. Split places use the product norm and convolution.
- Only the all-x,y cuspidal constant-term condition supplies the stated induced-operator vanishing. JL’s averaged Steinberg condition is not substituted for it. Identity, unipotent, continuous, residual and quadratic exceptional trace terms remain explicit in the ledger.

## Precisely what remains

The packet has seven gaps, each with affected node IDs; each stage’s `remaining` list also names its applicable supplier contracts. An independent review checks the complete pass. Follow-up work resolves:

1. **Archimedean supplier signatures.** Obtain the complete AF.1/AF.1b real/complex classification, chambers, finite-dimensional/limit boundary, globalization and factor interfaces. Current AF.1 has fragments; proposed AF.1b is not an installed stage.
2. **Actual supplier carriers in the signature file.** Replace the explicit parameters by SR/AF/AL/AS/ET smooth classes, analytic functions, quotient measures, LLC and trace-distribution carriers and their mathematical conditions. The provisional statements are not assertions for arbitrary parameters/functions.
3. **Full newvector/ramified interfaces.** Finish the precise top-left-to-last-row translation and modern Whittaker evaluation contract. Match primitive ramified U_p factors using upstream Layer 4, beyond fields in the pinned Newform bundle. Keep the CDT full type and selector separate.
4. **Primitive wild dyadic example.** Verify a genuinely primitive dyadic rank-two parameter, its Swan/Artin conductor and standard L=1, and its quaternionic matching function. The tame quadratic examples do not meet this acceptance test.
5. **R19 normalization handoff.** Match the Galois representation with determinant εχ_cyc^{k−1} to the explicit arithmetic/geometric Frobenius, nebentypus and dual convention; establish the consumer’s ramified WD compatibility with N retained. This is a downstream requirement, not a prerequisite returning from R19.
6. **Complete trace-term calculations.** Specialize the full AS.6/ET.4 singular, identity, unipotent, continuous intertwining-derivative and quadratic exceptional terms. Compute residual/norm-character corrections and half-Weyl weights with the measures used here. JL §16 and Langlands §10 explicitly provide analytically incomplete sketches; they do not close this calculation.
7. **Full coefficient/signature types.** Supply the actual Hilbert tensor representation, primitive subtypes, Weil induction, coefficient lattices, compact-mod-center support/volumes and orbital integrals. The suggested file exposes their unavailable conditions beside algebraic prototypes.

No stage should be changed to `closed` until its listed gaps and contracts are discharged. R17.3/R17.4 consume the distribution equality; R18/R19 consume characteristic-zero newvector/multiplicity and algebraic-weight comparisons. Integral torsion, Galois existence and global auxiliary-level arguments remain with those owners.

## Supplier requests and ownership fixes

There are 29 requests, recorded in the packet with exact needs and affected nodes:

- RG2.4: local/adelic compact and Iwasawa/Cartan comparisons.
- R01.1: characteristic-zero coefficient extensions and stable lattices.
- AA.2: central-character quotient integration and measures.
- SR.0 fixed-character abelian category; SR.1 convolution/idempotents; SR.2 normalized induction and induced kernels; SR.3 admissibility/types; SR.4 Satake/Bernstein; SR.5 Whittaker/Kirillov/newvector and L/ℚp scalar-extension/Γ descent.
- AF.1: the proposed AF.1b archimedean contract; AF.2: existing automorphic/cuspidal classes and twists; AF.4: cohomological weights and coefficient-dual conventions.
- AL.1: character factors and discriminant/measure conventions; AL.2: local standard factors and ramified test vectors; AL.3: general global Whittaker expansion, full twisted analytic conditions and strong-multiplicity pole criterion.
- AS.4: smooth/Hilbert cusp decomposition and residual determinant characters; AS.5: intertwining spectral data; AS.6: every invariant trace distribution and continuous/residual correction.
- ET.1: transfer normalization; ET.3: local functions/fundamental lemma and centralizer measures; ET.4: cyclic twisted spectral comparison; ET.6: all-field local LLC/JL, type/segment and wild/dyadic compatibility.
- Upstream QuadraticFormInvariants Layers 2 and 6d; ClassFieldTheory Layers 7 and 14; ModularForms Layers 4, 7 and 8. These remain upstream imports, not newly planned nodes.

The packet has three restructure proposals implementing the scoped verified RT-AREA-automorphic-1 findings 2, 9 and 14: request archimedean theory through current AF.1 with the AF.1b split, put the expansion in R16.4 before multiplicity, and assign Schwartz–Bruhat solely to AL.0. Restricted Haar products, adelic points and quotient measures retain AA.0/AA.1/AA.2 respectively. The latest RS-21 correction is still an external workflow; this run changes none of its files. No uninstalled AF.1b ID is used as a prerequisite and no geometric-consumer back edge is introduced.

## Sources and corrections

The packet records 18 public sources, exact versions, dates and SHA-256 digests; the reader lists every section range read. Core passages are JL §§2–3, 5–6, 10–11 and 15–16; Casselman’s printed pp. 301–308; Newton–Thorne §§1.2 and 2; Henniart’s appendix; CDT §§4.2 and 5.1; Dospinescu–Le Bras §§5 and 12; CG18 §3.9.2; CG20 §1.3; BCGP §§2.4.14–15; HKP §4.6; AKY §1.2; CDN20 §5.2.1; CDN23 §§4.1.2–3; Pan §§5.4.11 and 5.5.5; Cogdell §§2–3; Langlands §§4, 10–11; Arthur–Clozel Chapter 1 §§3–4; Getz’s 2015 notes §§6.4–6.5. Casselman’s scan has no useful extracted text; its relevant pages were read as images.

The four source issues E12–E15 preserve prior independently confirmed corrections: Newton–Thorne’s induction indices, CG20’s infinite-dimensional hypothesis, the BCGP GL₂ symbol, and the Casimir in Getz’s 2015 notes. Their source versions and provenance are explicit; no review of this packet is supplied by its author. The reader routes each added paper’s outside-scope geometric or global results to its existing consumer rather than replanning them.

No cited source is inaccessible. Missing mathematical evidence is the worked primitive dyadic parameter/matching example and the complete analytic term-by-term specialization recorded above; complete modern supplier signatures remain outstanding. Downloads and extracted text are scratch materials, not deliverables, and are deleted after submission.

## Validation and Lean limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2AutomorphicRepresentationsAndTransfer--R16.1.json`: 0 errors, 0 warnings, all eight stages planned, none closed.
- Source-issue schema/version checks pass. All 54 node names, 47 API names and 37 test names occur in both reader and suggested file. Every definition/construction has its API, at least three tests and recorded uses. A separate dependency traversal finds no internal cycle. Planets respect the six-per-stage bound.
- `lean-check research/blueprint/suggested/GL2AutomorphicRepresentationsAndTransfer--R16.1.lean`: exit 0, with 138 warnings solely for the intended proof placeholders. Memory was checked before each invocation and exceeded the required 20 GB available. No build/update/cache command or language server was used; no compilation is left running.
- The shared build’s Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The pinned Tau Ceti declarations were read at `f790474821cf4256814db967cb154e7af3d0c369`; the cited source files also agree in the available shared source tree. That shared Tau Ceti checkout is newer, and compiled Newform/SymmetricPower modules are unavailable. The companion therefore compiles using pinned Mathlib only and explicit parameters for those existing Tau Ceti carriers/operations. It is not a validation against compiled pinned Tau Ceti imports.
- The available open Mathlib PR search and Zulip archive search found no relevant smooth-GL₂/Whittaker/newvector interface to replace the supplier contracts. This was a scoped search, not an exhaustive assertion about all development.

The four deliverables are self-contained. Resume from the seven gaps and the packet’s node-specific acceptance properties after independent review; no scratch path or private source library is needed.
