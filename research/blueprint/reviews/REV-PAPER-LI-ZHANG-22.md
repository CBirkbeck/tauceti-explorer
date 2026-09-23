# REV-PAPER-LI-ZHANG-22

Issue #1279 · Codex — codex-a71f92 · 2026-09-23 · **revise**

This is a completed independent negative review of Claude Code — cc-fb70e5's extraction in PR #1950, merged as `684e71fbca0567e8f472e4c92d31dd6a7e843cca`. The claim was confirmed by bot comment 5801537860. I did not author that input. The extraction is now partial, not an accepted closed plan.

## Reading and evidence boundary

I read all 108 pages of the [published article](https://par.nsf.gov/servlets/purl/10338689), journal pp.1353–1460, including proofs and references. I inspected rendered pp.1379, 1418, 1434 where formula/sign/version checks mattered. The result's source metadata records its SHA-256 and those of the author manuscript and arXiv v1.

The [author-final manuscript](https://www.math.columbia.edu/~chaoli/KRO.pdf) and [arXiv v1](https://arxiv.org/pdf/2106.15038v1) were compared at the E7 passages, not freshly read word by word in their entirety. Retained original page locators name the manuscript; new findings additionally give journal pages. The original author's broader version-comparison claim is not my evidence.

I also read [KRProof.pdf](https://www.math.columbia.edu/~chaoli/KRProof.pdf) §§5.2–5.3 (94-page author copy dated 10 September 2021) and [Howard–Pappas](https://arxiv.org/pdf/1509.03914) §6.3's spinor-similitude calculation and §§7.2.3–7.2.6. I did not freshly prove/read all the paper's imported theorems, notably the full Tate, Lusztig, Kim, Gross–Keating, Terstiege, Kudla, Breuil and Rapoport–Richartz sources.

The companion review REV-PAPER-LI-ZHANG-22-B is a comparison lead, not an independent proof of this paper's claims. Likewise I do not endorse the cited PAPER-CHARLES-16 candidate or my earlier Maulik–Shankar–Tang review as independently checked inputs to this review: their shared IDs identify coordination work, not provider certificates.

## Verdict and coverage

The original 45 items were broad section/result bundles, with no library providers and a complete flag. They do not meet PROTOCOL §16's atomic, dependency-closed coverage requirement. The corrected inventory has 64 items: 9 library, 10 planned, 45 missing. All45 missing items are assigned exactly once.

This review identifies clear errors and makes safe local corrections; it does not replace every bundle with a final extraction. The residual closure ledger is:

| Items / source | Remaining atomic extraction |
|---|---|
|3, 5–14 / §§2–3, 8.2, 9.3 |separate all local-lattice carriers/invariants, finite-field counts, parity-dependent weight definitions, functional equations and recurrence hypotheses; complete E10's replacement induction |
|15–18, 23–24 / §§4–5 |admissible crystalline tensor conditions, projector and Frobenius/Hodge interfaces, local unramified Shimura–Hodge data, special lattices, vertex strata and exceptional cases; identify each imported theorem's exact statement |
|25–30 / §§2.3, 4.11–6.2 |formal-scheme support K/G groups, filtration and Tor bounds, Euler-length maps, properness, quasi-canonical orders and lifting/deformation inputs; generic scheme K-theory does not close this |
|31, 34, 36, 59–62 / §§6.3–7.6 |Lusztig eigenspaces, each localization/Gysin/Poincaré-duality step, quotient/filtration/coefficient maps, divisor functional and higher-local-modularity proof with E11's signs |
|4, 32, 35–39, 44 / §§2.2, 7–9 |regular distribution extension and integrability across the omitted cone, infinite-sum/Fourier interchange, restriction/partial-integral maps, exact newform/coinvariant inputs; E3 and E9 are not hypotheses to conceal |
|19–22, 40–43 / §§10–12 |orthogonal datum versus generic canonical model, integral Kuga–Satake/tensor packages, actual stack/cycle multiplicities and uniformization; metaplectic continuation, Diff support and normalized archimedean factors |
|prerequisites |close source-to-item/provider links, including Breuil's cited theorem, Serre–Tate/Grothendieck–Messing, finite-field cohomology, formal intersection theory and source-qualified analytic interchanges |

These are named omissions, not a claim that a keyword search proves every advanced theorem absent.

## Library and owner audit

I checked BASELINE.json and read every newly cited declaration at the specified Mathlib/Tau Ceti pins. There were no original library declarations to recheck. The following are actual reusable providers, each scoped narrowly in the result:

| New item | Declaration(s) and file |
|---|---|
|46 |Mathlib `CliffordAlgebra`, `ι`, `ι_sq_scalar`, `lift`; LinearAlgebra/CliffordAlgebra/Basic.lean |
|47 |Tau Ceti `RegularFormClass.discr`, `signedDiscr`, `discr_add`; LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean |
|48 |Tau Ceti `QuadraticMap.IsometryEquiv.exists_extension`; QuadraticForm/Witt/Extension.lean |
|49–50 |Tau Ceti `CliffordAlgebra.orthogonalSpinorNorm`, `spinorNorm`, `range_spinToSpecialOrthogonal_eq_ker_spinorNorm`; CliffordAlgebra/Spin/SpinorNorm/Basic.lean |
|51 |Mathlib `VectorFourier.fourierIntegral`; Analysis/Fourier/FourierTransform.lean |
|52 |Mathlib `DerivedCategory`, `DerivedCategory.Q`; Algebra/Homology/DerivedCategory/Basic.lean |
|53 |Mathlib `AlgebraicGeometry.AlgebraicCycle`; AlgebraicGeometry/AlgebraicCycle/Basic.lean |
|54 |Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AlgebraicGeometry/AbelianVariety/Basic.lean |

In particular, the Fourier integral has a **minus** in its character argument, whereas the paper uses plus; invert the character or negate the pairing. The field spinor norm is square-class-valued, not an integral GSpin group scheme. The Spin image theorem is a kernel theorem, not general surjectivity onto SO. The derived category is not support K-theory; an algebraic cycle is not its Chow quotient; an abelian variety over a field is not the Kuga–Satake family.

I read the reviewed coverage entries for GN.2–GN.3, AL.0, MP.3–MP.4, Shimura V6 and scheme S.7. There is no native R07.1 entry under that exact key, so I do not invent one. I checked actual stage contracts for all three original planned assignments (GN.2, AL.0, MP.4), all source destinations (GN.3, MP.3, R07.1), the two parents, and the relevant MP.2/MP.5/MP.6, S.3/S.6/S.7, EDC.3, SF.5, R07.6/A4, HS2 and AS.2 suppliers.

I read the existing Tau Ceti QuadraticFormInvariants6C–6D and GlobalQuadraticForms layers 3/8 contracts: they own generic local/global field classification. They are imports63–64, never new GN/GSpin construction work. The local O_F-lattice extension remains GN.2; its existing Z-lattice library is not silently generalized to O_F.

Grouped searches over both complete Lean trees covered every original missing bundle: arithmetic Siegel–Weil/Kudla–Rapoport and intersections(1–2, 39, 43); representation densities/Siegel series/Cho–Yamauchi/Gross–Keating/quasi-canonical data(5–14, 29, 37); RZ/GSpin/Kuga–Satake/special cycles/DL/BT/Grothendieck–Messing(15–24, 26–28, 30); Chern/Chow/support K/derived intersections(25, 34–36); Tate classes and Lusztig(31); distribution/Schwartz–Bruhat/Weil/newform APIs(32, 35–38, 44); incoherent/Whittaker/metaplectic/Eisenstein(40, 42); p-divisible/Tate full-faithfulness(45).

False positives were checked: the lattice-file comment about Bruhat–Tits vertices is not an RZ stratification; the non-split-torus file explicitly does not construct DL cohomology; classical Gamma0 upper-triangular factorization is over SL₂(Z), not Lemma 9.1.2 over O_F; abstract divisible groups are not p-divisible group schemes. Classical modular-form Eisenstein/newform libraries are not the local SL₂ principal-series or genuine metaplectic package. These searches supplement, rather than replace, the positive provider audit.

## In-place changes

- Status changed complete→partial; source scope now distinguishes published, final-manuscript and v1 evidence. Removed the blanket library-absence and exhaustive-comparison claims.
- Item 3 separates the integral quotient L^∨/L from nonintegral Gram valuations. Items 47/63 separate field discriminants/classification. Item 4 records the distribution-extension limitation and item 51 the integral convention.
- Item 5 adds the nonempty-generic-fibre condition for the dimension formula and changes missing→planned(GN.3). Items 6, 8, 9 add zero/type-zero conventions.
- Item 10 replaces the false χ=ε derivative branch. Item 13 excludes the false unrestricted overlattice helper and retains the safe a_t≥3 branch with an explicit proof gap for the rest.
- Items 15–20 identify actual imports. Item 25 no longer certifies isometry invariance by the invalid lift.
- Item 31 restores all Frobenius powers s≥1 and corrects companion Theorem 5.3.2; prerequisite 5 is corrected as well.
- Item 34 separates the K-class statement for arbitrary curves from equality of intersection functions using DL curves. Item 35 qualifies distribution extension and the rank-four conormal calculation.
- Item 36 fixes the Chern sign, the(−1)^d factors and product lower bound 1. Items 59–62 separately record the reduced K/Chow carriers, K-valued function and two higher-local-modularity targets.
- Items 38–39 flag their unresolved inputs; item 40 corrects the real signature and imports global realization; item 42 records its actual automorphic suppliers. Item 44 adds k=0 and its precise local source obligation. Item 45 distinguishes Tate from Raynaud.
- Items 46–58, 63–64 add the provider/import ledger above. All five route reasons are qualified; routes 1–2 are explicitly nonapproved briefs.
- E1's reach is corrected; E3's evidence is independently supplied and extended to the later component-subgroup step; E7 distinguishes a manuscript fix from the journal text. Every source entry now has this review's verdict and bounded correction search. E8–E12 are new checked findings.

## Source-issue verdicts

| Entry | Verdict and reach |
|---|---|
|E1 |confirmed; zero-dimensional count formulas are false as stated. Use S_0=#O(0,V)=1 and handle rational-expression endpoints separately |
|E2 |confirmed misprint; n+1+2k must be n+2k in the even-corank numerator |
|E3 |confirmed proof gap; the required component-preserving lift is not automatic, and the later rational subgroup is not all SO |
|E4 |confirmed cross-references, including freshly checked companion 5.3.1/5.3.2 |
|E5 |confirmed Sym/Herm, n−3 and strict-negative-valuation slips |
|E6 |confirmed q^{t−1}−q, not q^t−q; changing the sign parameter simultaneously is harmless |
|E7 |confirmed versioned misprints; author-final fixes both dual bases but published p.1434 retains one |
|E8 |confirmed false χ=ε branch of Corollary 3.6.2 |
|E9 |confirmed false uniqueness in unrestricted D(V); intended regular extension still needs its proof |
|E10 |confirmed false same-type-overlattice existence helpers, including a counterexample beyond the two printed base valuations |
|E11 |confirmed reversed Cartier-complex Chern sign and numerical top-degree signs |
|E12 |confirmed limited slips in annulus indicator, co-isotropic references and positive signature |

### E3: why the lift obstruction is real

A scalar change of GSpin lift multiplies η by a square. Thus its valuation parity cannot change. For V=ϖH_m^− with m even ≥4, choose the rank m−1 sublattice L from a unimodular orthogonal splitting. Its SO stabilizer has even spinor valuation.

This does not require trusting an unread reflection-generation citation. For a unit-norm vector v in a unimodular lattice and its isometric image w, at least one of Q(v−w),Q(v+w) is a unit, since their sum is 4Q(v). One or two unit reflections match v,w; induct on their unimodular orthogonal complement. After scaling, every such reflection and the remaining-line reflection has norm valuation 1, while determinant1 forces an even number.

A hyperbolic plane represents 1 and ϖ, so an odd-spinor-valuation isometry h exists. All isometries carrying hL back to L have odd parity and cannot act on the component N by the claimed J(F) lift. A semilinear/component-comparison repair might still establish the intended invariance; I have not supplied it.

The global p.1457 claim also has an explicit test: V′=diag(3, 3, 1, 2) over Q and p=3 has the allowed local discriminant 2/Hasse−1. The isometry diag(−1, 1,−1, 1) has spinor norm3, so no lift has p-unit similitude. Howard–Pappas §7.2.6 retains precisely that unit-similitude subgroup.

### E8: a reproducible derivative counterexample

Take q=3, ε=−1, V=diag(3, 3, 9, 2), L^♭=diag(3, 3), L=diag(3, 3, 9) and L̃=diag(3, 3, 1). Then χ(L^♭)=ε, val(x)=2>1 and V has Hasse−1/discriminant 2.

Integral classes of L^∨/L are exactly
`(a,b,c)=(0, 0, 0),(0, 0, 3),(0, 0, 6)`,
where a,b range mod 3 and c mod 9: enumerate the 81 triples satisfying
`3a²+3b²+c² ≡ 0 (mod 9)`.
There is no proper integral overlattice of L^♭, since a²+b² is anisotropic mod 3.

The lattice-count formulas give

```text
D(X) = (1−3X)(1−X)
B(X) = 1−X²
A(X) = (1−X²)(1−3X+X²) = X²B(X)+(1+X)D(X)
−A′(1) = −2;  −B′(1) = 2;  −2D′(1) = −4.
```

The printed corollary instead gives−εχ(L^♭)D(1)=0. Differentiating Theorem 3.6.1 yields the corrected three branches in item 10. The downstream Corollary 3.8.3 uses only εχ=−1 or0, so this example does not refute that specialization.

### E9–E11: distinct issues, not one sign convention

E9: for any distribution extension T from Ω(L^♭), T+aδ_0 has the same restriction because 0∉Ω. Uniqueness among Schwartz functions, when available, is different. The Fourier eigenidentity is not invariant under adding δ_0, so the chosen regular extension and its convergence matter.

E10: for diag(3, 3, 9), index3 lowers determinant valuation 4→2, impossible for rank/type 3. For diag(3, 3) the same bound rules out a type 2 overlattice. The stronger diag(9, 9) example has val=t+2, but any new vector(ae_1+be_2)/3 has unit norm whenever(a,b)≠0 mod 3, so type drops. Thus simply deleting the minimal-valuation cases does not repair Lemma 8.2.6. The safe a_t≥3 construction is retained, while missing terminal-Jordan/base cases are explicit. The weighted identities are not disproved by these examples.

E11: the Cartier resolution contributes[O]−[O(−Z)], not its negative. With the source's c_1(O(−Z)) definition, its Chern character is 1−exp(c_1). At d=1 a transverse intersection of length 1 has negative-line-bundle degree−1, while the printed lemma gives+1. Keeping that definition gives(−1)^d in 7.6.6/7.6.7; homogeneous Fourier identities are unchanged. The companion's analogous registered defect was checked here directly, not copied as proof.

## Routes

Routes 1–2 are rejected as build briefs. The shared candidate names are sensible coordination leads, but do not make generic classification, K/Chow, canonical-model or Eisenstein theory fresh arithmetic-height constructions. Local strata and derived-cycle geometry must have one boundary across the orthogonal-moduli, GSpin-height and unitary programmes. Exact terminal statements and the source repairs must precede a design job.

Route 3 is accepted only as a corrected source contribution to GN.3. Its density definition is already planned; the specialized formulas add proof work, and E10 remains a named repair task. Route 4 fits MP.3 after importing MP.2 and AL.0 and retaining the SL₂ newform input. Route 5 fits R07.1 and must not conflate Tate full-faithfulness with Raynaud's e<p−1 finite-flat theorem. See the machine review for each decision. Overall verdict remains revise, not an endorsement of a complete extraction.

## Validation and limits

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LI-ZHANG-22.result.json`: passed.
- Five-file `intake.py check-files`: passed.
- `python3 -m unittest tests.test_check_paper tests.test_source_issues tests.test_papers_queue tests.test_intake tests.test_check_errata tests.test_errata`: 55 tests passed.
- Exact Python-standard-library diagnostics: E1 endpoints; E6 for q=3, 5, 7, 11 and even t=2, 4, 6, 8; E8 polynomial coefficients/derivatives, 81 dual classes and Hasse sign; E10 every index3 line in the three stated examples. All passed. These are finite checks, not Lean proofs.
- No Lean deliverable was requested, and no Lean compilation was run. No formalization claim.

The author page, arXiv version history and Crossref relation fields were checked on 2026-09-23, with bounded erratum/correction searches. No external correction was located. The publisher page failed in the final recheck; this is not an exhaustive journal correction audit or a claim of priority. The source metadata and each entry preserve this limitation.
