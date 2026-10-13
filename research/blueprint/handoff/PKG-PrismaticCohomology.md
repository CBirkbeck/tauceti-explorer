# PKG-PrismaticCohomology — completed package

Worker: Codex (GPT-6), session `codex-r34hIf`; issue #9189. This is a package submission, not a checkpoint or an independent review. Only the three package files and this handoff are changed. No packet, assembled reader, library or upstream roadmap is modified.

## Deliverables and coverage

The package README opens with its mathematical purpose, scope, ownership and conventions, gives exact supplier contracts, and retains all **369 targets**, **127 definitions/constructions**, **835 API entries** and **494 checks** from the accepted PR.0 and PR.8 packets. Proof sketches and acceptance computations remain with their targets; each layer has further worked examples. The input packets have 290 and 79 nodes respectively. The blueprint checker reports 834 API items in aggregate, whereas summing the actual arrays gives 835; the package uses the arrays. All 127 accepted definitions/constructions have at least three checks. Additional local foundations have APIs and discriminating checks as well.

The stale assembly was consulted for context, but the current accepted packets are authoritative. Source excerpts, extraction notes and process wording are not copied into the package. The README follows construction dependencies rather than a paper's section order. Its mathematical statements and explanations are in the workers' own words.

Visible layers 0–8 correspond to original PR stages **0,1,2,3,5,6,4,7,8**. Original PR.4 consumes the absolute and q-de Rham comparisons, so it follows PR.5 and PR.6. Within each layer, targets are topologically ordered. Mechanical checking finds no internal forward prerequisites or cycles. Ordinary and logarithmic Laurent-crystal names receive distinct anchors and scope-specific references.

`Suggested.lean` is **395 lines**, with `import Mathlib` and namespace `TauCetiRoadmap.PrismaticCohomology`. It contains integral delta correction polynomials, bundles of elementary delta/Frobenius data, ideal predicates, q-integers and elementary logarithmic delta data on existing ring/monoid carriers. All data definitions have real bodies. Representative theorems use `sorry`; several small computations are proved directly. Sites, stacks, enhanced derived categories, perfectoidization, crystals and comparison equivalences remain README targets because their carriers are absent at the pins. The closing comment lists all accepted definitions and the new prerequisite families. Elaboration is not a formalisation of the prismatic theory.

`metadata.toml` is `topic = "math.AG"`.

## Ownership and tier corrections

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit and the current read-only upstream checkouts were examined: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included mathematical operators and hypotheses, as well as names. None of the new prismatic/delta targets was found there. Ordinary derived categories, Witt-vector ring operations, divided powers, naive cotangent modules and adic completion are imported with their actual ranges; none is treated as its missing enhanced counterpart.

The nine post-snapshot roadmaps and Completed roadmaps were checked for overlapping objects. In particular, AlgebraicVectorBundles Layers 0A/0B supply the existing monoidal sheaf and ordinary affine finite-projective dictionary. The completed module effectivity and formal QCoh inputs here are different statements. AdicSpaces supplies adic and Fargues–Fontaine geometric inputs, but not the arbitrary analytic étale site or filtered-bundle classification used here. AdicEtaleGeometry A1 supplies the analytic étale site.

