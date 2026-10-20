# Independent package review: PadicHodgeRegulators

Issue #11419 · `REV-PKG-PadicHodgeRegulators~codex1` · 2026-10-20.
Reviewer: Codex (GPT-6), session `codex-nJC1mZ`.
Verdict: **needs_changes** after the corrections below.

This is a completed independent review, not a checkpoint. The package was written
by session `codex-CBsHyc` for #11377 and merged through #11418. I did not write
that package or its design revisions. The issue template's earlier review report
and review.json were absent; its final instruction correctly identifies the new
package and controls this review. The unrelated Mordell title in that template
was not treated as the subject.

All 132 input target families have a corresponding specification or detailed
supplier contract. The seven light Lean definitions have real bodies; the final
Lean check exits 0 with eleven `sorry` warnings and no other diagnostics. Those
facts do not establish prerequisite closure or fix a convention comparison.
Several advertised external producers do not exist, and two normalization/range
obligations remain unresolved. The package is therefore not ready for a
TauCetiRoadmap draft PR.

## Remaining defects

| ID | Location and missing result | What must be supplied before acceptance |
|---|---|---|
| R1 | Exact supplier contracts; the rigid-syntomic, log-syntomic, period-map and divided-comparison supplier subsections; §§4.2,4.6,7.7,7.10 | An earlier **classical** syntomic producer with actual target sections: log-crystalline divided-power ideals and their divided Frobenius domains, the divided and undivided fibres and comparison arrows, the multiplicative Fontaine–Messing map, the modified Tate lattice, small-weight exactness versus bounded integral errors, and the Hyodo–Kato/semistable extension complex. CohomologyComparisons §§4.1–4.3 are proper semistable period adapters. They do not plan these constructions; CohomologyComparisons Part II has no package/packet/current upstream roadmap. A routing anchor and the detailed requests printed here cannot replace that producer. |
| R2 | §§7.8–7.9 and the relative-coefficient supplier clause | An earlier producer for relative **open-curve** rigid/de Rham comparison, filtered Frobenius modules with connection and their Ext category, residues/tame-kernel exactness, and Frobenius-compatible relative syntomic evaluation. CohomologyComparisons §6.3 concerns proper smooth prismatic coefficients. It does not provide the AM2022 Fil-F-MIC/Ext interfaces under the open/compactification hypotheses used here. Preserve AM's coherence and truncated-complex assumptions; changing the domain to all proper K₂ or all evaluation points would not repair this. |
| R3 | §§7.7,7.10–7.11; ColemanIntegration Part II request | An earlier integration producer with harmonic gluing on semistable wide opens, Vologodsky primitives with branch and trace laws, global triple indices, annular double indices, and the orientation/cup-product comparisons used in the regulator formula. The proposed Part II does not exist. Current ColemanIntegration Layers 0–3 and its §§L3.14–L3.15 do not supply these operations. The restored arbitrary-reduction theorem also requires finite semistable-extension descent for the period and integration comparisons. The explicit split-model formula is not a replacement for that theorem. |
| R4 | §§1.10,2.4,8.13–8.14,8.18,8.21 | Complete `fontaineIwasawaEquiv_kummer` and `regulatorNormalizationComparison` with a determined sign and ordered pairing constants. CC99 Proposition V.3.2's proof uses a (1−τ) period lift; the package fixes Kummer as τ(α)/α and the period boundary as (g−1)b. The text still leaves `kummerColemanSign` in {−1,1}, and the Fontaine integral boundary comparison also retains ±. LZ formulas are correct in the transported source convention, but their transport to these declared conventions has not been specified by a proved comparison or a decisive nonzero witness. This is a convention gap, not a claim that CC99 has a source error. The new f₆ checks below distinguish the two signs once that comparison is made. |
| R5 | §9.29, `integralWachLowerInclusion` | A source-supported integral convergence/coefficient-descent argument for the actual modular lattice in every range claimed beyond LLZWach2010 Proposition 4.11. That proposition assumes (C),(D), including p≥k−1 and the stated slope condition, and its displayed assertion is rational and one-coordinate. LLZ2011 Theorem 5.10 explicitly appeals to its proof integrally. The package honestly makes the stronger lower inclusion a separate assumption/additional target, but has not given the wider proof route. Keep that obligation; neither imposing p≥k−1 as the general theorem nor inferring it from rational surjectivity closes it. |

These defects require substantive supplier planning or comparison work. I did
not create or alter another roadmap's packet under a package-review claim.
The README now explicitly marks R1–R3 as missing inputs and preserves the
normalization and integral-range qualifications in R4–R5.

## Corrections applied

- **Ordinary Chern classes versus descent edges.** The Soulé supplier no longer
  calls the ordinary completed Chern map an integral isomorphism in every
  weight. It distinguishes the all-weight étale descent edge from Chern
  normalization, retains the weight-two Chern isomorphism needed for K₃, and
  requires the factorial comparison in other weights. Weibel's Proposition 5.1,
  p.24 gives a useful independent negative control: over F₃ the mod-2 K₅ and
  H¹(F₃,ℤ/2(3)) each have order two, but c₃ vanishes because of the factor 2.
  This does not weaken the general regulator construction.
- **Degree zero.** §4.1's additive higher Chern maps now have i,j≥1. Degree-zero
  ordinary Chern classes obey Whitney sum; the total Chern series is
  multiplicative. On ℙ², c₂(𝒪(1)⊕𝒪(1))=h² although each summand's c₂ is zero.
  Rank and the zero weight in positive K-degree are recorded separately.
