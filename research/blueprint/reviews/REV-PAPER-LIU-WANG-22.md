# Independent review: PAPER-LIU-WANG-22

**Verdict: revise.** Completed by Codex, session codex-c83e7a, for [issue1264](https://github.com/CBirkbeck/tauceti-explorer/issues/1264). This is a finished independent review; the corrected extraction remains partial. Ten source routes are accepted and four routes rejected.

The original extraction was by Claude Code cc-442dc5. Its JSON/Markdown, the attribution index and session log were checked for a self-review conflict. Claim5802594203 was confirmed by bot5802595989 and the whole issue reread. Only the four authorized deliverables are changed.

## Evidence and corrections

All 66 original items and 15 original findings were checked against the complete 65-page [arXiv v4 paper](https://arxiv.org/pdf/2012.15014v4). The review read every proof, AppendixA and references; images18,22,35,38,45,51,55,57 checked the delicate formulas. The source TeX was checked selectively, not read completely. Published typesetting was not retrieved. The one-page affiliation correction and [Nikolaus–Scholze, printedp48](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf) were read at the indicated scope; the latter confirms the bounded-below hypothesis missing from the general comparison on p10.

The revised 90 items comprise 8 library, 15 planned and 67 missing. Every missing item is assigned exactly once. The source locators for Lichtenbaum–Quillen and the geometric cohomology remark are1.7 and1.4, respectively. Stack cohomology has degree−i. The normalization of u uses F_p→k and a fixed TC^- lift, so it needs no nonexistent O_K→F_p map.

Pinned searches covered 9,055 Mathlib and 5,489 TauCeti Lean files, 2,007 stage descriptions and 218 roadmap texts, plus packet/decomposition directions. All 24 added items received their own semantic search. Ten relevant source blobs were verified against the pinned trees. `TauCeti.Comodule` and `TauCeti.Comodule.Hom.cofreeEquiv` exist, as do Mathlib’s divided-power algebra, cyclic Hilbert90, finite-field Frobenius generator and rank-nullity. These are imported with their exact hypotheses; they do not implement completed Hopf-algebroid Ext or spectral convergence. The reviewed audit and every cited layer were checked. The DGAInfinity graded tensor owner is reused, not replanned.

The new mathematical findings are material. For p = 3 and φ=id on Z3, the printed δ-product rule returns 4 where δ(4)=−20. For S=k[t], the printed graded tensor formula has degree1 dimension 2, while S⊗_S S has dimension 1. For p = 3, δ(z0−z1)=z0 z1(z0−z1), contradicting the printed negative expansion; the wrong sign feeds the later Frobenius assertions. The proposed corrected higher-differential targets remain explicitly unproved pending a consistent cobar orientation and tame-base-change argument. The original E9 exponent finding is confirmed with its correction amended to the actual sign. The final additive TC group descriptions are not disproved by these intermediate inconsistencies.

Concrete arithmetic checks passed: 828 corrected basis-index cases, all 8 nonzero twists in F9, and the δ-product/binomial counterexamples. These finite checks support the stated counterexamples and examples; they are not a proof of the full TC calculation. No Lean file or compilation was run or claimed.

## Route verdicts

| Route | Owner | Verdict | Reason |
|---|---|---|---|
| 1 | RefinedTraceMethods | accept | Generic relative THH/cyclotomic mathematics belongs to RT.2; the bounded-below comparison is corrected and the spherical Witt primary supplier remains explicit. |
| 2 | RefinedTraceMethods | accept | The regular-quotient algebraic HH/HP comparison belongs to RT.1, importing the common PD, Koszul and completion owners. |
| 3 | KTheoryFiniteLocalFields | reject | L.5 is the correct existing owner, but the alternative odd-prime proof of item002 depends on the unresolved sign chain. Preserve the planned status and existing classical target; do not ingest this route as a certified alternative proof yet. |
| 4 | RefinedTraceMethods | accept | The BMS relative computation and fixed-u_Fp normalization belong to RT.6. The base-change direction and normalization are correctly stated. |
| 5 | CrystallineCohomology | accept | CR.0 owns envelopes; the existing divided-power structures/algebra are separated and imported. |
| 6 | PrismaticCohomology | accept | PR.0 owns the corrected δ-ring law and torsionfree Frobenius-lift equivalence. |
| 7 | DerivedDeRhamCohomology | accept | DD.1 owns complete filtered algebra and mixed topology. The graded tensor direction is imported from DGAInfinity rather than duplicated; the false domain claim is corrected. |
| 8 | StableHomotopyKTheory | accept | H.6 is the shared coefficient/Bockstein/convergence owner; record the two-primary self-map/extension input explicitly. Source routing is not a claim the full supplier is proved. |
| 9 | KTheoryFiniteLocalFields | accept | L.5 needs this finite-field TC linear-algebra adapter. Its proof from pinned multiplicative Hilbert90, Frobenius and rank-nullity avoids a new generic additive-Hilbert90 development. |
| 10 | MotivicEtaleKTheory | accept | The norm-residue, motivic and étale comparison targets already belong to M.5/M.6/M.7. The source pictures are not used as proofs. |
| 11 | RefinedTraceMethods | accept | The precise degree−1 λ cokernel is a trace-comparison target for RT.3. Its unproved source assertion is retained as OPEN-TRACE with the required connective comparison contract. |
| 12 | StableHomotopyKTheoryPartIIHopfAlgebroidDescent | reject | The generic supplier must be separated from local TC, but the flatness, complete comodule-category and Ext/Adams contracts are not sufficiently closed to issue an accepted design brief. Reconcile the existing graded and cofree APIs first. |
| 13 | RefinedTraceMethodsPartIIDescentStackComparison | reject | The correct stack category and QCoh descent comparison are unresolved, and the WCart/motivic equivalences are conjectural in this source. No unconditional design theorem can be claimed. |
| 14 | KTheoryFiniteLocalFieldsPartIIDescentSpectralSequences | reject | The local-only scope and imports are repaired, but the corrected sign chain, finite-page conventions, convergence and two-primary suppliers remain unresolved. Do not certify the main calculation from inconsistent intermediate formulas. |

Source-route acceptance records a suitable existing owner and a usable corrected source scope. It does not certify the owner’s missing constructions. Rejected PartII IDs are proposals only, not live atlas stages.

## Open contracts

- **OPEN-SIGN**: Reconcile the cobar orientation, corrected δ/Frobenius coefficients, tame-base-change transport and γ normalization through §§6–8. Items050/053/059 are explicitly proposed corrected targets. The local counterexamples do not prove that all final additive groups are wrong.
- **OPEN-HOPF**: Supply exactness/flatness hypotheses and the derived Ext comparison for distinct-unit Hopf algebroids and complete filtered comodules. Ordinary TauCeti coalgebra cofree adjunction is insufficient.
- **OPEN-DESCENT**: Read and decompose the complete Mathew–Naumann–Noel Proposition2.14 proof; verify partial-totalization indexing, connectivity, orbit/finite-limit interchange and every algebraic/refined convergence assertion. Split remaining composite results into declaration-sized obligations.
- **OPEN-STACK**: Construct the completed/derived quotient stack and QCoh Ext comparison with PR.5 and SF.1/SF.2. Check later primary sources for the conjectures; this review does not promote them to theorems.
- **OPEN-TRACE**: Provide the exact connective henselian trace comparison proving the λ cokernel and the Bott-localization passage in Remark1.7, with low-degree fibre bounds.
- **OPEN-TWO**: Decompose the Moore-spectrum η/Bockstein identity and v1^4 self-map used in Theorem8.21. Keep all module structures, 2-extensions and K(1)-localization hypotheses explicit.
- **OPEN-FOUNDATIONS**: Finish transitive primary proof contracts for spherical Witt vectors, regular-quotient HP/Koszul comparison, complete filtered lifting, and the BMS Breuil–Kisin comparison. Existing owner routes assign this work; they do not certify implementation.

## Source findings

All 15 original findings were independently checked. The review adds 21 findings, for 36 total, each with a confirmed verdict. Some are harmless index/name slips; the δ-product, graded tensor, binomial sign, nonzero-differential page and basis interval are false as printed. The JSON contains corrections, impact and bounded correction searches. Crossref lists only the affiliation correction; Wang’s homepage and exact-title correction searches yielded no mathematical erratum. Liu’s homepage timed out and is not counted as read. Journal-version agreement and global novelty are not asserted.

| Finding | Kind | Locator | Independent reason |
|---|---|---|---|
| E1 | misprint | Proof of Theorem 2.17(6), arXiv v4 p. 14 | The rescaling must use the tilded elements already constructed; its product is E_K because λ=φ(b)/b. |
| E2 | misprint | Proof of Lemma 3.32, arXiv v4 p. 21 | Every u and divided-power generator has degree2; the printed exponents give degree4j. The target is relative HH of O_K over W(k)[z0,z1]. Also correct the old finding’s own Corollary3.31(2) citation to3.30(2). |
| E3 | misprint | Proof of Proposition 3.29, arXiv v4 p. 20 | The dense algebra in Lemma3.27 contains z0,z1. Equation3.25, not3.24, places the f^(k) in that larger algebra. Adding z0,z1 preserves δ-stability. |
| E4 | misprint | Corollary 3.35, arXiv v4 p. 22 | No active definition of ι precedes this corollary in v4. The embedding of Lemma3.32 gives the needed interpretation; do not assert a version-history explanation as proved. |
| E5 | misprint | Proposition 6.2(2), case e_K = 1, arXiv v4 p. 33 | The upper index l is undefined and must be n. The power j−1 matches u^(n); the printed j merely multiplies a valid basis by the unit−μbar, so it does not destroy the basis theorem. |
| E6 | misprint | Lemma 6.12(2), arXiv v4 p. 36 | The summation variable must be distinct from the fixed row index. The common basis sign can be changed by a unit, but the formal convention must agree with E8 and the global sign audit E28. |
| E7 | misprint | Diagrams (6.6) in the proof of Proposition 6.2, arXiv v4 p. 33, and (6.14) in the proof of Lemma 6.12, arXiv v4 p. 36 | With the displayed β, the two squares have bottom map ηR−ηL. Reversing that arrow repairs each square, but this is not a complete sign repair: Lemma6.12 separately claims d(z)=+t. See E28. |
| E8 | misprint | Convention 6.16, arXiv v4 p. 37 | For n=1 the printed sum is−t while its asserted formal value is t. The alternating exponent j−1 gives the claimed binomial expansion. |
| E9 | misprint | Proof of Lemma 6.19, arXiv v4 p. 38 | The exponent p is a slip, but the original proposed correction still has the wrong sign. With ξ=−δ(f)/f, the actual congruence is ξ+z0^(p−1)∈(p,N^{≥(p−2)/e+1}); see E27. This finding is confirmed with the amended correction. |
| E10 | misprint | Proof of Proposition 6.32, arXiv v4 p. 41 | The binomial expansion has exponent n′−i and nonleading indices i≤n′−2; n is not the binomial degree. |
| E11 | misprint | Proof of Proposition 7.6, arXiv v4 p. 49 | This case uses n=pe(j−1)/(p−1) and the cocycle z0^(n−1)σ^j dz; the copied j exponent names the wrong class. |
| E12 | misprint | Proof of Corollary 8.6, arXiv v4 p. 52 | Substitute n=e(m−1)+1 into Proposition8.4’s exponent: the variable is j, not an undefined a. |
| E13 | misprint | Theorem 8.21, arXiv v4 p. 58 | For p2,d=1 all α_(i,l) lie in topological degree1 by Theorem8.18, irrespective of ramification index i. |
| E14 | error | Proof of Proposition 8.23, arXiv v4 p. 60 | For p = 3, (ω−1)^2=−3ω, so3/(ω−1)^2=−ω² and the error from−1 has valuation1/2. The weaker residue congruence is exactly sufficient for Hensel; no counterexample to Proposition8.23 follows. |
| E15 | misprint | Proof of Proposition 6.2, arXiv v4 p. 34 | The proof is referring to its own diagram6.6; the source TeX duplicates the label E:thh-cobar. Diagram6.14 belongs to the later proof. |
| E16 | error | arXiv v4 Definition3.20,p18 | Expanding φ(xy)=φ(x)φ(y) forces the p-th powers. For p = 3 and φ=id on Z3, δ(2)=−2 and δ(4)=−20, while the printed right side at x=y=2 is4. PDF image and TeX agree. |
| E17 | error | arXiv v4 §4,p22 | Set S=k[t] and M=N=S with deg(t)=1. The printed degree1 space has dimension 2, whereas S⊗_S S≃S has dimension 1. This matters for the Hopf-algebroid tensor construction. |
| E18 | gap | arXiv v4 Definition2.4,p10 | The primary Nikolaus–Scholze PDF, printedp48, explicitly requires bounded below. Section2’s E∞-algebras are not stated connective. Actual O_K applications are connective; the general comparison is underjustified as written, not disproved here for every unbounded input. |
| E19 | misprint | arXiv v4 Lemma6.10 proof,p34 | E_K(z) modp=μbar z^e and μ need not1. Multiplication by this unit leaves the filtration argument intact. The extraction had silently repaired this without recording the source slip. |
| E20 | error | arXiv v4 Lemma6.11(2),p35 | The divided-power relation t^[0]=1 and unitality force ε(1)=1. The printed statement includes i0. |
| E21 | error | arXiv v4 §6 before Lemma6.19,p37 | The smallest admissible index is0 for every integral filtered element. Moreover Lemma6.11 gives a divided-power algebra over k in the modp associated graded, where t≠0 but t^p=p!t^[p]=0. It is not an integral domain. The particular products used later need separate checks. |
| E22 | error | arXiv v4 §5,p30 and §6,p35 | Equations5.21–5.22 and the refined definition explicitly take cohomology. A chain group and its cohomology are not interchangeable. The introduction’s p6 diagram already uses E2(THH). |
| E23 | misprint | arXiv v4 Lemma6.28 proof,p39 | Equation3.22 at k1 gives δ^1(h); Lemma4.11 supplies the needed filtration for either iterate, so the estimate is unchanged. |
| E24 | error | arXiv v4 Propositions6.32,6.43 and Lemma6.36,pp40–45 | v_p(0)=∞ does not define the displayed finite page or n/p^l. In particular1 has zero differential; Proposition7.1 expressly identifies the zero-charge surviving classes. |
| E25 | error | arXiv v4 Propositions6.32 and6.43,pp40,45 | The next page is the homology of the differential page. Every image of that differential is zero there. The printed page45 image confirms the superscript, not an OCR artefact. |
| E26 | misprint | arXiv v4 Proposition7.1 proof,p47 | can has source TC^- and target TP. The displayed use reverses them; can(u)=E_K(z)σ gives the corrected identity. |
| E27 | error | arXiv v4 Lemmas6.19–6.20,pp37–38; Lemma8.2 and Proposition8.4,pp50–51; compare Lemma8.13 proof,p55 | For p = 3, φzi=zi³ gives δ(z0−z1)=z0 z1(z0−z1), hence ξ=−z0 z1. With e>1, its difference from+z0² has initial term−2z0² in filtration2/e, strictly below1+1/e, so the claimed congruence fails. Proposition8.4’s negative sign would also contradict the positive coefficient explicitly used in the proof of8.13. Pages38,51,55 were visually checked. This disproves intermediate formulas, not the main additive TC groups. |
| E28 | error | arXiv v4 Lemma6.12 and proof,p36; diagrams6.6,6.14,pp33,36 | By definition t has initial form z0−z1. At odd p these signs differ. Repairing only the squares as in E7 leaves the differential assertion inconsistent. OPEN-SIGN tracks the global correction. |
| E29 | misprint | arXiv v4 Proposition8.4 proof,pp52–53 | The preceding cocycle is z0^(n−1). Equation6.35 sends exponent l−1 to ml−1. Comparing ml=p(mn−me(j−1)) cancels m. These slips do not settle the separate Frobenius sign issue. |
| E30 | error | arXiv v4 §8 after Remark8.17,p57 | For i1 the printed interval is{p}, which is excluded by p∤b. The corrected interval has p−1 successive integers and excludes multiples of p; exactly one has the specified residue class. The inequalities determine a unique l. |
| E31 | misprint | arXiv v4 Proposition8.11 proof,p54 | The equation is λ^{p−1}=μbar^{pj}; the displayed fixed root only solves the degree d equation. The claimed polynomial-module conclusion uses its powers. |
| E32 | misprint | arXiv v4 §5 Equations5.13–5.17,pp28–29 | D(1)=0 and D(t)=1 rule out Γ-linearity. The preceding paragraph explicitly identifies Ext in comodule categories, and the coaction formula for the adjunction has precisely that type. |
| E33 | misprint | arXiv v4 Definition4.3(1),p23 | Only n_i are introduced in the graded definition; m_i belong to the preceding filtered definition. |
| E34 | error | arXiv v4 Lemma6.12 proof after diagram6.14,p36 | β(dz)=t and β(z dz)=z0 t−t^[2], whereas z0β(dz)=z0t. The nonzero divided-power generator t^[2] obstructs the stated linearity. This does not apply to the different k[z]-linear map in6.6, whose polynomial variable is u. |
| E35 | misprint | arXiv v4 Theorem8.21 proof,p58 | Using φ(u)=σ and δ(E)=(φ(E)−E²)/2 gives the negative sign. It disappears after reduction mod2, which is the subsequent calculation. |
| E36 | gap | arXiv v4 Propositions6.34 and6.43,pp41,45; compare Lemma6.36,p42 | If e_K=1 and p∤n, l=0 and the displayed page is1−1/e_K=0, while the refined sequence was defined starting at1/e_K=1. Lemma6.36 itself requires l≥1 when e_K=1. The omitted initial-stage qualification must be supplied. |

## Validation

The extraction checker, four-file submission intake check and independent structural audit passed. The audit checked all missing-item routes, all 36 finding verdicts, per-item search coverage, the supplier graph and the four-file scope. No generated atlas, queue state or library source is edited.