The p-adic comparison bundle is tier 13 in `upstream/CaraianiNewton.md`. External mathematical suppliers in the package are lower-tier or same-bundle roadmaps. There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` citations. The following higher-tier or outside-order requirements become local targets; their former owners need redirects after review:

| Former reference | Package owner and exact range |
| --- | --- |
| LanglandsParameterStacks LP1 | Layer 4.0: derived-complete formal QCoh, completed pull/push, base change and projection formulas, homotopy-coherent descent on the entire nerve of an infinite affine group. No parameter-stack theory is imported. |
| QWittVectors QW.6 | Layer 5.0: a framing over a general complete delta base, including A_inf with q=[ε]; commuting gamma operators, q-derivatives and cochain Koszul models; coordinate-injective naturality. No dependency on preceding Habiro/q-Witt layers. |
| RefinedTraceMethods RT.3b and RT.6 | Layer 7.0: the minimal graded prismatic Beilinson square and derived de Rham terms needed for analytic continuation. Its proof must establish either the filtered TC/syntomic graded comparison or the direct prismatic comparison. Full trace theory stays outside the package. |
| VectorBundlesAndIsocrystals VB2:classification | Layer 7.0: the filtered Frobenius bundle dictionary, degree/sign convention and slope-zero criterion needed to extend a crystalline lattice. This does not duplicate all-slope bundle classification. |
| HigherToposTheory T6 | Layer 8: the already accepted fs log adic Kummer foundations move down; the higher roadmap becomes a consumer. |
| Proposed ArcTopologyAndDescent | Layer 2.0: arc, arc_p and formal arc sites/equivalences, torsion étale descent, formal gluing, Fujiwara–Gabber, perfectoid basis and structure-sheaf acyclicity. No citation to a nonexistent outside-order roadmap remains. |

The stronger perfect-prismatic-site/base-independence, integral-map perfectoidization and arc-excision conclusions remain explicit extensions of the same-bundle PerfectoidQuotients inputs. They are not silently obtained from the fixed-base construction.

## Mathematical corrections and remaining inputs

The accepted packets are not edited. The following corrections are present in the package and should be reconciled in any future packet update:

- The syntomic H⁰ torsion-free assertion requires the pro-zero system `((A/I^n)[p])_n`. It is stated with that hypothesis. General boundedness alone does not justify the existing proof. The sufficient bounded I-power torsion condition on A/p is explained.
- The arbitrary-formal étale comparison is first a Spec comparison and its formal étale sheafification. Its Rμ_* formulation requires the specialization-site and Spec/Spa extension; the type-(S) supplier is not applied to arbitrary pre-adic fibres. The proof's globalization is corrected accordingly.
- The AΩ comparison uses the cofinal subsystem of coordinate sets containing a framing when it claims perfectoidness. Multiplicativity remains conditional on an E₁ q-de Rham comparison proof; arbitrary naturality requires indexed-family or intrinsic descent comparison, since coordinate merging does not commute with the displayed q-derivatives.
- A coefficient-change proof claimed finite Tor dimension for Z/p^n → Z/p^(n−1), which is generally false. Derived tensor preserves the finite fibre because it is exact between stable categories; that is the argument now used.
- The formal-torus example incorrectly used units very close to 1 as non-p-th powers. Those sufficiently close to 1 have binomial roots. The replacement chooses distinct coefficient valuations between 0 and v(p). A finite product has logarithmic derivative of Gauss norm greater than |p|, whereas a p-th power unit reducing to 1 has derivative norm less than |p|. This gives infinitely many independent mod-p Kummer classes. The convergence range for binomial roots is also stated.
- Infinite-group QCoh is described by homotopy-coherent completed comodules on the full nerve, not by an unqualified identification with the ordinary derived category of abelian comodules. The Sen restriction is local nilpotence of Θ^p−Θ.
- The filtered Fargues–Fontaine degree is t_H−t_N; the TC fibre/cofibre shifts are ΣHC and Σ²HC. q-integers are polynomials even at q=1 and n=0. Log products keep the p·δ_log(m)·δ_log(n) term.

All **28 input gaps** (25 ordinary, three logarithmic) are retained as exact additional mathematical requirements, with their conditional ranges. Adding a local target specifies what must be proved; it does not claim its proof exists. Their coverage is:

1. Cofree Witt delta adjunction for rings with p-torsion.
2. Derived Frobenius homotopy datum, excluded from the ordinary congruence dictionary and not needed by its end theorems.
3. Complete-flat p-torsion control beyond the pro-zero range.
4. The E∞ power operation P⁰, including annihilation of positive homotopy.
5. Prismatic Nygaard continuity/internal weights for henselian syntomic rigidity.
6. Bounded formal schemes and globalization of quasisyntomic sheaves.
7. Almost Galois comparison for the perfectoidized tensor product, requiring almost v-acyclicity.
8. Identification of the filtered Frobenius bundle with the period-domain construction.
9. Period theory for arbitrary perfect residue fields, beyond finite extensions of Q_p.
10. Derived crystalline/de Rham–Witt comparisons for quasiregular semiperfect rings.
11. Arbitrary pre-adic specialization and Spec/Spa comparison.
12. Flat G_m continuity, derived descent and animated Beauville–Laszlo gluing.
13. Perfectoid Spec/Spa lisse comparison.
14. Adic finite-projective/invertible module effectivity.
15. Multiplicative toric q-de Rham comparison.
16. Artin–Schreier localization with zero divisors, including t=0.
17. Étale algebraization and W₂ base change.
18. Global scheme Ext² lifting obstruction.
19. Tensor-nilpotence/descendability of perfection.
20. Beilinson filtered t-structure and E∞ décalage enhancement.
21. Completed formal QCoh and infinite-group nerve descent.
22. General complete delta-base framing independent of the q-Witt theory.
23. Arc/arc_p topology and descent.
24. Perfect-site comparison, integral perfectoidization and arc excision.
25. Arbitrary naturality of the AΩ comparison.
26. Full algebraic Witt–Frobenius Riemann–Hilbert with extension by zero; the perfect/lisse version is insufficient.
27. Logarithmic torsion étale arc descent, supplied by the same Layer 2.0 prefix rather than duplicated.
28. Completed untilt/condensed coefficients, non-fine formal log cotangent/crystalline inputs, rational crystalline base change and cochain Koszul sign/completion adapters.

## Source work and access limits

Public versions read include BS22 v4, Bhatt–Lurie absolute prismatic cohomology v1, Anschütz–Le Bras v4, BMS2 v2, prismatic F-crystals v2, Koshikawa I v3, Koshikawa–Yao II v1, AMMN v2, Bhatt–Mathew syntomic complexes v2, Arc v4, Česnavičius–Scholze v3, the official Lurie DAG XIII and DLLZ PDFs, and the Fargues–Fontaine author book. Other logarithmic comparison sources were read in their public author/preprint versions. Cleared BMS1 material was read in place in the maintainer's library; no cleared file or passage was copied. No uncleared book copy was used.

A mechanical first-numbered-heading/printed-page comparison covered **628 citations in eight main papers**. After the locator corrections below it found 628 matches and no mismatches. This checks that the first numbered heading lies in the cited printed page/range; it does not prove every statement, subsequent heading or proof. Mathematical checking additionally read the source statements and relevant proof portions for the following stratified sample of 15 targets (seed 9189, at least one per original layer), and for the new prerequisites and identified delicate assertions:

| Target | Source locator read and point checked |
| --- | --- |
| Frobenius morphism reflection | BS22 Definition 2.1 / Remark 2.2, p.13; p-injectivity is explicit. |
| Prismatic structure sheaf | ALB Remark 3.1.2 / Proposition 3.1.3, p.16; boundedness, completion and opposites. |
| Derived crystalline comparison | ALB Theorem 3.1.7 / Remark 3.1.8, p.17; polynomial/syntomic range versus explicit animated extension. |
| Regular-semiperfectoid Nygaard | BS22 Proposition 12.8, p.90; conjugate filtration and twist. |
| Cartier–Witt stack | BL Remarks 3.1.6–3.1.7, pp.39–40; functorial pullback and fpqc descent are distinct assertions. |
| q-de Rham comparison | BS22 Theorem 16.22, p.115; complete-flat delta base and framing range. |
| Tate twist discreteness | BMS2 Conjecture 7.18 / Remark 7.20, pp.50–51, with BS22 Theorem 14.1, p.97; sheaf discreteness is not objectwise vanishing. |
| Analytic continuation | F-crystals Proposition 6.8, p.22; ordinary fixed points and nonnegative weights. |
| Absolute log site | KY Definition 7.34, p.80; saturation and strict-flat topology. |
| Perfectoid prelog cotangent | KY Lemma 2.28 / Corollary 2.29, p.19; p-completed cotangent vanishing. |
| Delta completion congruence | BS22 Lemma 2.17, p.17; the stronger stated modulus follows from the product axiom and p in I. |
| Characteristic-p syntomic | BL Example 7.4.4, p.178; weight-zero H¹ exception. |
| Transversal approximation | BL Proposition 2.4.1 / Lemmas 2.4.2–2.4.3, p.25; bounded and unbounded cases kept distinct. |
| Delta kernel stability | BS22 Definition 2.1, p.13; direct delta compatibility, with no torsion cancellation. |
| Čech–Alexander complex | BS22 Construction 4.18 / Remark 4.19, pp.42–43; functorial variables and the extra infinite-envelope input. |

Locator repairs: Koshikawa Theorem 7.10 is p.41 (not 40); KY Proposition 5.24 is pp.53–54 (not 52), Corollary 7.31 is p.80 (not 79). The WCart locator now includes Remark 3.1.7, p.40, for functoriality and fpqc descent. Česnavičius–Scholze continuity is Theorem 5.3.5, pp.59–61, in v3; 5.3.4 is a different lemma. Lemma 5.4.2 is pp.63–66. Secondary source pages absent from input records are supplied, including the BMS1 θ/θ̃ square on p.69, the Nygaard BL comparisons on pp.122–123, and F-crystal extension on pp.26–27. The Fargues–Fontaine author PDF has 60 preliminary pages: Theorem 8.2.10(1) p.238, Proposition 10.5.6 p.290 and Corollary 11.2.22 p.328 were read at the corresponding PDF pages. Their algebraic-closure and sign hypotheses are retained.

**Unverified fresh source access, for the independent reviewer:**

- The full five-page Koshikawa–Yao correction, *Advances in Mathematics* 503 (2026), 111223, DOI `10.1016/j.aim.2026.111223`, could not be retrieved here. Publisher/researchmap attempts gave metadata without the body. The package retains the accepted conservative p-Kummer restriction, together with its monodromy criterion and prime-to-p counterexamples; it does not restore the older all-Kummer assertion. The correction's precise published/preprint numbering and body were established by the accepted independent input review, not freshly reproduced in this run. Its recorded input hash is `005ee338ad8f6cb0adb297dfadcb7bca06bea7e817e5b97dc09ac0e5ea686b1f`. The older Inoue statement does not independently verify that correction.
- Illusie III.2.1.2.3 is named only as the additional global Ext² obstruction input. No cleared copy or verified printed page was available, and no other book copy was used. That supplier theorem remains an explicit additional requirement; the accepted BS22 comparison locator is not represented as a fresh verification of Illusie's book.

The source-heading script and downloaded public PDFs are transient scratch material. This handoff records the durable findings; it does not require retaining source passages.

## Validation and next step

- Both accepted input packets: `python3 scripts/check_blueprint.py` → **0 errors, 0 warnings** each.
- Structural reconciliation: 369 target anchors; all 835 API entries and 494 checks present in their own target blocks; 127 definitions/constructions with ≥3 checks; 404 unique anchors, 2,693 internal links resolving; no internal forward dependencies.
- Lean: `lean-check research/blueprint/packages/PrismaticCohomology/Suggested.lean` → **exit 0**, **25 warnings, all declaration uses of `sorry`**, no errors. Two completed runs agreed; the Lean file was unchanged after the final run. Available memory exceeded 20 GB. No language server, dependency build, update or cache fetch was started; no Lean process is left running.
- Ten representative signatures compared with README hypotheses and conventions: integral correction identity/sign, associated Frobenius lift, p-injective reconstruction, forced delta(p), no delta in nonzero characteristic p, quotient delta iff stability, distinguished prism relation, polynomial q-integer identity and logarithmic chart Frobenius. All match; no `True`, sorry'd data or conclusion-as-hypothesis surrogate.
- `python3 research/blueprint/intake.py check-files` on the four deliverables → **4 files, 0 problems**. Every accepted definition title is present in the Lean closing inventory or declarations. Package prose contains no workflow ids, packet/review language, local paths or source excerpts. Staged whitespace check: `git diff --cached --check` → no errors.

Ready for the separate package review. The reviewer should prioritize the two source-access limits, the full supplier ranges and the moved ownership contracts. There is no unfinished implementation task for another package worker and no claim of a closed formal proof. The maintainer controls upstream publication and redirects; this worker opens only the atlas package PR and stops.