- **Supplier names that resolve.** Replaced nonexistent MotivicEtaleCohomology
  by MotivicEtaleKTheory §12.1's finite Chern operations and
  KTheoryFiniteLocalFields §§1.8,6.6–6.7's finite/completed comparisons.
  Replaced nonexistent ColemanIntegration Layer 8 by its actual §§L3.14–L3.15.
  Unbounded Amice/Mellin, differential, growth and character-space operations
  now cite LocallyAnalyticDistributions §§1.1,1.4–1.5,2.1,2.3,3.3; bounded
  measures and Weierstrass preparation remain with PadicMeasuresIwasawaAlgebras.
  The false attribution of classical and relative syntomic constructions to
  existing CohomologyComparisons sections is now an explicit missing-input
  clause, not a claim of supply.
- **Later-roadmap references.** Removed the EllipticRegulators checks in
  §§7.4–7.5. They are now computed locally: genus zero has zero H¹, a primitive's
  constant contributes C·deg(div f)=0, and p=5,γ=2 gives the normalization factor
  9/10. The Polylogarithms P6 unit-regulator citation in §3.5 is replaced by an
  explicit local definition `padicUnitRegulatorRank`, its basis/field/permutation
  API, and three rank checks, sourced to Rubin I Corollary 6.4, printed p.16.
  No prerequisite points to EllipticRegulators, PeriodsAndSpecialValues or
  MotivicEtaleKTheoryPartII.
- **Source and scope corrections.** §1.11 cites the discussion following
  HK2 Proposition 2.3.2, p.21, rather than a nonexistent §2.3.2. §6.7 cites
  GSWZ §1.5 equation (19), p.9 for the global map and BorelRegulators §3.12
  for the rational rank; GSWZ Theorem 9 is local and is not evidence for global
  injectivity. The Frobenius product clause now explicitly retains its tame-root
  (or odd-p) domain. §1.10 distinguishes the small-weight Fontaine equivalence
  2≤r≤p−2 from the r=1 finite unit logarithm. §7.7 now states Besser2025
  Theorem 3.10 in arbitrary reduction, alongside the more explicit split-model
  formula and its separate descent obligation.
- **Discriminating checks.** Added a two-dimensional quotient-logarithm model
  in §1.3 where quotienting by Fil⁰ alone gives the wrong answer. §4.6 now
  tests r=0 and the zero mod-p composite at r=2. §8.21 now computes a nonzero
  cyclotomic-unit mass and a χ² moment instead of merely asking to distinguish
  signs. For p=5 and f₆=((1+π)⁶−1)/π, Δf₆(0)=5/2,
  Col₀(1)=(4/5)log₅6≠0, Col₀(χ²)=−35/3 and
  ℓ₀(χ²)Col₀(χ²)=−70/3. The Tate-root tower still gives zero.
- **Presentation and Lean scope.** The README remains under 200,000 bytes;
  repeated API introductions and repeated good-reduction hypotheses were
  compacted without dropping a target, hypothesis, locator or check.
  Suggested.lean's closing comment now names the unit-regulator rank, strong
  injectivity and arbitrary-reduction curve theorem. No declaration or proof
  was changed. Metadata remains the appropriate single line `topic = "math.NT"`.

## Inputs, fidelity and supplier order

Read WORKERS, PROTOCOL §§0–15 and 20, PACKAGE_REVIEW, UPSTREAM_GUIDE, and the
expansion protocol. Models read include the snapshot ClassFieldTheory and
LocalFieldsRamification roadmaps and the current ClassFieldTheory and
ProfiniteArithmetic README/Suggested pairs. The package has upstream-style
scope, conventions, supplier contracts, ten ordered layers, prose definitions
with named APIs and Checks, examples and primary-source references.

The assembly's one native residue-function node plus the D.1 import's 72 nodes
and the L3 import's 59 nodes give **132 distinct target families**. The table
below maps every one to a unique subsection/supplier contract and records an
independent mathematical instance. There are 114 numbered subsections and 18
supplier subsections, with the broader curve theorem added inside §7.7.
The 40 assembly correction requests were also compared with the package:

| Correction group | Package disposition |
|---|---|
| Integral h_Iw, Wach basis/containment, coefficients, characters and twists | Imported from the actual PhiGammaModulesAndIwasawaCohomology §§5–6 targets, rather than replanned as new foundations. |
| Regulator, big exponential, obstruction, growth, reciprocity, determinant and de Rham interfaces | Kept with explicit domains, NC/refinement hypotheses where needed, meromorphic arbitrary-weight codomain, and the genuine differential Robba target. Unbounded analytic foundations now use LAD. R4 and R5 remain substantive limitations. |
| Ordered dual-exponential adjunction and residue-function prerequisite | Pairing arguments are ordered consistently in the displayed adjunction; the residue function is defined before its spanning theorem. Ordered source-normalization transport remains R4. |
| LLZ/RJ/BdJ/EN locators | Corollary 1.12 p.1107, Proposition 5.11 pp.1128–1129 versus arXiv Remark 5.12 p.25, RJ Lemmes I.24–I.26 p.919 and footnote 10 p.898, BdJ text preceding Remark 1.5 p.3, and EN §2.2 pp.7–8 are preserved in their actual versions. |
| Cubic example attribution and nine wording changes | The computation is mathematical data to certify, not attributed as another worker's verified result. No job, packet, checkpoint or review language appears in the roadmap. |

Input packets were not edited. Their accepted assembly still records 22 gaps,
32 requests and unapplied part corrections. Package presence is not evidence
that these registers have been closed. In particular: the arbitrary-symbol
Bloch formula remains BdJ's conjecture; positive-rank global injectivity is a
predicate/conjecture; missing pinned arithmetic carriers stay README targets;
pushforward is a target via étale comparison/corestriction; and general
crystalline/de Rham normalization is a target rather than a conclusion from a
diagonal eigenbasis calculation. The bounded-image issue has a named
Weierstrass unit-reflection/descent argument in §9.26. General wide-open
integration/colliding-support and relative-coefficient inputs are inherited
supplier obligations, not supplied by citing a stage identifier.

