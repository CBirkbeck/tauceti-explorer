# Independent review: p-adic local Langlands for GL₂(ℚ_p)

Refs #467. Codex, session `codex-NduUhl`, 19 October 2026. Reviewed the
blueprint written by Claude in session `claude-oQ7sqq`; this reviewer did not
write that submission.

**Verdict: accepted as a complete target-level pass with explicit gaps.** All
60 original nodes were checked against their cited passages, supplier
statements, API, checks and proof routes. Thirteen are verified unchanged,
47 are corrected, and five justified key targets are added. The packet's
`review.checked` records a verdict and reason for each of the resulting 65
nodes. There are no unverifiable verdicts. All six stages are planned; none is
closed. Acceptance does not establish the missing proofs in G1–G18.

| Inventory | Before | After |
| --- | ---: | ---: |
| Nodes | 60 | 65 |
| Definitions / constructions / comparisons / theorems | 14 / 11 / 3 / 32 | 14 / 11 / 3 / 37 |
| API items | 170 | 167 |
| Definition and construction checks | 100 | 102 |
| Planets | 26 | 26 |
| Pinned baseline declarations | 17 | 14 |
| Source catalogue entries | 26 | 26 |
| Supplier requests | 11 | 12 |
| Explicit gaps | 4 | 18 |
| Confirmed source issues | unreviewed: 4 | 9 |

## Corrections by mathematical topic

- **R30.1, coefficients and conventions.** Separate the integral, rational
  and torsion residue pairings, and use the corresponding coefficient ring
  in the free rank-two wedge identity (Colmez §I.2.2–I.2.3, pp.31–32).
  The abstract ψ-module construction requires continuous surjective ψ;
  restrictions require compatible φ, and inverse-limit action formulas use
  sufficiently large coordinates (§I.3.3, pp.35–36). Distinguish generalized
  Hodge–Tate weights from integral de Rham weights in the trianguline API.
  For the irreducible cases of Colmez's classical list,
  `rec(LL(M)) = M^{F-ss} ⊗ ν^{−1/2}` and
  `recᵀ(LL(M)) = M^{F-ss} ⊗ ν^{−1}`. His nonsplit Weil self-extension is
  permitted; its unipotent Frobenius is lost only in the classical
  comparison. Monodromy is retained (Colmez §VI.6.11, p.192; supplier
  R16.3/tate-unitary-normalization).
- **R30.2, categories and exceptional representations.** Finite length is
  over O[G], not O. At unrestricted torsion level admissibility tests
  `π^H[ϖ^n]`; fixed-level finite generation is not the general definition.
  Local admissibility versus local finite length and injective envelopes
  require the GL₂(ℚ_p) theorem, rather than only a Grothendieck category
  (Paškūnas 2013 §2, pp.14–15). Replace the unsupported general completion
  existence equivalence by the specified lattice construction and record
  the coherent-lattice input (Colmez–Dospinescu Proposition 0.6 and
  Theorem 0.7, pp.5–6). Correct both exceptional mod-p extension orders:
  r=0 has Steinberg subobject and character quotient; r=p−1 has the reverse
  order (Kisin (1.2.2), published p.648). Restore the full BCDT normaliser,
  its generator with square −ℓ and its central parameter (§1.3, pp.10–12).
  Correct the coefficient field in the counterexample beyond ℚ_p.
- **R30.3, the construction and its proofs.** Standardness is a condition on
  the chosen presentation, not on every choice of generator. Distinguish
  quotient-category equivalence from an actual representation isomorphism.
  Restore saturation in the integral natural submodule and distinguish
  torsion, compact integral and closed rational topologies. Family stability
  concerns the unsaturated construction and integral coefficient-valued
  points; it does not assert arbitrary fibrewise saturation. Remove the
  unsupported Ext isomorphism. Neither exactness nor a dense set of
  characteristic-zero points proves irreducibility or equality of
  nonreduced deformation rings. The packet now names the missing density,
  Schur, infinitesimal-character and schematic-comparison inputs.
