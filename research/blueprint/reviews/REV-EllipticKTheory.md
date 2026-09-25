# Review: EllipticKTheory (K-theory of curves and elliptic curves), stages E.1–E.8

Job `REV-EllipticKTheory` (issue #392), by Claude Code, session `cc-442dc5`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-EllipticKTheory`, issue #715, PR #2886). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: six stages are `source_decomposed`, E.5 and E.6 are `partial`, and the open points are recorded as 2 gaps and 30 requests.

## What was checked

- **Sources.** The packet's only source was the K-book, in the author-hosted draft of 29 August 2013 (a04f53c9…, re-hashed). Every one of its "PDF p." locators was wrong: the numbers were neither the PDF page nor the printed page (mostly the printed page minus one). I re-derived the page key from the page footers of the file: PDF page = printed page + 8. Every K-book locator now gives both. Further texts were read and added as sources:
  - **Bloch, CRM Monograph 11** (the programme's supplied scan `SUP_Bloch_HigherRegulators_2000`, 9715a312…), Lecture 10.1 and 11.1. The packet had filed it as a gap ("not freely available and was not obtained"); it is a supplied source of this programme.
  - **Dokchitser–de Jeu–Zagier**, arXiv math/0405040v2 = Compositio 142 (2006) (a9d5c2cc…), §§3, 4, 6, 8.
  - **Dummigan–Golyshev–de Jeu–Kerr**, arXiv 2605.11100v1 (93ca7e61…), §2 and §10.
  - **Young**, Durham thesis 1995 (8526c62b…), Chapter 3.
  - **Scholl**, *Integral elements in K-theory and products of modular curves*, author preprint (7bffc958…), §1.
  - **Conrad**, *Minimal models for elliptic curves*, 2015 (1093586a…).
  - **The Stacks project**: Chapter 53 (curves), and the chapters *Resolution of surfaces* and *Semistable reduction* (version ed88ff78).
  - **Poonen**, *Rational points on varieties*, author draft (42e92ce4…), for the descent of line bundles.
  - **The AMS errata list** for GSM 145 (2 September 2014, 653be303…). The author's own errata link on the K-book page returns 404.
- **Checkers.** Three worked in parallel, each comparing locators and excerpts with the rendered pages, opening every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, reading every supplier stage in `data/atlas.json`, and computing small cases in PARI/GP:

  | Checker | Scope |
  |---|---|
  | A | E.1–E.3 (12 nodes), the 13 baseline declarations, AUDIT-28, the Lean file |
  | B | E.4–E.6 (12 nodes), the models literature (Conrad, Stacks, Scholl, DJZ) |
  | C | E.7–E.8 (6 nodes), Bloch's lectures, the packet-level fields, cycles |

- **What I checked myself.**
  - **Texts.** Every excerpt the review wrote was taken from the text of the file at the locator: II.8.1, II.8.2.1, II.8.2.3, II.8.5, I.5.15–I.5.16, III.6.3, III.6.3.1, V.1.5, V.3.11, V.3.12, V.6.6 (with the tame-symbol claim and ∂{π, u} = ū), V.6.12, V.6.12.1, VI.6 opening, VI.6.1, VI.6.4, VI.6.7 and VI.6.8 (whose excerpt had silently dropped "(generalizing V.6.12.1)"). I also read III.7.2(a), I.5.17 and VI.6.2 for the source issues.
  - **Mathematics, by hand.**
    - The tame symbol: III.6.3 gives ∂_v{r, s} = (−1)^{v(r)v(s)} (s^{v(r)}/r^{v(s)})‾ and V.6.6 gives ∂{π, u} = ū, the inverse of K2SymbolsBrauer's ∂{f, g} = (−1)^{v(f)v(g)} (f^{v(g)}/g^{v(f)})‾.
    - The ring structure (0, 1, O)² = 0 from II.8.1's (a₁, L₁)(a₂, L₂) = (a₁a₂, L₂^{a₁} ⊗ L₁^{a₂}).
    - The pullback example s ↦ s² in K2SymbolsBrauer's convention (∂_y{u, t} = u, ∂_x{u, s²} = u²).
    - On ℙ¹_ℚ, div(t² + 1) = [x] − 2[∞].
    - The weight-one eigenvector z + z²/2 in K₀(ℙ²) = ℤ[z]/(z³).
    - [m]_*[m]^* = m² for odd m: [m]^*L ≅ L^{⊗m} on Pic⁰ and det² trivial.
    - The self-intersection argument of the base-point lemma.
    - The 36a1 products (normed 1, unnormed −1 − √−3).
    - The uniformiser 3 at the generic point of V = 0 on DGJK's model at u = 1/3.
    - DGJK's discriminant 16u⁴(u² − 1)², which the Lean file also checks by `ring`.
  - **Graph.** A validator checks that:
    - every prerequisite resolves;
    - every stage prerequisite has a request, and every request and gap has `neededBy` nodes;
    - the node graph is acyclic and respects the stage order;
    - no path runs from a cross-roadmap prerequisite back to its stage of this roadmap or a later one, following node prerequisites, the atlas `requires` and the links of the accepted restructuring RS-18.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/EllipticKTheory.json` reports 0 errors and 0 warnings. The original packet also passed it; the checker does not test statement truth, test kinds, excerpt length, locators or cycles.
  - The source issues pass `scripts/check_errata.py`, run on a copy of the list.
  - `research/blueprint/intake.py check-files` passes on the three deliverables.

## Counts

| | before | after |
|---|---|---|
| nodes | 30 | 52 (26 corrected, 26 added, 4 deleted and replaced) |
| API items | 46 | 67 |
| unit tests | 32 (none with a kind) | 49 (all with a kind) |
| planets | 9 | 6 (at most one per layer) |
| sources | 1 | 11 |
| baseline declarations | 13 | 59 (49 added, 3 removed) |
| requests | 16 (none with `neededBy`) | 30 (14 stages, 16 Tau Ceti roadmap layers) |
| gaps | 5 (with stage ids as `neededBy`) | 2 (with node ids) |
| source issues | 0 | 16 |
| restructure entries | 3 | 5 |

Added nodes by stage: E.1 3, E.2 3, E.3 4, E.4 2, E.5 1, E.6 3, E.7 7, E.8 3. No original node was verified unchanged.

## The main corrections

**False statements.**
- **E.3, the localisation sequence.** The last map is the generic rank K₀(X) → K₀(F(X)) = ℤ, not the degree. With the degree the sequence is not exact at K₀: on ℙ¹_ℚ, [O_X] has degree 0 and is not in the image of the sum over closed points (K-book V.6.6, V.6.12). The route is Quillen localisation, dévissage and K = G, not "gluing affine sequences".
- **E.3, the tame-symbol boundary.** In the K-book normalisation the connecting map is the *inverse* of K2SymbolsBrauer's tame symbol; the node said the two agree unchanged. The node now fixes the left-linear normalisation. It imports the comparison from K2SymbolsBrauer T.3/localization-boundary, which states both normalisations.
- **E.2, the descent warning.** "A Galois-invariant class need not descend" is false for E with its rational origin: c − d[O] lies in Pic⁰(E_s)^G = E(F) (Poonen Ex. 6.10). It becomes a theorem (E.2/line-bundle-descent) with the conic x² + y² + z² = 0 over ℝ as the non-example.
- **E.2, the Picard splitting.** "Without a rational origin the splitting does not exist" is false: Pic ≅ Pic⁰ ⊕ ℤ abstractly always holds. What fails without a point of degree one is surjectivity of the degree.
- **E.4, SK₁.** "The curve SK₁ differs from the stable SK₁ for an affine curve with non-trivial class group" is false: for Spec R the kernel to the function field is ker(det). The difference is for proper curves: SK₁(ℙ¹_F) ≅ F^× while both charts have SK₁ = 0.
- **E.4, coniveau.** "The left filtration term is not zero" is false (F¹K₃(𝔸¹_F) = 0), and degeneration is unconditional (two columns).
- **E.4, weights.** "Integrally no eigenspace decomposition exists" is false for K₀ of a curve; the witness is K₀(ℙ²).
- **E.5, isogenies.** The rational f_*f^* = deg f was justified by a wrong reason; the weight decomposition does not kill Pic⁰ ⊗ ℚ. What holds is that det f_*O is 2-torsion for a separable isogeny. A new lemma gives the integral non-example (the 2-isogeny of y² = x³ − x) and the positive case [m], m odd.
- **E.5, the projective line.** "An elliptic curve's K₀ is not free of finite rank" is false (y² + y = x³ + x + 1 over 𝔽₂ has K₀ ≅ ℤ²).
- **E.6, models.** "A Weierstrass model is proper but not regular at bad primes" is false (37a1 is regular at 37, type I₁). "Already regular at good primes" needs minimality (y² = x³ − 81x at 3). "The Néron model is not proper" is false over O_{F,S} with good reduction (Conrad Ex. 5.3).
- **E.6, the integral part.** "The S-integral variant is a different subspace; inverting more primes enlarges it" is false: a good prime imposes no condition (Scholl 1.3.6). Model independence needs no blow-up formula (Scholl 1.3.3, Stacks 0C5S). The vertical-residue description holds rationally without the packet's hedge.
- **E.7, independence.** Bloch's "independence modulo torsion and constants" was read as linear independence. It means independence of the choices; DJZ Prop. 4.3 shows such classes span rank at most one. The classes S_a were never constructed, and S_a exists only after the factor C (source issue E11).
- **E.7, descent.** "Descent need not be surjective" is false rationally (DJZ Remark 4.14). The stage's warning concerns integrality.
- **E.7, certificates.** The condition must be triviality in the residue field k(P), not of its norm (on 36a1, {x − 1, −1} has value −1 of norm 1 at x = 1).

**Ownership (PROTOCOL §15).** The checkers had not seen the accepted restructuring RS-18 (23 September), which narrows every stage of this roadmap. I aligned the packet with it after reading `research/blueprint/restructure/RS-18.result.json`. Its owners agree with the checkers' findings:
- E.1's scheme, smoothness, properness, points and group law are ModularCurves layers 1A, 1B and 1D, the scheme isogenies are 2A and 2B, and the function-field dictionary is AlgebraicCurves 12. E.1 had built the field case itself.
- E.2's degree, Riemann–Roch and Cl ≅ Pic are JacobianChallenge A and B. The function-field point equivalence is EllipticCurves 0, and descent is ModularCurves 2D.
- Pullback, pushforward and the projection formula are SchemeKTheoryOperations S.2, and the projective bundle theorem is S.5. The packet cited S.4 (descent and coniveau) for all of them.
- The coniveau sequence is S.4's, not M.6a's (Levine's homotopy-coniveau tower). The rational motivic comparison is M.6.
- The tame-symbol comparison is K2SymbolsBrauer T.3:localization-comparison's.
- E.6's local model theory is StableReduction layers 4 and 5.

Tau Ceti roadmap layers are recorded as requests with `neededBy`, not as prerequisites. `check_blueprint.py` reads every `tauceti:` reference as a baseline declaration.

**Cycles.** E.3/the-tame-symbol-boundary required the stage K2SymbolsBrauer:T.3:localization-comparison, while K2SymbolsBrauer:T.3/localization-boundary required EllipticKTheory:E.3: a two-stage cycle. REV-K2SymbolsBrauer--T.3 (#2893) has since removed the second edge, and E.3 now cites the node instead of the stage. Two further repairs avoid paths back to E.3:
- The number-field injectivity now uses the colimit of the finite groups K₂(O_{F,S}) instead of the tame kernel sequence of T.5.
- The finite-field injectivity uses T.2/k2-finite-field.

The validator finds no remaining path.

**Closure.** Targets the stage texts ask for that no node realised now have nodes:
- E.1: the points and group-law comparison; integrality and regularity in the form Tau Ceti's divisor API consumes.
- E.2: Cl ≅ Pic for the scheme; the ring structure of K₀.
- E.3: the boundaries in degrees one and zero; finite pullback and transfer as separate lemmas.
- E.4: the base-point splitting; the finite-coefficient weights; K₃^ind in weight two.
- E.5: the class of f_*O.
- E.6: existence of models; the blow-up link; good primes.
- E.7: the Bloch nodes (principal divisors, correction, S_a); transfer; rational Galois descent.
- E.8: three worked examples with explicit curves, elements, points and primes, the values computed by checker C in PARI:
  - DGJK's E₄ with an eight-point certificate;
  - a residue in ℚ(√−3) on 36a1;
  - 11a3 and E_{1/3} at split multiplicative fibres.

**Deleted and replaced.**
- E.7/weil-reciprocity-as-the-consistency-condition duplicated K2SymbolsBrauer T.4 and cited only ℙ¹.
- E.7/classes-from-torsion-divisors and E.7/non-rational-torsion-and-descent: see the false statements above.
- E.8/the-three-worked-examples named no curve.

**Presentation.**
- Ten excerpts were not literal. Two of them turned the source's pullbacks into pushforwards (V.3.7.3 labelled V.3.5.3). One was 356 characters long.
- Planets were removed from imports and comparisons; E.2 gained "K₀ of an elliptic curve" and E.7 "Bloch's elements S_a".
- Coverage: E.1–E.4, E.7 and E.8 `source_decomposed`; E.5 and E.6 `partial`, each with one gap.

## Baseline citations removed or fixed

- **Near miss.** `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.degreeSplitForward` is only the forward map. The splitting is `classGroupAddEquivPicZeroProdInt` (Splitting.lean:227), which needs `isWeightedDegreeZero_orderSystem`, `ker_degreeClass_eq_picZero`, `Place.degree_infinity` and the Dedekind instance from `isIntegrallyClosed_coordinateRing` (no global instance exists).
- **Overstated.**
  - `eulerCharBelow` is a truncated sum with junk values, additive only under hypotheses.
  - `LineBundleClass` is a monoid.
  - `TauCeti.Isogeny.ker` is the group of F-rational points, not a group scheme.
- **Removed as decorative:** `mathlib:AlgebraicGeometry.Scheme` (the declaration that makes Proj a scheme is `AlgebraicGeometry.«Proj»`) and `tauceti:TauCeti.AlgebraicGeometry.SchemeWeilDivisor`.
- **Added (49), all confirmed in the pinned index:**
  - Mathlib: Proj with its charts, separatedness and properness, smoothness, integrality and regularity classes, `functionField_isFractionRing_of_isAffineOpen`, and the Weierstrass lemmas;
  - Tau Ceti: the places and divisor API (`Place`, `ord`, `residueUnit`, `normResidue`, `exists_eq_zpow_mul_unit`, `finite_setOf_ord_ne_zero`, `Divisor.principal`, `conorm`), the isogeny API, the scheme Weil-divisor comparison maps, `AbelianK0`, and `exists_principal_zsmul_pointPlace_sub_infinity` (AUDIT-28's E.7 evidence, which the packet had re-planned).
- **Format.** Every entry has `kind` and `checked`.

## Mistakes in the sources

16 entries, all with `review.verdict = confirmed`; `sourceVersions` lists six texts. None was recorded before; the K-book issues other packets record lie in other sections.

**K-book, 10 entries.**
- E1: VI.6 cites III.7.2(a) for the finiteness of K₂(X), but III.7.2(a) is about Milnor K_n for n ≥ 3.
- E2 (gap): "By classical Weil reciprocity V.6.12.1, the cokernel of ∂ is F_q^×" gives only a surjection.
- E3: Hartshorne I.6 is cited over F_q.
- E4: VI.6.2(a) prints |S| = s − 1 for s + 1.
- **E5 (error):** before VI.6.5 the book claims H^p(G, −) is torsion for p > 0 on ℚ_ℓ-modules. It is not: H¹(G, ℚ_ℓ) = ℚ_ℓ by the book's own (6.5.1). Lemma VI.6.6 uses only i ≥ 2 and is unaffected.
- E6: an edge map of X for X̄.
- E7: K₂F(t) is "generated by linear symbols", which omits K₂(F).
- E8, E9: grammar in V.6.6.
- E10: the AMS erratum to V.3.11 (recorded as known).

**Bloch, 3 entries.**
- **E11 (gap):** (10.1.2) defines S_a from {ρ, f_a}, but only C{ρ, f_a} is correctable (y² = x³ − x, C = 2).
- E12: the proof of 10.1.1 uses Weil reciprocity silently.
- E13: Lecture 11 cites "Theorem 10.3.2" for Theorem 10.2.1.

**Other sources, 3 entries.**
- E14: Scholl 1.1.6(i) drops the target N.
- E15: Conrad cites "Theorem 4.7" for Corollary 4.7.
- E16: DGJK Prop. 2.2(1) prints Δ with (u² − 1)⁴ for (u² − 1)².

## Lean

`research/blueprint/suggested/EllipticKTheory.lean` was rewritten against the final packet: 891 lines, importing only individual Mathlib modules. The original did not parse (a docstring on a `variable`), and 84 of its 89 declarations had type `True`. I elaborated the new file with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib 082e2d3; nothing was built. The result was exit 0 with 54 warnings, all `declaration uses 'sorry'`.

**Coverage.** A scripted check finds every node id, API item and test of the packet in the file. Tests are `example`s whose docstring names the test, or comments `-- Test <name>: not stated; needs …`.

**Other roadmaps' objects are variables:**
- the Weierstrass scheme with its charts and zero section (ModularCurves 1A);
- K-theory of schemes as one contravariant functor per degree, with proper pushforward, the localisation boundary and Adams operations (S.2, S.3, S.6);
- the Picard group, rank and determinant (JacobianChallenge A, Z.5);
- K₁ of a field, the tame symbol and K₂ (U.3, K2SymbolsBrauer T.2–T.4);
- the places of a function field with their orders and residues (Tau Ceti's `TauCeti.Place` API, not imported because no build of Tau Ceti f790474 was available).

**Objects stated concretely:**
- pullback, with its functoriality proved;
- the transfers from closed points and the restriction to the generic point;
- the curve SK₁ and the coniveau filtration;
- the rational weight components;
- the structure `RegularProperModel` with its fibres and components, and the integral part and its S-variant as ranges of ℚ-linear maps;
- the tame value, candidates, `SymbolCertificate` and `IntegralCertificate`, whose fields are their actual conditions;
- the multiplication on ℤ ⊕ ℤ ⊕ E(F).

The concrete checks of the worked examples (DGJK's discriminant, 11a3's Δ = −11, the 37a1 and 11a1 regularity computations) are proved.

**Not stated yet**, as comments: whatever needs the projective line or [m] as schemes, K-theory with finite coefficients, motivic cohomology, Néron models, or Tau Ceti's divisors on W.FunctionField. No statement is `True`, and `sorry` appears only in declaration bodies and proof obligations.

## Questions for the orchestrator

1. **RS-18 and the atlas.** `data/atlas.json` still has E.3 requiring only E.2; RS-18's links are not applied yet. Separately, E.7 needs E.6 (integral certificates rest on vertical residues), which RS-18 does not add; a restructure entry proposes it. RS-18 gives E.6 a link from S.5 for the blow-up formula, which model independence does not need.
2. **RS-18 keeps E.2's "descent obstruction".** With a rational origin there is none. The packet states descent as an isomorphism, with the obstruction as a non-example for curves without a rational point. The stage text should be read that way.
3. **Tau Ceti roadmap layers as prerequisites.** `check_blueprint.py` treats every `tauceti:` reference as a baseline declaration, so the 16 layers this packet imports are requests with `neededBy` rather than prerequisites. PROTOCOL §15 says Tau Ceti layers are "cited as prerequisites"; the checker and the protocol disagree.
4. **Unowned inputs:**
   - Geisser–Levine and the étale cohomology of curves over 𝔽_q with Weil's theorem (E.5), which have no atlas owner;
   - the global uniqueness of the minimal regular model over O_{F,S} (E.6), which is not needed for the integral part.

   Both are gaps.
5. **For EllipticRegulators.** Bloch's classes S_a are defined only up to the factor C (source issue E11), and Lecture 11 misquotes Theorem 10.2.1 (E13). ER.4 and ER.5 consume both.

## Summary

The review accepted the packet after correcting it in place. Of the 30 nodes, 26 were corrected and 4 were replaced, and 26 nodes were added.

Among the false statements corrected:
- the last map of the localisation sequence;
- the sign of the tame-symbol boundary;
- descent for E;
- the Picard splitting;
- SK₁ of an affine curve;
- the coniveau left term;
- the rational isogeny formula;
- the projective-line contrast;
- regularity of Weierstrass models and properness of Néron models;
- the S-integral monotonicity;
- Bloch's independence and rational descent.

Bloch's monograph, filed as unobtainable, was read and decomposed. The packet now follows the accepted RS-18 owners and has no cross-roadmap cycle. Every test has a kind, every locator gives both page numbers, and every baseline citation was checked at the pin. The packet records 16 source mistakes, 2 gaps and 30 requests. The Lean file elaborates, with `sorry` as its only warning.