CaraianiNewton explicitly leaves this roadmap outside its 88-roadmap order
and moves the finite local condition down to SelmerIwasawaCohomology. I checked
that supplier's §§4.2–4.9 and the actual PG, LAD, K-theory, Coleman and
CohomologyComparisons sections. I do not infer a new total K-theory order from
focus.json's display order. The specifically prohibited later suppliers are
absent; HabiroModuleGluing and SelmerModularIwasawaMain are consumers.
Missing Part II producers cannot be deemed earlier merely by naming them.

## Source checks

The author did not list a separate set of unverified locators. I inspected the
assembly's unresolved-source/comparison records as well as sampling numbered
README subsections. The reproducible sample uses Python
`random.Random("codex-nJC1mZ-REV-PKG-PadicHodgeRegulators-2026-10-20").sample(headings, 15)`
with the 114 numbered headings in document order. These are source/statement
checks, not certification of every proof in every reference.

| Sample subsection | Primary passage read | Finding |
|---|---|---|
| §9.6 | LLZ2011 Proposition 4.2 proof, p.1118 | Transport preserves the subspace dimension; the earlier factors evaluate invertibly at the unused point. |
| §1.11 | Rubin II §2, printed p.25; HK2 §2.3, discussion after Proposition 2.3.2, p.21 | Componentwise semilocal maps; corrected the HK section description. |
| §8.10 | Berger2003DM Definition II.12, Theorem II.13, Remark II.14, pp.120–121 | Big exponential retains the derivative obstruction kernel and invariant quotient. |
| §5.1 | GSWZ (177), p.37; (180) and proof of Proposition 3.3, p.38 | Integral indices and double zero; the latter requires p>3. |
| §9.19 | LLZ2011 Proposition 5.11 proof, p.1129 | Row transformation and specialization-line equations have the displayed orientation. |
| §8.5 | LLZ2011 Lemma 5.6, p.1126 | Quadratic Euler expression with nonzero denominators; no commuting-matrix-ring assumption needed. |
| §9.2 | LLZ2011 Lemma 4.3, pp.1118–1119 | Distinct evaluation factors are needed for the divisibility product. |
| §8.3 | LLZ2011 Lemma 5.6 proof, pp.1126–1127 | Candidate inverts I−Φ only when 1+a+b≠0. |
| §5.2 | GSWZ (178)–(182), Propositions 3.2–3.3, pp.38–39 | Pole order, excluded points and F₅ values agree. |
| §7.4 | AM18 Theorem 9.1, p.45; BdJ2012 Remark 1.10, p.4 | Coleman pairing applies to the normalized regulator; q-Frobenius conversion is the package's explicit §7.1 transport. |
| §7.3 | AM18 Proposition 6.4, p.34; BdJ2003 Lemma 4.7, p.24; Besser2000 Proposition 10.3, author p.35 | Symbol/Chern formula. The static author PostScript was read as data, including the ordered logarithmic form. |
| §6.7 | GSWZ Theorem 9, p.39, compared with §1.5 (19), p.9 | The cited theorem is local. Corrected the global-map/rank attribution; global injectivity remains conjectural. |
| §5.9 | GSWZ Theorem 9, p.39 | Tame-root generation uses the completed group and p>3, not bare integral Bloch symbols. |
| §2.1 | CC99 Lemme I.4.2, p.7; Berger2003DM Proposition I.8, p.110 | Cochain and logarithmic normalizers transform reciprocally. |
| §8.14 | LZ2014 Theorem B.5 and its following qualification, pp.39–40 | Only the Euler operator actually inverted must be invertible; Gamma leading factors at negative integers retain factorial denominators. |

Additional primary passages were read for the high-risk definitions and fixes:

- Fontaine–Ouyang's linked 2006 draft, Theorems 6.25(3),6.26(3), Remark 6.27,
  pp.129–130: the rational twisted period sequence uses full FilʳB_cris and
  integral r; it is not a small nonnegative-weight statement.
- BNQD2002 Lemma 1.3.2, p.647, Theorem 2.1, p.648, and §§2.2.2–2.3.2,
  pp.649–652: actual trace formula and lattice, not just a lattice index.
- HK2011 Definition 2.2.1 and Example 2.2.4, pp.14–15; Definition 2.3.3 and
  Proposition 2.3.4, p.16; NN2016 Proposition 4.13, pp.53–54: rigid-syntomic
  cone, universal Chern maps and comparison with the exponential.
- CN2017 Corollary 3.16, p.37 and §2.4.3, p.23; EN2016 §§2.1–2.2, pp.4–8,
  including Theorems 2.2–2.3 and unit-class compatibility: divided/undivided
  directions, truncation, modified lattice and p-power errors are distinct.
- BdJ2003 Theorems 1.6,1.10,1.12, Remarks 1.7,1.13 and Conjecture 1.14,
  pp.3–6: special units versus arbitrary symbols and the (n−1)! factor.
- CC99 Proposition V.3.2 and proof, pp.26–27; LZ2014 §§2.4–2.6, pp.5–7,
  §6.4.2, pp.28–29 and Appendix B, pp.37–40: R4 is not silently resolved by
  recognizing the name Kummer or by differentiating a Coleman series.
- LLZ2011 §§4–5, pp.1118–1129; arXiv v2 Remark 5.12, p.25;
  LLZWach2010 Proposition 4.11 and proof, pp.26–27: bounded image,
  maximal-ideal shear and the precise R5 limitation.
- Besser2025 §3, pp.6–9, §4, pp.11–14 and §7, p.28;
  BR2019 §3, pp.10–11 and Theorem 4.7 proof, pp.19–20: continuous/discrete
  coordinates, branch derivative, full second-kind formula and monodromy
  quotient. The arbitrary-reduction statement and the graph-model computation
  have different scopes.
- Rubin I Corollary 6.4 and proof, printed p.16; WeibelChern Proposition 5.1,
  p.24: the rank and ordinary-Chern negative controls added here.

No source passages, book files or section-by-section paper summaries were put
in the repository. Public PDFs and the static PostScript were read as source
data; no fetched program was executed. The cleared-library index was checked;
no uncleared book copy was used.

