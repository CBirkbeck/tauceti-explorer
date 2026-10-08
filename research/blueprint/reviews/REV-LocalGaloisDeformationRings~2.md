# Independent review of revision round 2: Local Galois deformation rings and their components

Job **REV-LocalGaloisDeformationRings~2**, issue **#6912**. Reviewer: **Claude, session claude-aJXeVj**, 8 October 2026. This session did none of the planning (BP-LocalGaloisDeformationRings, BP-LocalGaloisDeformationRings~2) and none of the first review. Verdict: **accepted**, after corrections made in place.

All 157 nodes have a verdict: 122 corrected, 35 verified, none added, none removed, none unverifiable. All 9 baseline declarations are confirmed at the pinned commits. The packet stays `complete` with all eight stages `planned`; it has 22 requests, 10 gaps (one new), 7 restructure proposals and 10 source issues (four new, one rejected). The suggested Lean file elaborates at the pinned Mathlib. The reader document was regenerated from the corrected packet. Nothing is claimed to be implemented.

The number of corrected nodes is large, so this report says first what kind of corrections they are. Most are small and local: a dropped hypothesis restored, a locator fixed, a sign convention named, a reference to the review process removed. Twenty nodes lost a prerequisite on local duality (and the proof step that went with it) that their arguments do not use. A dozen corrections change mathematics that a formaliser would have got wrong; they are listed in the next section. No correction changes the design of the plan: the nodes, their layers and their order are those of the revision.

## How the review was done

The packet, the reader and the suggested file were read in full, with the previous review, the revision's handoff, the five red-team findings and the supplier nodes of other packets that this one cites (52 nodes, all present, statements read).

Every node was then checked against its sources in the public versions the packet records. The files were fetched again and their hashes agree with the packet's records. The check was organised as seven passes, one per group of sources, each run by a sub-agent of this session that read the cited places and wrote a report per node (Geraghty and Thorne; Boxer–Calegari–Gee–Pilloni; Le–Le Hung–Levin–Morra; Dotto, Booher, Fakhruddin–Khare–Patrikis, Shotton, Liu et al., Paškūnas–Quast, Böckle–Iyengar–Paškūnas, Ding; Khare–Wintenberger and neighbours; Kisin's three papers; Clozel–Harris–Taylor and the remaining sources). Formulas that the text layer garbles were read on rendered pages. For the GL₃ tables a script enumerated the points of each variety over 𝔽₅ and 𝔽₇ and substituted the parametrisation of every listed prime into every relation.

I did not take those reports on trust for the corrections that matter. Before writing a correction of high or medium weight I read the place myself: Kisin's (2.4.6) and (2.4.10); the proof of LLHLM Theorem 3.5.3 and Proposition 3.6.3; the proof of Proposition 3.5.2 of the LTXZZ companion (the matrix identity was computed by hand for both parities); KW II §3.2.4, §3.3.2 and Definition 3.4; KW I Theorem 5.1 and its remarks; CHT p. 37, p. 39 and p. 52; Calegari–Geraghty's definition of χ; Kisin's Corollary (1.7); Ding's Proposition 2.10; Shotton's Definition 3.5, Proposition 3.6 and Theorem 4.6; Dotto p. 244; BCGP25 p. 145; Newton–Thorne §4 and its bibliography; FKP Lemma 7.2; Thorne's Proposition 3.17; Bellovin–Gee §3 (a paper the packet cited only through FKP, now added as a source). Low-weight corrections (locators, wording, notation) rest on the pass reports.

**Limits.** These are the things that were not checked, and nothing in the verdict depends on them.

- Published page numbers where only an arXiv or author version is public (Calegari–Geraghty 2018 and 2020, Liu et al., BCDT, LLHLM). Locators give the page of the version read.
- The published texts of Geraghty (Math. Ann. 2019), Savitt (Duke 2005), Kisin (J. Amer. Math. Soc. 2008, the AMS PDF) and the LTXZZ companion (Acta Math. Sin. 2024). The preprint or author version was read and is named in each case.
- Results that the sources quote from papers outside the packet (LLHLM18 and LLHL19, Enns, Conrad–Diamond–Taylor, Berger–Li–Zhu, Snowden, Wake–Wang-Erickson, Balaji, Bushnell–Henniart). Where a node rests on one of these, a request or a gap says so.
- Whether the ideals of relations of the two GL₃ charts are radical. The script counts points; the minimal primes and their dimensions are confirmed.

## Corrections that change the mathematics