- **R30.4, algebraic and analytic vectors.** The admissible-filtration locus
  may be empty. Restrict the Jacquet-module trichotomy and supersingular
  algebraic-vector conclusion to nonzero algebraic vectors (Colmez
  Theorem 0.20, p.17; VI.6.50–VI.6.51, pp.192–193). State Colmez's theorem
  in his convention; the inconsistent printed Emerton weight conversion
  remains G4/E3, not an asserted identification. Berger–Breuil's theorem
  retains absolute irreducibility, φ-semisimplicity and the modified
  exceptional model, without an additional odd-prime restriction. Preserve
  Kisin's separate odd-prime hypotheses. Separate type uniqueness for p>2
  from dyadic choice-independence of reduced multiplicities. Clarify that
  supersingular Banach means nonordinary, not supersingular residual
  reduction, and retain the Tate-dual convention in the extension theorem.
- **R30.5, blocks and rings.** For E=End(P), Hom(P,−) is a right E-module,
  P is a left E-module and End(J)=Eᵒᵖ. Distinguish the finite-length
  category from its locally finite completion. Use degree-two determinant
  laws at p=2, rather than a trace-only substitute. The local central
  identity applies to all objects. The deformation-comparison hypothesis
  excludes finite-dimensional subobjects and quotients; it does not exclude
  every finite-dimensional subquotient (Emerton Theorem 3.3.2, p.24).
  Crystalline schematic closure is not the set of crystabelline points.
  Restore the coefficient and finiteness assumptions, the crystalline
  exception and the distinction between support and quotient-ring results
  in Paškūnas's criterion. Projectivity after restriction to K requires
  Theorem 2.44 and its hypotheses. CDN's block determines residual
  semisimplification, not a selected nonsplit lattice extension; retain
  empty loci and the finite-L-algebra universal property. Spell out every
  BCDT admittance case and expose the additional extended-type comparison.
- **R30.5–R30.6, determinants and applications.** Use det=ψε consistently,
  with ψ on inertia equal to ε^{a+b−1}det τ. For nonzero type rings the
  framed absolute/generic/special dimensions are 5/4/4; the unframed values
  are 2/1/1 under scalar endomorphisms. Zero rings remain possible. Retain
  the fixed-determinant dyadic gap: the supplier's p∤n splitting does not
  apply to n=p=2. Restore Kisin's residual exclusion and corrected scalar
  multiplicities 1/2/4 (Gee–Kisin Appendix B.1, p.38), together with B.1's
  smoothness exceptions and B.2's additional Galois line. Separate the
  dyadic extension argument from Dospinescu's p≥5 theorem. Treat global
  patched support conditionally on its actual setup and record the missing
  globalisation inputs. Remove the incompletely stated global modularity
  theorem from this local roadmap. A compact specialised module becomes a
  Banach representation only after the appropriate continuous dual.

## Five added key targets

Each carries `addedBy: REV-PadicLocalLanglandsForGL2Qp`, sources, hypotheses,
acceptance checks and direct prerequisites. Their remaining proof inputs
are recorded, rather than hidden in a sketch.

| Node suffix | Source and purpose |
| --- | --- |
| R30.2/locally-admissible-finite-length | Paškūnas 2013 §2, pp.14–15; isolates finite-length and locally admissible envelope theorems. |
| R30.3/family-stability | Colmez Proposition II.2.15, pp.60–61, Theorem II.3.3 and Lemma II.3.6, pp.63–64; separates integral family stability and specialisation. |
| R30.3/fontaine-heart-weyl | Colmez Proposition V.2.1, p.125; isolates the Weyl map between Fontaine hearts, with analytic comparison G10. |
| R30.4/artinian-de-rham-criterion | CDN–Kisin Theorem 4.1, pp.13–15 and §4.2, pp.16–17; supplies the all-prime Artinian target used by the Kisin-ring construction. |
| R30.4/analytic-quotient-filtration-independent | Colmez VI.6.41–VI.6.44, pp.189–190; specifies the common analytic quotient, the two algebraic copies in the nonspecial case, and the special-case boundary. |

## Baseline, upstream reuse and ownership