## Lean statement and definition checks

The file imports only `Mathlib`, uses the roadmap namespace and layer comments,
and contains seven real definitions, twelve named theorems (eleven admitted,
one proved) and fourteen proved examples, exactly two per light definition.
There is no sorry'd data, arbitrary carrier encoding, `set_option`, computation
command or algorithmic development. The heavy arithmetic targets are described
in the README and its closing comment instead of weakened into Lean stand-ins.

| Signature checked | README match / nonvacuity condition |
|---|---|
| `finitePolylog_two_double_zero` | §5.1, prime p and p>3; p=3 is excluded for a computed reason. |
| `residueDilogValue_cancel_double_zero` | §5.2, p>3, field over Fₚ, x≠1; not cancellation through 0/0. |
| `residueDilogValue_spans` | §5.5, nonzero finite-field degree and admissible x≠0,1; spans both values and differences. |
| `quadraticFrobeniusInverse_spec` | §§8.1–8.2, actual quadratic matrix relation and b≠0, both product orders. |
| `quadraticEulerInverse_spec` | §§8.3–8.4, relation and 1+a+b≠0; Φ=1 is not admitted. |
| `quadraticEulerInverse_product` | §8.5, p,b,1+a+b all nonzero; actual matrices over a field. |
| `gammaLeadingFactor_ne_zero` | §8.6, every integral j; value at j=−3 is 1/2, not 2. |
| `constraint_basis_and_determinant` | §§9.7–9.8, domain R, injective points, evaluation kernel=(t−xⱼ), nonzero factors and explicit algebra maps. |
| `coleman_row_covariance` | §9.17, row convention, U and B are units, coefficient embedding explicit. |
| `shearMatrix_unit` | §9.18, determinant must be a unit in the original commutative ring. Nonzero is insufficient over a DVR. |

The two additional signatures `residueDilogValue_five_values` and the proved
`residueDilogValue_map` were checked too. The examples discriminate excluded
prime/point, singular inverses, negative Gamma factor, empty constraint set,
failed constant section and a nonunit determinant. Every prose definition was
checked for a named API and at least three meaningful Checks; theorem-only
subsections need not have three tests of a newly introduced object. The new
quotient-logarithm, rank and Coleman-moment checks address the weakest cases.

## Current-library and roadmap duplication screen

Read the ten-stage audit in `data/library-coverage.json`, then searched current
Tau Ceti and all current roadmap README/Suggested files, including the nine
post-snapshot roadmaps and Completed roadmaps, by cohomological kernels,
Frobenius/monodromy, local units, completed multiplicative groups, period
rings, Chern operations, finite polylogarithms, Wach/Robba modules and
regulator images, rather than only proposed declaration names.

