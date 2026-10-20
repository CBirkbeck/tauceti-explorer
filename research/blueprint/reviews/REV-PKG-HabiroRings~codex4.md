# Independent package review: HabiroRings

Issue #11484 · Codex · session `codex-9d9kZ9` · 2026-10-20.

**Verdict: needs_changes.** The specialized completion, descent and coefficient constructions now consume Part I correctly. The ordinary comparison, Laurent and scalar-restriction comparisons, arithmetic presentations and conditional spectral/solid results survive. One generality defect remains: the general marked étale-deformation interface removed from former §§4.1–4.6 has no complete lower supplier. The special coefficient case does not discharge it. This is a completed independent review, not a checkpoint.

## Basis and scope

Reviewed the package at atlas commit `46c14f000c676e976e5d8aa03b4a0a560199e296`, all 89 nodes in the parent and five supplementary HabiroRings packets, the relevant library audit, the preceding codex2/codex3 reviews, the latest fix handoff, and the relevant Part I review and supplier sections. The latest fix was authored by Claude session `claude-vfVjVI`; this reviewer did not write it. The original `REV-PKG-HabiroRings~codex.md` and adversarial `~adv.md` reports are absent; no findings were inferred from their names. The issue's inherited Mordell title is unrelated template text.

The maintainer's revised family order controls the older ownership assignments:

```text
HabiroCyclotomicCompletions → QWittVectors → HabiroCohomologyFoundations I
  → HabiroRings → RefinedTraceMethods → HabiroCohomologyFoundations II
```

Compared the document's form with current upstream AdicSpaces and DGAInfinity, including their boundary, hypothesis, construction and dependency sections, and their representative Lean files. Read UPSTREAM_GUIDE and PACKAGE_REVIEW. The README opens with its summary, states conventions and exact supplier contracts, and retains APIs and discriminating checks. Its final size is 195,605 bytes, below the issue's 200 KB bound. `metadata.toml` remains `topic = "math.NT"`. Sources are discussed in original mathematical prose, not reproduced or summarized section by section.

## R1: the general marked deformation targets still need an owner

The seven-node HR.4 supplementary packet distinguishes six general deformation targets from its final cyclotomic ghost-coherence application. The fix removed the first six along with the specialized construction. The current Part I §0.3 states reduction equivalence for étale algebras over `A[q]/(q^m−1)` and its coefficient objects. It does not state the full arbitrary-ring/ideal interface below. Moving the old anchors to this supplier block preserves link resolution but does not preserve those statements.

The required general contract is:

| Input and target | Hypotheses and retained content |
| --- | --- |
| Marked deformation | Any commutative B, ideal I, étale B/I-algebra D; actual étale B-algebra E and actual equivalence E/IE≃D. Reduction of maps is conjugated by the two markings. Étale means finite presentation and formal étaleness, not module-finiteness. |
| Object lift | Every such D has a marked étale lift E over B, with no nilpotence, finite-generation or Noetherian condition on I or B. |
| Reduction equivalence | For nilpotent I, étale objects and their maps descend and lift equivalently; Stacks also gives the locally nilpotent version. Marked comparisons satisfy identity and composition. Rigidity is not asserted across an arbitrary ideal. |
| Ordinary complete lift | For finitely generated I, W=lim E/I^nE uses the existing AdicCompletion carrier; W is complete and has marked quotients W/I^nW≃E/I^nE. Neither ordinary étaleness nor flatness of W is asserted. |
| Maps and comparisons | For ordinary I-complete B-algebras C, reduction gives Hom_B(W,C)≃Hom_(B/I)(D,C/IC), natural in D and C. It supplies lifted maps, independence of E, marked equivalences and all their composition laws. |
| Principal derived lift | For any regular f in B and étale D over B/f, the marked derived f-complete lift is unique with contractible comparison space, static and f-regular. Its ordinary model is the completion of an étale object lift; flatness makes that lift f-torsion-free, providing the bounded-torsion ordinary/derived comparison. |