Read all 17 original declaration statements at Mathlib `082e2d37` and
Tau Ceti `f7904748`. Remove `mathlib:PontryaginDual`: its Circle-valued
dual is not Hom_O(−,L/O). Remove `TauCeti.IsInjectiveEnvelope` and
`TauCeti.IsProjectiveCover`: ordinary module envelopes do not provide
envelopes in these representation categories. The 14 retained entries are
confirmed; their modules and checked locations are recorded in `baseline`.
Narrow `TopRep` to continuous endomorphisms, without inferring joint
continuity. Narrow `AbstractMeasure.amiceTransformEquiv` to its Zp-linear
statement, leaving O_L coefficients, convolution and affine compatibility
as G5.

Read the reviewed library audit and current upstream near this area,
including LocalGaloisGroups, ProfiniteArithmetic, OperatorTheory and
SmoothRepresentationsOfLocalGroups, at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`. Read current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reuse its compact-coefficient
completed group algebra, compact modules and categorical essential
mono/epi predicates; distinguish these newer APIs from the pinned
baseline. Do not plan their carriers again. The PMIA request now asks only
for compact Nakayama and inverse-system results. Selmer–Iwasawa's underlying
p-primary duality needs the O_L-linear adapter. Supplier reads also checked
the precise R16 normalisation and type contracts, R07 Serre-weight/Hecke
objects, R08 fixed-determinant hypotheses, IHG determinant laws and the
analytic and patching contracts.

RT-AREA-automorphic-1/17 is preserved: ND.6 owns the general admissible
Banach category and its requested compact-open independence theorem;
R30.2 specialises it, and CC.2/CC.5 should import it. R30 creates no second
general category. Global completed-cohomology and modularity-lifting
inputs remain explicit gaps or named hypotheses, avoiding upward cycles.
No upstream or consumer file was edited.

## Sources and source issues

Read every cited node locator in the 26 public sources. Replace Kisin's
partly garbled DVI by the published Harvard DASH PDF, with printed pages
and a new hash. Also collate the relevant published Colmez, Paškūnas and
Nakamura passages. The source catalogue and `sourceVersions` identify the
texts read. No source passage is copied into this submission.

All nine findings have independent `confirmed` verdicts:

- E1: the inequality/equality misprint is confined to the Paškūnas preprint;
  the published Theorem 2.37, p.1329, corrects it.
- E2: the missing ε in the determinant condition persists in the published
  Paškūnas §2.C, pp.1325–1326.
- E3: Emerton Theorem 3.3.22, p.28, and §7.4, pp.96–98, have different
  determinant exponents. Confirm the inconsistency, without choosing an
  unproved convention dictionary; G4 bounds its use.
- E4: CDP's reference to Emerton 3.2.22 should be 3.3.22. The publisher
  denied access; the finding is explicitly scoped to arXiv v1, p.2.
- E5–E6: the exceptional extension orientations in Colmez III.3.2
  (published p.359) and CDN–Kisin Remark 1.1 (arXiv v2, p.4) conflict with
  Kisin (1.2.2), p.648, which gives the correct sequences.
- E7: Nakamura B.18 says subquotients where Emerton's original excludes
  subobjects and quotients. This persists in the published p.279.
- E8–E9: Gee–Kisin Appendix B.1–B.2, p.38, corrects Kisin's multiplicities,
  formal smoothness claim, exception list and missing Galois line. These
  are known corrections, not new discoveries.

## Validation and remaining orchestration

The indexed packet validator reports **0 errors and 0 warnings**:

`python3 scripts/check_blueprint.py research/blueprint/packets/PadicLocalLanglandsForGL2Qp.json --index <pinned declaration index>`

`lean-check research/blueprint/suggested/PadicLocalLanglandsForGL2Qp.lean`
elaborates at the pins with **20 declaration-uses-sorry warnings and no
other warning**. The 382-line file corrects group-algebra length, the
norm-character documentation and the smooth twisting hypothesis. Its
closing inventory now agrees with all 65 targets. It contains no sorry'd
data definition. The reader was brought into agreement with every target,
hypothesis, API, check, source, request and gap. Source-issue/version schema
checks, review coverage and `git diff --check` pass.

The orchestrator should use G1–G18 and the coverage lists for follow-ups.
In particular: settle the Emerton dictionary; supply the dyadic
fixed-determinant and inertial-type contracts; close the analytic,
representation-category and schematic-comparison inputs; and decide how
to expose the global inputs without tier cycles. Repoint the consumers
listed in the handoff only when their own jobs permit edits. No further
work is required for this review job.