| Baseline | Revision / finding |
|---|---|
| Pinned Mathlib | `082e2d37e8b0463410cdb532e111cd43d5a66174`; read polynomial, finite-field, submodule and determinant APIs used by the Lean file. Finite-field degree-zero hypotheses are not silently omitted. |
| Pinned Tau Ceti | `f790474821cf4256814db967cb154e7af3d0c369`; local-field Teichmüller names in the old API were read. |
| Current Tau Ceti | `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; read Teichmüller/residue, `unitFiltrationZeroEquivProd`, and Frobenius-on-Teichmüller/root declarations. These are consumed as supplier contracts, not added as new regulator targets. |
| Current TauCetiRoadmap | `0d144d044dacebca17b654695b6f1ad58f159b27`; LocalGaloisGroups Layer 7, LocalFieldsRamification units/logarithm and ProfiniteArithmetic are genuine prior boundaries. Existing height/real regulators and syntomic ring morphisms do not supply the higher p-adic cohomological regulators here. |

No further target was found already implemented, so this review makes no
additional duplicate-target deletion. The package already defers unit
factorization, tame roots, fundamental period sequences, h_Iw and good Wach
bases to their owners. Current and pinned Teichmüller APIs are distinguished.
No Lake command was run in a current read-only checkout.

## Adversarial pass and complete target map

Each row covers the input family's statement, defining/API identities and
conventions. Instances were independently recomputed or compared with the
specified source domain. These are mathematical checks, not machine proofs of
heavy targets. `Kept` means the test exposes no additional defect; remaining
producer or normalization gaps are recorded as R1–R5 above. In the map below,
the common `PadicHodgeRegulators:` prefix is omitted.

| Input family | README location | Instance / discriminating result | Disposition |
|---|---|---|---|
| `L0/fundamental-exact-sequences` | Supplier: The fundamental exact sequences used by the Bloch–Kato maps | V=ℚₚ has a fixed crystalline line; V=ℚₚ(2) has none. | R1 integral comparison only |
| `L0/integral-period-interface` | Supplier: Integral comparison interface for small weights | At p=3 weight 2 is outside [0,p−2]; at p=5 it is inside. | Kept range |
| `L2/fontaine-iwasawa-map` | Supplier: Fontaine's isomorphism h_Iw : D(T)^{ψ=1} ≅ H¹_Iw | The trivial representation has Λ-torsion; a nontrivial unramified line does not. | Prior supplier |
| `L2/local-iwasawa-twist` | Supplier: Twisting local Iwasawa cohomology by characters of G_∞ | η=χ sends g to χ(g)⁻¹g; η followed by η⁻¹ is identity. | Prior supplier |
| `L2/twist-compatibility` | Supplier: Compatibility of h_Iw with twists | At j=1 the Wach twist is π⁻¹N(T)⊗v₁; j=0 changes nothing. | Prior supplier |
| `L2/wach-psi-fixed-vectors` | Supplier: Berger: ψ-fixed vectors lie in the Wach module | A Tate ψ-fixed vector need not be φ-fixed; positive weights retain the stated hypothesis. | Prior supplier |
| `L2/lattice-and-coefficient-squares` | Supplier: Lattice and coefficient-change squares | T⊂p⁻¹T gives the same rational comparison; zero module has zero limit. | Prior supplier |
| `D.1/teichmuller-unit-decomposition` | Supplier: Teichmüller decomposition of the units of a local field | Over ℚ₂ the tame roots are trivial; −1 is principal torsion, not a missing tame factor. | Existing current API |
| `D.1/unramified-frobenius-on-roots` | Supplier: Frobenius on the roots of unity of an unramified field | In an unramified degree-two field, φ² fixes tame ζ; at p=2, ζ=−1 fails φζ=ζ². | Existing current API |
| `D.2/etale-regulator` | Supplier: Soulé's étale regulator to continuous Galois cohomology | Over F₃ mod 2, c₃=0 on a nonzero K₅ class; the descent edge is not c₃. | Fixed Chern/edge identification |
| `D.2/rigid-syntomic-cohomology` | Supplier: Rigid syntomic cohomology of smooth schemes over a p-adic integer ring | Spec 𝒪 in positive weight has rational coordinate K; its cone is not integral exactness. | R1 |
| `D.2/log-syntomic-complex` | Supplier: Log-syntomic complexes S_n(r) | At m=1,r≥1, ωτ=pʳ=0; at r=0 both are identity. | R1 |
| `D.2/fontaine-messing-kato-period-map` | Supplier: The Fontaine–Messing–Kato period morphism | At r=p−1 the target lattice is p⁻¹ℤₚ(r); a unit undivided class gains p. | R1 directed map |
| `D.2/small-twist-comparison` | Supplier: The divided small-weight comparison and the undivided bounded comparison | r=p−2 is divided exact; r=p−1 is not this endpoint and undivided remains bounded. | R1 |
| `D.3/unramified-etale-algebra` | Supplier: Finite unramified étale Q_p-algebras | The empty product has rank 0; ℚₚ(ζₚ) at odd p is ramified despite finite étaleness. | Prior supplier |
| `D.3/completed-k3-unramified` | Supplier: Completed K₃ of a finite unramified étale algebra | At p=2,3 nonzero torsion forbids a free-rank-only formulation; at p>3 rank=N. | Kept actual completion |
| `D.3/completed-k3-bloch-description` | Supplier: Completed K₃ of an unramified field is the completed Bloch group | A nonzero Tate-module obstruction cannot be suppressed outside the unramified range. | Prior supplier |
| `L4/good-wach-basis` | Supplier: Good Wach basis coordinate interface | A rationally invertible matrix with determinant 5 is not an integral good-basis change. | Prior PG §6.2 supplier |
| `L0/hodge-tate-and-twist-conventions` | §0.1 | r=1: φ(d₁)=p⁻¹d₁, Fil⁻¹ full, Fil⁰ zero; r=0 reverses no filtration. | Kept |
| `L1/bloch-kato-subgroups` | §1.1 | V=0 gives zero; at V=ℚₚ(1), f is the units and g is all H¹. | Kept |
| `L1/bloch-kato-exponential` | §1.2 | V=ℚₚ gives zero source; exp(log(1+p))=κ(1+p) in the finite Tate condition. | R4 boundary transport |
| `L1/bloch-kato-logarithm` | §1.3 | D=ℚₚ², Fil⁰=Ee₁, fixed-image=Ee₂: quotient is zero, not a line. | Added quotient test |
| `L1/dual-exponential` | §1.4 | For ℚₚ, logχ maps to 1; for ℚₚ(1), target Fil⁰ is zero and kernel is g. | R4 ordered normalization |
| `L1/dimension-formulas` | §1.5 | For ℚₚ(1): dim f=N, dim g=N+1; for ℚₚ: dim f=1. | Kept invariant terms |
| `L1/local-duality-of-conditions` | §1.6 | The dual of ℚₚ(1) is ℚₚ after (1); unramified characters annihilate unit Kummer. | Kept ordered pairing |
| `L1/twist-and-change-of-field` | §1.7 | A degree-two extension sends a base scalar to 2a under trace, not a. | Kept |
| `L1/tate-twist-examples` | §1.8 | κ(p) is outside finite units at r=1; r=2 has f=H¹; r=0 is unramified f. | Kept |
| `L1/abelian-variety-logarithm` | §1.9 | Torsion has logarithm zero; [m] scales the Lie logarithm by m. | Kept Lie target |
| `L1/integral-logarithm-unramified` | §1.10 | At p=5,r=2 the lattice is 25𝒪; r=1 is finite units, not all H¹. | Clarified r range; R4 sign |
| `L1/semilocal-bloch-kato` | §1.11 | Two factors permit independent (a,0),(0,b), not a diagonal line; empty product is zero. | Corrected HK locator |
| `L2/generator-independence` | §2.1 | γ→γ⁻¹ gives u=−γ and reverses logχ; their cohomology effects cancel. | Kept |
| `L2/root-change` | §2.2 | ε→εᵃ scales t and v₁ by a, so d₁ is unchanged; derivative scales inversely. | Kept |
| `L2/character-specialisation` | §2.3 | η=1 is pr₀; raising a finite-character level adds corestriction, not a new value. | Kept |
| `L2/kummer-coleman-comparison` | §2.4 | For a=6,p=5, Δf₆(0)=5/2; the (1−τ) lift alone does not determine this Kummer sign. | R4 |
| `D.1/etale-algebra-dilogarithm` | §3.1 | In K×K, nonzero (0,2) is not admissible; −1 gives D=0 by inversion. | Kept component domain |
| `D.1/dilogarithm-scalar-extension` | §3.2 | A factor permutation permutes values; a diagonal field embedding preserves D. | Kept |
| `D.1/combined-dilogarithm` | §3.3 | A split prime gives independent local coordinates, not their trace as the target. | Kept |
| `D.1/regulator-normalisation-dictionary` | §3.4 | Weight two Gros depletion over ℚ₅ multiplies the syntomic coordinate by 24/25. | Kept normalization distinction |
| `D.1/unit-logarithm-kernel` | §3.5 | F=ℚ has rank zero; ℚ(√2),p=7 has rank one; a zero matrix there fails Leopoldt. | Added owned rank/API/tests |
| `D.1/logarithm-norm-trace` | §3.6 | For a base scalar u in a degree-two extension: log Norm(u)=2log u=Tr log u. | Kept |
| `D.2/syntomic-regulator` | §4.1 | On ℙ², c₂(𝒪(1)⊕𝒪(1))=h²≠0; each summand has c₂=0. | Fixed degree-zero additivity |
| `D.2/syntomic-etale-regulator-comparison` | §4.2 | Weight one on 1+p agrees with the finite unit logarithm, not an unramified class. | R1/R4 |
| `D.2/weight-two-dilogarithm-comparison` | §4.3 | Roots of unity kill the log correction; a nonspecial arbitrary symbol is not covered. | Kept conjecture boundary |
| `D.2/higher-weight-polylogarithm-comparison` | §4.4 | At n=3 a tame root class gives 2Li₃, not 6Li₃. | Corrected Coleman supplier |
| `D.2/gros-normalisation` | §4.5 | At weight two over ℚ₅, 1−σ/25=24/25; it cannot be erased from integrality. | Kept |
| `D.2/syntomic-exponential` | §4.6 | p=5,r=2: raw boundary is 25exp; normalized boundary is exp; mod p is not inversion. | Added third check; R1 |
| `D.3/finite-polylogarithm` | §5.1 | At p=3, li₂(1)=2, so the double zero fails; at p=5, li₂(2)=1. | Kept p>3 |
| `D.3/residue-dilogarithm-function` | §5.2 | F₅: f(2)=1, f(3)=4, f(4)=0; x=1 is excluded despite totalized division. | Kept |
| `D.3/finite-polylogarithm-reduction` | §5.3 | ζ=1 is not an admissible reduction; the displayed denominator is then zero. | Kept |
| `D.3/dilogarithm-integrality` | §5.4 | At p=5, ζ=2 mod p yields p⁻²D(ζᵖ)≡1; no blanket p³-integrality follows. | Kept |
| `D.3/residue-spanning` | §5.5 | F₅ values include 1,4,0; differences include 1 and span too. Degree zero is excluded. | Kept differences and s>0 |
| `D.3/root-of-unity-classes` | §5.6 | m[ζ] has zero boundary; m is a p-unit, while bare [ζ] need not be integral Bloch. | Kept completed class |
| `D.3/local-regulator` | §5.7 | A product uses each component and preserves zero; rationalization kills torsion at small p. | Kept |
| `D.3/unramified-regulator-theorem` | §5.8 | At p=5,N=1 the image lattice is 25ℤ₅; p=3 is outside the freeness/spanning proof. | Kept p>3 and unramified |
| `D.3/roots-of-unity-generate` | §5.9 | A root class can generate after completion without being an integral bare Bloch symbol. | Kept |
| `D.4/global-p-adic-regulator` | §6.1 | For F=ℚ the rational K₃ source is zero; a split prime retains all completions. | Kept |
| `D.4/special-unit-formula` | §6.2 | A special unit is evaluable; an arbitrary Bloch presentation invokes Conjecture 1.14. | Kept qualification |
| `D.4/norm-trace-compatibility` | §6.3 | Restriction followed by transfer in degree d multiplies a rational regulator by d. | Kept |
| `D.4/frobenius-compatibility` | §6.4 | An unramified degree-two factor has φ²=1; ramified fields have no such canonical φ. | Kept |
| `D.4/torsion-and-denominators` | §6.5 | A torsion class rationalizes to zero; an integral lattice map is not thereby injective. | Kept |
| `D.4/habiro-regulator-export` | §6.6 | For a product of degrees 1 and 2, the p² lattice has total rank 3. | Kept; no global injectivity used |
| `D.4/padic-k3-regulator-injectivity` | §6.7 | ℚ²→ℚₚ, (a,b)↦a+αb with α∉ℚ is ℚ-injective, not injective after ℚₚ extension. | Corrected global/local attribution |
| `D.4/example-cubic-field-five-two` | §6.8 | x³−x²+1 mod 5=(x−2)(x²+x+2); discriminant −23 is a 5-unit. | Kept degrees 1+2 |
| `D.5/curve-weight-two-target` | §7.1 | f=1 gives N_f=1; f=2 gives 1+φₚ/p², not identity. | Kept q/p conversion |
| `D.5/open-curve-splitting` | §7.2 | For X=ℙ¹ the proper H¹ target is zero, even when deleting points gives open H¹. | Kept retraction domain |
| `D.5/curve-syntomic-regulator` | §7.3 | A zero symbol gives zero vector; all 2g coordinates are retained, not just holomorphic pairings. | R1 |
| `D.5/coleman-symbol-formula` | §7.4 | A constant C changes the divisor integral by C deg(div f)=0; scalar p=5,γ=2 gives 9/10. | Replaced later-roadmap tests |
| `D.5/curve-etale-comparison` | §7.5 | For X=ℙ¹ both sides vanish; on γ=2 at p=5 raw and normalized pairings differ by 9/10. | Removed later-roadmap reference |
| `D.5/curve-regulator-functoriality` | §7.6 | For an unramified quadratic extension the raw coordinate gains 1+Φ/q². | Kept trace route and raw factor |
| `D.5/semistable-input-boundary` | §7.7 | A Tate curve needs the Vologodsky branch; arbitrary reduction is retained as a separate theorem. | Restored general theorem; R1/R3 |
| `D.5/relative-curve-syntomic-regulator` | §7.8 | The Steinberg symbol {t,1−t} is zero; a nonzero tame symbol forbids the proper refinement. | R2; correct negative sign |
| `D.5/smooth-family-specialisation` | §7.9 | Zero class specializes to zero; an evaluation not commuting with σ is outside the stated square. | R2 |
| `D.5/semistable-continuous-regulator` | §7.10 | Adding d(a) cancels in β,ρ; a pure nonzero ρ is invisible to β alone. | R1/R3 |
| `D.5/semistable-symbol-formula` | §7.11 | The two edge orientations contribute equally, so use one orientation or one half of both. | R3; retains H/im N only |
| `L3/quadratic-frobenius-inverse` | §8.1 | Φ=2,a=−5,b=6 gives 1/2; Φ=0,b=0 gives no inverse. | Kept |
| `L3/quadratic-frobenius-inverse-spec` | §8.2 | Multiplication in both orders gives I using Φ²+aΦ+bI=0; b=0 breaks it. | Kept |
| `L3/quadratic-euler-inverse` | §8.3 | Φ=2,a=−5,b=6 gives −1; Φ=1,a=−3,b=2 gives a singular zero candidate. | Kept |
| `L3/quadratic-euler-inverse-spec` | §8.4 | Φ=0,a=b=0 gives Q=I, although Φ itself is not invertible. | Kept separate denominator |
| `L3/quadratic-euler-product` | §8.5 | Φ=2,a=−5,b=6,p=5 gives −9/10; p=0 or b=0 is forbidden. | Kept |
| `L3/gamma-leading-factor` | §8.6 | j=0 gives 1, j=−2 gives −1, j=−3 gives 1/2. | Kept Laurent coefficient |
| `L3/logarithmic-factors` | §8.7 | At χʲ, ℓᵢ=j−i; weights 0 and 2 give different zero multiplicities. | Kept generator normalization |
| `L3/crystalline-regulator` | §8.8 | The Tate-root tower has (1−φ)Δ=0; arbitrary negative weights use the separate extension. | Kept intrinsic domain |
| `L3/big-exponential-obstruction` | §8.9 | Top tʰ eigenvectors can lie in the obstruction kernel; the invariant quotient is not deleted. | Kept exact-sequence target |
| `L3/big-exponential` | §8.10 | For h=0 the differential product is empty, but derivative-obstruction solvability still matters. | Kept source domain |
| `L3/auxiliary-h-comparison` | §8.11 | Increasing h by one introduces ∇ₕ; j=0 twisting is identity. | Kept |
| `L3/meromorphic-twist-extension` | §8.12 | Dividing by ℓ₀ can introduce a pole at the trivial character; no universal ℋ-valued assertion. | Kept arbitrary weights |
| `L3/ramified-interpolation` | §8.13 | A primitive character of conductor pᵐ cannot be treated as primitive at level m+1. | Kept Gauss/conductor domain; R4 |
| `L3/unramified-interpolation` | §8.14 | j=−3 has Gamma factor 1/2; only the stated Bⱼ inverse requires invertibility. | Kept; R4 transport |
| `L3/singular-euler-specialization` | §8.15 | φ=p⁻¹,j=0 makes Bⱼ=0; the cleared relation does not specify one output. | Kept relation, not total inverse |
| `L3/growth` | §8.16 | A slope −1 quotient permits order 1; it does not assert bounded order 0. | Kept quotient hypothesis |
| `L3/naturality-and-lattice` | §8.17 | Root changes a then b multiply by [σ_ab]⁻¹; coefficient extension preserves the comparison. | Kept actual Wach lattice |
| `L3/explicit-reciprocity` | §8.18 | Replacing the second input by g y acts by g⁻¹; transposing degree-one cups changes sign. | R4 source-to-declared pairing |
| `L3/regulator-determinant` | §8.19 | Weights (0,2) yield ℓ₀ℓ₁, while (1,1) yield ℓ₀²; not a rank-only formula. | Kept ideal, not basis equality |
| `L3/scalar-projection` | §8.20 | At vector (2,3), first and second projections differ; twice a functional doubles the value. | Kept chosen functional |
| `L3/tate-coleman-comparison` | §8.21 | f₆ at p=5 has nonzero mass; χ² moment is −35/3, and ℓ₀ changes it to −70/3. | Added computed checks; R4 |
| `L3/rubin-coleman-map` | §8.22 | Split multiplicative α=1 has augmentation vanishing; nonsplit α=−1 does not force it. | Kept source-specific normalization |
| `L4/evaluation-constraints` | §9.1 | At zero, constant 1 fails V=0 while X satisfies it; empty J gives the full module. | Kept native submodule |
| `L4/scalar-multiple-zeros` | §9.2 | X(X−5) vanishes at two distinct points; repeating zero does not imply X² divides X. | Kept distinctness |
| `L4/single-constraint-basis` | §9.3 | In rank 2 with V=E(1,0), basis rows (1,0),(0,X−x) have one determinant factor. | Kept |
| `L4/unused-point-invertibility` | §9.4 | At y≠x, X−x evaluates to y−x≠0; at y=x it cannot be inverted. | Kept |
| `L4/transported-specialization` | §9.5 | Swapping basis coordinates swaps the allowed line; row transport uses multiplication on the right. | Kept |
| `L4/transport-dimension` | §9.6 | An invertible 2×2 transport preserves a line dimension; a zero transport does not. | Kept |
| `L4/constraint-basis` | §9.7 | V₀=Ee₁,V₅=Ee₂: rows (X−5,0),(0,X) give the simultaneous module. | Kept explicit evaluation kernels |
| `L4/constraint-determinant` | §9.8 | Those two line constraints give determinant X(X−5); full V contributes exponent zero. | Kept |
| `L4/projection-generator` | §9.9 | An allowed line contained in v₂=0 contributes X−x to the second coordinate only. | Kept |
| `L4/projection-witness` | §9.10 | Lagrange interpolation at distinct points gives a witness; repeated points would divide by zero. | Kept |
| `L4/coordinate-image` | §9.11 | Zero coordinate constraints give their product ideal; no coordinate constraint gives the unit ideal. | Kept |
| `L4/coleman-coordinates` | §9.12 | Zero Wach vector has zero row; changing the basis requires U⁻¹ on that row. | Prior carrier plus new coordinates |
| `L4/coleman-reconstruction` | §9.13 | For a rank-one basis, the coefficient times that basis recovers (1−φ)x. | Kept |
| `L4/logarithmic-matrix` | §9.14 | Changing n to U n and ν to Bν produces U M B⁻¹, not B M U. | Kept |
| `L4/matrix-expansion` | §9.15 | For M the coordinate swap and c=(2,3), cM=(3,2). | Kept row convention |
| `L4/regulator-coordinate-decomposition` | §9.16 | The same swap sends the regulator row to (3,2); a column interpretation disagrees. | Kept |
| `L4/constant-basis-covariance` | §9.17 | Set M=B=I: (cU⁻¹)U=c; period change alone gives cB⁻¹. | Kept coefficient embedding |
| `L4/shear-matrix` | §9.18 | e₁=1,e₂=−4 gives det=5, nonzero over ℚ₅ but nonunit over ℤ₅. | Kept unit condition |
| `L4/shear-specialization-lines` | §9.19 | e₁=2,e₂=3 sends (7,11) to (29,32); both slope equations give 928/11. | Kept axes and off-axis |
| `L4/integral-shear-choice` | §9.20 | In ℤ₂, r=−2, choose e₁=4,e₂=2: det=−7 unit; e₁=2 hits a forbidden slope. | Kept infinite maximal ideal |
| `L4/sheared-coordinate-surjectivity` | §9.21 | The ideal (5,X) becomes the full ring after inverting 5, but is not integrally full. | Kept rational/integral distinction |
| `L4/noncritical-refinement` | §9.22 | A φ-stable line carrying the wrong filtration weight is critical even with scalar φ. | Kept explicit filtration dimensions |
| `L4/refinement-saturated-flag` | §9.23 | In rank one the exact quotient annihilator is nᵣ, not the unnormalized ℓ product. | Kept saturation |
| `L4/logarithmic-elementary-divisors` | §9.24 | Weights (0,2) give (1,n₂); removable values at x₀,x₁ are nonzero. | Kept NC/refinement scope |
| `L4/specialization-subspaces` | §9.25 | V=Ee₁ and a swap M give W=Ee₂; φ=p⁻¹,i=0 violates the inverse hypothesis. | Kept transported W |
| `L4/actual-coleman-image` | §9.26 | A nonconstant distinguished factor has a root in the open disc, obstructing an analytic unit. | Kept named bounded descent |
| `L4/regulator-elementary-divisors` | §9.27 | Weights (0,2) give analytic factors (1,ℓ₀ℓ₁), not bounded X-polynomial factors. | Kept analytic codomain |
| `L4/modular-specialization` | §9.28 | p=5,k=2,aₚ=0 and (g,h)=(1,2): corrected ρ=0; printed swapped ρ=−6. | Kept ordered functional |
| `L4/integral-image-index` | §9.29 | A proper ideal (ϖ,X) is rationally full; integral finite cokernel is weaker than surjectivity. | R5 lower inclusion |
| `L4/signed-local-condition` | §9.30 | Col=(1,0), U⁻¹=[[1,1],[0,1]] changes the second coordinate to 1 and its kernel. | Kept basis as data |
| `L4/derham-character-domain` | §9.31 | Equality at the valuation radius is excluded; a different torsion component is outside. | Kept strict balls and p=2 q=4 |
| `L4/analytic-differential-powers` | §9.32 | κ=1 gives identity, κ=x gives ∂, κ=x⁻¹ gives its ψ-zero inverse only. | Kept genuine N_rig module |
| `L4/derham-regulator` | §9.33 | A primitive level-m Gauss sum is not replaced by the imprimitive level-(m+1) sum. | Kept admitted domain |
| `L4/derham-interpolation-growth` | §9.34 | Negative and nonnegative j use different exponential branches; no single global order bound. | Kept source range |
| `L4/crystalline-derham-comparison` | §9.35 | A Jordan Frobenius block is not diagonalized by extending coefficients; eigenbasis check is insufficient. | Kept general extension target |
| `L4/split-multiplicative-augmentation` | §9.36 | α=−1 does not force augmentation zero; containment does not imply image equality. | Kept odd-prime split hypothesis |


The convention checks also include a semistable linear model
N(a,b)=(b,0), ρ=(0,1), I=id. With N²=0 the branch change is
(−λ²/2,−λ), not (0,−λ); N²=0 does not imply Nρ=0. This tests the
finite branch-change formula without pretending that the arbitrary linear
model itself is an admissible geometric representation. The ker N pairing
determines H/im N and cannot recover the discrete regulator.

## Validation and handoff

- `lean-check` on the final Suggested.lean: **exit 0**, eleven `declaration uses
  sorry` warnings, no errors or other warnings. There were 77 GB available
  before starting; no language server or library build was started.
- `python3 scripts/check_blueprint.py` on the root packet and each of the D.1
  and L3 imported packets: **all exit 0**, zero errors and zero warnings.
  The root checker still reports 22 gaps, 32 requests and zero closed stages;
  syntactic validity is not mathematical acceptance.
- `intake.py check-files` on all five changed deliverables: **5 files,
  0 problems**. `git diff --check`: **exit 0**. README: **199,895 bytes**,
  114 numbered and 18 supplier subsections. Suggested.lean: **297 lines**.
  The import, metadata and prohibited-later-supplier checks pass.

Only this package's README, the short Suggested.lean closing comment,
review.json, this review and this job's handoff are changed. The input packets,
other roadmap deliverables and upstream checkouts are untouched. No second job
was claimed. The handoff gives the exact resume points for R1–R5; no source or
validation artifact needed by the next worker is left only in disposable scratch.