A lower supplier must retain the ten `EtaleDeformation` operations (`ofAlgebra`, `carrier_etale`, `reduction_etale`, `transportMarking`, `reduceMap`, `reduceMap_id`, `reduceMap_comp`, `unit`, `split`, `localisation`) and the fourteen `CompletedEtaleLift` operations (`instCommRing`, `instAlgebra`, `of`, `complete`, `reductionEquiv`, `reduction_of`, `homEquiv`, `map`, `map_reduction`, `map_id`, `map_comp`, `equivOfMarking`, `equivOfMarking_reduction`, `equivOfMarking_trans`), or exact renamed equivalents. These are the accepted general API families, not requests for a second Habiro lift.

Discriminating cases for that supplier include I=0 giving W=D; nilpotent I giving W=E; the split lift whose transposition moves (1,0); B=ℤ[t], I=(t), E=ℤ[t,1/2], giving W=ℤ[1/2][[t]] with unbounded coefficient denominators; B=ℤ, f=2, D=𝔽₂ giving ℤ₂ rather than static 𝔽₂; a unit f giving zero; and f=0 on ℤ failing regularity. The localization at 2 is étale but not a finite ℤ-module.

I independently read [Stacks Lemma 10.143.10, §10.143, tag 04D1](https://stacks.math.columbia.edu/tag/04D1), including its presentation argument, and [Lemma 15.11.2, §15.11, tag 0ALI](https://stacks.math.columbia.edu/tag/0ALI), including full faithfulness. They establish the general ordinary lifting and locally nilpotent invariance inputs. The complete statements assemble those inputs with the existing completion API; the derived comparison additionally uses DD.1. Wagner Q, Theorem 2.9, pp.16–17, explains their coefficient application, rather than replacing the arbitrary B,I target.

Related lower material was checked rather than assumed absent:

- DerivedDeRhamCohomology §1.11, `DerivedDeRham.completelySmoothAlgebraization`, treats finitely generated I and algebraizes an already supplied derived-complete algebra with smooth/étale reduction. It is relevant general machinery, but is not the marked category, arbitrary-ideal object existence, ordinary complete-map equivalence or their API above.
- PerfectoidQuotients §0.0, `completeEtale_algebraization`, sits under the complete δ-extension hypotheses, including an ideal containing p. Its proof uses arbitrary-ideal lifting, but does not export the full general marked interface.
- Mathlib already provides map lifting and uniqueness from a given formally étale source and the ordinary completion carrier. Those are imports to the interface; they are not the missing arbitrary-ideal object construction or the assembled marked category.

The README now explicitly records this ownership gap. Repair requires assigning the general contract below Part I, for example in DD.1 or Part I's general foundations, with exact targets, API and checks, then citing that owner. Merely redirecting more anchors, or restoring a second HR-owned construction that Part I would need, would not repair the dependency order. This review can edit only HabiroRings and its report/handoff, so it cannot complete the lower package's missing contract. No general target is declared dispensable.

## Clear corrections applied

1. **Zero stage, §4.1.** The former check asserted maps both to and from the zero algebra. In unital algebras it is terminal. A map from zero forces the target to be zero. The revised check uses the nonzero target ℤ[[q−1]] at m=1 to exclude the spurious reverse map.
2. **Supplier direction.** QW.3's relative construction and QW.4's naturality previously listed HR §1.1 as a prerequisite, while §1.1 listed completed Frobenius as input. Replaced those backward references with the elementary commutative-square data. The relative QW construction remains available for arbitrary Λ-bases and algebras; étaleness and perfect covering enter only the later pair category. Frobenius compatibility is a consequence of QW.4 naturality, not part of that category's definition.
3. **Telescope, §2.2.** Added denominator cofinality: each repeated factor 1−q^j can be assigned a different multiple j·k among the factors of a sufficiently large P_N. Thus all localization fractions occur as a/P_N. Merely identifying which elements become units did not explain this step. The differential and inverse-factorial augmentation are unchanged.
4. **Solid dependencies, §§2.8 and 2.12.** Their local Needs clauses now name the full SA.1 spectral contract, including uniformly bounded resolutions and realizations where used. VS2 supplies its abelian comparison only, consistently with the opening boundary and the exact contract.
5. Removed the process phrase about the QW supplier being designed. No README target, hypothesis or check was deleted. Suggested.lean and metadata were left unchanged.

## Supplier edges and preservation of owned material

Within the revised ring/cohomology family the supplier edges are exactly these:

| Supplier | Exact interface used by HabiroRings |
| --- | --- |
| HC.1 | Factorial topology/cofinality, q-factorials, `qBinomial_factorial`, `qFactorial_pochhammer`; input to §§2.1–2.5 and the factorial tensor weights. |
| HC Layers 2–5 | Ordinary polynomial/Laurent completion (§2.3), root adjunction and p-adic re-expansion (HC.3), classical Taylor injectivity (HC.4), coefficient-module completion, prime inversion and rational components (HC.5). HR §2.4 adds the enhanced ordinary/derived comparison, not HC's ordinary construction. |
| QW.0 | Big Witt operations, integral coordinate formulas, Dwork criterion and coalgebra/Adams/exterior/free Λ-ring interfaces. |
| QW.1 | Perfect and perfectly covered bases, Adams colimit perfection and faithful-flatness criteria. |
| QW.2 | Finite absolute q-Witt rings and their ghost, Frobenius and Verschiebung operations; absence of ordinary restriction. |
| QW.3 | The s_m and c_m comparisons, relative q-Witt quotient, coefficient base change and functoriality for commutative squares. |
| QW.4 | Étale q-Witt and ghost pushouts, completed Frobenius and its invertible linearization, and the global-Frobenius obstruction. The complete-Frobenius specification here is the interface Part I §0.3 already assigns to QW.4; it must survive QW's design, whose current stage description refers through QW.1 to the prismatic input. |
| Part I §0.1 | `HabiroComplete.reflect`, `.tower`, `.detect`, `.tensor`, over arbitrary A[q]. HR's Laurent, scalar-restriction and ordinary-module comparisons consume these. |
| Part I §0.2 | `CyclotomicCompleteDescent.reconstruct`, `.maps`, `.arithmetic`, `.divisor`, `.naturality`. HR retains index combinatorics and the explicit prime-edge mapping-space formula. |
| Part I §0.3 | `EtaleHabiroCoefficients.partial`, `.unique`, `.ghost`, `.transition`, `.limit`. HR §4.1 extends functoriality to changes of the pair; §5.1 takes the ordinary π₀ ring with its full projections and quotients. |
| Part I §§4.21, 4.28 | `HabiroHodge.etale`, `.etaleModel`, `HabiroHodgeDescent.etale`; an imported identification, not a new HR comparison or an input to the ordinary ring construction. |

No HR target imports RefinedTraceMethods or Part II. Both appear as consumers. QW.5–QW.7 are not suppliers here.

These are the family edges, not an assertion that all other mathematical dependencies vanish. The enhanced E0/E1/E3/E5, DD.1, H.5/H.6 and conditional SA.1 inputs remain explicit. HB.6 supplies the existing number-field ring and HB.7 supplies actual global lines and certificates for their comparisons; the latter do not construct HR's coefficient ring. Removing these inputs would discard the requested spectral or arithmetic targets. The inherited HC/HB/RT/Part II citations noted in the previous fix's handoff require repointing by their owners, outside this review's files.

The previous duplicate completion adjunction, monoidal structure and detection are now supplier contracts rather than Layer 2 constructions. The duplicate finite reconstruction, arithmetic fracture and divisor functors are Part I §0.2 imports. The duplicate specialized marked lifts, ghost overlaps and limit are §0.3 imports. HR §3.5 still states a more general finite descent principle with explicit coherent overlap hypotheses; Part I proves its cyclotomic case directly and has no dependency on HR §3.5. It is not a second cyclotomic construction.

## Current library and roadmap audit

Read the reviewed library audit and checked the pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` declarations used below. Also screened current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine later roadmaps and the four named Completed roadmaps. Searches included operators and hypotheses: regular Laurent multiplication, cyclotomic quotient towers, étale maps over nilpotent quotients, semilinear completed Frobenius, power-series invertible modules, Picard base change, and solid spectral products/tensors. They were not limited to Habiro names.

| Existing material inspected | Boundary of its contribution |
| --- | --- |
| `Algebra.Etale`, `.baseChange`, standard smooth presentations | Ordinary étale carriers and finite presentations; not a new heavy carrier in Suggested.lean. |
| `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` and `Algebra.FormallyUnramified.ext_of_iInf` | Existence of maps into a complete target and uniqueness into a separated target, from a source already given. |
| `AdicCompletion.pow_smul_top_eq_ker_eval`, `.ker_evalOneₐ_eq_map`, `.isAdicComplete` | Finitely generated ideal hypothesis retained in the ordinary marked completion discussion. |
| `Module.Invertible.bijective_of_surjective`, `.free_iff_linearEquiv`; `CommRing.Pic.mapRingHom` and its identity/composition laws | The evaluator definition uses the existing bijectivity criterion. HR adds the actual normalized evaluator and the power-series first-fiber milestone, not Picard functoriality. |
| `NumberField.not_dvd_discr_iff_isUnramifiedIn` | Primewise discriminant criterion, not the assembled localized étale-algebra theorem. |
| `TauCeti.Cyclotomic.conjugateResiduesRingHom`, `.conjugateResidues_lift` | All-conjugate residue tuple and its section for a chosen primitive finite-field root. Not the general completed relative coefficient algebra. |
| Current AlgebraicVectorBundles, AdicSpaces and Tau Ceti Huber Laurent files | Geometric invertible sheaves or topological rational localizations, with different hypotheses and objects; none supplies the first-fiber R[[X]] theorem or Habiro localization. |
| Current ProfiniteArithmetic/LocalGaloisGroups and Completed RestrictedProducts | Restricted products, local arithmetic and completions; no cyclotomic-factor tower or its marked étale deformation API. The other named new/Completed roadmaps yielded no mathematical duplicate. |

No additional HR target was removed in favor of an implemented current-library theorem or existing current-roadmap target. The ordinary library notions above were already deferrals, and remain so.

## Source verification

Selected fifteen semantic locator blocks using seed 11484, excluding explicit conditional gaps, and read the relevant public PDFs directly. The table records the mathematical match, not passages from the sources. Page numbers are PDF pages except T, where printed p.86 is PDF p.90. Q, W, H, B, G, T and MW refer to the README's fixed versions.

| Sample | Locator read | Result |
| --- | --- | --- |
| Perfectly covered bases | Q 1.22(e), p.12; 2.7, pp.15–16; W Remark 2.47 and footnote (2.3), p.32 | Faithful flatness and perfect covering, rather than injectivity alone, retained. |
| Free Adams presentations | Q 1.22(e), p.12; H Lemmas 1.4 and 1.8, pp.8–11 | Q supplies the faithful-flatness assertion; H gives the integral triangular formulas used to derive the planned local presentations. They are not attributed as a verbatim basis theorem in H. |
| Ordinary relative ring §5.1 | Q 2.7 and footnote (2.1), p.16; Theorem 2.9, pp.16–17; Lemma 2.12 proof, p.18 | Staticity, étale hypothesis and ordinary/derived comparison retained. |
| Coalgebra–Adams equivalence | H Lemma 1.24, p.19 | Torsion-free equivalence; Adams data alone do not define the torsion case. |
| Solid unit §2.9 | Q proof of B.8, pp.79–80; T §5.3, printed p.86/PDF p.90 | The generator and proof pattern do not supply all spectral tower hypotheses; the explicit conditional contract remains. |
| Completed discrete embedding §2.8 | Q B.6–B.7, p.79; MW §4.1, pp.41–42 | Solid ambient category and completion comparison are distinguished. |
| Coefficient supplier | Q 2.7–2.10, pp.15–17; W Proposition 2.48 and Corollary 2.51, pp.33–34 | Marked étale reductions and completed Frobenius overlap maps, not global Adams operations on R. |
| Prime-chain factorization §3.4 | Q proof of Corollary 2.4, pp.14–15 | Consecutive prime edges recover chains; height one does not remove the undirected m=6 cycle. |
| Order-one fiber §6.4 | G Definition 1.4, p.10; Proposition 1.5(f), p.11 and proof p.45; Theorem 2, p.10 and §3.3, p.43 | Retain HB.7's actual global descent, inverse-tensor and integral linear-jet certificates. A local line calculation alone would not prove integral surjectivity. |
| Cubic example §7.3 | Q Remarks 2.8 and 2.11, pp.16–17 | Non-global completed Frobenius and the constant-family obstruction. |
| Naive quotient obstruction | W Corollary 2.52, p.35 | Requires a marked ℤ[q]-algebra isomorphism and R→R̂_p injective. |
| Compatible roots §5.2 | Q Remark 2.11, p.17 | Coprime and prime-power compatibilities, re-expansion and full coefficient algebras retained. |
| s_m and c_m | W 2.31, p.26; Lemma 2.34, p.27; Corollaries 2.35 and 2.37, pp.28–29 | Correct ghost indices, Adams-twisted action and perfect-base comparison. |
| Witt section | B §§1.6–1.9, pp.8–10 and §1.17, pp.12–13; W 2.31, p.26 | Integral ghost recursion and the torsion-free hypotheses used in the section. |
| q−1 map §6.3 | Q 1.4, p.4 and Lemma 2.12 proof, p.18 | Completion loses prime-inverted components; this does not assert nontriviality of a specific regulator class. |

Additionally read Q Appendix B's corrected telescope and ordinary tower argument; Bosco Proposition A.3 and Lemma A.4, pp.92–93; HA Proposition 2.2.1.9, p.197, Corollaries 3.2.2.4–3.2.2.5, pp.358–359, and Theorem 7.1.2.13, p.1212; and the two Stacks lemmas for R1. Bosco is an abelian derived p-adic model with both factors cohomologically bounded above, not a theorem about arbitrary light solid spectra. HA's Eilenberg–Mac Lane equivalence is relative to HR, so it does not make restriction to the spherical base strongly monoidal. The already corrected finite-field, restriction-map and target-index source slips were not reintroduced.

## Adversarial mathematics pass

This groups every supplier/owned statement family, including its named maps and conventions. The tests distinguish objects, map directions and hypotheses; a successful sorry build was not used as evidence of mathematical truth.

| Statements checked | Instances and computed distinction | Outcome |
| --- | --- | --- |
| QW Adams, Dwork and integral Frobenius formulas | ℤ, 𝔽₂, toric ℤ[t]; ψ²(t)=t², while t↦t+1 fails to commute with ψ² | Torsion-free ghost reconstruction separated from general coalgebra data. |
| Witt comultiplication, counit, coassociativity and cofree adjunction | Integer 2 has second Witt coordinate −1, not +1; counit is coordinate one; zero ring | Sign and coordinate-versus-exterior distinction retained. |
| Witt section, its naturality, generating series and exterior operations | τ₂(2)=3+q under c₂, λ²(2)=1 and c₂(2)=−1; toric generator | No inversion of coordinate integers on torsion rings. |
| Free Λ-ring, adjunction and local Adams presentations | Empty/free generator sets; p=2; basis containing 1; toric {1,t} over ℤ[t²] | Twisted scalar action and arbitrary generator sets retained. |
| Perfection and perfectly covered bases | A=0, A=ℤ, toric bases, ℤ[x,y]/xy | Injective Adams operations on the last example do not imply flatness. |
| Relative and completed Frobenius | B=𝔽_p[t], S=B; Gaussian inert/split primes; cubic at 5; zero algebra | Linearized Frobenius can be invertible while the semilinear map is not globally invertible. |
| Finite Witt and q-Witt operations, relative quotient, ghosts | m=1,2,4; q-W₂(ℤ) rank 2 versus naive rank 4; q-W₂(𝔽₂)=ℤ/4 has noninjective ghosts | Frobenius, restriction and Verschiebung remain distinct. |
| s_m,c_m and base change | Toric A=R=ℤ[t], m=2; c₂'s image misses t, relative self-ring contains t | Absolute and relative q-Witt rings are not identified. |
| Étale pushouts, ghost pushouts and naive obstruction | Divisor d=m; m=1; cubic mod 5 has degrees 1 and 2 | Étale flatness makes the specified pushouts derived; marked base-ring condition retained. |
| Part I reflection, tower, detection and tensor | Zero, localization R_r, 𝔽₂ with q=1, and ℤ[[q−1]] | Supplier owns these constructions; localization is killed, complete objects are fixed. |
| Part I finite descent and arithmetic pieces | m=1,2,4,6,12; (1,0) fails integral m=2 gluing; characteristic 2 has intersecting supports | Completed arithmetic pieces are not independent copies of all prime-power levels. |
| Part I marked lifts and Hodge identification | R=0, R=A, split R=A², non-étale dual numbers, cubic at 5 | Marking, étaleness, staticity proof and Frobenius transitions are necessary. R1 concerns the missing general interface. |
| §1.1 pair category, identity, composition and base change | Self-pairs force g=f; Gaussian conjugation is allowed; toric translation is not Λ-linear | Removed backward QW prerequisite; no extra Λ-structure imposed on R. |
| §2.1 Laurent convention and scalar restriction | q=1 modulo P₁; q locally nilpotent on Laurent/polynomial cofiber; 𝔽₂ with q=1 | q becomes invertible on completion, and restriction preserves the derived reductions. |
| §2.2 localization resolution | d(e₀) augments to 1−1=0; d(e₁) cancels inverse P₁; repeated (1−q) denominators | Cofinality supplied explicitly; a plus sign or factorial rather than inverse factorial fails. |
| §2.3 homotopy criterion | Static modules, shifts, unbounded module complexes, R_r | Two-column Hom/Ext¹ computation uses π_(n+1) in the Ext term; no boundedness silently added. |
| §2.4 ordinary comparison | M=0; m=0 negative control; M=𝔽₂ with positive m; P₁/P₂ quotient ranks 1/3 | Positive factors are regular without flatness or integer torsion-freeness; the surjective countable tower is static. |
| §2.5 completed tensor and coefficient extension | ℤ[q]/(q²−1)⊗^Lℤ[q]/(q³−1)=ℤ⊕Σℤ; ℤ→ℤ[t]; identity and zero base | Tor and completion both retained; flatness does not remove infinite completion. |
| §§2.6–2.7 spherical localization and completion | Sphere versus Hℤ, localized object, quotient by q−1, zero | Higher sphere homotopy is retained; HR-relative monoidality does not turn spherical restriction into a strong monoidal functor. |
| §2.8 solid embedding | Zero and completed unit; underlying discrete object versus completion of that object | Full spectral hypotheses now present in the local dependency list. |
| §2.9 solid unit idempotence | Constant sphere and 1/3-term finite wedges at the first factorial quotients | Conditional SA.1 tower/product hypotheses retained; no abelian result promoted to a spectral theorem. |
| §2.10 null families and profile poset | J empty, singleton, countable blocks; f=0; proper versus constant profiles | Zero profile convention and reverse ordering agree with inclusions of weighted ideals. |
| §2.11 tensor profiles and Gaussian factors | a=b=1 gives P₂=P₁²(1+q); q=−1 refutes reversed divisibility; q=1 over ℤ and 𝔽₂ | Polynomial identity precedes specialization, so no cancellation of a zero denominator. |
| §2.12 bounded-below closure | Zero factors, shifted generators and both uniformly bounded-below resolutions | Both factors and realization hypothesis remain; no unbounded extension claimed. |
| §3.1 cyclotomic intersections | {1,4} survives at (2,q−1); {1,6} gives unit ideal | Nonadjacent powers on one prime chain are not discarded. |
| §§3.2–3.4 index, height and edge factorization | m=1 has one vertex; m=6 eight; m=12 eleven; m=6 undirected cycle | Subset order, singletons, maximal chains and unique consecutive-edge paths retained. |
| §3.5 monoidal descent | Identity cover; disjoint summands; constant nonzero D on opens with zero overlap | Explicit overlap identity rules out false descent from conservativity alone. |
| §3.6 mapping spaces | m=1 ordinary local mapping space; prime m one path; m=6 four paths | Homotopy equalizer, not set equalizer; no spurious higher cocycle on the height-one index. |
| §4.1 stage maps and self-comparison | Identity, toric base change, Gaussian conjugation at m=4 swaps e=(1−iq)/2 with 1−e | Map depends on g, not only f. Zero check corrected: ℤ[[q−1]] admits no unital map from zero. |
| §5.1 ordinary limit, completions and quotients | R=0; self-pair; m=1,2; Gaussian Φ₄ quotient R² | π₀, finite projections, factorial cofinality, f_m regularity and q-Witt quotient are all retained. |
| §5.2 roots, Taylor factors and the two arrows | ζ₆=−ζ₃ gives ζ₃−ζ₆=2ζ₃; traditional roots differ by a unit; m=1; R=0 | Correct re-expansion direction; full coefficient algebra and nontrivial realized Galois action retained. |
| §§5.3–5.4 local comparison and Taylor equalizer | Φ₅ mod 11 splits into four factors; 1−q³ has zero value but nonzero Taylor series | Values alone and a selected embedding both lose data. |
| §5.5 untwisting | Self-pair over toric A; general cubic coefficients | Requires compatible invertible linearizations on R; perfect covering alone does not untwist arbitrary R. |
| §5.6 completed coefficient base change | Identity, zero target, ℤ→ℤ[t] and the unbounded-degree series ΣP_n t^n | Precise tensor-product target and completion retained even for flat base change. |
| §§5.7–5.9 classical/discriminant/number-field comparisons | F=ℚ; Gaussian and cubic fields; Δ≠0; primes in discriminant support | Ring theorem needs discriminant inversion; 6 is an extra line hypothesis. No unramified-prime or localization convention reversed. |
| §6.1 complete scalar extension and Picard map | Identity, finite free modules, quotient at m=2 after inverting 2, infinite direct sum | Perfect complexes need no extra completion; general colimits do. Existing Picard base change is used. |
| §6.2 actual lines and regulator | ξ=0, ξ+(−ξ), absent global descent certificate | Conditional actual HB.7 global lines and tensor laws retained; no automatic global line from local rank one. |
| §6.3 q−1 map | q↦1+X; ℤ classical injection; ℤ[1/2] nonzero higher-order idempotent killed | Ring kernel is distinguished from nontriviality of a regulator class. |
| §6.4 actual first-fiber evaluator | Unit evaluator, zero evaluator, negative evaluator sends 3 to −3 | Actual preimage of 1 supplies surjectivity; normalization is remembered. |
| §6.5 power-series line theorem | Arbitrary R, including nonlocal R and R=0; arbitrary invertible P with trivial first fiber | X lies in the Jacobson radical; finite generation and Nakayama give a generator, then invertibility gives the isomorphism. No field/DVR/Noetherian shortcut. |
| §6.6 completed Picard class | ξ=0 and arbitrary ξ under the integral evaluation certificate | Only the completed Picard class vanishes; original class need not be proved nonzero. |
| §6.7 supported field pullback | Identity and successive embeddings, common positive Δ divisible by both discriminants and 6 | Uses an actual HB.7 arithmetic certificate and H-scalar equivalence, not an unsupported R-tensor or trace map. |
| §§7.1–7.4 worked arithmetic | Φ₅ roots 3,4,5,9 mod 11; cubic x³−2=(x−3)(x²+3x+4) mod 5; prime-inverted components | All factors retained; degree-two factor gives nontrivial completed Frobenius; no identification of the naive stage. |

## Lean shape and signature audit

`Suggested.lean` remains 181 lines, imports only Mathlib, and uses `TauCetiRoadmap.HabiroRings`. The two light definitions have real bodies on existing carriers: the actual evaluator's linear equivalence and the constant-coefficient algebra instance. No heavy carrier, admitted datum, dummy proposition, auxiliary development or admitted example occurs. Enhanced targets remain specified in the README and listed by family in the closing comment.

Checked ten representative signatures/normalizations: arbitrary R,M and positive m in `laurent_regular`; its characteristic-two witness; its m=0 negative control; arbitrary commutative coefficients and a,b=0 in `factorial_mul_dvd`; the reversed-divisibility negative control; Δ≠0 and discriminant divisibility in `etale_localization_away_discr`; prime-support rather than multiplicity in `etale_localization_away_of_prime_dvd`; arbitrary H→R and actual e with preimage of 1 in `OrderOneFibre.trivialization`; the negative evaluator normalization; and arbitrary coefficient ring R with an actual first-fiber equivalence in `completedRegulatorTriviality`.

The five factorial/Laurent examples record the roadmap's positive-order, sign, divisibility and specialization controls listed above; they are not unrelated library calculations. The evaluator has two proved examples. `zeroEvaluation` is proved. All seven examples are proved, and exactly five milestone theorems use sorry. `lean-check` exited 0 with exactly five `declaration uses sorry` warnings and no other warning or error: `laurent_regular`, `factorial_mul_dvd`, the two localized étale theorems, and `completedRegulatorTriviality`. No Lean code changed after that check.

## Validation and receipts

- All six unchanged HabiroRings packets: `scripts/check_blueprint.py` gives zero errors and zero warnings for each.
- `scripts/check_sorry_data.py`: exit 0.
- `intake.py check-files`: zero problems for the package and the final review/handoff deliverables.
- JSON and TOML parse; local links, 90 explicit anchors and whitespace checked; no dangling anchor, duplicate explicit anchor or private path introduced.
- No new source passage, source file or excerpt is committed. No suspicious instruction was found in the untrusted material read.

Public source receipts, all accessed 2026-10-20; SHA-256 is for the retrieved bytes. HTML receipts are retrieval-specific, not immutable editions. PDFs and extracted text stayed in disposable scratch space.

| Source | URL | SHA-256 |
| --- | --- | --- |
| Q | https://arxiv.org/pdf/2510.04782v2 | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| W | https://arxiv.org/pdf/2410.23078v5 | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| H | https://arxiv.org/pdf/1006.3125v3 | `1b21e5adf08ea73ea1aac471100d6b191d57d47d95ff27ae0f25ee5e1d9f2973` |
| B | https://arxiv.org/pdf/0801.1691v6 | `d8d7c8f62311b4b60cf4d298af4e8519460e33b69ce9a34da4641488e6766019` |
| G | https://arxiv.org/pdf/2412.04241v2 | `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9` |
| T | https://guests.mpim-bonn.mpg.de/ferdinand/q-Thesis.pdf | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |
| MW | https://ferdinand-wagner.github.io/papers/q-Hodge.pdf | `74b8a5c122cc54f5b347a49c895fdafc12e36f376fdd7165036b0c80277b3538` |
| Bosco | https://arxiv.org/pdf/2306.06100v1 | `a142fc46709b8a54ef552a052f8a0c96006b578ef2565bbe4bcea6100505c7e9` |
| HA | https://www.math.ias.edu/~lurie/papers/HA.pdf | `112b145a95a62daefb8275851cac9ab6430004cfc8f751a33a8d981fd7ad68c3` |
| Stacks 04D1 | https://stacks.math.columbia.edu/tag/04D1 | `11a0a6e46f55de460fce17a06dc9202700ba0c0cf36583839f4cc0993f37a85a` |
| Stacks 0ALI | https://stacks.math.columbia.edu/tag/0ALI | `77f4af37f94371d067830836f2d56c59f8c87104c013130ed8ecb0b4e484f588` |
