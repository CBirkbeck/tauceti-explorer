# Harpaz–Wittenberg (2016): extraction after independent review

**Extraction status: partial. Independent review: complete, revise.** Codex `codex-7e92bd`, review issue [#1180](https://github.com/CBirkbeck/tauceti-explorer/issues/1180), reviewed the input by Claude Code `cc-39fac3` from PR1953. The reviewer did not author the extraction. The companion JSON is the authoritative statement and change register.

The paper develops the fibration method for zero-cycles over curves and higher-dimensional bases, and conditional or special unconditional rational-point results. Its zero-cycle conclusion uses exactness of the completed modified adelic Chow complex, with closed-point fibre hypotheses. Its rational-point conclusions retain the polynomial conjectures and the precise real-place and bad-fibre restrictions. Conjectures are not proved merely by being registered in the extraction.

The reviewed inventory contains **106 items: 2 library, 15 planned and 89 missing**. Every missing item has exactly one route. Seven rows separate algebra-to-scheme Hensel lifting, general symmetric powers, one-omitted-place approximation, norm-boundary geometry, Faddeev residues and Lemmas9.19–9.20 from earlier bundles. The extraction still lacks atomic rows for several definitions and suppliers, their APIs/tests and a recursively closed dependency graph; G1–G8 enumerate that work.

## Sources actually read

The [author PDF](https://www.math.univ-paris13.fr/~wittenberg/zcfib.pdf), all 54 pages including proofs and references, was read independently. The [public published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p05-p.pdf) contains all 67 pages, despite its preview filename. The earlier claim that only two published pages were accessible is superseded. Selected journal pages259–260,265,275,278,280–283,287 were collated, with images265,275,281,283 inspected. [arXivv4](https://arxiv.org/pdf/1409.0993v4) passages31,39,45,47 were checked separately. No full independent rereading of the arXiv TeX archive is claimed.

Original suppliers newly read: [Wittenberg12](https://www.math.univ-paris13.fr/~wittenberg/zerocycles.pdf), pp21–22 Lemma4.2 with proof and Lemma4.3 statement/setup; [Smeets15](https://arxiv.org/abs/1305.0756), pp14–15 Proposition6.1 with proof; [Harpaz–Wei–Wittenberg22](https://www.math.univ-paris13.fr/~wittenberg/hww.pdf), Remark3.2, Theorem4.1 and Remarks5.4 selectively. Other external suppliers are not represented as having been read merely because HW16 cites them. Exact download hashes and scope are in the JSON.

## Existing work and corrections

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` gives exactly algebra lifting to an adically complete ring. Item25 now has that precise scope; the scheme-smoothness and affine-chart adapter is planned separately in100. At TauCeti `f790474821cf4256814db967cb154e7af3d0c369`, `TauCeti.GlobalNumberFields.weakApproximation_denseRange` already proves density in finite products of genuine mixed completions; item99 is now library. Neither declaration supplies strong approximation with an arbitrary finite place omitted.

The exact cited layer descriptions and corresponding reviewed coverage rows were read. GlobalNumberFields Layer6 names only finite-adele density. JacobianChallenge LayerC owns curve symmetric powers, not arbitrary quasi-projective quotients. RG2.0a owns affine Weil restriction; the normal-crossings boundary claim must be restricted to finite étale integral models and has empty singular locus in rank1. SF.2 owns cohomological Brauer/residue and Kummer interfaces; T.4 supplies Weil reciprocity. All these are planned interfaces, not implemented fibration theorems.

The Faddeev sequence originally combined an affine-only residue index with the projective sum-of-corestrictions map. Corrected104 includes infinity; the affine alternative ends at its residue direct sum. The Smeets bibliography was a different paper by a misnamed author: the correct supplier is Arne Smeets, *Principes locaux-globaux pour certaines fibrations en torseurs sous un tore*, DOI10.1017/S0305004114000577, arXiv1305.0756.

Other clear corrections include the good-place moving hypothesis, characteristic-zero Kummer coefficients, the actual model hypotheses in relative curve vanishing, finite Pic torsion as a consequence of Mattuck, the image of Br(k) rather than an asserted isomorphism, and constant-field compatibility in geometric Frobenius realization. The JSON records each changed field and its previous value.

## Route decisions

Acceptance below approves the bounded source request or coalescing contribution. It does not certify the whole paper or the unexpanded external proofs.

### 1. HeightsRationalPointsAndObstructions — reject

Reject until the three Harari inputs are separated with exact original good-model, torsion and intersection hypotheses. The RP.2 owner and corrected variety-level approximation carrier are appropriate, but the present bundle is not a sufficient build interface.

### 2. SchemeAndStackFoundations — accept

Accept the corrected source additions to SF.2: characteristic-zero Kummer, residues, henselian finite-residue-ring Brauer vanishing and the projective Faddeev sequence104. Import the existing algebraic Brauer carriers; original proof acquisition remains explicit. This accepts a source request, not proof completion.

### 3. InverseGaloisAndArithmeticFundamentalGroups — accept

Accept the closed-point local Hilbert stability and product-Hilbert source request in IG.2. HW16 Lemmas6.1/8.12 were read, and the rational-point source Smeets Proposition6.1 was independently checked in the correctly identified original paper.

### 4. WeilConjectures — reject

Reject the current broad contract: WC.5 states smooth-projective cohomological bounds, while24/88 need uniform quasi-projective/model estimates and a constant-field Frobenius-coset condition. The corrected item88 avoids a false unrestricted realization claim, but the source adapter is not yet decomposed.

### 5. MotivesAndAlgebraicCycles — reject

Reject until the original Bloch/Srinivas hypotheses and proof suppliers are acquired. E3 confirms missing properness in the printed statement;65 now retains the safe smooth-projective application range. MC.0 is the right correspondence owner but the unrestricted equivalence is not accepted.

### 6. AnalyticNumberTheory — reject

Reject the bundled source after correcting ownership to AN.6. SV.4 plans Maynard bounded gaps, not the conjecture register. Exact H/HH1 predicates and the separate proved implication still need an original source contract.

### 7. SieveMethodsAndPrimePatterns — reject

Reject: the Irving row still contains unspecified suitable local data, and neither analytic supplier has a complete original statement-level extraction. SV.5 is the sieve direction; do not activate an executable theorem from the current paraphrases.

### 8. AdditiveCombinatorics — reject

Reject pending Matthiesen’s exact integral norm-form representation/admissibility, finite complexity and archimedean-region hypotheses. AC.5 owns linear patterns, but the theorem is not supplied by that ownership alone.

### 9. AbelianSchemesAndArithmeticModuliPartIILocalPoints — accept

Accept reuse of the independently accepted Bresciani local-points candidate. Finite-K/Qp Mattuck implies finite Pic torsion through the injection Pic⁰(C)→Jac(C)(K); no degree-one point, equality of Picard rational points, or equivalence with finite exponent is assumed.

### 10. HeightsRationalPointsPartIIHomogeneousMassey — accept

Accept coalescing these already accepted homogeneous-candidate inputs, preserving HW20 route13’s ownership of1,68,92 and its Borovoi input59. This contribution does not reassign accepted ownership or validate new unrestricted HW16 proof closure; the generic RC prefix and arithmetic consumer order stay explicit.

### 11. HeightsRationalPointsPartIIZeroCycles — reject

Reject the enlarged fibration design. Atomic inventory, every definition’s API/tests, original suppliers and exact DAG are still missing; the restricted weak9.2 real proof has E4. Preserve the accepted HW20 candidate and fixed ownership, but do not promise this larger package is ready to build.

### 12. SchemeAndStackFoundations — accept

Accept the general quasi-projective symmetric-power source in SF.1, importing curve Sym from JacobianChallenge. Smoothness requires f smooth at the support and reduced image; the local disjoint-support quotient argument gives the intended interface without a duplicate curve carrier.

### 13. GlobalNumberFieldsPartIIOmittedPlaceApproximation — reject

Reject pending the original one-omitted-place additive approximation proof and its exact interfaces. The PartII boundary is justified: existing weak approximation is built, and upstream Layer6 only promises finite-adele density.

### 14. ReductiveGroupsPartII — accept

Accept the precise finite-étale norm-boundary source in RG2.0a. Splitting gives coordinate hyperplanes and codimension≥2 singular locus, including the empty rank-one case; integral claims are restricted to the unramified base.

### 15. ClassFieldTheoryPartIICharacterCorestriction — reject

Reject pending the original Gras statement/proof and the divisible-idele-class duality interface. The generic theorem is correctly separated from its fibration application as an upstream CFT continuation; the current citation is not proof closure.

HW20 routes13/14 and HW23 route8 have now been accepted. Their shared homogeneous owner retains Conjecture1.1, Conjecture9.1 and Corollary9.25; the earlier proposal to move those items from an allegedly unreviewed candidate is removed. The generic rational-connectedness prefix of the zero-cycle continuation precedes the homogeneous layer, and final arithmetic consumers come later. Bresciani’s accepted local-points route remains the single Mattuck owner. No upstream TauCeti roadmap is rewritten.

## Findings in the published source

- **E1, confirmed misprint, published p275:** the remaining case in Lemma9.13(4) lies outside S-prime. The Möbius identity is correct; the complement is the slip.
- **E2, confirmed proof error, p283:** a finite Brauer subgroup need not vanish on every local point outside a fixed finite set when X is nonproper. Integral outside-S choices on a common model repair this step; the separate E4 issue remains.
- **E3, confirmed missing properness, p265:** Lemma8.11 uses the degree-zero Chow invariant outside its defined domain. On A1 the principal divisor of t has degree1. The extraction retains the smooth-projective application range; arbitrary singular/proper generality is not newly certified.
- **E4, confirmed proof-step error, p281:** a flat proper map need not be open on real points. The explicit cubic family and component calculation are in the independent review. This is not a counterexample to the main theorem. The restricted weak-Conjecture9.2 real case needs a valid replacement; simply shrinking the base changes the assumed polynomial/sign data.

A bounded correction search checked the publisher landing, author publication pages, arXiv version history, relevant later-paper passages and targeted erratum searches. No relevant separate correction was identified. That is not a discovery-priority assertion or a claim to have surveyed every later paper.

## Remaining work and validation

- **G1 — Atomic inventory:** Split16–18,21–23,26,35–38,46–48,51,60,64,67,72,76,79,83,95 into separate definitions/lemmas. Rational connectedness, condition8.1, property(*), relative Chow kernels, and the remaining named proof lemmas need standalone contracts.
- **G2 — Definition APIs and tests:** None of the99 input rows supplied a planning API, tests or dependency array. Supply a consumer-derived API and at least three discriminating tests for every definition; the exact counterexamples below are review evidence, not a substitute for those per-definition obligations.
- **G3 — Original source closure:** Acquire Wit12 duality/completion/local Chow statements, Har94/97, CT00/CTP00/CT11, Bloch80/BS83, GHS, Saito/Milne, Kollár–Szabó, Gras, and the uniform Lang–Weil/Ekedahl suppliers in their original versions. Only the specifically recorded Wit12/Smeets passages were newly read; quotations by HW16 are not original-source verification.
- **G4 — Analytic source contracts:** Replace suitable local data in82 and the summary80 with exact Irving/Matthiesen/Heath-Brown–Moroz/Swinnerton-Dyer hypotheses and proof decompositions; separate conjecture predicates from proved reductions.
- **G5 — Weak real fibration branch:** E4 refutes the printed real-openness/component step. Supply a valid replacement under the restricted9.2 hypothesis, or clearly advertise a strengthened hypothesis. E2 integral choices do not solve E4.
- **G6 — Generic ownership and stage DAG:** Preserve accepted HW20 homogeneous/zero-cycle stage ownership, finish the exact generic owner of power-quotient completion47, and separate the new upstream continuations102/87. Source route4 still needs the uniform/nonproper and constant-field contracts beyond current WC.5.
- **G7 — Source-level to library bridges:** Read the exact original finite-field/local-ring Brauer and cycle suppliers; close scheme-smoothness/algebra lifting100, Pic⁰ versus Jacobian points, site/Kummer/residue and quotient-Sym bridges. Built abstract carriers do not supply these geometric theorems.
- **G8 — Plan completeness:** The new explicit dependency edges cover checked central arguments only. Build an acyclic statement-level DAG down to pinned declarations or already owned exact interfaces; do not use a missing theorem as its own supplier. Review complete does not mean extraction complete.

The independent review report records the exact validation results. No Lean file is an issue deliverable, and no Lean compilation or formalization is claimed.

Final validation: paper checker passed; exact five-file intake passed (0 problems); structural audit passed (106 unique items, 89 missing items each routed once and searched, 105 acyclic edges, 15 route verdicts and four finding verdicts). Seven symbolic calculations and three arithmetic sanity checks passed. No Lean compilation claimed. Atlas inputs refreshed at `56a4451639a928390a1d48b04dc8e5c2ceb51654` and guarded by exact blobs at publication. Fresh changed-result/review ownership screened. Benoist–Wittenberg20 route3 retains universal CH0 support and diagonal action at MC.0; its route6/component-separators concern equivariant real-locus cohomology, not openness of a flat proper map. The diagonal-vanishing row itself retains GAP-DIAGONAL. Gleason–Lim–Xu26 routes1/8 retain RG2.0a and Tannakian MC.6; no replacement fibration/approximation owner is introduced. The other refreshed candidates do not replace these exact interfaces. Existing accepted HW20/HW23 and Bresciani ownership was read in full at the relevant routes.