1. **`R08.4/resolution-local-structure`** (and `R08.4/components-via-special-fibre`). The node put "reduced, normal, rational singularities" on the fibre of Kisin's resolution over the closed point of Spec R^v. Kisin's (2.4.6)(2) is about the reduction modulo a uniformiser. For the fibre over the closed point the claim is false: for p = 3, a totally ramified extension of degree 7 and the φ-module with φ(e₁) = e₁, φ(e₂) = u·e₂, that fibre is a connected curve with two components. The two fibres are now named separately, and the example is an acceptance check.
2. **`L7/gl3-explicit-rings`**. The statement and one API item said that R̄^τ_ρ̄ is formally smooth over the explicit ring. Diagram (3.9) says this for the ring with framing and gauge basis, which is a power series ring in 3f variables over R̄^τ_ρ̄ and formally smooth of relative dimension 9 over the explicit ring. The node's version fails for f ≥ 4 on dimensions alone (9 + 3f < 6f). Corrected, with the hypothesis that ρ̄ is semisimple and the convention τ = τ(s, μ) for the structure constants, which differs by η from the convention of the prerequisite node.
3. **`L7/gl3-pcris-deformation-rings`, `L7/gl3-component-labelling`**. The proof outline of LLHLM Theorem 3.5.3 was "induction on the shape". The source's proof uses a weak minimal patching functor, built by globalising ρ̄, and a multiplicity comparison; so does the existence of the primes labelled by Serre weights. This global input was nowhere in the plan. It is now in both proof outlines and is a **new gap**; the statements for shapes of length greater than one are local and are separated out.
4. **`L7/kisin-modules-tame-descent`**. The set-up was wrong in three places (f′ = f·r with r the order of s_τ, so 2f was missing; L′ is totally ramified over K′, not K; the ring is a power series ring in u′ with v = (u′)^{e′}), and the change-of-eigenbasis formula could not be right, because Proposition 3.2.1 forces a twist. A hypothesis and a test, introduced by the previous review, said that a type that is not 1-generic does not give a zero ring; Theorem 3.5.3 says it does when ρ̄ is 10-generic and semisimple. Corrected, and the request to R07.4 was corrected with it.
5. **`R08.2/level-raising-local-problems`, `R08.2/rigid-residual-conditions`**. The nodal local model holds only for the even parity of the similitude sign μ. With the matrices of the source's own proof, relation (3.21) reads x₀·((1 + y) − (−1)^μ(1 + x)) = 0; for μ odd this forces x₀ = 0, every lift is unramified and 𝒟^ram has the wrong dimension. The source states the proposition for both parities (new source issue E9); its applications use the even case. The hypothesis is added, and the acceptance check of the rigidity node, which was false without a condition on eigenvalue ratios, is corrected.
6. **The duality step.** A proof step saying that local Tate duality and the Euler characteristic formula are used in the dimension and smoothness count had been appended to 25 nodes, and 42 nodes listed ClassFieldTheory Layer 5 as a prerequisite. In 20 of these the argument uses neither (archimedean, unramified and minimally ramified rings, Taylor–Wiles rings, Kisin's filtered-module, finite-flat and 2-adic arguments, the Fontaine–Laffaille count, exports that only add dimensions). There the prerequisite is removed, with the step where it was present. In the 22 others the step says where duality is used. The request's list of consumers follows.
7. **`L7/finite-height-lattices`**. The API item "nonempty iff V_B has E-height ≤ h" is false for B finite flat over ℤ_p: the unique lattice need not be projective over 𝔖_B (counterexample recorded in the item). The test `height_u_not_finite` is false for p = 2, where φ(u⁻¹e) = u⁻¹e; it is restated for p odd with a real argument.
8. **`R08.4/rank-two-bt-components`**. The acceptance example was wrong: over ℚ_p(ζ_p) the trivial representation has no non-ordinary finite flat model. Replaced by the correct description and an example with e = 2(p − 1).
9. **Khare–Wintenberger nodes.** `R08.4/finite-cocycles-kummer` lacked k(ρ̄_v) ≤ p, without which its rank statement fails at k = p + 1. `R08.6/serre-weight-crystalline-lift` had dropped p ≥ 3 and the shape of ρ̄_p, and its added clause was false for a general reducible ρ̄_p. `R08.6/kw1-lift-types` had dropped "k(ρ̄) = 2 if p = 2". `R08.6/dyadic-weight-two-transition` identified the k = 2 ring with Kisin's flat connected ring, which is wrong for reducible ρ̄_v. `R08.6/newton-thorne-local-quotients` cited the wrong paper of Kisin and routed only to p > 2 nodes. `R08.5/weight-p-crystalline-ordinarity` had an extra p ≥ 3 that excluded a case another node needs.
10. **`R08.2/taylor-wiles-block-condition`**. The comparison with the rank-two Taylor–Wiles ring was wrong: in the block condition the determinant is ψ_v on inertia, so an unramified determinant leaves only unramified lifts. The comparison is by a twist with a square root of ψ_v.
11. **`R08.2/dotto-division-algebra-cycles`**. The cycle groups were indexed one too low (they are indexed by dimension), and τ_s and k′ were undefined.
12. **`L7/g-valued-ordinary-condition`**. The node extended FKP's definition to disconnected G, where the canonical torus is not defined; and the comparison with `L7/ordinary-of-weight-lambda` holds only after a change of weight, now stated.
13. **Conventions.** Several nodes quoted Hodge–Tate weights, determinants or Lubin–Tate characters in a source's convention HT(ε) = −1 without saying so, against the roadmap's HT(ε) = +1 (`R08.3/fixed-determinant-pst-rings`, `R08.4/bt-ring-unique-generalisation`, `L7/local-model-rho-nm0`, `L7/semistable-ordinary-quotient`, `L7/weight-zero-crystalline-connectedness`, `R08.6/newton-thorne-local-quotients`). Each now names the convention. `L7/ordinary-ring-with-frobenius-eigenvalue` used a character χ it never defined, and carried a congruence on n that the source does not have.

Other corrections of substance, each in the ledger: `L7/ordinary-flag-scheme-local-structure` (a ratio inverted), `L7/gsp4-flat-ordinary-smoothness` (the proof written out for the Siegel parabolic), `L7/gsp4-borel-ordinary-conditions` (an API item with the inclusion of problems the wrong way round), `L7/gsp4-ordinary-regularity` (a weight argument that did not prove the case it was used for), `L7/gsp4-ordinary-weight-two-components` (surjective, not dominant), `R08.2/steinberg-ring-domain` (a hypothesis that is not Thorne's), `R08.2/gsp4-unipotent-local-models` (five components, not four), `L7/connects-relation`, `L7/partition-ring-smooth-points`, `L7/semisimple-kisin-modules-and-shapes`, `R08.5/rank-two-connected-components`, `R08.5/ordinary-deformations-p2`, `R08.3/filtered-phi-N-deformations`, `R08.1/phi-gamma-module-deformation-rings` (a dimension), `R08.1/lambda-presentation`, `R08.3/g-valued-pst-rings`.

## Baseline audit at the pinned commits

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration was opened at the cited module in a checkout at the pin. No citation was removed or replaced.

| Declaration | Module | Found | Provides what the nodes need |
| --- | --- | --- | --- |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | yes | yes |
| `mathlib:ProfiniteGrp` | `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean` | yes | yes |
| `tauceti:TauCeti.ContCohomology.H2` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | yes | yes, as an abbreviation; only the additive group, which is what the packet says (the linear structure, duality and the Euler characteristic are requested) |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | yes | yes |
| `mathlib:Matrix.symplecticGroup` | `Mathlib/LinearAlgebra/SymplecticGroup.lean` | yes | yes; defined by A J Aᵀ = J, as the nodes use it |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | yes | yes |
| `mathlib:IsLocalRing.ResidueField` | `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean` | yes | yes |
| `mathlib:PowerSeries.exists_isWeierstrassFactorization` | `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean` | yes | yes; needs the reduction of the series to be non-zero, as the citing node assumes |
| `mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` | `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean` | yes | yes; same hypothesis |

## Closure, granularity, API, tests, planets

- **Stage targets.** Each target of the eight stages, in the atlas text as narrowed by RS-08, is realised by a node. The stages stay `planned`. L7's `remaining` list gains the new gap.
- **Cross-roadmap prerequisites.** All 52 external nodes exist and their statements were read. Three corrections came from this: the R07.4 nodes with coefficients are stated for p ≠ 2 but used here at p = 2 (request extended); `R08.4/components-via-special-fibre` uses the theorem on formal functions, which was not a prerequisite (added); `R08.2/level-raising-local-problems` needs the 𝒢_N-valued framed ring at an inert place, which the global polarized node does not supply (prerequisite added).
- **Proof closure.** After the corrections, every node cited in a proof step is a prerequisite or is marked as a forward reference, and the prerequisite graph is acyclic. Prerequisites that a corrected proof no longer uses were removed.
- **Requests.** 22 requests, none added. Five were made more precise (Layer 5 consumers; κ-coefficient cohomology consumers; R07.4 at p = 2; R07.4 with tame descent, where the set-up was wrong; ClassFieldTheory Layer 7 notation).
- **Gaps.** 10, one new: weak minimal patching functors for GL₃.
- **Granularity.** Target level. No node was split.
- **API and tests.** 247 API items (2 added: the projections of the rigidity predicate for its clauses (3) and (4)) and 162 unit tests. Every definition and construction has at least three tests. Sixteen changes were made to API items and twenty to tests, most because the item stated something false; each is in the ledger.
- **Planets.** 43, at most six per layer. Two were renamed so that they are named from the mathematics and not from a citation ("Khare–Wintenberger local conditions", "Local types of the Khare–Wintenberger lifts").
- **Library audit.** The reviewed audit shows nothing of this roadmap in the libraries, and no node plans a declaration that exists.

## The suggested Lean file

`lean-check research/blueprint/suggested/LocalGaloisDeformationRings.lean` exits 0 at Mathlib `082e2d37e8`: 129 `sorry` warnings and nothing else. Before this review it elaborated with 127. It elaborates 73 of the 247 API items, 54 of the 162 unit tests and 54 of the 114 theorem-type nodes; the rest are in its comment inventory with their statements.

Elaboration had hidden several statements that were false or empty as written. Changes:

- `steinbergRing_isPrime`: `ϖ` is now a uniformiser of a discrete valuation ring (for `ϖ = 0` the flat closure is the unit ideal and the statement was false).
- docstring of `steinbergRing_isPrime`: the sources named.
- `iharaAvoidance_distinct_isPrime`: `ϖ` is a uniformiser of a discrete valuation ring and the `ζ_i` are residually trivial, as in the node.
- `pcris_genericFibre_regular`: `ϖ` is a uniformiser (the generic fibre is `R[1/ϖ]` only then).
- `KWCondition.ring_unique`: `𝒪` is a discrete valuation ring of characteristic zero with uniformiser `ϖ` (for a unit `ϖ` every ideal is saturated and the statement was false).
- `export_archimedean`: the group is now `{1, c}` with `c² = 1` and `ρ̄` odd (the statement was made for an arbitrary group).
- `domain_of_specialFibre_domain`: `𝒪` is a domain (over `ℤ/p²` with `R = 𝒪` the statement was false).
- `fixedDet_pst_krullDim`: the fixed-determinant quotient is assumed nonzero and `𝒪`-flat, which says that `ψ` is the determinant of a crystalline lift of the type (for other `ψ` the quotient is zero or torsion and the equality fails).
- docstring of `fixedDet_pst_krullDim`.
- Replaced `doubling_eq_unramified`, whose conclusion was its own hypothesis, by `doubling_quadratic_free`: the algebraic core of Lemma 3.22(1).
- `Connects.restrict` was the identity statement; it is now the restriction statement for an arbitrary ring map, with its proof.
- docstring of `levelRaising_dims` (it said dimension 2 while the statement says 1).
- docstring of `detFlag_dimension_count`: the proposition is 6.2.12.
- Added the `IsInPol` form of the test `partitionRing_dominance_insufficient`.
- Inventory: 39 entries brought in line with the corrected packet statements; 1 entries of items no longer in the packet removed.
- Inventory headers: "not elaborated in this round" → "not elaborated here".
- docstring of `X_not_dvd_pow`: it shows that the lattice `𝔖e` has no finite height, as the corrected test says; the claim about the other lattices is for `p` odd.
- `tameGroup_not_direct`: the hypothesis is `q ≥ 2`, as in the corrected test.
- `discreteSeries_dimension`: the count is written with `d`, the rank of `r̃_v`, as in the node.
- The example of the same count, with `d`.
- docstring of `rhoNM0Weights`: the sign convention of the weights.
- docstring of the second `rhoNM0Weights`: the sign convention.
- Section heading without the reference to a round of work.
- Section heading without the reference to a round of work.

## Source issues

| Id | Source | Kind | Verdict | Reason in brief |
| --- | --- | --- | --- | --- |
| E1 | SAVITT-2005 | error | confirmed | Read in arXiv v3, Remark 1.7: the author reports the error of the published Theorem 6.12(4) at i = 1. The published text was not read. Theorems 6.22–6.24, the only ones used, are unaffected. |
| E2 | CHT08 | error | confirmed | Read on the page images of pp. 37 and 39. The printed condition excludes the wrong ratio; the proofs of Lemmas 2.4.7 and 2.4.8 need the other one. The count 5 against 4 for ω ⊕ 1 was redone. |
| E3 | GEE-MLT-2022 | error | confirmed | The family over 𝒪⟦T⟧ is a valid lift with fixed determinant, so a closed quotient containing its points with N ≠ 0 contains the point with N = 0. Reading the type without N repairs the sentence. |
| E4 | BCGP-2025 | gap | rejected | **Rejected.** The step is a proof by reference to Kisin's Proposition 2.4.4, and the argument referred to applies as it stands, because the unipotent radical of the Siegel parabolic is abelian. The node writes it out. A second claim of the entry was an artefact of text extraction. |
| E5 | DOTTO-2025 | misprint | confirmed | Shotton's l is Dotto's ℓ; the hypothesis needed is on the coefficients. The same slip is in Dotto's introduction (p. 217), now in the locator. |
| E6 | DOTTO-2025 | misprint | confirmed | Read on p. 244 of the published PDF: the Hom carries the group algebra of GL_n(𝒪_F), and the proof on the same page uses that of 𝒪_D^×. |
| E7 | KW1-2009 | misprint | confirmed | **New.** KW I, remark after Theorem 5.1: its conclusion that the case i = j + 1 never occurs fails for q = 2, p = 3. |
| E8 | CHT08 | misprint | confirmed | **New.** CHT, proof of Lemma 2.4.28: the four terms of the count are printed with m where the rank d of r̃_v is meant. The sum is unaffected. |
| E9 | LTXZZ-RIGID-2021 | error | confirmed | **New.** LTXZZ companion, Proposition 3.5.2: false for μ odd, by the matrix identity of its own proof. Scoped to arXiv v1; the published version was not read. |
| E10 | KISIN-PST-2008 | gap | confirmed | **New.** Kisin 2008, Corollary (1.7)(2): "free" where the proof gives projective of constant rank. Scoped to the author's DVI. |

For the four new entries the search for an existing correction is recorded in each entry (arXiv version lists, journal pages, a web search on 8 October 2026); none was found. Mistakes of the sources that reviewed paper extractions already record are cited from the nodes by their extraction ids and are not repeated here (Khare–Wintenberger II E4 and E33, Calegari–Geraghty 2018 E89, E92, E93 and E172, Boxer–Calegari–Gee–Pilloni 2021 E95 and E102, the LLHLM table misprints). The wording of E1, E3, E4 and E6 was restated in the plan's own words; two of them had carried garbled notation from text extraction.

## The five red-team findings

| Finding | What the plan does | Checked |
| --- | --- | --- |
| RT-AREA-langlands-2/14 | `R08.3/pst-quotient-in-families` states Kisin's (2.5.5), (2.7.6), (2.7.7) over an arbitrary complete local base; a restructure record proposes the link R08.3 → R19.5 and the node there. | The statement was read against Kisin; one word corrected (the module is the contravariant one). The link is the maintainer's to apply. |
| RT-AREA-langlands-2/16 | Nodes cite ClassFieldTheory Layer 5 for local duality and the Euler characteristic; the link Layer 5 → R08.1 is requested. | The fix had been applied too widely: 20 nodes cited the layer without using it. Now exactly the nodes whose arguments use duality cite it, and each says where. |
| RT-AREA-langlands-2/17 | R06.4 is the single owner of KW II Lemma 3.5 including the Berger–Li–Zhu case; R08.5 imports it by request. | Confirmed. The restriction to F_v = ℚ_p is now stated accurately: only the identification "crystalline of weight p + 1 = ordinary" needs it. |
| RT-AREA-langlands-2/18 | R08.3 owns potentially semistable rings in every rank; L7 keeps what R08.3 does not contain, and its integral categories are wrappers around R07.3 and R07.4. | Confirmed in the nodes and in the restructure record. |
| RT-AREA-langlands-2/22 | The uses of the ACC+ §6.2 nodes name PotentialAutomorphyInfrastructure PA.3; links L7, L8, G8 → PA.3 are proposed. | Confirmed. |

## What the previous review asked for

- **The reader was to be brought in line** (nine places listed). Done by the revision and checked here mechanically: every node section of the reader is the rendering of its packet node, before my corrections and after.
- **The 28 nodes it could not verify.** The revision restated them from the sources; 15 of them changed in the revision and 13 rest on requests or gaps that it wrote. In this review all 28 were read against the sources. Twenty-seven are corrected and one is verified as it stood; none remains unverifiable. Where an input is still missing from the atlas, a request or gap names it.
- **Its orchestrator decisions 2–4** (owners for the local-model and generic-reducedness inputs, the Colmez–Fontaine proof, the Geraghty and rank-four inputs, the Booher hypotheses, the canonical torus, the Dotto cycle map) are answered in the packet by nodes, requests, gaps or restructure records, all read here.
- **One correction of the previous review was itself wrong.** It replaced "a non-generic type gives a zero ring" in `L7/kisin-modules-tame-descent` by the opposite, with a counterexample whose ρ̄ is not generic. The source's theorem is the first statement, under the hypothesis that ρ̄ is 10-generic and semisimple. The node now says that.
- **One over-correction of the previous review**, on `R08.3/pst-deformation-ring`, had already been repaired by the revision; the repaired statement agrees with Kisin's (2.7.6) and (2.7.7).

## The reader document

Regenerated from the corrected packet: all node sections, the dependency list, the coverage lines, the gaps, the structure proposals, the planets and the list of sources. The authored prose was read and corrected where it restated something the packet no longer says. Two further changes: the section listing how each red-team finding was handled is now a section on ownership and consumers that says the same things without reference to the process, and the section on mistakes in the sources is rewritten from the packet's entries. In the reader as reviewed that section still quoted the sources' sentences, which the packet had already replaced by descriptions.

References to rounds of work were also removed from node fields, source reading records and Lean headings (checkpoint numbers, session names, "red-team finding", "was read here").

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0, `sorry` warnings only.
- `python3 research/blueprint/intake.py check-files` on the five changed files: passed.
- Reader against packet: all 157 node sections equal the rendering of the packet.

## Questions for the orchestrator

1. **Patching functors.** LLHLM's GL₃ structure theorem for shapes of length at most one, and the labelling of components by Serre weights, need a weak minimal patching functor. No roadmap plans patching functors with Serre-weight coefficients. Either a roadmap takes them, or L7 narrows these two nodes to the shapes of length greater than one, which are local. The gap states what a supplier would have to provide.
2. **The even-parity restriction in level raising.** Source issue E9 is against arXiv v1 of the LTXZZ companion. The published version (Acta Math. Sin. 2024) could not be obtained; someone with access should compare Proposition 3.5.2 there.
3. **E4.** I rejected it as a mistake of the source; the node that writes the argument out stays. If the maintainer prefers to keep proofs by reference to an analogous argument on the register as gaps, the entry's text is ready and only the verdict changes.
4. **Kisin modules with tame descent.** The change-of-eigenbasis formula is now requested from R07.4 with the rest of the descent data, because it could not be settled from LLHLM 2020 alone. The R07.4 blueprint should take it from LLHLM18.
5. **Size of this review's corrections.** They are in place and the plan is accepted, but 122 corrected nodes is a lot for one pass. A red team on L7 (the GL₃ and GSp₄ nodes) would be the best use of further checking.

## Sources read

Public versions only. URLs and hashes are those of the packet's `sources` and `sourceVersions`; the files fetched for this review have the recorded hashes.

| Source | Opened at |
| --- | --- |
| GEE-MLT-2022 | <https://arxiv.org/pdf/2202.05818v2> |
| KISIN-LECTURES | <https://people.math.harvard.edu/~kisin/notes/notes.pdf> |
| TUNG-2021 | <https://arxiv.org/pdf/1908.06174v3> |
| CHT08 | <https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf> |
| TAYLOR-II-2008 | <https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf> |
| KISIN-PST-2008 | <https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf> |
| KW2-2009 | <https://www.math.ucla.edu/~shekhar/papers/proofs.pdf> |
| KISIN-FFLAT-2009 | <https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi> |
| SAVITT-2005 | <https://arxiv.org/pdf/math/0404327v3> |
| ACC-POTENTIAL-AUTOMORPHY-CM-2023 | <https://arxiv.org/pdf/1812.09999v2> |
| SKINNER-WILES-1999 | <http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf> |
| KISIN-2ADIC-2009 | <https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi> |
| BIP-2023 | <https://arxiv.org/abs/2110.01638> |
| PQ-2026 | <https://arxiv.org/abs/2404.14622> |
| CG-2018 | <https://arxiv.org/abs/1207.4224> |
| BCGP-2021 | <https://arxiv.org/abs/1812.09269> |
| BHS-2019 | <https://arxiv.org/abs/1702.02192> |
| DING-2025 | <https://arxiv.org/abs/2407.21237> |
| LTXZZ-2022 | <https://arxiv.org/abs/1912.11942> |
| LTXZZ-RIGID-2021 | <https://arxiv.org/abs/2108.06998> |
| NT-2026 | <https://arxiv.org/abs/2212.03595> |
| CG-2020 | <https://arxiv.org/abs/1907.08691> |
| FKP-2022 | <https://arxiv.org/abs/2008.12593> |
| BCGP-2025 | <https://arxiv.org/abs/2502.20645v1> |
| KISIN-PST-2008-AMS | <https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/> |
| CDN-2023 | <https://arxiv.org/abs/2204.11214> |
| BCDT-2001 | <https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/> |
| CN-2023 | <https://arxiv.org/abs/2301.10509v3> |
| KW1-2009 | <https://www.math.ucla.edu/~shekhar/papers/results.pdf> |
| BLGGT-2014 | <https://arxiv.org/abs/1010.2561> |
| BCGNT-2025 | <https://arxiv.org/abs/2309.15880> |
| BCG-2025 | <https://arxiv.org/abs/2309.15944> |
| LLHLM-2020 | <https://arxiv.org/abs/1608.06570> |
| CT-2017 | <https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf> |
| SHOTTON-2018 | <https://arxiv.org/pdf/1608.01784v2> |
| THORNE-2015 | <https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download> |
| GERAGHTY-2019 | <https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf> |
| BOOHER-2019 | <https://arxiv.org/pdf/1807.10743> |
| DOTTO-2025 | <https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf> |
| BELLOVIN-GEE-2019 | <https://arxiv.org/pdf/1708.04885> |

## Per-node verdicts

| Node | Verdict | Note |
| --- | --- | --- |
| `R08.1/local-lifting-ring` | corrected | Checked against GEE-MLT-2022, KISIN-LECTURES. Corrected: Typo. |
| `R08.1/local-tangent-obstruction` | corrected | Checked against GEE-MLT-2022, KISIN-LECTURES. Corrected: Reworded the duality step to state the dependency without a reference to the review process. |
| `R08.1/local-fixed-determinant` | corrected | Checked against GEE-MLT-2022. Corrected: Reworded the duality step to state the dependency without a reference to the review process. |
| `R08.1/local-forget-framing` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-LECTURES, GEE-MLT-2022 at the cited places; no change needed. |
| `R08.1/archimedean-rings-p-odd` | corrected | Checked against TUNG-2021. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). The formal smoothness for odd p is stated in KW II Proposition 3.3, not in Tung's proposition. |
| `R08.1/archimedean-odd-ring-p2` | verified | Statement, hypotheses, proof outline and locators checked against TUNG-2021 at the cited places; no change needed. |
| `R08.1/local-residue-field-change` | corrected | Checked against GEE-MLT-2022, BLGGT-2014. Corrected: The cited place in Gee only fixes the setting. |
| `R08.2/tame-splitting` | corrected | Checked against CHT08. Corrected: The order condition is on inertia. |
| `R08.2/unramified-lifting-ring` | corrected | Checked against GEE-MLT-2022, CHT08. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/minimally-ramified-condition` | corrected | Checked against CHT08. Corrected: T_q is ℤ_p ⋊ Ẑ. |
| `R08.2/minimally-ramified-ring` | corrected | Checked against CHT08. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/unrestricted-away-from-p` | corrected | Checked against CHT08, GEE-MLT-2022, TUNG-2021, BLGGT-2014. Corrected: Reworded the duality step to state the dependency without a reference to the review process. Tung's lemma is for GL₂ with fixed determinant. Cited the general-n statement directly. |
| `R08.2/inertial-type-quotient` | corrected | Checked against GEE-MLT-2022, SHOTTON-2018. Corrected: Shotton's Proposition 3.6 is for rings without fixed determinant. |
| `R08.2/taylor-wiles-local-ring` | corrected | Checked against GEE-MLT-2022. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/steinberg-condition` | verified | Statement, hypotheses, proof outline and locators checked against TAYLOR-II-2008, GEE-MLT-2022 at the cited places; no change needed. |
| `R08.2/ihara-avoidance-components` | corrected | Checked against TAYLOR-II-2008, GEE-MLT-2022, NT-2026, THORNE-2015. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). Part (4) without p > n is Thorne §3.3.4 / Proposition 3.17. |
| `R08.3/hodge-and-galois-types` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-PST-2008 at the cited places; no change needed. |
| `R08.3/semistable-height-quotient` | corrected | Checked against KISIN-PST-2008. Corrected: Gave the map (2.4.3) whose Galois compatibility defines the quotient. |
| `R08.3/hodge-type-components` | corrected | Checked against KISIN-PST-2008. Corrected: Lemma (2.6.1) is about the steps of the filtration, not the graded pieces. Follows the source, which compares the steps of the filtration. The description is for K = ℚ_p. |
| `R08.3/pst-deformation-ring` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-PST-2008, GEE-MLT-2022 at the cited places; no change needed. |
| `R08.3/filtered-phi-N-deformations` | corrected | Checked against KISIN-PST-2008. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). The source asks for a projective associated graded (which makes base change of the filtration well defined), and for N to commute with the descent datum. Restored the hypothesis of Proposition (3.3.1) that A° is formally smooth over the deformation groupoid. (and 1 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to PadicHodgeTheory:R06.3 and gap(s): Colmez–Fontaine proof and inertia-type projection. |
| `R08.3/pst-generic-fibre` | corrected | Checked against KISIN-PST-2008. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pcris-generic-smooth` | corrected | Checked against KISIN-PST-2008, GEE-MLT-2022. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pst-coefficient-change` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-PST-2008 at the cited places; no change needed. |
| `R08.4/flat-deformation-condition` | corrected | Checked against KISIN-FFLAT-2009. Corrected: For ramified K the characters are powers of the fundamental character of K. |
| `R08.4/finite-flat-model-moduli` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-FFLAT-2009 at the cited places; no change needed. |
| `R08.4/small-ramification-flat` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-FFLAT-2009 at the cited places; no change needed. |
| `R08.4/flat-generic-fibre` | corrected | Checked against KISIN-FFLAT-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/hodge-type-resolution` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-FFLAT-2009 at the cited places; no change needed. |
| `R08.4/resolution-local-structure` | corrected | Checked against KISIN-FFLAT-2009. Corrected: The statement put Proposition (2.4.6)(2) on the fibre over the closed point of Spec R^v. The comparison is through a third ring formally smooth over both, not a map from one ring to the other. Named the right fibre. (and 1 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Pappas–Rapoport local models for Res_{K/ℚ_p} GL_d are not planned anywhere. |
| `R08.4/components-via-special-fibre` | corrected | Checked against KISIN-FFLAT-2009. Corrected: Added the prerequisite that step 2 uses: H⁰ of a proper scheme over a complete local ring is the limit over the infinitesimal neighbourhoods of the closed fibre (theorem on formal functions). Named the result used (formal functions) and its supplier. Said which fibre 𝒢ℛ^{v,loc}_0 is. (and 2 further change(s), listed in the report). |
| `R08.4/ordinary-type-of-components` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-FFLAT-2009 at the cited places; no change needed. |
| `R08.4/rank-two-nonordinary-connected` | corrected | Checked against KISIN-FFLAT-2009. Corrected: Reworded reading-history narrative as a statement of scope. Gee removed the restriction only for residual representations with trivial image. The residual shapes are in terms of the fundamental characters of K, not the cyclotomic character. |
| `R08.4/rank-two-ordinary-locus` | corrected | Checked against KISIN-FFLAT-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/rank-two-bt-components` | corrected | Checked against KISIN-FFLAT-2009, CN-2023. Corrected: The example was wrong: for K = ℚ_p(ζ_p) and trivial V_𝔽 there are no non-ordinary points. The "exactly when" holds only in the cases (i) and (ii). |
| `R08.4/savitt-weight-two-rings` | corrected | Checked against SAVITT-2005. Corrected: The two shapes are not always irreducible: at i = 1 and i = p they degenerate to niveau one. Dropped the label "irreducible" (see the correction of the explicit list). Locator: the three theorems are on p. 42 of arXiv v3. |
| `R08.6/smooth-resolution-criterion` | corrected | Checked against KW2-2009. Corrected: Flatness comes from the injectivity in (1), as in the source. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to DeformationAndDerivedPatchingAlgebra:R03.3. |
| `R08.6/kw-local-conditions` | corrected | Checked against KW2-2009. Corrected: Renamed the planet: authors spelled out instead of the abbreviation of a paper. KW II §3.2.2 requires F_v = ℚ_p at k(ρ̄_v) = p + 1 only for the crystalline lifts. Definition 3.4(2) asks only that an open subgroup of inertia act by χ_p^a. (and 2 further change(s), listed in the report). |
| `R08.6/export-archimedean` | verified | Statement, hypotheses, proof outline and locators checked against KW2-2009 at the cited places; no change needed. |
| `R08.6/export-fontaine-laffaille-irreducible` | verified | Statement, hypotheses, proof outline and locators checked against KW2-2009 at the cited places; no change needed. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Endpoint crystalline classification and KW ordinarity input. |
| `R08.6/export-weight-two-irreducible` | corrected | Checked against KW2-2009. Corrected: Added the range 3 ≤ k(ρ̄_p) ≤ p and named the type. Recorded why the range of k is needed, with the extraction issue that records the source's slip. |
| `R08.6/export-ordinary` | corrected | Checked against KW2-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). The reference [13] of KW II is Conrad–Diamond–Taylor. For a sum of two distinct unramified characters there are two stable lines. (and 1 further change(s), listed in the report). |
| `R08.6/export-semistable-weight-two-at-p` | corrected | Checked against KW2-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). Added the standing hypothesis that F_v/ℚ_p is unramified, which the dichotomy uses (for ramified F_v ⊇ ℚ_p(μ_p) and p odd, D_v can act by homotheties). |
| `R08.6/export-endpoint-weight` | corrected | Checked against KW2-2009. Corrected: Replaced the generic duality step by the exact use (cup product with the très ramifiée class). The hypothesis misdescribed the source: only the identification crystalline = ordinary is restricted to ℚ_p. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to Tau Ceti ClassFieldTheory and gap(s): Endpoint crystalline classification and KW ordinarity input. |
| `R08.6/export-away-from-p` | corrected | Checked against KW2-2009. Corrected: Replaced the generic duality step by the exact use, and cited the node that proves the count. Added the missing prerequisite: (a) uses the cocycle count proved in R08.5/twisted-semistable-away-from-p. Recorded the particular case of KW II §3.3.2. |
| `R08.6/export-completed-tensor-product` | corrected | Checked against KW2-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/local-nonemptiness` | corrected | Checked against KW2-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `L7/finite-height-lattices` | corrected | Checked against KISIN-PST-2008. Corrected: The stated reason only shows that the lattice 𝔖e has no finite E-height. Same correction as in the test height_u_not_finite. The equivalence "nonempty iff V_B has E-height ≤ h" was false for B finite flat over ℤ_p: the unique lattice need not be projective over 𝔖_B. (and 5 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4. |
| `L7/height-lattice-moduli` | corrected | Checked against KISIN-PST-2008. Corrected: Recorded the difference from the printed statement (free versus projective). Injectivity on E[ε]-points gives injectivity on tangent spaces. The acceptance check overreached (it is not a statement about every A, and the converse for h ≤ 1 is false for a given G_K-action). (and 1 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to AlgebraicModuliForArithmeticGeometry:R09.1. |
| `L8/ordinary-coefficient-ring` | corrected | Checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023. Corrected: The group is the inertia subgroup of the abelianised Galois group, as in ACC+. Same notation. |
| `L7/ordinary-flag-scheme` | corrected | Checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023. Corrected: Removed the reference to the review process from the use record. |
| `L7/ordinary-flag-scheme-local-structure` | corrected | Checked against GERAGHTY-2019, THORNE-2015. Corrected: Restated a quoted phrase of the source in our own words. Corrected the proof step: the graded characters of (ad V_x/Fil¹ad V_x)(ε) are χ_rχ_s^{−1}ε (r ≥ s), not χ_sχ_r^{−1}ε. Geraghty's functor of pairs carries no condition on the inertial characters. (and 3 further change(s), listed in the report). |
| `L7/geraghty-fixed-weight-ordinary-rings` | corrected | Checked against GERAGHTY-2019. Corrected: Restated a quoted sentence of the source in our own words. The remark asserts the two cases; no proof is printed. The ring is zero unless the weight character is residually trivial. |
| `L7/trivial-residual-flag-ring` | corrected | Checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023, BCGP-2025, THORNE-2015. Corrected: Removed the reference to the review process from the use record. Ē is an algebraic closure of Frac R (no object of C_𝒪 has algebraically closed fraction field). The 'maximal reduced' definition is Thorne's. (and 3 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `L7/residually-split-nearly-ordinary-ring` | corrected | Checked against SKINNER-WILES-1999. Corrected: The step contradicted the statement: a relation also occurs when ω = 1. |
| `L8/determinant-ordinary-ring` | verified | Statement, hypotheses, proof outline and locators checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023 at the cited places; no change needed. |
| `L8/det-ord-finite` | verified | Statement, hypotheses, proof outline and locators checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023 at the cited places; no change needed. |
| `L8/ordinary-point-criteria` | verified | Statement, hypotheses, proof outline and locators checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023 at the cited places; no change needed. |
| `L8/distinct-characters-flag` | verified | Statement, hypotheses, proof outline and locators checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023 at the cited places; no change needed. |
| `L8/determinant-flag-comparison` | corrected | Checked against ACC-POTENTIAL-AUTOMORPHY-CM-2023. Corrected: Removed the reference to the review process from the use record. The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `L7/fontaine-laffaille-deformation-condition` | corrected | Checked against CHT08. Corrected: Removed the reference to the review process from the use record. With CHT's normalisation the point is the dual Tate module, not T_lE (the sign of the jumps). The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `L7/fontaine-laffaille-tangent-space-and-smoothness` | corrected | Checked against CHT08. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `L7/ordinary-condition-fixed-inertial-characters` | corrected | Checked against CHT08. Corrected: Restated the printed condition in our own words. CHT's indexing is zero-based, with gr^{n−1} the sub. Stated the index reversal between the two flags and the input (uniqueness of the flag) that makes the comparison an equality of rings. (and 2 further change(s), listed in the report). |
| `L7/ordinary-fixed-inertial-characters-smoothness` | corrected | Checked against CHT08. Corrected: Reworded the duality step to state the dependency without a reference to the review process. |
| `L7/discrete-series-deformation-condition` | corrected | Checked against CHT08. Corrected: In the node's notation the coefficient characteristic is l. Notation: the coefficient characteristic is l in this node. Restated a phrase of the source in the plan's own words. |
| `L7/discrete-series-smoothness` | corrected | Checked against CHT08. Corrected: Reworded the duality step to state the dependency without a reference to the review process. Recorded that the count differs from the print (a misprint of the source, now E8). |
| `R08.5/connected-kisin-modules-with-coefficients` | corrected | Checked against KISIN-2ADIC-2009. Corrected: Recorded that the supplier nodes are stated for p ≠ 2 and are requested at p = 2. The rigidification is over A/I (an 𝔽-algebra with no map to 𝔽 in general, e.g. A = 𝔽[T]), not over 𝔽. Said which character the module realises. |
| `R08.5/etale-multiplicative-parts` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-2ADIC-2009 at the cited places; no change needed. |
| `R08.5/connected-model-moduli` | verified | Statement, hypotheses, proof outline and locators checked against KISIN-2ADIC-2009 at the cited places; no change needed. |
| `R08.5/flat-connected-deformation-ring` | corrected | Checked against KISIN-2ADIC-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.5/rank-two-type-v` | corrected | Checked against KISIN-2ADIC-2009. Corrected: Restated a quoted phrase of the source in our own words. The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `R08.5/rank-two-connected-components` | corrected | Checked against KISIN-2ADIC-2009. Corrected: The connectedness of Spec R[1/p] needs ξ of determinant χ and formally smooth over D^{fl,c,χ}. |
| `R08.5/ordinary-deformations-p2` | corrected | Checked against KISIN-2ADIC-2009. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). Proposition 2.4.4 says that the scheme 𝓛^{ord} is formally smooth over W(𝔽), not that the morphism Θ^{ord} is formally smooth. Said over what. (and 1 further change(s), listed in the report). |
| `R08.5/kisin-local-rings-p2-comparison` | corrected | Checked against KISIN-2ADIC-2009. Corrected: The section is written for every p; said so, since R08.6/newton-thorne-local-quotients cites it for all p. |
| `R08.1/coefficient-rings-lambda` | verified | Statement, hypotheses, proof outline and locators checked against BIP-2023 at the cited places; no change needed. |
| `R08.1/lambda-presentation` | corrected | Checked against BIP-2023, PQ-2026. Corrected: The restriction p ∤ d is not in the sources and is not needed. For κ of characteristic p one inverts t. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to Tau Ceti ClassFieldTheory and gap(s): Natural-topology continuous cohomology beyond finite coefficients. |
| `R08.1/completion-at-points` | corrected | Checked against BIP-2023, CG-2018, BCGP-2021, BHS-2019. Corrected: BIP's proposition is for F/ℚ_p and for points of P₁. The regularity criterion is Remark 3.43. |
| `R08.1/smooth-points-generic-fibre` | corrected | Checked against BCGP-2021. Corrected: Made the purity argument precise (with N ≠ 0 several weights occur). |
| `R08.1/rank-one-ring` | verified | Statement, hypotheses, proof outline and locators checked against BIP-2023 at the cited places; no change needed. |
| `R08.1/determinant-twisting` | verified | Statement, hypotheses, proof outline and locators checked against BIP-2023 at the cited places; no change needed. |
| `R08.1/g-valued-framed-ring` | corrected | Checked against PQ-2026, BCGP-2021. Corrected: The source proves representability by Grothendieck's criterion, without using smoothness of G. Marked the forward reference. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to ArithmeticStatistics:ST.5 and gap(s): Integral reductive group scheme and Lie API. |
| `R08.1/g-valued-presentations` | corrected | Checked against PQ-2026, BCGP-2021. Corrected: The unramifiedness of all lifts is under the same vanishing hypothesis. PQ §3.1 assumes G generalised reductive. |
| `R08.1/phi-gamma-module-deformation-rings` | corrected | Checked against DING-2025. Corrected: Corrected the dimension of R_{D,g}: it is 1 + [K:ℚ_p]·n(n−1)/2 (Ding, Proposition 2.10(1)), not n(n−1)/2·[K:ℚ_p] + n. The framed ring is a power series ring over R_D. |
| `R08.2/q-tame-group` | corrected | Checked against LTXZZ-RIGID-2021. Corrected: The condition A ≡ 1 mod 𝔪 covered only ρ̄(t) = 1. Holds for every q ≥ 2. |
| `R08.2/level-raising-local-problems` | corrected | Checked against LTXZZ-RIGID-2021, LTXZZ-2022. Corrected: Added the prerequisite that supplies the lifting ring: the problems are subfunctors of the 𝒢_N-valued lifts of r̄ : Γ_{F⁺_v} → 𝒢_N(k) with fixed similitude (checked in LTXZZ, §3.5: the pair (r̄, χ) has Γ̃ = Γ_{F⁺_v}). Said which lifting ring the problems live in, and what the G7 supplier does and does not provide at an inert place. Added the hypothesis that μ is even: for μ odd the relation (3.21) in the proof of Proposition 3.5.2 forces the monodromy coordinate to vanish, and the nodal structure fails (E9). (and 3 further change(s), listed in the report). |
| `R08.2/unrestricted-ring-complete-intersection` | corrected | Checked against LTXZZ-RIGID-2021, NT-2026, SHOTTON-2018. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). Corrected the title of Shotton's paper. Added the primary source of (1), which the node cited only through Newton–Thorne. (and 2 further change(s), listed in the report). |
| `R08.2/inertial-type-with-monodromy` | corrected | Checked against NT-2026, SHOTTON-2018. Corrected: With no determinant condition the exact-type points are the unramified lifts. As in the acceptance check. |
| `R08.2/fixed-type-rings-rank-n` | verified | Statement, hypotheses, proof outline and locators checked against BCGP-2025, NT-2026 at the cited places; no change needed. |
| `R08.2/rank-two-unrestricted-rings-cg` | corrected | Checked against CG-2018. Corrected: Merged the two overlapping opening sentences. Lemma 4.11 is in §4.1. Δ comes from the finite field with v, resp. |
| `R08.2/taylor-wiles-local-tangent` | corrected | Checked against CG-2018. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/steinberg-ring-domain` | corrected | Checked against NT-2026, THORNE-2015. Corrected: Removed reading-history narrative. Thorne's Proposition 3.17 has no condition on the power of p dividing q_v − 1. As in the statement. (and 1 further change(s), listed in the report). |
| `R08.2/dotto-division-algebra-cycles` | corrected | Checked against NT-2026, DOTTO-2025, SHOTTON-2018. Corrected: The cycle groups are indexed by dimension (Shotton §2.3, Dotto): the rings R^□_r̄(τ, N) have dimension n² + 1 and their special fibres n², so the groups are Z^{n²+1}(R^□_r̄) and Z^{n²}(R^□_r̄/ϖ). Defined k′ and τ_s, which the statement used without definition. Locator: Shotton's Theorem 4.6 is on p. 17 of arXiv v2. (and 1 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Jacquet–Langlands transfer of types for D^× (inputs to Dotto’s cycle comparison). |
| `R08.2/regular-unipotent-minimally-ramified` | corrected | Checked against CG-2020. Corrected: Stated the implicit hypothesis under which r̄(σ) makes sense. |
| `R08.2/gsp4-ramification-types` | verified | Statement, hypotheses, proof outline and locators checked against CG-2020 at the cited places; no change needed. |
| `R08.2/gsp4-taylor-wiles-lifts` | verified | Statement, hypotheses, proof outline and locators checked against BCGP-2021 at the cited places; no change needed. |
| `R08.2/gsp4-unipotent-local-models` | corrected | Checked against BCGP-2021. Corrected: There are five components for four strata: the rank-two part has two. |
| `R08.2/gsp4-ihara-avoidance-rings` | corrected | Checked against BCGP-2021. Corrected: Defined R̃_v^χ, which the statement used without definition. |
| `R08.2/g-valued-generic-fibre-away-from-p` | corrected | Checked against FKP-2022, BOOHER-2019, BELLOVIN-GEE-2019. Corrected: The fixed similitude κ^{1−2n} must lift the residual one (a hypothesis of FKP Proposition 9.1; Booher allows any lift of the residual similitude). Added the locator of (3). The general theorem is for GSp_m and GO_m only. (and 4 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `R08.2/equal-characteristic-local-lifts` | corrected | Checked against FKP-2022. Corrected: The existence of a local lift needs only ℓ ≠ p. Added the locator of the last sentence of the statement. |
| `R08.2/reducible-lifts-prescribed-determinant` | verified | Statement, hypotheses, proof outline and locators checked against FKP-2022 at the cited places; no change needed. |
| `R08.2/ihara-avoidance-rings-p2` | verified | Statement, hypotheses, proof outline and locators checked against BCGP-2025 at the cited places; no change needed. |
| `R08.3/pst-quotient-in-families` | corrected | Checked against KISIN-PST-2008-AMS. Corrected: Removed the reference to the review process. The module is the contravariant one. |
| `R08.3/g-valued-pst-rings` | corrected | Checked against FKP-2022, BELLOVIN-GEE-2019. Corrected: Bellovin–Gee take G reductive, not necessarily connected. Stated the characterising property as in the source (on finite local E-algebras) and where reducedness comes from. Stated Theorem 3.3.3 as read (any v; reduced, local complete intersection). (and 3 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Integral reductive group scheme and Lie API. |
| `R08.3/weil-deligne-type-ring` | corrected | Checked against CDN-2023. Corrected: Added the determinant and marked which direction is not at the cited locator. |
| `R08.3/bcdt-type-rings` | verified | Statement, hypotheses, proof outline and locators checked against BCDT-2001, KISIN-PST-2008-AMS at the cited places; no change needed. |
| `R08.3/fixed-determinant-pst-rings` | corrected | Checked against CN-2023. Corrected: Added the sign convention of the source for the weight of ψ. |
| `R08.4/finite-cocycles-kummer` | corrected | Checked against KW2-2009. Corrected: Removed the reference to the review process. Added the hypothesis 2 ≤ k(ρ̄_v) ≤ p and said what Ξ is on inertia for k > 2. The Kummer description is for k = 2. (and 1 further change(s), listed in the report). |
| `R08.4/kw-algebraisation-lemma` | verified | Statement, hypotheses, proof outline and locators checked against KW2-2009 at the cited places; no change needed. |
| `R08.4/bt-ring-unique-generalisation` | corrected | Checked against CN-2023. Corrected: Stated the convention: with HT(ε) = +1 a representation of determinant ε^{-1} has weights {0, −1}. |
| `R08.5/weight-p-crystalline-ordinarity` | corrected | Checked against KW2-2009. Corrected: Removed the reference to the review process. KW II Lemma 3.5 has no restriction on p, and the case p = 2, k = 2 is needed by R08.6/export-ordinary. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to PadicHodgeTheory:R06.4 and gap(s): Endpoint crystalline classification and KW ordinarity input. |
| `R08.5/weight-p-plus-one-ordinary-ring` | corrected | Checked against KW2-2009. Corrected: Removed the reference to the review process. The hypothesis misdescribed the source. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to PadicHodgeTheory:R06.4, Tau Ceti ClassFieldTheory and gap(s): Endpoint crystalline classification and KW ordinarity input. |
| `R08.5/semistable-weight-two-resolution` | verified | Statement, hypotheses, proof outline and locators checked against KW2-2009 at the cited places; no change needed. |
| `R08.5/dyadic-minimal-lifts` | corrected | Checked against KW2-2009, KW1-2009. Corrected: γ takes values in a field of characteristic 2, so its order is odd. Uniqueness is for the lift of the restriction to inertia, not for ρ₀. |
| `R08.5/twisted-semistable-away-from-p` | verified | Statement, hypotheses, proof outline and locators checked against KW2-2009 at the cited places; no change needed. |
| `R08.5/kw1-endpoint-weight-rings` | corrected | Checked against KW1-2009. Corrected: The ordinary crystalline weight-two lifts at p = 2 are the rings of R08.5/ordinary-deformations-p2 (Kisin §2.4), which the node did not cite. Added the prerequisite for the ordinary case at p = 2. The homothety case does not occur for F_v = ℚ₂ and k(ρ̄) = 4. (and 2 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `R08.6/kw1-lift-types` | corrected | Checked against KW1-2009. Corrected: Renamed the planet: a name of the object, not a source locator. Added the global hypotheses of the theorem. Type (1) assumes k(ρ̄) = 2 when p = 2; without it the node claimed a crystalline lift of weight 4 at p = 2. (and 2 further change(s), listed in the report). |
| `R08.6/good-dihedral-type` | corrected | Checked against KW1-2009. Corrected: KW I state that i = j + 1 does not occur. The list of pairs (i, j) is given by the source for p = 2 as well. Completed the Serre-weight statement of Theorem 5.1(4). (and 1 further change(s), listed in the report). |
| `R08.6/dyadic-weight-two-transition` | corrected | Checked against KW2-2009, KW1-2009. Corrected: KW II does not identify the k = 2 ring with Kisin's flat connected ring, and for reducible ρ̄_v that comparison is wrong. Routed the k = 2 case to the nodes that state KW II's rings. Added the prerequisite that the corrected proof step cites for k = 2, ρ̄_v irreducible. (and 2 further change(s), listed in the report). |
| `R08.6/ordinary-pcris-lifts-reducible` | verified | Statement, hypotheses, proof outline and locators checked against FKP-2022 at the cited places; no change needed. |
| `R08.6/serre-weight-crystalline-lift` | corrected | Checked against FKP-2022. Corrected: Restored the hypotheses of FKP Lemma 7.2 (p ≥ 3, ρ̄_p an extension of the trivial character by χ̄). Removed a reference to the review process. Added the case showing why the shape of ρ̄_p is needed. |
| `R08.6/newton-thorne-local-quotients` | corrected | Checked against NT-2026. Corrected: Added the sign convention of the source. Notation of the archimedean ring. Named the paper. (and 5 further change(s), listed in the report). |
| `R08.6/torsion-semistable-condition` | corrected | Checked against NT-2026. Corrected: The extension had sub and quotient interchanged, and the character is trivial. |
| `R08.6/category-deformation-conditions` | corrected | Checked against BCDT-2001. Corrected: Repaired a garbled clause. The count is Ramakrishna's, for p odd. |
| `L7/ordinary-of-weight-lambda` | corrected | Checked against NT-2026, BCGP-2025, CN-2023. Corrected: Restricted the comparison with R06.4's ordinary representations to parallel weights (that notion uses powers of ε), and said how semistability is obtained in general. Made the use of the supplier precise (parts (a)–(b), not the parallel-weight statement (c)). The inequality holds only for λ_{τ,n} ≥ 0. (and 1 further change(s), listed in the report). |
| `L7/semistable-ordinary-quotient` | corrected | Checked against CN-2023. Corrected: Named the convention in which the weights increase (the node L7/ordinary-of-weight-lambda uses the opposite sign). |
| `L7/g-valued-ordinary-condition` | corrected | Checked against FKP-2022. Corrected: FKP Appendix B takes G split connected reductive. The comparison with L7/ordinary-of-weight-lambda holds only after the change of weight λ_{τ,j} = −(λ′_{τ,n+1−j} + j − 1). Added the weight dictionary. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to Tau Ceti ReductiveGroups and gap(s): Ordinary weight and canonical torus comparison. |
| `L7/g-valued-ordinary-quotient` | corrected | Checked against FKP-2022. Corrected: Named the extra generators accurately: ψ runs over a basis of X*(T₀), not over central characters. The claim that the generators "must be added" was overstated: on the generic fibre of the Hodge-type quotient the condition is automatic. On the Hodge-type quotient the equations hold after inverting p. (and 2 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Ordinary weight and canonical torus comparison. |
| `L7/g-valued-ordinary-components` | corrected | Checked against FKP-2022, BCG-2025. Corrected: The vanishing holds because the module is trivial, not because λ is regular. Barnet-Lamb–Calegari–Gee use Lemma B.4 for GSp_n and GO_n, not GL_n. |
| `L7/snowden-ordinary-ring-trivial-residual` | corrected | Checked against CN-2023. Corrected: Added the sign convention of the source. |
| `L7/ordinary-ring-with-frobenius-eigenvalue` | corrected | Checked against CG-2018. Corrected: Defined χ (the node used it without definition; CG18 take χ = εω^{−1}) and said that n is the weight. R^univ is the local framed ring, not a global ring. The condition n ≡ 1 mod p − 1 is not in the source and is not needed with χ = εω^{−1} (it would exclude n = 2). |
| `L7/eigenvalue-ring-normal-cm-type-three` | verified | Statement, hypotheses, proof outline and locators checked against CG-2018 at the cited places; no change needed. |
| `L7/gsp4-siegel-ordinary-condition` | verified | Statement, hypotheses, proof outline and locators checked against CG-2020 at the cited places; no change needed. |
| `L7/gsp4-siegel-ordinary-tangent` | verified | Statement, hypotheses, proof outline and locators checked against CG-2020 at the cited places; no change needed. |
| `L7/gsp4-borel-ordinary-conditions` | corrected | Checked against BCGP-2021. Corrected: Stated the defining condition of 𝒟^P, which the node only called "the analogous Siegel-parabolic problem". Only the Borel problem is the distinguished case of the flag-incidence scheme. Replaced `BorelOrdinary.toParabolic`, whose direction was wrong (P ⊂ B, so the parabolic problem is a subproblem of the Borel one, and the ring map goes R^B ⊗ Λ_{v,1} ↠ R^P), by `ParabolicOrdinary.toBorel`. |
| `L7/gsp4-ordinary-generic-fibres` | corrected | Checked against BCGP-2021. Corrected: Step (5): only "H² = 0 implies smooth" is used. Added the prerequisite that step (5) now cites. Named the argument that repairs the step. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to Tau Ceti ClassFieldTheory and gap(s): Natural-topology continuous cohomology beyond finite coefficients. |
| `L7/gl2-borel-ordinary-ring` | corrected | Checked against BCGP-2021. Corrected: Remark 7.3.8 does not introduce the variables. The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to Tau Ceti ClassFieldTheory. |
| `L7/gsp4-ordinary-flag-incidence` | corrected | Checked against BCGP-2025. Corrected: Added the hypotheses under which the Borel-ordinary ring is defined. |
| `L7/gsp4-ordinary-regularity` | corrected | Checked against BCGP-2025. Corrected: The weight argument given for case (b) was wrong. |
| `L7/gsp4-flat-ordinary-smoothness` | corrected | Checked against BCGP-2025. Corrected: Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). Restated a quoted phrase of the source in our own words. Rewrote the planned argument so that it is a proof: the previous form (right exactness on each graded piece kills the obstruction) is not valid as stated, since a Selmer-type H¹ that is right exact on graded pieces need not be so on the module and the Borel is not abelian. (and 4 further change(s), listed in the report). |
| `L7/gsp4-ordinary-weight-two-components` | corrected | Checked against BCGP-2025. Corrected: Removed prerequisites that the proof no longer uses (the rank-four input is L7/gsp4-flat-ordinary-smoothness; R07.4 stays, for the finite flatness of lattices in crystalline representations of weights {0, 1}). BCGP25 Lemma 6.2.6 assumes surjectivity onto Spec Λ. Said where the R07.4 prerequisite is used. The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `L7/connects-relation` | corrected | Checked against BLGGT-2014. Corrected: The criterion was false for potentially crystalline characters. |
| `L7/weight-zero-crystalline-connectedness` | corrected | Checked against BCGNT-2025, GERAGHTY-2019. Corrected: Part (4) was false as stated: for V = 1 ⊕ ε^{−1}, V ⊗ V has weights {0, 1, 1, 2} and is ordinary of no weight. Stated the Hodge–Tate convention and the normalisation of the valuation in (3). Proof step for the corrected (4). (and 1 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places. |
| `L7/local-model-rho-nm0` | corrected | Checked against BCGNT-2025. Corrected: Fixed ε₂ by its values: BCGNT do not state ε₂ε′₂ = ε^{-1}, and Barnet-Lamb–Calegari–Gee use the inverse character with the same description. Recorded the sign convention of the weights, which the node used without notice. |
| `L7/kisin-modules-tame-descent` | corrected | Checked against LLHLM-2020. Corrected: Corrected the set-up: f′ = f·r with r the order of s_τ (the value 2f was missing), L′ is totally ramified of degree p^{f′} − 1 over K′ (not over K), and 𝔖_{L′,R} is a power series ring in u′, with v = (u′)^{e′}. Spelled out the type condition (on Δ′, with the dual). The untwisted change-of-basis formula could not be right (Proposition 3.2.1 forces a twist by s_j* v^{μ_j*+η_j*}). (and 8 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4. |
| `L7/semisimple-kisin-modules-and-shapes` | corrected | Checked against LLHLM-2020. Corrected: Restated (2)–(5) as in the source: Proposition 3.3.9 is a criterion, not a classification. The Kisin-variety argument proves (5) only. Added the hypotheses under which the Kisin module exists and is unique. (and 1 further change(s), listed in the report). |
| `L7/gl3-pcris-deformation-rings` | corrected | Checked against LLHLM-2020. Corrected: Added the non-vanishing criterion, which is part of the source's count and proof. Lemma 3.5.4 does not assume ρ̄ generic; added its count of components. Notation: the element is w̃*, not w*. (and 3 further change(s), listed in the report). |
| `L7/gl3-explicit-ring-rows` | corrected | Checked against LLHLM-2020. Corrected: Added the hypothesis that ρ̄ is semisimple. Stated the convention τ = τ(s, μ), and that the primes are ideals of the quotient ring. Restated in the plan's own words. (and 1 further change(s), listed in the report). |
| `L7/gl3-explicit-rings` | corrected | Checked against LLHLM-2020. Corrected: Added the hypothesis that ρ̄ is semisimple (the explicit presentations are those at the semisimple Kisin module) and the convention τ = τ(s, μ). The claim that R̄^τ_ρ̄ is formally smooth over the explicit ring is not in diagram (3.9) and is false for f ≥ 4 (dimension 9 + 3f < 6f). Added "semisimple". (and 8 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as request(s) to FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4. |
| `L7/gl3-component-labelling` | corrected | Checked against LLHLM-2020. Corrected: Added "semisimple" and the convention for (s, μ). Notation: the index set is the i-th component of w̃*, which makes the index reversal consistent. Added "semisimple". (and 4 further change(s), listed in the report). The previous review could not verify this node; the statement is now taken from the source at the cited places, and its missing input is recorded as gap(s): Weak minimal patching functors for GL₃ (global input of LLHLM Theorems 3.5.2, 3.5.3 and Proposition 3.6.1) are not planned anywhere. |
| `L7/partition-monodromy-rings` | corrected | Checked against CT-2017. Corrected: Pol_n((1, …, 1), q) is everything, so the ring is the maximal reduced flat quotient of R^1_v. As in the statement. |
| `L7/partition-ring-smooth-points` | corrected | Checked against CT-2017. Corrected: The step did not follow as written (a closed subscheme through x need not contain the component through x). |
| `L7/away-from-p-rank-n-interface` | corrected | Checked against CT-2017. Corrected: Stated the consumer without the reference to the review process. |
| `L8/doubling-equals-unramified` | verified | Statement, hypotheses, proof outline and locators checked against CG-2018 at the cited places; no change needed. |
| `R08.2/taylor-wiles-block-condition` | corrected | Checked against BCGP-2025. Corrected: The block condition is a twist of the rank-two Taylor–Wiles ring, not equal to it. The comparison as stated was wrong: in the block condition det r on inertia is ψ_v, so an unramified determinant gives only unramified lifts. Corrected the rank-two comparison (twist by a square root of ψ_v). (and 1 further change(s), listed in the report). |
| `R08.2/gsp4-minimal-conditions` | corrected | Checked against CG-2020. Corrected: Definition 4.6 has no clause for type H. Gave the right reason for the order being prime to p. The relation as written is for arithmetic Frobenius. |
| `R08.2/rigid-residual-conditions` | corrected | Checked against LTXZZ-2022. Corrected: Removed a remark about an earlier paraphrase. Added the projection for clause (3). Added the projection for clause (4). (and 2 further change(s), listed in the report). |
| `L7/torsion-crystalline-representations` | corrected | Checked against LTXZZ-2022. Corrected: Marked the Fontaine–Laffaille description as not taken from the cited definition. |

## Change ledger

Every change made to the packet, in the order it was made. The reader and the inventory of the suggested file follow the packet.

| Node or record | Field | Change |
| --- | --- | --- |
| `R08.1/archimedean-rings-p-odd` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.1/archimedean-rings-p-odd` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/unramified-lifting-ring` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/unramified-lifting-ring` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/minimally-ramified-ring` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/minimally-ramified-ring` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/taylor-wiles-local-ring` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/taylor-wiles-local-ring` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/taylor-wiles-local-tangent` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/taylor-wiles-local-tangent` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/ihara-avoidance-components` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/ihara-avoidance-components` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/filtered-phi-N-deformations` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/filtered-phi-N-deformations` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pst-generic-fibre` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pst-generic-fibre` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pcris-generic-smooth` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.3/pcris-generic-smooth` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/flat-generic-fibre` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/flat-generic-fibre` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/rank-two-ordinary-locus` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.4/rank-two-ordinary-locus` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.5/flat-connected-deformation-ring` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.5/flat-connected-deformation-ring` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.5/ordinary-deformations-p2` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.5/ordinary-deformations-p2` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-completed-tensor-product` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-completed-tensor-product` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-ordinary` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-ordinary` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-semistable-weight-two-at-p` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/export-semistable-weight-two-at-p` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/local-nonemptiness` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.6/local-nonemptiness` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `L7/fontaine-laffaille-tangent-space-and-smoothness` | proofSteps | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `L7/fontaine-laffaille-tangent-space-and-smoothness` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `L7/gsp4-flat-ordinary-smoothness` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.2/unrestricted-ring-complete-intersection` | prerequisites | Removed the appended duality step and the ClassFieldTheory Layer 5 prerequisite: this node's argument uses neither local Tate duality nor the Euler characteristic formula (where a prerequisite uses them, that prerequisite carries the Layer 5 dependency). |
| `R08.1/local-tangent-obstruction` | proofSteps | Reworded the duality step to state the dependency without a reference to the review process. |
| `R08.1/local-fixed-determinant` | proofSteps | Reworded the duality step to state the dependency without a reference to the review process. |
| `R08.2/unrestricted-away-from-p` | proofSteps | Reworded the duality step to state the dependency without a reference to the review process. |
| `L7/ordinary-fixed-inertial-characters-smoothness` | proofSteps | Reworded the duality step to state the dependency without a reference to the review process. |
| `L7/discrete-series-smoothness` | proofSteps | Reworded the duality step to state the dependency without a reference to the review process. |
| `R08.6/export-endpoint-weight` | proofSteps | Replaced the generic duality step by the exact use (cup product with the très ramifiée class). |
| `R08.6/export-away-from-p` | proofSteps | Replaced the generic duality step by the exact use, and cited the node that proves the count. |
| `R08.6/export-away-from-p` | prerequisites | Added the missing prerequisite: (a) uses the cocycle count proved in R08.5/twisted-semistable-away-from-p. |
| `(requests)` | ClassFieldTheory Layer 5 | neededBy now lists exactly the nodes whose argument uses duality or the Euler characteristic (22 nodes; 20 removed, L7/ordinary-flag-scheme-local-structure and L7/residually-split-nearly-ordinary-ring added); need reworded without process references. |
| `L7/ordinary-flag-scheme` | uses | Removed the reference to the review process from the use record. |
| `L7/trivial-residual-flag-ring` | uses | Removed the reference to the review process from the use record. |
| `L8/determinant-flag-comparison` | uses | Removed the reference to the review process from the use record. |
| `L7/fontaine-laffaille-deformation-condition` | uses | Removed the reference to the review process from the use record. |
| `L7/away-from-p-rank-n-interface` | hypotheses | Stated the consumer without the reference to the review process. |
| `R08.3/pst-quotient-in-families` | hypotheses | Removed the reference to the review process. |
| `R08.4/finite-cocycles-kummer` | hypotheses | Removed the reference to the review process. |
| `R08.5/weight-p-crystalline-ordinarity` | hypotheses | Removed the reference to the review process. |
| `R08.5/weight-p-plus-one-ordinary-ring` | hypotheses | Removed the reference to the review process. |
| `R08.2/rigid-residual-conditions` | hypotheses | Removed a remark about an earlier paraphrase. |
| `R08.2/steinberg-ring-domain` | hypotheses | Removed reading-history narrative. |
| `R08.4/rank-two-nonordinary-connected` | hypotheses | Reworded reading-history narrative as a statement of scope. |
| `(requests)` | PadicHodgeTheory:R06.4 | Removed the reference to the review process from the need. |
| `L7/ordinary-flag-scheme-local-structure` | acceptance | Restated a quoted phrase of the source in our own words. |
| `L7/geraghty-fixed-weight-ordinary-rings` | proofSteps | Restated a quoted sentence of the source in our own words. |
| `L7/ordinary-condition-fixed-inertial-characters` | hypotheses | Restated the printed condition in our own words. |
| `R08.5/rank-two-type-v` | acceptance | Restated a quoted phrase of the source in our own words. |
| `L7/gsp4-flat-ordinary-smoothness` | hypotheses | Restated a quoted phrase of the source in our own words. |
| `R08.1/phi-gamma-module-deformation-rings` | acceptance | Corrected the dimension of R_{D,g}: it is 1 + [K:ℚ_p]·n(n−1)/2 (Ding, Proposition 2.10(1)), not n(n−1)/2·[K:ℚ_p] + n; checked for n = 2, K = ℚ_p by counting filtered φ-modules. |
| `L7/ordinary-flag-scheme-local-structure` | proofSteps | Corrected the proof step: the graded characters of (ad V_x/Fil¹ad V_x)(ε) are χ_rχ_s^{−1}ε (r ≥ s), not χ_sχ_r^{−1}ε; the step now agrees with statement (4). |
| `L7/gsp4-ordinary-weight-two-components` | prerequisites | Removed prerequisites that the proof no longer uses (the rank-four input is L7/gsp4-flat-ordinary-smoothness; R07.4 stays, for the finite flatness of lattices in crystalline representations of weights {0, 1}). |
| `L7/gsp4-ordinary-weight-two-components` | prerequisites | Removed prerequisites that the proof no longer uses (the rank-four input is L7/gsp4-flat-ordinary-smoothness; R07.4 stays, for the finite flatness of lattices in crystalline representations of weights {0, 1}). |
| `L7/finite-height-lattices` | tests | The stated reason only shows that the lattice 𝔖e has no finite E-height; the test now says that, and gives the Artin–Schreier argument for the emptiness of the functor over ℚ_p. |
| `L7/finite-height-lattices` | acceptance | Same correction as in the test height_u_not_finite. |
| `L7/gsp4-flat-ordinary-smoothness` | proofSteps | Rewrote the planned argument so that it is a proof: the previous form (right exactness on each graded piece kills the obstruction) is not valid as stated, since a Selmer-type H¹ that is right exact on graded pieces need not be so on the module and the Borel is not abelian. The argument now lifts the unramified Levi part and then the finite flat cocycle in the abelian unipotent radical, by Kisin's Lemma 2.4.2 applied to the rank-three unramified module. |
| `L7/gsp4-flat-ordinary-smoothness` | statement | The source asks that Fil₂ be unramified; "through unramified characters" would allow a ramified extension inside Fil₂. |
| `L7/gsp4-flat-ordinary-smoothness` | statement | H²_flat has no definition in the source; the theorem is the formal smoothness. |
| `R08.6/good-dihedral-type` | statement | KW I state that i = j + 1 does not occur; this holds for q odd only (q = 2, p = 3 gives (1, 0)). Recorded as source issue E7. |
| `R08.4/bt-ring-unique-generalisation` | statement | Stated the convention: with HT(ε) = +1 a representation of determinant ε^{-1} has weights {0, −1}; the source uses HT(ε) = −1. |
| `R08.3/fixed-determinant-pst-rings` | hypotheses | Added the sign convention of the source for the weight of ψ. |
| `L7/snowden-ordinary-ring-trivial-residual` | hypotheses | Added the sign convention of the source. |
| `R08.6/newton-thorne-local-quotients` | hypotheses | Added the sign convention of the source. |
| `L7/semistable-ordinary-quotient` | proofSteps | Named the convention in which the weights increase (the node L7/ordinary-of-weight-lambda uses the opposite sign). |
| `L7/ordinary-of-weight-lambda` | hypotheses | Restricted the comparison with R06.4's ordinary representations to parallel weights (that notion uses powers of ε), and said how semistability is obtained in general. |
| `L7/ordinary-of-weight-lambda` | proofSteps | Made the use of the supplier precise (parts (a)–(b), not the parallel-weight statement (c)). |
| `R08.2/rank-two-unrestricted-rings-cg` | statement | Merged the two overlapping opening sentences; no change of content. |
| `R08.4/components-via-special-fibre` | prerequisites | Added the prerequisite that step 2 uses: H⁰ of a proper scheme over a complete local ring is the limit over the infinitesimal neighbourhoods of the closed fibre (theorem on formal functions); the algebraization node alone does not give it. |
| `R08.4/components-via-special-fibre` | proofSteps | Named the result used (formal functions) and its supplier. |
| `(requests)` | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 (p = 2) | Extended the need: the with-coefficients supplier nodes are stated for p ≠ 2 but are used here at p = 2. |
| `R08.5/connected-kisin-modules-with-coefficients` | hypotheses | Recorded that the supplier nodes are stated for p ≠ 2 and are requested at p = 2. |
| `(sources)` | SHOTTON-2018 | Corrected the title: arXiv:1608.01784 is "The Breuil–Mézard conjecture when l ≠ p" (Duke Math. J. 167 (2018)), not "Generic local deformation rings when ℓ ≠ p"; listed Theorems 2.5 and 4.6, which nodes cite, among the sections read. |
| `(sources)` | THORNE-2015 | The title field held author and venue as well; reduced to the title. |
| `R08.2/unrestricted-ring-complete-intersection` | proofSteps | Corrected the title of Shotton's paper. |
| `R08.2/unrestricted-ring-complete-intersection` | sources | Added the primary source of (1), which the node cited only through Newton–Thorne. |
| `R08.5/kw1-endpoint-weight-rings` | statement | The ordinary crystalline weight-two lifts at p = 2 are the rings of R08.5/ordinary-deformations-p2 (Kisin §2.4), which the node did not cite; added with its prerequisite. |
| `R08.5/kw1-endpoint-weight-rings` | prerequisites | Added the prerequisite for the ordinary case at p = 2. |
| `R08.6/kw1-lift-types` | planet | Renamed the planet: a name of the object, not a source locator. |
| `R08.6/kw-local-conditions` | planet | Renamed the planet: authors spelled out instead of the abbreviation of a paper. |
| `R08.2/rigid-residual-conditions` | api | Added the projection for clause (3). |
| `R08.2/rigid-residual-conditions` | api | Added the projection for clause (4). |
| `(sourceIssues)` | E1, E2, E4 | E1: restored the garbled exponents in `printed`. E2: restated a quoted phrase of the source. E4: `printed` and `correction` restated (the text extraction had lost the bar on ρ̄ and the subscripts); verdict rejected. |
| `L7/gsp4-flat-ordinary-smoothness` | hypotheses | The step is a proof by reference, not a recorded mistake of the source (E4 rejected). |
| `L7/gsp4-flat-ordinary-smoothness` | hypotheses | Recorded the standing assumption p > 2 of the source at this point. |
| `(sourceIssues)` | E7 | Added: the remark after KW I Theorem 5.1 that i = j + 1 does not occur holds for q odd only. |
| `L7/ordinary-flag-scheme-local-structure` | statement | Geraghty's functor of pairs carries no condition on the inertial characters; the added clause contradicted the dimension in (3) by n[F_w:ℚ_l]. |
| `L7/ordinary-flag-scheme-local-structure` | statement | Same correction for the Borel-valued functor. |
| `L7/ordinary-flag-scheme-local-structure` | statement | The source bounds the components of the completed local ring. |
| `L7/ordinary-flag-scheme-local-structure` | acceptance | For n = 1 the flag scheme is a closed subscheme of Spec R^□_{Λ_w}, not the whole of it. |
| `L7/weight-zero-crystalline-connectedness` | statement | Part (4) was false as stated: for V = 1 ⊕ ε^{−1}, V ⊗ V has weights {0, 1, 1, 2} and is ordinary of no weight. Restricted to the case where the weights stay distinct, which is the case the sources use. |
| `L7/weight-zero-crystalline-connectedness` | statement | Stated the Hodge–Tate convention and the normalisation of the valuation in (3). |
| `L7/weight-zero-crystalline-connectedness` | proofSteps | Proof step for the corrected (4). |
| `L7/weight-zero-crystalline-connectedness` | sources | Added the source of (3). |
| `L7/weight-zero-crystalline-connectedness` | sources | Added the source of (3). |
| `L7/trivial-residual-flag-ring` | statement | Ē is an algebraic closure of Frac R (no object of C_𝒪 has algebraically closed fraction field). |
| `L7/trivial-residual-flag-ring` | statement | The 'maximal reduced' definition is Thorne's; Geraghty takes the image in the functions on the generic fibre. |
| `L7/trivial-residual-flag-ring` | proofSteps | The one-relator presentation is the case μ_p ⊂ F_v; the other case is free. |
| `L7/trivial-residual-flag-ring` | hypotheses | Restricted the p = 2 claim to what BCGP25 state; Thorne assumes p odd. |
| `L7/trivial-residual-flag-ring` | hypotheses | Marked which parts the sources state for a quotient of Λ_v. |
| `L7/geraghty-fixed-weight-ordinary-rings` | hypotheses | The remark asserts the two cases; no proof is printed. |
| `L7/geraghty-fixed-weight-ordinary-rings` | acceptance | The ring is zero unless the weight character is residually trivial. |
| `L8/ordinary-coefficient-ring` | statement | The group is the inertia subgroup of the abelianised Galois group, as in ACC+; the abelianisation of inertia is much larger. |
| `L8/ordinary-coefficient-ring` | statement | Same notation. |
| `(requests)` | ClassFieldTheory Layer 7 | Notation: the inertia subgroup of Gal(F_v^{ab}/F_v), not the abelianisation of inertia. |
| `(sources)` | GERAGHTY-2019 | Corrected which papers test the numbering concordance (Thorne 2015 uses the preprint numbering); removed the mention of excerpts. |
| `(requests, gaps)` | natural-topology cohomology | Added the six nodes that apply duality or the Euler characteristic to E′-vector spaces at characteristic-zero points to the request for κ-coefficient cohomology and to its gap. |
| `R08.2/level-raising-local-problems` | prerequisites | Added the prerequisite that supplies the lifting ring: the problems are subfunctors of the 𝒢_N-valued lifts of r̄ : Γ_{F⁺_v} → 𝒢_N(k) with fixed similitude (checked in LTXZZ, §3.5: the pair (r̄, χ) has Γ̃ = Γ_{F⁺_v}). |
| `R08.2/level-raising-local-problems` | hypotheses | Said which lifting ring the problems live in, and what the G7 supplier does and does not provide at an inert place. |
| `L7/gsp4-borel-ordinary-conditions` | statement | Stated the defining condition of 𝒟^P, which the node only called "the analogous Siegel-parabolic problem"; in BCGP21, P is the six-dimensional subgroup of B (dimensions of B and P are 7 and 6). |
| `L7/gsp4-borel-ordinary-conditions` | hypotheses | Only the Borel problem is the distinguished case of the flag-incidence scheme; 𝒟^P is a closed subproblem. |
| `L7/gsp4-borel-ordinary-conditions` | api | Replaced `BorelOrdinary.toParabolic`, whose direction was wrong (P ⊂ B, so the parabolic problem is a subproblem of the Borel one, and the ring map goes R^B ⊗ Λ_{v,1} ↠ R^P), by `ParabolicOrdinary.toBorel`. |
| `L7/gsp4-ordinary-flag-incidence` | acceptance | Added the hypotheses under which the Borel-ordinary ring is defined. |
| `L7/gsp4-ordinary-flag-incidence` | tests | Added the hypotheses under which the Borel-ordinary ring is defined. |
| `L7/gsp4-ordinary-regularity` | proofSteps | The weight argument given for case (b) was wrong; restated the source's argument, which uses p-distinguishedness. |
| `L7/gsp4-ordinary-generic-fibres` | proofSteps | Step (5): only "H² = 0 implies smooth" is used; the vanishing at pure points is the argument of BCGP25 Lemma 6.2.2(2)(b), and R^P needs the extra remark on non-pure points. |
| `L7/gsp4-ordinary-generic-fibres` | prerequisites | Added the prerequisite that step (5) now cites. |
| `L7/gsp4-ordinary-generic-fibres` | hypotheses | Named the argument that repairs the step. |
| `L7/gl2-borel-ordinary-ring` | proofSteps | Remark 7.3.8 does not introduce the variables; they are introduced before Lemma 7.3.7. |
| `R08.2/gsp4-ihara-avoidance-rings` | statement | Defined R̃_v^χ, which the statement used without definition. |
| `R08.2/taylor-wiles-block-condition` | hypotheses | The block condition is a twist of the rank-two Taylor–Wiles ring, not equal to it. |
| `R08.2/taylor-wiles-block-condition` | hypotheses | The comparison as stated was wrong: in the block condition det r on inertia is ψ_v, so an unramified determinant gives only unramified lifts. The comparison is by the twist by a square root of ψ_v (p odd). |
| `R08.2/taylor-wiles-block-condition` | api | Corrected the rank-two comparison (twist by a square root of ψ_v). |
| `R08.2/taylor-wiles-block-condition` | tests | Corrected the test: an unramified determinant does not give 𝒪[Δ_v]⟦x, y, B⟧. |
| `R08.2/gsp4-unipotent-local-models` | acceptance | There are five components for four strata: the rank-two part has two. |
| `R08.1/g-valued-presentations` | statement | The unramifiedness of all lifts is under the same vanishing hypothesis. |
| `R08.1/smooth-points-generic-fibre` | proofSteps | Made the purity argument precise (with N ≠ 0 several weights occur). |
| `L7/gsp4-ordinary-weight-two-components` | statement | BCGP25 Lemma 6.2.6 assumes surjectivity onto Spec Λ; "dominates" is weaker and does not suffice for the proof (the special fibre of the component must reach a point where no ratio of the four characters is 1 or ε). |
| `L7/gsp4-ordinary-weight-two-components` | proofSteps | Said where the R07.4 prerequisite is used. |
| `L7/gl3-explicit-rings` | statement | Added the hypothesis that ρ̄ is semisimple (the explicit presentations are those at the semisimple Kisin module) and the convention τ = τ(s, μ). |
| `L7/gl3-explicit-rings` | statement | The claim that R̄^τ_ρ̄ is formally smooth over the explicit ring is not in diagram (3.9) and is false for f ≥ 4 (dimension 9 + 3f < 6f); the two formally smooth maps are from the ring with framing and gauge basis. |
| `L7/gl3-explicit-rings` | hypotheses | Added "semisimple". |
| `L7/gl3-explicit-rings` | hypotheses | Stated the convention τ = τ(s, μ) for the structure constants; the prerequisite node uses (s, μ) for the lowest alcove presentation, which differs by η. |
| `L7/gl3-explicit-rings` | proofSteps | The source defines the rings for the shapes α and id by the listed relations and gives no surjection argument there; the step now says so and keeps the consistency check as a check. |
| `L7/gl3-explicit-rings` | acceptance | All six quotients are power series rings (the remaining equations are linear in one variable with unit coefficient). |
| `L7/gl3-explicit-rings` | api | Corrected: the formally smooth maps start from the ring with framing and gauge basis, not from R̄^τ_ρ̄. |
| `L7/gl3-explicit-rings` | api | Added the hypotheses of Proposition 3.6.3 and the source and target. |
| `L7/gl3-explicit-rings` | tests | The target of ι′_τ is Φ-Mod^ét_{ℳ̄}, without framing. |
| `L7/gl3-explicit-rings` | tests | Said that the prime ideals are those of the quotient ring. |
| `L7/gl3-explicit-rings` | sources | Locator: the α relations are repeated on p. 46, the identity ones on p. 48. |
| `L7/gl3-explicit-ring-rows` | hypotheses | Added the hypothesis that ρ̄ is semisimple. |
| `L7/gl3-explicit-ring-rows` | hypotheses | Stated the convention τ = τ(s, μ), and that the primes are ideals of the quotient ring. |
| `L7/gl3-explicit-ring-rows` | hypotheses | Restated in the plan's own words. |
| `L7/gl3-explicit-ring-rows` | proofSteps | Step 2: what the source leaves out on p. 49 is the matching computation for βα and αβα, not a completeness argument; restated the p. 44 argument (equal multiplicity, then Lemma 3.6.11) in the plan's own words. |
| `L7/kisin-modules-tame-descent` | statement | Corrected the set-up: f′ = f·r with r the order of s_τ (the value 2f was missing), L′ is totally ramified of degree p^{f′} − 1 over K′ (not over K), and 𝔖_{L′,R} is a power series ring in u′, with v = (u′)^{e′}. |
| `L7/kisin-modules-tame-descent` | statement | Spelled out the type condition (on Δ′, with the dual). |
| `L7/kisin-modules-tame-descent` | statement | The untwisted change-of-basis formula could not be right (Proposition 3.2.1 forces a twist by s_j* v^{μ_j*+η_j*}); the statement now describes the action and leaves the formula to the supplier. The shape is an Iwahori double coset only for principal series types, and presupposes the existence of the Kisin module. |
| `L7/kisin-modules-tame-descent` | hypotheses | The hypothesis contradicted Theorem 3.5.3, which does give a zero ring for non-1-generic τ when ρ̄ is 10-generic and semisimple. |
| `L7/kisin-modules-tame-descent` | acceptance | The trivial type has no lowest alcove presentation and is outside the source's set-up; the acceptance check is now the principal-series case, and the trivial type is marked as a remark of the plan. |
| `L7/kisin-modules-tame-descent` | api | Removed the untwisted formula; the action is twisted (Proposition 3.2.1). |
| `L7/kisin-modules-tame-descent` | api | Shape by Iwahori double coset only for principal series types. |
| `L7/kisin-modules-tame-descent` | api | Uniqueness, not existence. |
| `L7/kisin-modules-tame-descent` | tests | Replaced the trivial-type test, which is outside the set-up, by the principal-series case; the trivial type is kept as a marked remark. |
| `L7/kisin-modules-tame-descent` | tests | The test contradicted Theorem 3.5.3; it now states the vanishing and why the genericity of ρ̄ is needed. |
| `L7/kisin-modules-tame-descent` | proofSteps | Added the formula of Proposition 3.2.1, which is what fixes the twist in the change of eigenbasis. |
| `(requests)` | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 (tame descent) | Corrected the set-up in the need (L′ over K′, the variable u′) and added the change-of-eigenbasis formula to what is requested. |
| `L7/semisimple-kisin-modules-and-shapes` | statement | Restated (2)–(5) as in the source: Proposition 3.3.9 is a criterion, not a classification; Lemma 3.3.10 and Theorem 3.3.11 are for type (λ, τ) with shapes in Adm^∨(λ) and assert existence of a Kisin module; Theorem 3.3.12 is conditional on the existence of some Kisin module and has genericity hypotheses. |
| `L7/semisimple-kisin-modules-and-shapes` | proofSteps | The Kisin-variety argument proves (5) only; (4) is quoted from LLHL19. |
| `L7/semisimple-kisin-modules-and-shapes` | acceptance | Added the hypotheses under which the Kisin module exists and is unique. |
| `L7/semisimple-kisin-modules-and-shapes` | sources | Added the locators of the statements other than (4). |
| `L7/gl3-pcris-deformation-rings` | statement | Added the non-vanishing criterion, which is part of the source's count and proof. |
| `L7/gl3-pcris-deformation-rings` | statement | Lemma 3.5.4 does not assume ρ̄ generic; added its count of components. |
| `L7/gl3-pcris-deformation-rings` | hypotheses | Notation: the element is w̃*, not w*. |
| `L7/gl3-pcris-deformation-rings` | proofSteps | The proof is not an induction on the shape: it uses Enns's result for non-generic types, a weak minimal patching functor (global), the multiplicity-one theorem 3.5.2 and a multiplicity comparison. Restated it, and recorded the global input. |
| `L7/gl3-pcris-deformation-rings` | hypotheses | Recorded the global input of Theorem 3.5.3. |
| `L7/gl3-pcris-deformation-rings` | sources | Added the locator of the proof. |
| `L7/gl3-component-labelling` | statement | Added "semisimple" and the convention for (s, μ). |
| `L7/gl3-component-labelling` | statement | Notation: the index set is the i-th component of w̃*, which makes the index reversal consistent. |
| `L7/gl3-component-labelling` | hypotheses | Added "semisimple". |
| `L7/gl3-component-labelling` | proofSteps | Existence of 𝔭(σ) comes from the support of a patched module (global input), which the step did not say. |
| `L7/gl3-component-labelling` | proofSteps | Lemmas 3.6.12–3.6.16 are consequences of Theorem 3.6.4, not inputs; the separation inside each 𝔴_ω is by induction on the defect. |
| `L7/gl3-component-labelling` | acceptance | The set given for Σ_{(αβ)*} was Σ_{(βα)*}: the star reverses words. |
| `L7/gl3-component-labelling` | sources | Added locators for (3), (4) and Table 2. |
| `(gaps)` | Weak minimal patching functors for GL₃ | New gap: the global input of LLHLM Theorem 3.5.3 and Proposition 3.6.1, which the two nodes used without saying so. |
| `R08.6/kw-local-conditions` | statement | KW II §3.2.2 requires F_v = ℚ_p at k(ρ̄_v) = p + 1 only for the crystalline lifts; the weight-two and semistable conditions are over unramified F_v. |
| `R08.6/kw-local-conditions` | hypotheses | Definition 3.4(2) asks only that an open subgroup of inertia act by χ_p^a; without it the weight-two lifts would not be ordinary. |
| `R08.6/kw-local-conditions` | proofSteps | Corollary 2.3 gives uniqueness of the quotient, not that its points are exactly the prescribed ones. |
| `R08.6/kw-local-conditions` | hypotheses | Recorded the particular case of KW II §3.3.2. |
| `R08.6/export-weight-two-irreducible` | statement | Added the range 3 ≤ k(ρ̄_p) ≤ p and named the type; for k(ρ̄_p) = 2 the type is trivial and the ring is formally smooth. |
| `R08.6/export-weight-two-irreducible` | hypotheses | Recorded why the range of k is needed, with the extraction issue that records the source's slip. |
| `R08.6/export-ordinary` | hypotheses | The reference [13] of KW II is Conrad–Diamond–Taylor. |
| `R08.6/export-ordinary` | proofSteps | For a sum of two distinct unramified characters there are two stable lines; the choice of character picks one. |
| `R08.6/export-ordinary` | acceptance | The third case of Proposition 3.6 includes the non-split unramified representations; gave the reason for the failure of formal smoothness. |
| `R08.6/export-semistable-weight-two-at-p` | statement | Added the standing hypothesis that F_v/ℚ_p is unramified, which the dichotomy uses (for ramified F_v ⊇ ℚ_p(μ_p) and p odd, D_v can act by homotheties). |
| `R08.6/export-endpoint-weight` | hypotheses | The hypothesis misdescribed the source: only the identification crystalline = ordinary is restricted to ℚ_p. |
| `R08.6/export-away-from-p` | hypotheses | Recorded the particular case of KW II §3.3.2. |
| `R08.6/kw1-lift-types` | statement | Added the global hypotheses of the theorem. |
| `R08.6/kw1-lift-types` | statement | Type (1) assumes k(ρ̄) = 2 when p = 2; without it the node claimed a crystalline lift of weight 4 at p = 2. |
| `R08.6/kw1-lift-types` | statement | Recorded the rest of type (3) and that q is odd. |
| `R08.6/kw1-lift-types` | statement | Recorded the rest of type (4). |
| `R08.6/good-dihedral-type` | statement | The list of pairs (i, j) is given by the source for p = 2 as well. |
| `R08.6/good-dihedral-type` | hypotheses | Completed the Serre-weight statement of Theorem 5.1(4). |
| `R08.6/good-dihedral-type` | hypotheses | Recorded an open point about KW II §3.3.3 in the case of trivial residual inertia. |
| `R08.6/dyadic-weight-two-transition` | statement | KW II does not identify the k = 2 ring with Kisin's flat connected ring, and for reducible ρ̄_v that comparison is wrong; the rings are those of KW II §3.2.3 and Proposition 3.6. The homothety clause was vacuous for k(ρ̄_v) = 4. |
| `R08.6/dyadic-weight-two-transition` | proofSteps | Routed the k = 2 case to the nodes that state KW II's rings. |
| `R08.6/serre-weight-crystalline-lift` | statement | Restored the hypotheses of FKP Lemma 7.2 (p ≥ 3, ρ̄_p an extension of the trivial character by χ̄); for a general reducible ρ̄_p the ordinary clause was false (ω² ⊕ ω has no unramified quotient), and for irreducible ρ̄_p or p = 2 the cited lemma says nothing. |
| `R08.6/serre-weight-crystalline-lift` | hypotheses | Removed a reference to the review process. |
| `R08.6/serre-weight-crystalline-lift` | acceptance | Added the case showing why the shape of ρ̄_p is needed. |
| `R08.6/newton-thorne-local-quotients` | statement | Notation of the archimedean ring. |
| `R08.6/newton-thorne-local-quotients` | statement | Named the paper. |
| `R08.6/newton-thorne-local-quotients` | hypotheses | The Kisin paper cited by Newton–Thorne is the 2-adic one, not the Annals paper. |
| `R08.6/newton-thorne-local-quotients` | proofSteps | Routed (1)–(2) to the nodes that state the cited results, valid for p = 2 as well (Newton–Thorne allow p = 2 in the potentially crystalline case). |
| `R08.6/newton-thorne-local-quotients` | proofSteps | Routed (4) to the node stating Proposition 2.5.2. |
| `R08.6/newton-thorne-local-quotients` | proofSteps | Routed (5) to the nodes for both parities of p. |
| `R08.6/newton-thorne-local-quotients` | prerequisites | Added the supplier that the corrected routing cites. |
| `R08.6/newton-thorne-local-quotients` | prerequisites | Added the supplier that the corrected routing cites. |
| `R08.6/newton-thorne-local-quotients` | prerequisites | Added the supplier that the corrected routing cites. |
| `R08.6/newton-thorne-local-quotients` | prerequisites | Added the supplier that the corrected routing cites. |
| `R08.6/torsion-semistable-condition` | proofSteps | The extension had sub and quotient interchanged, and the character is trivial. |
| `R08.6/category-deformation-conditions` | statement | Repaired a garbled clause. |
| `R08.6/category-deformation-conditions` | tests | The count is Ramakrishna's, for p odd. |
| `R08.5/weight-p-crystalline-ordinarity` | statement | KW II Lemma 3.5 has no restriction on p, and the case p = 2, k = 2 is needed by R08.6/export-ordinary. |
| `R08.5/weight-p-plus-one-ordinary-ring` | hypotheses | The hypothesis misdescribed the source. |
| `R08.5/dyadic-minimal-lifts` | tests | γ takes values in a field of characteristic 2, so its order is odd; "order 3·2^a" was impossible. |
| `R08.5/dyadic-minimal-lifts` | tests | Uniqueness is for the lift of the restriction to inertia, not for ρ₀. |
| `R08.5/kw1-endpoint-weight-rings` | statement | The homothety case does not occur for F_v = ℚ₂ and k(ρ̄) = 4. |
| `R08.5/kw1-endpoint-weight-rings` | statement | Mapped the endpoint cases to the right rings. |
| `R08.5/kw1-endpoint-weight-rings` | hypotheses | Recorded the case of Theorem 4.1 that has no ring in this roadmap. |
| `R08.4/finite-cocycles-kummer` | statement | Added the hypothesis 2 ≤ k(ρ̄_v) ≤ p and said what Ξ is on inertia for k > 2; for k = p + 1 (Ξ\|I_v = χ_p^p) the rank statement fails (the count is 2 + [F_v:ℚ_p]). |
| `R08.4/finite-cocycles-kummer` | statement | The Kummer description is for k = 2. |
| `R08.4/finite-cocycles-kummer` | statement | Said where Z¹_f = Z¹. |
| `R08.4/savitt-weight-two-rings` | statement | The two shapes are not always irreducible: at i = 1 and i = p they degenerate to niveau one. |
| `R08.4/savitt-weight-two-rings` | statement | Dropped the label "irreducible" (see the correction of the explicit list). |
| `R08.4/savitt-weight-two-rings` | sources | Locator: the three theorems are on p. 42 of arXiv v3. |
| `R08.2/rank-two-unrestricted-rings-cg` | statement | Lemma 4.11 is in §4.1. |
| `R08.2/rank-two-unrestricted-rings-cg` | statement | Δ comes from the finite field with v, resp. v², elements. |
| `R08.2/rank-two-unrestricted-rings-cg` | hypotheses | Lemma 4.11 is in §4.1. |
| `R08.6/smooth-resolution-criterion` | proofSteps | Flatness comes from the injectivity in (1), as in the source; the isomorphism of generic fibres gives the dimensions. |
| `R08.1/archimedean-rings-p-odd` | sources | The formal smoothness for odd p is stated in KW II Proposition 3.3, not in Tung's proposition. |
| `R08.4/resolution-local-structure` | statement | The statement put Proposition (2.4.6)(2) on the fibre over the closed point of Spec R^v; the source states it for the reduction modulo π_F, and for the fibre over the closed point it is false (a connected reducible curve occurs). |
| `R08.4/resolution-local-structure` | proofSteps | The comparison is through a third ring formally smooth over both, not a map from one ring to the other. |
| `R08.4/resolution-local-structure` | acceptance | Named the right fibre. |
| `R08.4/resolution-local-structure` | acceptance | Added a worked example showing why the two fibres must not be confused. |
| `R08.4/components-via-special-fibre` | statement | Said which fibre 𝒢ℛ^{v,loc}_0 is. |
| `R08.4/components-via-special-fibre` | hypotheses | Two different fibres were given one name. |
| `R08.4/components-via-special-fibre` | proofSteps | Named the right fibre. |
| `R08.4/components-via-special-fibre` | proofSteps | Named the right fibre. |
| `L7/finite-height-lattices` | proofSteps | The equivalence "nonempty iff V_B has E-height ≤ h" was false for B finite flat over ℤ_p: the unique lattice need not be projective over 𝔖_B. |
| `L7/finite-height-lattices` | api | Corrected the false equivalence and recorded a counterexample to the uncorrected one. |
| `L7/finite-height-lattices` | acceptance | The claim fails for p = 2, where φ(u⁻¹e) = u⁻¹e. |
| `L7/finite-height-lattices` | tests | The test was false for p = 2 and the reason given for the other lattices was not a proof; restated for p odd with the argument through characters, and recorded the p = 2 lattice. |
| `L7/finite-height-lattices` | hypotheses | Recorded the domain on which the source defines the functor and the two conventions for M(V) in the three papers. |
| `L7/height-lattice-moduli` | statement | Recorded the difference from the printed statement (free versus projective). |
| `L7/height-lattice-moduli` | proofSteps | Injectivity on E[ε]-points gives injectivity on tangent spaces. |
| `L7/height-lattice-moduli` | acceptance | The acceptance check overreached (it is not a statement about every A, and the converse for h ≤ 1 is false for a given G_K-action). |
| `R08.4/rank-two-nonordinary-connected` | hypotheses | Gee removed the restriction only for residual representations with trivial image. |
| `R08.4/rank-two-nonordinary-connected` | hypotheses | The residual shapes are in terms of the fundamental characters of K, not the cyclotomic character. |
| `R08.4/rank-two-bt-components` | acceptance | The example was wrong: for K = ℚ_p(ζ_p) and trivial V_𝔽 there are no non-ordinary points. Replaced by the correct description and an example with e = 2(p − 1). |
| `R08.4/rank-two-bt-components` | statement | The "exactly when" holds only in the cases (i) and (ii). |
| `R08.5/rank-two-connected-components` | statement | The connectedness of Spec R[1/p] needs ξ of determinant χ and formally smooth over D^{fl,c,χ}; the hypothesis had been dropped. |
| `R08.5/ordinary-deformations-p2` | statement | Proposition 2.4.4 says that the scheme 𝓛^{ord} is formally smooth over W(𝔽), not that the morphism Θ^{ord} is formally smooth. |
| `R08.5/ordinary-deformations-p2` | statement | Said over what. |
| `R08.5/ordinary-deformations-p2` | statement | Completed the statement of Corollary 2.4.6. |
| `R08.3/filtered-phi-N-deformations` | statement | The source asks for a projective associated graded (which makes base change of the filtration well defined), and for N to commute with the descent datum. |
| `R08.3/filtered-phi-N-deformations` | statement | Restored the hypothesis of Proposition (3.3.1) that A° is formally smooth over the deformation groupoid. |
| `R08.3/filtered-phi-N-deformations` | acceptance | ad D = E needs K₀ = ℚ_p. |
| `R08.3/hodge-type-components` | hypotheses | Lemma (2.6.1) is about the steps of the filtration, not the graded pieces. |
| `R08.3/hodge-type-components` | proofSteps | Follows the source, which compares the steps of the filtration. |
| `R08.3/hodge-type-components` | acceptance | The description is for K = ℚ_p. |
| `R08.3/pst-quotient-in-families` | statement | The module is the contravariant one. |
| `R08.3/semistable-height-quotient` | proofSteps | Gave the map (2.4.3) whose Galois compatibility defines the quotient. |
| `R08.5/connected-kisin-modules-with-coefficients` | api | The rigidification is over A/I (an 𝔽-algebra with no map to 𝔽 in general, e.g. A = 𝔽[T]), not over 𝔽. |
| `R08.5/connected-kisin-modules-with-coefficients` | tests | Said which character the module realises; the name could mislead. |
| `R08.4/flat-deformation-condition` | acceptance | For ramified K the characters are powers of the fundamental character of K. |
| `R08.5/kisin-local-rings-p2-comparison` | statement | The section is written for every p; said so, since R08.6/newton-thorne-local-quotients cites it for all p. |
| `L7/fontaine-laffaille-deformation-condition` | tests | With CHT's normalisation the point is the dual Tate module, not T_lE (the sign of the jumps). |
| `L7/ordinary-condition-fixed-inertial-characters` | api | CHT's indexing is zero-based, with gr^{n−1} the sub. |
| `L7/ordinary-condition-fixed-inertial-characters` | hypotheses | Stated the index reversal between the two flags and the input (uniqueness of the flag) that makes the comparison an equality of rings. |
| `L7/ordinary-condition-fixed-inertial-characters` | tests | Stated the index reversal. |
| `L7/discrete-series-deformation-condition` | acceptance | In the node's notation the coefficient characteristic is l; for m = 2 condition (3) excludes q² ≡ 1 mod l. |
| `L7/discrete-series-deformation-condition` | tests | Notation: the coefficient characteristic is l in this node. |
| `L7/discrete-series-smoothness` | hypotheses | Recorded that the count differs from the print (a misprint of the source, now E8). |
| `L7/residually-split-nearly-ordinary-ring` | proofSteps | The step contradicted the statement: a relation also occurs when ω = 1. |
| `L7/ordinary-of-weight-lambda` | hypotheses | The inequality holds only for λ_{τ,n} ≥ 0. |
| `L7/ordinary-of-weight-lambda` | acceptance | For "ordinary" the first character is only of finite order on inertia. |
| `L7/local-model-rho-nm0` | statement | Fixed ε₂ by its values: BCGNT do not state ε₂ε′₂ = ε^{-1}, and Barnet-Lamb–Calegari–Gee use the inverse character with the same description. |
| `L7/local-model-rho-nm0` | hypotheses | Recorded the sign convention of the weights, which the node used without notice. |
| `L7/ordinary-ring-with-frobenius-eigenvalue` | statement | Defined χ (the node used it without definition; CG18 take χ = εω^{−1}) and said that n is the weight. |
| `L7/ordinary-ring-with-frobenius-eigenvalue` | hypotheses | R^univ is the local framed ring, not a global ring. |
| `L7/ordinary-ring-with-frobenius-eigenvalue` | hypotheses | The condition n ≡ 1 mod p − 1 is not in the source and is not needed with χ = εω^{−1} (it would exclude n = 2). |
| `L7/connects-relation` | acceptance | The criterion was false for potentially crystalline characters; restricted it to crystalline ones and gave the extra condition. |
| `L7/partition-monodromy-rings` | statement | Pol_n((1, …, 1), q) is everything, so the ring is the maximal reduced flat quotient of R^1_v; the source does not claim R^1_v reduced. |
| `L7/partition-monodromy-rings` | tests | As in the statement. |
| `L7/partition-ring-smooth-points` | proofSteps | The step did not follow as written (a closed subscheme through x need not contain the component through x); added the input that Spec R^m_v is a union of components. |
| `L7/torsion-crystalline-representations` | statement | Marked the Fontaine–Laffaille description as not taken from the cited definition. |
| `R08.2/tame-splitting` | proofSteps | The order condition is on inertia. |
| `R08.2/minimally-ramified-condition` | statement | T_q is ℤ_p ⋊ Ẑ. |
| `R08.2/unrestricted-away-from-p` | sources | Tung's lemma is for GL₂ with fixed determinant; the general statement is BLGGT Lemma 1.3.4, now cited. |
| `R08.2/unrestricted-away-from-p` | sources | Cited the general-n statement directly. |
| `R08.2/ihara-avoidance-components` | hypotheses | Part (4) without p > n is Thorne §3.3.4 / Proposition 3.17. |
| `R08.2/steinberg-ring-domain` | statement | Thorne's Proposition 3.17 has no condition on the power of p dividing q_v − 1; "p^N > n" is a property of the auxiliary field in Newton–Thorne, not a hypothesis of the domain property. |
| `R08.2/steinberg-ring-domain` | hypotheses | As in the statement. |
| `R08.2/steinberg-ring-domain` | proofSteps | Stated Thorne's proposition with its hypotheses. |
| `R08.2/regular-unipotent-minimally-ramified` | hypotheses | Stated the implicit hypothesis under which r̄(σ) makes sense. |
| `R08.2/gsp4-minimal-conditions` | statement | Definition 4.6 has no clause for type H; the isomorphism r(I_x) ≅ r̄(I_x) is automatic there, and is now stated as a consequence. |
| `R08.2/gsp4-minimal-conditions` | proofSteps | Gave the right reason for the order being prime to p. |
| `R08.2/gsp4-minimal-conditions` | acceptance | The relation as written is for arithmetic Frobenius. |
| `R08.2/equal-characteristic-local-lifts` | statement | The existence of a local lift needs only ℓ ≠ p. |
| `R08.2/equal-characteristic-local-lifts` | sources | Added the locator of the last sentence of the statement. |
| `R08.3/weil-deligne-type-ring` | api | Added the determinant and marked which direction is not at the cited locator. |
| `R08.1/local-lifting-ring` | hypotheses | Typo. |
| `R08.1/local-residue-field-change` | sources | The cited place in Gee only fixes the setting; the statement is BLGGT Lemma 1.2.1. |
| `R08.2/dotto-division-algebra-cycles` | statement | The cycle groups are indexed by dimension (Shotton §2.3, Dotto): the rings R^□_r̄(τ, N) have dimension n² + 1 and their special fibres n², so the groups are Z^{n²+1}(R^□_r̄) and Z^{n²}(R^□_r̄/ϖ); the indices were one too small (and contradicted step 3). |
| `R08.2/dotto-division-algebra-cycles` | statement | Defined k′ and τ_s, which the statement used without definition. |
| `R08.2/dotto-division-algebra-cycles` | sources | Locator: Shotton's Theorem 4.6 is on p. 17 of arXiv v2. |
| `R08.2/dotto-division-algebra-cycles` | hypotheses | Restated the source's hypothesis in the plan's own words, and recorded the form in which Dotto states the identity. |
| `R08.2/level-raising-local-problems` | statement | Added the hypothesis that μ is even: for μ odd the relation (3.21) in the proof of Proposition 3.5.2 forces the monodromy coordinate to vanish, and the nodal structure fails (E9). |
| `R08.2/level-raising-local-problems` | hypotheses | Recorded the computation behind the parity hypothesis. |
| `R08.2/level-raising-local-problems` | hypotheses | Said why the direction is the one stated, and that the main paper writes it the other way round. |
| `R08.2/level-raising-local-problems` | sources | Locator given in the version read (arXiv v3). |
| `R08.2/rigid-residual-conditions` | statement | Added the standing assumptions: Σ_min contains the ramified places, and there are no level-raising places for N odd (for odd N the similitude η^N ε^{1−N} has μ odd, where the local model of R08.2/level-raising-local-problems is not available). |
| `R08.2/rigid-residual-conditions` | acceptance | The acceptance check was false without the condition on eigenvalue ratios; the level-raising places of this node are the counterexample. |
| `L7/g-valued-ordinary-condition` | statement | FKP Appendix B takes G split connected reductive; the canonical torus uses N_G(B) = B, which fails for disconnected G. |
| `L7/g-valued-ordinary-condition` | hypotheses | The comparison with L7/ordinary-of-weight-lambda holds only after the change of weight λ_{τ,j} = −(λ′_{τ,n+1−j} + j − 1); stated it. |
| `L7/g-valued-ordinary-condition` | api | Added the weight dictionary. |
| `L7/g-valued-ordinary-condition` | tests | Added the weight dictionary. |
| `R08.2/g-valued-generic-fibre-away-from-p` | statement | The fixed similitude κ^{1−2n} must lift the residual one (a hypothesis of FKP Proposition 9.1; Booher allows any lift of the residual similitude). |
| `R08.2/g-valued-generic-fibre-away-from-p` | statement | Added the locator of (3). |
| `R08.2/g-valued-generic-fibre-away-from-p` | hypotheses | The general theorem is for GSp_m and GO_m only. |
| `R08.2/g-valued-generic-fibre-away-from-p` | acceptance | The two statements are not the same: one fixes the multiplier. |
| `R08.2/g-valued-generic-fibre-away-from-p` | hypotheses | Recorded the standing hypotheses and that (1) is taken through FKP. |
| `R08.2/inertial-type-quotient` | proofSteps | Shotton's Proposition 3.6 is for rings without fixed determinant; gave the argument for the fixed-determinant ring, and the right reason for flatness. |
| `R08.2/inertial-type-with-monodromy` | acceptance | With no determinant condition the exact-type points are the unramified lifts. |
| `R08.2/inertial-type-with-monodromy` | tests | As in the acceptance check. |
| `R08.2/unrestricted-ring-complete-intersection` | statement | For GL_N no bound p ≥ N is needed (CHT §2.4.4 has none). |
| `R08.2/unrestricted-ring-complete-intersection` | hypotheses | Said that the node is the split case of the source, and removed the unnecessary bound. |
| `R08.2/q-tame-group` | api | The condition A ≡ 1 mod 𝔪 covered only ρ̄(t) = 1; the right condition is that the reduction of A is unipotent. |
| `R08.2/q-tame-group` | tests | Holds for every q ≥ 2. |
| `L7/g-valued-ordinary-quotient` | statement | Named the extra generators accurately: ψ runs over a basis of X*(T₀), not over central characters. |
| `L7/g-valued-ordinary-quotient` | hypotheses | The claim that the generators "must be added" was overstated: on the generic fibre of the Hodge-type quotient the condition is automatic. |
| `L7/g-valued-ordinary-quotient` | acceptance | On the Hodge-type quotient the equations hold after inverting p. |
| `L7/g-valued-ordinary-quotient` | api | Renamed the generators as in the statement. |
| `L7/g-valued-ordinary-quotient` | tests | Added the weight dictionary. |
| `L7/g-valued-ordinary-components` | proofSteps | The vanishing holds because the module is trivial, not because λ is regular. |
| `L7/g-valued-ordinary-components` | sources | Barnet-Lamb–Calegari–Gee use Lemma B.4 for GSp_n and GO_n, not GL_n. |
| `R08.1/lambda-presentation` | statement | The restriction p ∤ d is not in the sources and is not needed; the case p \| d is the one for which BIP is used. |
| `R08.1/lambda-presentation` | proofSteps | For κ of characteristic p one inverts t. |
| `R08.1/completion-at-points` | statement | BIP's proposition is for F/ℚ_p and for points of P₁; the closed point is not in P₁, and for ℓ ≠ p the characteristic-p points of P₁ have no source here. |
| `R08.1/completion-at-points` | acceptance | The regularity criterion is Remark 3.43. |
| `R08.1/g-valued-framed-ring` | proofSteps | The source proves representability by Grothendieck's criterion, without using smoothness of G. |
| `R08.1/g-valued-presentations` | statement | PQ §3.1 assumes G generalised reductive; the statement uses the derived group, which needs it. |
| `R08.1/phi-gamma-module-deformation-rings` | hypotheses | The framed ring is a power series ring over R_D; R_D is not a quotient of it by the framing. |
| `(sources)` | BIP-2023 | Proposition 3.41, Corollary 3.42 and Remark 3.43 are in §3.5 (pp. 29–30), not §3.7. |
| `(sources)` | BELLOVIN-GEE-2019 | Added the source: Bellovin–Gee was cited through FKP only; it was read in this review for R08.3/g-valued-pst-rings and R08.2/g-valued-generic-fibre-away-from-p. |
| `R08.3/g-valued-pst-rings` | statement | Bellovin–Gee take G reductive, not necessarily connected. |
| `R08.3/g-valued-pst-rings` | statement | Stated the characterising property as in the source (on finite local E-algebras) and where reducedness comes from. |
| `R08.3/g-valued-pst-rings` | statement | Stated Theorem 3.3.3 as read (any v; reduced, local complete intersection). |
| `R08.3/g-valued-pst-rings` | hypotheses | The parabolic depends on the embedding. |
| `R08.3/g-valued-pst-rings` | proofSteps | Described the source's proof (the map to the moduli of Weil–Deligne representations), and recorded that only regularity is claimed. |
| `R08.3/g-valued-pst-rings` | sources | Added the source read for (1)–(3). |
| `R08.2/g-valued-generic-fibre-away-from-p` | statement | Restated (1) as it follows from Theorem 3.3.3 read for each type. |
| `R08.2/g-valued-generic-fibre-away-from-p` | sources | Added the source read for (1). |
| `(sources)` | LTXZZ-RIGID-2021 | Recorded the published version (Acta Math. Sin. (Engl. Ser.) 40 (2024)), which was not read. |
| `(coverage)` | L7 | Added the new gap to the remaining list. |
| `(sourceIssues)` | E3, E5 | E5: verdict confirmed, and the second place where the slip occurs (p. 217) added to the locator. E3: remark added to the review reason on the reading of τ that repairs the sentence. |
| `(sourceIssues)` | E8, E9, E10 | Three mistakes of the sources that the packet had not recorded: E8 (CHT, the count in the proof of Lemma 2.4.28 printed with m for d), E9 (LTXZZ companion, Proposition 3.5.2 fails for μ odd), E10 (Kisin, Corollary (1.7)(2) asserts free where the proof gives projective). |
| `L7/height-lattice-moduli` | statement | Cited the source issue. |
| `(restructure)` | link ClassFieldTheory Layer 5 → R08.1 | The proposal said that every dimension node lists the Layer 5 declarations; it now says which nodes do. |
| `(sourceIssues)` | E3, E6 | The descriptions of what the sources say are restated in the plan's own words with readable notation (E3: the statement after Theorem 3.31, and σ for the tame generator in the example; E6: the Hom space of the definition). |
| `(sources)` | CHT08, ACC-POTENTIAL-AUTOMORPHY-CM-2023, SKINNER-WILES-1999, KISIN-PST-2008, KISIN-PST-2008-AMS, BCDT-2001 | Reading records restated without references to rounds of work (checkpoint numbers, session names, review notes); the information on which text was read is kept. |
| `(baseline)` | all 9 declarations | Confirmed again at the pinned commits; the record of the check updated. No citation removed or replaced. |
| `R08.6/dyadic-weight-two-transition` | prerequisites | Added the prerequisite that the corrected proof step cites for k = 2, ρ̄_v irreducible. |
| `R08.6/dyadic-weight-two-transition` | prerequisites | Added the prerequisite that the corrected proof step cites for k = 2, ρ̄_v reducible. |
| `R08.6/dyadic-weight-two-transition` | prerequisites | Removed a prerequisite that the corrected statement no longer uses (the comparison with Kisin's flat connected ring is only a remark). |
| `R08.6/dyadic-weight-two-transition` | prerequisites | Removed a prerequisite that the corrected statement no longer uses (the comparison with Kisin's flat connected ring is only a remark). |
| `L7/finite-height-lattices` | proofSteps | Marked the forward reference. |
| `R08.1/g-valued-framed-ring` | proofSteps | Marked the forward reference. |
| `L7/ordinary-condition-fixed-inertial-characters` | hypotheses | Restated a phrase of the source in the plan's own words. |
| `L7/discrete-series-deformation-condition` | hypotheses | Restated a phrase of the source in the plan's own words. |
| `(gaps)` | Suggested Lean file: items still in the comment inventory | Counts brought in line with the corrected packet and file. |
