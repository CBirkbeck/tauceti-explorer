# Motivic and étale methods for arithmetic K-theory

This roadmap constructs the maps and comparisons that connect Milnor and Quillen K-theory to motivic and étale cohomology. It begins with arithmetic coefficient modules and Tate's degree-two comparison, develops cycle complexes and the geometric proof of norm residue, then constructs the motivic filtration, étale comparison ranges and regulator interfaces. The direct Tate argument in M.3 makes degree two available before the all-degree machinery. The higher arithmetic comparisons require the proof engines in M.5a–d and the actual filtered spectrum in M.6a–b.

The document assembles the current M.1–M.5c and M.5d–M.8 packets, including the corrections made by their independent reviews. It contains 149 declarations across fourteen layers. M.1's part review is accepted; M.5d's part review is **needs_changes**. Both target-level passes are complete, all fourteen layers are planned, and none is closed. Every implementation is unchecked. The outstanding source, supplier and signature obligations are included below; assembling the parts does not accept the second part or discharge them. The companion [suggested Lean file](../suggested/MotivicEtaleKTheory.lean) is a non-exhaustive signature proposal, and the [assembly handoff](../handoff/ASM-MotivicEtaleKTheory.md) records the remaining review work.

## Scope and neighbouring roadmaps

Generic continuous cohomology, derived limits, arithmetic compact support and Poitou–Tate duality belong to [Arithmetic Galois duality](../../../content/campaign/ArithmeticGaloisDuality/README.md). M.1 constructs the twist coefficient objects and arithmetic realization dictionary on those carriers, and M.2 constructs the real-place and degree-two comparison diagrams. The [Profinite cohomology](../../../content/tau-ceti/ProfiniteCohomology/README.md) link records supply finite/discrete Kummer theory in Layer 9, all-degree discrete cohomology and transfers in Layer 10, and graded cup products in Layer 12. Compact coefficients still need the arithmetic derived-limit suppliers. The [Class field theory](../../../content/tau-ceti/ClassFieldTheory/README.md) links supply local invariant computations in their stated characteristic scope and the number-field global Brauer sequence. They do not supply the missing global function-field argument.

Milnor K-theory, field symbols, norms and residues are imported from [K₂ symbols and Brauer groups](../../../content/campaign/K2SymbolsBrauer/README.md). Ordinary Chow intersection theory and scheme étale foundations belong to [Scheme and stack foundations](../../../content/campaign/SchemeAndStackFoundations/README.md). M.4 owns the higher cycle complexes and their operations; [Motives and algebraic cycles](../../../content/campaign/MotivesAndAlgebraicCycles/README.md), MC.4, owns the packaged higher-Chow/motivic-cohomology comparison. M.5a supplies the transfer action used by that comparison and by M.5d. It does not re-plan MC.4's theorem. The perfect-field restrictions of that supplier remain binding.

Generic spectra, exact couples, Bocksteins and convergence machinery belong to [Stable homotopy and K-theory](../../../content/campaign/StableHomotopyKTheory/README.md). Scheme K-theory with supports, dévissage, λ/Adams operations and the K₀ Grothendieck–Riemann–Roch theorem belong to [Scheme K-theory operations](../../../content/campaign/SchemeKTheoryOperations/README.md). M.6a constructs this roadmap's support filtration; M.6b applies those generic APIs and proves compatibility of its layers, products and Adams actions. M.6 records their resulting spectral sequence and weight comparison.

M.7 owns the algebraic-to-étale and algebraic-to-real comparisons and their arithmetic exceptions. Complex KU from Refined trace methods RT.4 does not provide real KO; a Part II supplier request remains. At the residue characteristic, M.5d uses the absolute differential and logarithmic de Rham–Witt APIs of Derived de Rham cohomology and Crystalline cohomology. That branch is separate from the prime-to-characteristic norm-residue map.

M.8 constructs K-theory Chern and Deligne maps and their arithmetic applications. Tate and elliptic realization spaces come from MC.2/PS.0 and the elliptic suppliers. Hodge structures are imported as existing work; logarithmic Deligne–Beilinson realization needs the recorded Hodge-direction Part II. Borel regulators supply the archimedean normalization comparison; p-adic Hodge regulators supply local comparison regimes. Selmer complexes belong to Selmer–Iwasawa cohomology, and determinant functors to p-adic measures and Iwasawa algebras L5. The late period/leading-term assembly must follow the early M.8 exports: PS.4 currently depends through PS.3 on M.8, so its independent prefix is an unresolved supplier obligation. No whole-stage PS.4 theorem is used to prove its own input.

The roadmap proves the norm-residue theorem historically called Bloch–Kato. Its last layer supplies the statement infrastructure for the Bloch–Kato Tamagawa-number conjecture in specified Tate/elliptic cases; it does not prove that conjecture or assert general Euler-system existence. Generic owners and the upstream Tau Ceti roadmaps are imported once and retain their own APIs.

## Conventions

F is a field, Fˢ a separable closure, and G_F = Gal(Fˢ/F). A finite modulus m is positive and invertible wherever a prime-to-characteristic Tate twist is used; ℓ is a prime. μ_m(j) denotes μ_m^{⊗j}, with tensors over ℤ/m and duals for negative integer j. Weight one is the pinned Kummer coefficient module. Choosing a primitive root gives a trivialization, not a canonical identification with a trivial Galois module.

Write T_j = ℤ_ℓ(j), μ_(ℓʳ)(j) = T_j/ℓʳ and ℚ_ℓ/ℤ_ℓ(j) = colim_r T_j/ℓʳ. The transition from exponent r to r+s is multiplication by ℓˢ on the lattice model. Factorwise inclusion of roots of unity gives the wrong transition in weights j≥2. ℚ/ℤ(j) is the primewise sum of the divisible twists. Continuous compact-coefficient cohomology and étale hypercohomology use derived inverse limits, with Milnor and Bockstein terms; an ordinary quotient A/mA is not the homotopy group of a spectrum with finite coefficients. Finite generation and the relevant limit theorem are needed before identifying derived-completed K-groups with K⊗ℤ_ℓ.

For a smooth scheme over a field, Bloch's simplicial cycle complex has boundary ∑ᵢ(−1)ⁱ∂ᵢ; the normalized cubical boundary is ∑ᵢ(−1)ⁱ(∂ᵢ^∞−∂ᵢ^0). The cube uses ℙ¹ minus 1 and faces 0,∞. Motivic cohomology is H^{a,j}(X,ℤ)=H^a(X,ℤ(j)); in the field/smooth-field setting H^{a,j}=CH^j(X,2j−a). Dedekind bases use the specified dimension-indexed complex and sheaf hypercohomology. The general arithmetic localization theorem is not a naive global higher-Chow statement. All residue signs use the symbol conventions fixed by their K₂ supplier.

The motivic sequence is E₂^{a,b}=H^{a−b}(X,ℤ(−b)) ⇒ K_{−a−b}(X), with differential of bidegree (r,1−r). The support filtration weight is −b; the raw exact-couple shift s corresponds to page r=s+1. The étale descent sequence is E₂^{s,t}=H_et^s(X,ℤ/ℓʳ(t/2)) for even t, total K-degree t−s and differential (r,r−1). The base support-tower construction uses smooth, separated, finite-dimensional schemes of finite type over a perfect field. An arbitrary-field or arithmetic extension needs its own theorem.

For a number field F, S is finite and includes the required coefficient primes; O_{F,S} is the S-integer ring. Use ℝ for the real field and R for an arithmetic ring. In the real-comparison declarations any occurrence of “R” meaning the real field is read as ℝ, with G_ℝ=C₂. Ordinary real cohomology, the mapping-fibre positive theory and the kernel groups denoted by a tilde are distinct. Even at odd ℓ, the positive groups in degrees zero and one need their actual fibre terms. At ℓ=2 with real places, virtual dimension bounds do not erase real connecting maps or non-split extensions.

Chern maps c_{i,n} at positive K-degree n≥1 and positive weight i≥1 are additive. K₀ Chern classes obey Whitney polynomials. The rational character is ch_i=(−1)^{i−1}c_i/(i−1)! in positive degree, while the K₀ Newton polynomial uses i!. Finite coefficient statements retain factorials integrally. Integral motivic image groups, their torsion-free quotients and their rational scalar-extension images are separate objects; lattice assertions need finite generation and the stated embedding conditions.

Real Deligne coefficients use the Tate lattice (2πi)^jℝ, with real conjugation and the Borel factor-two convention kept explicit. The Tate/elliptic Euler-polynomial dictionary uses cohomological geometric Frobenius: 1−q^{−j}T and 1−a_vq^{−j}T+q^{1−2j}T². Dual representations or inverse-Frobenius suppliers require the displayed translation before imposing Euler relations. Norm-family transitions are norm after coefficient reduction; Soulé's family is the specific norm of a unit times a Bott power in degree 2i−1.

## Pinned libraries and source register

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-30 entries in [library coverage](../../../data/library-coverage.json) distinguish existing carriers from missing computations and comparisons. The 68 cited declaration statements were inspected at those pins for this assembly. Derived categories, sheaf and continuous cohomology, basic cycles, tensor/exterior powers, Kähler differentials and the recorded low-degree Galois APIs are reused. A partial library carrier does not supply its missing comparison theorem.

The following register consolidates the parts' source editions. “Recorded sections” and access dates report the plan/review evidence inherited from the packets, not a claim that this assembly has independently re-proved every source theorem. The per-declaration locators below belong to these editions; the packets preserve literal excerpts and the review's source-version checks. Original-proof gaps remain explicitly identified.

<a id="source-kbook2013"></a>

1. **Kbook2013.** Charles A. Weibel, [The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Author draft dated 29 August 2013 (printed page = PDF page - 8).

Recorded sections: III.6.9-6.10 (norm residue symbol, Galois symbol, Proposition 6.10.3, Remark 6.10.4), printed pp. 241-243; VI.1.7 Tate twists and VI.2.1 the e-invariant, printed pp. 468-469; VI.4 Theorem 4.1, Corollary 4.1.1, Theorem 4.2, Remark 4.2.2, Edge map 4.3, printed pp. 480-481; VI.8 Classical data 8.1, (8.1.1), Theorem 8.2, Corollary 8.3, Example 8.5 and Exercises 8.1-8.3, printed pp. 513-516; VI.9 Theorem 9.1, (9.2), Lemma 9.3, Theorem 9.4, (9.6), Definition 9.6.1, (9.6.2), Lemma 9.6.3 and Exercises 9.1-9.2, printed pp. 517-521, 525; III.7 differential symbol, Definition 7.7.1 and Theorem 7.7.2, printed pp.250–251; Izhboldin continuation only a lead, no extra target; V §§11.2–11.12, printed pp.451–458, and the universal motivic-class proof through p.459; Lemma 11.13 normalization; VI §3 Theorem 3.1 and proof/sketch through Lemmas 3.5–3.8, pp.475–479; VI §4 Theorems 4.1–4.8 and Example 4.9 and proofs, pp.480–486; VI §8 Theorems 8.1–8.5 and arithmetic degree calculation, pp.513–514; VI §9 through entire proof of Theorem 9.4, pp.517–520.

Access recorded: 2026-10-06. SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

<a id="source-tate1976"></a>

2. **Tate1976.** John Tate, [Relations between K2 and Galois cohomology](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf). Inventiones mathematicae 36 (1976), 257-274; GDZ scan LOG_0020 (PDF page = printed page - 255).

Recorded sections: §1 introduction, pp. 257-258; §3 (3.1) Theorem, (3.2) Lemma, diagram (3.3), (3.4) Lemma, (3.5) Theorem and Corollary, pp. 262-265; §4 (4.1)-(4.5) and the Corollary for locally compact fields, pp. 265-268; §5 (5.1) Theorem, (5.2) Lemma, sequence (5.3), (5.4) Theorem, pp. 268-270; §6 (6.1) Theorem, (6.2) Theorem, (6.3) Theorem, (6.4) Lemma, pp. 270-271.

Access recorded: 2026-10-06. SHA-256: `5d1ee68e3f9cc49ba6cac8269e1c9ca510411c6a154f36b559290849a72db7b7`.

<a id="source-mvw2006"></a>

3. **MVW2006.** Carlo Mazza, Vladimir Voevodsky, Charles Weibel, [Lecture Notes on Motivic Cohomology](https://www.claymath.org/library/monographs/cmim02c.pdf). Clay Mathematics Monographs 2, AMS/CMI 2006; CMI PDF (printed page = PDF page - 15).

Recorded sections: Lectures 1-6 (finite correspondences, presheaves with transfers, motivic complexes, weight one, Milnor K on the diagonal, étale sheaves with transfers); Lecture 10 (étale motivic cohomology, Theorem 10.2); Lectures 13-14 (Nisnevich sheaves with transfers, Theorem 13.8, Definition 14.1, Theorem 14.11, Proposition 14.16); Lecture 16 (Theorem 16.25); Lectures 17 and 19 (Definition 17.1, Theorem 17.21, Theorem 19.1); Lecture 20 (Proposition 20.1).

Access recorded: 2026-10-06. SHA-256: `fb20ff2f30cefe0b67b359de275491e3716d509d891cc72afa95460f57ed0180`.

<a id="source-voevodsky2011"></a>

4. **Voevodsky2011.** Vladimir Voevodsky, [On motivic cohomology with Z/l-coefficients](https://arxiv.org/pdf/0805.4430v2). Annals of Mathematics 174 (2011), 401-438; arXiv:0805.4430v2 (read).

Recorded sections: §1 introduction; §3 Lemma 3.1-Theorem 3.8; §4 Lemma 4.1, Lemma 4.3, Theorem 4.4; §5 Lemmas 5.7-5.15, Theorem 5.16, Corollary 5.17, Proposition 5.18; §6 Theorem 6.1, Definition 6.2, Theorem 6.3, Lemmas 6.4-6.15, Proposition 6.11, Theorems 6.16-6.18.

Access recorded: 2026-10-06. SHA-256: `9f4b7ed2624a8b412bcc9baea75b32dd5f72f9035267a77f6115c6d6c0234d0a`.

<a id="source-voevodsky2003rpo"></a>

5. **Voevodsky2003RPO.** Vladimir Voevodsky, [Reduced power operations in motivic cohomology](https://arxiv.org/pdf/math/0107109v1). Publications Mathématiques de l'IHÉS 98 (2003), 1-57; arXiv:math/0107109v1 (read).

Recorded sections: §6 Theorems 6.10, 6.14, 6.16; §9 Theorems 9.3-9.4, Lemmas 9.5, 9.7, 9.8, Proposition 9.6; §10 Adem relations; §13 Milnor operations.

Access recorded: 2026-10-06. SHA-256: `a47880bd5aaf51b8341e472561110c91994144e95460f3141a3e6922547a2d8f`.

<a id="source-voevodsky2010cancel"></a>

6. **Voevodsky2010Cancel.** Vladimir Voevodsky, [Cancellation theorem](https://arxiv.org/pdf/math/0202012v1). Documenta Mathematica, Extra Volume Suslin (2010), 671-685; arXiv:math/0202012v1 (read).

Recorded sections: §1 introduction and main theorem; §4 proof of the cancellation theorem.

Access recorded: 2026-10-06. SHA-256: `834de6dc40560395512507023eb6241e155673edf3c4f159836658dfee650d6a`.

<a id="source-totaro1992"></a>

7. **Totaro1992.** Burt Totaro, [Milnor K-theory is the simplest part of algebraic K-theory](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf). K-Theory 6 (1992), 177-189 (author's scan).

Recorded sections: §1 cubical higher Chow groups and products; §2 statement of Theorem 1; §§3-4 the maps K^M_n(F) -> CH^n(F,n) and back, using norms and Weil reciprocity.

Access recorded: 2026-10-06. SHA-256: `3447b12c9108d37528d998376051d7e60f0461584f61c1e980bdaa46ada43aee`.

<a id="source-geisser2004-geisserdedekind"></a>

8. **Geisser2004, GeisserDedekind.** Thomas Geisser, [Motivic cohomology over Dedekind rings](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf). Mathematische Zeitschrift 248 (2004), 773-794 (author's copy).

Recorded sections: §1 Theorems 1.1-1.3 and notation; §3 Theorem 3.2 and Corollary 3.3 (localization); §4 Theorem 4.2 and Corollary 4.3 (Gersten); Introduction, exact Theorem 1.2; Lemma 2.1 and Proposition 2.2; Entire §5 proof of Theorem 1.2, pp.787–789; cited Geisser–Levine original unavailable.

Access recorded: 2026-10-06. SHA-256: `88b92df6124b0e3a2be09ac24250c2b811572628d17a6282e787e0883160091f`.

<a id="source-spitzweck2018"></a>

9. **Spitzweck2018.** Markus Spitzweck, [A commutative P^1-spectrum representing motivic cohomology over Dedekind domains](https://arxiv.org/pdf/1207.4078v3). Mémoires de la SMF 157 (2018); arXiv:1207.4078v3 (read).

Recorded sections: Introduction (Bloch–Levine cycle complexes over a Dedekind domain, Levine's moving lemma); §2 cycle complexes M_X(r), flat pullback.

Access recorded: 2026-10-06. SHA-256: `7da11119650a216f3722152c6b2e6b6b9b9feb1b28bf1f1f335e7e4ab20c6e74`.

<a id="source-hw2009chain"></a>

10. **HW2009Chain.** Christian Haesemeyer, Charles Weibel, [Norm varieties and the chain lemma (after Markus Rost)](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf). Algebraic Topology, Abel Symposia 4 (2009), 95-130 (author's copy).

Recorded sections: Introduction: Theorem 0.1 (Chain Lemma), Definition 0.2, Theorem 0.3 (Norm Principle), Definitions 0.4-0.5, Theorem 0.7.

Access recorded: 2026-10-06. SHA-256: `355cc3d96da367fa85001c6291bf298930a2b6ece246186f8f1f2e6145ec27ac`.

<a id="source-nsw2020"></a>

11. **NSW2020.** Jürgen Neukirch, Alexander Schmidt, Kay Wingberg, [Cohomology of Number Fields](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf). Second edition, corrected electronic version 2.3 (May 2020).

Recorded sections: II §7 (2.7.5)-(2.7.6) continuous cohomology of inverse limits; VIII §6 (8.6.10) Poitou-Tate sequence and its proof.

Access recorded: 2026-10-06. SHA-256: `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91`.

<a id="source-milneadt"></a>

12. **MilneADT.** James S. Milne, [Arithmetic Duality Theorems](https://www.jmilne.org/math/Books/ADTnot.pdf). Second edition (2006), electronic version.

Recorded sections: I §4 Theorem 4.10 and the remarks on scd_p(G_S); II §2 Proposition 2.9 (étale cohomology of U versus Galois cohomology of G_S); II §2 Proposition 2.1 (cohomology of G_m on open subschemes of Spec O_K) and I §4 Theorem 4.20 (finitely generated modules).

Access recorded: 2026-10-06. SHA-256: `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31`.

<a id="source-levine1994"></a>

13. **Levine1994.** Marc Levine, [Bloch's higher Chow groups revisited](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf). K-theory (Strasbourg, 1992), Astérisque 226 (1994), 235-320; author's preprint (preprint page = PDF page).

Recorded sections: Introduction; §3 the cubical complexes Z^q(X, *)^c; §4 Lemmas 4.1-4.3, Proposition 4.4, Theorem 4.5, Bloch's properties (1)-(2), Lemma 4.6, Theorem 4.7, Corollaries 4.8-4.9; §5 Lemma 4.10 sign rule for products.

Access recorded: 2026-10-06. SHA-256: `2ddb007b371fb91b533db4a39b178eb1589f2ccd1d5157f8b1f4ecb3d9d5a9c2`.

<a id="source-park2021"></a>

14. **Park2021.** Jinhyun Park, [On localization for cubical higher Chow groups](https://arxiv.org/pdf/2108.13561v2). arXiv:2108.13561v2 (27 December 2021) (read).

Recorded sections: §1 introduction and Theorem 1.0.1 (history of the localization theorem); §2.1 Definition 2.1.1 (cubical higher Chow complex); §2.2 Theorem 2.2.1 (normalisation).

Access recorded: 2026-10-06. SHA-256: `2eb581265b4d0ff9fee6b944393de0c6c63b726f7b078f38a2058e90657af53f`.

<a id="source-voevodsky2003mcz2"></a>

15. **Voevodsky2003MCZ2.** Vladimir Voevodsky, [Motivic cohomology with Z/2-coefficients](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf). Publications Mathématiques de l'IHÉS 98 (2003), 59-104 (published version, Numdam scan; printed page = PDF page + 58).

Recorded sections: §1 introduction; §5 Definition 5.1, Proposition 5.2, Lemmas 5.3-5.8, Theorem 5.9; §6 Theorem 6.1, Definition 6.4, Theorem 6.6, Lemmas 6.7-6.8, Corollaries 6.9-6.10, Lemmas 6.11-6.13; §7 Proposition 7.1, Lemmas 7.2-7.3, Theorem 7.4, Corollary 7.5; Appendix B: Definition 9.1, Lemmas 9.2-9.3.

Access recorded: 2026-10-06. SHA-256: `94abfd028ce8185ee044903c9fdf565de182aa29ebb6be07632fd544d4cdfb5c`.

<a id="source-voevodsky2010mss"></a>

16. **Voevodsky2010MSS.** Vladimir Voevodsky, [Motives over simplicial schemes](https://arxiv.org/pdf/0805.4431v1). Journal of K-Theory 5 (2010); arXiv:0805.4431v1 (read; this is the preliminary version cited as [9] by Voevodsky 2011, whose lemma numbers differ slightly, e.g. its [9, Lemma 6.14] is Theorem 6.14 here).

Recorded sections: §5 Lemmas 5.14-5.18 (slices of Tate motives); §6 Definition 6.1, Example 6.3, Lemmas 6.5-6.12, Definition 6.13, Theorem 6.14, Lemmas 6.15-6.23.

Access recorded: 2026-10-06. SHA-256: `c37407ef2781b49aef9af2231bce6179320f7b7541bebcf1635f304845bc9d69`.

<a id="source-bk1986"></a>

17. **BK1986.** Spencer Bloch and Kazuya Kato, [p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf). Publications Mathématiques de l’IHÉS 63 (1986), 107–152, published scan.

Recorded sections: Entire §2, printed pp.113–118, re-read in this run, including Lemmas 2.2/2.3.2/2.5, Proposition 2.4 and Corollary 2.8; Kato 1982 §1 is a cited original input that remains unread; no claim of full BK paper coverage.

Access recorded: 2026-10-06. SHA-256: `51cf9c3fe85c3d55a6af56c9789c831b810cdd4c9b2c275057dcde6c14730dc8`.

<a id="source-kf2000"></a>

18. **KF2000.** Masato Kurihara and Ivan Fesenko; A2 by Ivan Fesenko, [Appendix to Section 2](https://msp.org/gtm/2000/03/gtm-2000-03-003p.pdf). Geometry & Topology Monographs 3 (2000), appendix pp.31–41; published publisher PDF.

Recorded sections: Entire appendix A1–A2, printed pp.31–41 / PDF pp.1–11, read on 2026-09-26; key formulas on printed pp.31, 33, 36, 37, 38 and 40 visually checked.; Compared the recorded source-issue passages with arXiv math/0012134v1. A2 remains a supplementary account with unresolved proof obligations, not a completed BGK proof.; 2026-10-06 continuation: reread the six inherited source-issue passages at pp.31,33,36–40 and the supplement argument; their v1 comparison/search remains the prior worker’s ledger, not a new independent verification.; Independent review 2026-10-06: entire appendix read; all six issue passages visually inspected in the published PDF and compared with arXiv v1 and the author-hosted volume. Five issues confirmed and E2 rejected as a demonstrated misprint; the intended Cartier arrow remains binding..

Access recorded: 2026-10-06. SHA-256: `3fc22f399e587fbd689270de87e501f839258276b3926bc0a5acf395529a9b95`.

<a id="source-levine2008"></a>

19. **Levine2008.** Marc Levine, [The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334). arXiv:math/0510334v1, 16 October 2005; publication 2008; locators here use the 67-page preprint.

Recorded sections: Introduction §1.3; §2.1 support construction and convergence discussion; Theorem 3.2.1 statement and opening proof; §4.1 Theorem 4.1.1 and proof; §5.3 Theorem 5.3.1/Corollary 5.3.2; Entire §6.4 K-theory layer comparison; §§11.2–11.3 statements, not all earlier moving proofs.

Access recorded: 2026-10-06. SHA-256: `5f268002b5ec36a74932a48ac051712c9c19c41a8b76e5bcb5dcdf0800538190`.

<a id="source-levineschemes"></a>

20. **LevineSchemes.** Marc Levine, [K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf). Author preprint December 2001, 86 pages.

Recorded sections: Introduction and §2.3–§2.5 support/face definitions; Theorem 12.12 and its proof, pp.58–59; Theorems 14.5 and 14.7 statements, pp.71–73; §11 and Appendix D multiplicative proof not read; explicit gap.

Access recorded: 2026-10-06. SHA-256: `67affc5d6f837a78281c824d21723be9af1180bb77d44e8cff9cca5b0b2ef820`.

<a id="source-fgv2022"></a>

21. **FGV2022.** Tony Feng, Søren Galatius and Akshay Venkatesh, [The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf). Author PDF, published 2022.

Recorded sections: §§2.6–2.8, including Remark 2.8, Proposition 2.9, Lemma 2.10, Adams/transfer conventions and cited transfer proof; Only these ordinary/étale K-theory inputs are routed here; no KSp construction planned.

Access recorded: 2026-10-06. SHA-256: `5d717b2a94288593049be2aed34e38dbde10750beba4bd3d3387820d038e8807`.

<a id="source-liliu2021"></a>

22. **LiLiu2021.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Annals of Mathematics 194 (2021); author PDF AIPF.pdf.

Recorded sections: Appendix B, pp.57–62, including Lemma B.6, support Chern map and footnote 22; No other automorphic or height-theoretic assertions routed to this packet.

Access recorded: 2026-10-06. SHA-256: `6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566`.

<a id="source-sv2000"></a>

23. **SV2000.** Andrei Suslin and Vladimir Voevodsky, [Bloch–Kato conjecture and motivic cohomology with finite coefficients](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf). The arithmetic and geometry of algebraic cycles (2000), author PDF.

Recorded sections: §7, pp.52–53, Theorem 7.4 and its resolution-of-singularities hypothesis; general proof not fully read.

Access recorded: 2026-10-06. SHA-256: `4f29e999c004da03de80d80e3acc4b4318a18c95951629d9f899e27164fd5fad`.

<a id="source-illusie1979"></a>

24. **Illusie1979.** Luc Illusie, [Complexe de de Rham–Witt et cohomologie cristalline](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf). Annales scientifiques de l’École normale supérieure 12 (1979), 501–661, published scan.

Recorded sections: I §5.7, printed pp.596–598, statements 5.7.1–5.7.9 and proof of Corollary 5.7.5; This is I(5.7.5), not part II; full general de Rham–Witt theory stays with CR.4.

Access recorded: 2026-10-06. SHA-256: `bf9b783b4f5f255133c68ccb544aec029f25828aa943a744ccb6958d51f218d8`.

<a id="source-calmes2026"></a>

25. **Calmes2026.** Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, [Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4). arXiv:2009.07225v4, 27 April 2026; routed Annals 204 (2026).

Recorded sections: Lemma 3.2.4 and entire proof, pp.56–57 only; no other hermitian K results claimed.

Access recorded: 2026-10-06. SHA-256: `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`.

<a id="source-fs2002"></a>

26. **FS2002.** Eric M. Friedlander and Andrei Suslin, [The spectral sequence relating algebraic K-theory to motivic cohomology](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf). Annales scientifiques de l’École normale supérieure 35 (2002), author-hosted PDF.

Recorded sections: Introduction; §13 Lemma 13.12 and Theorem 13.13, pp.67–68; Proposition 13.17 and Theorem 13.18, pp.71–72; Earlier full multi-relative comparison/moving proofs not read; global filtered-zigzag gap retained.

Access recorded: 2026-10-06. SHA-256: `d716deea11cf2e9e56d04b78eb777b10037bef4573fcc32db957d2cf6c4735a3`.

<a id="source-soule1987"></a>

27. **Soule1987.** Christophe Soulé, [Éléments cyclotomiques en K-théorie](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf). Astérisque 147–148 (1987), 225–257, published scan.

Recorded sections: §4.1–§4.4, printed pp.238–240: compatible units, Bott powers and K-degree/norm conventions.

Access recorded: 2026-10-06. SHA-256: `714881bf6d8d10db209d9a3f03835fb048e4fc85ae103942daaefc3924efb0b7`.

<a id="source-kato2003"></a>

28. **Kato2003.** Kazuya Kato, [Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1). ICM 2002 proceedings, 163–171; arXiv:math/0304233v1, 16 April 2003.

Recorded sections: §§1.1–1.3 and §2.1 through its fundamental-line discussion, pp.163–168; opening of §2.2, p.169; No proof of the characteristic-zero conjectural zeta-element/basis assertions is claimed.

Access recorded: 2026-10-06. SHA-256: `6d7f3a5924fd5291bc23870547b05552ba7fb1e39413d551f11daf052fbcf12b`.

<a id="source-burgos2002"></a>

29. **Burgos2002.** José Ignacio Burgos Gil, [The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf). CRM Monograph Series 15 (2002), author PDF.

Recorded sections: §4.4 and Remark 4.25 normalization, pp.31–32; §10.1–§10.3 in full, pp.89–94; §10.4 infinitesimal-diagonal construction and diagram through Lemma 10.10 and Proposition 10.11 on p.97; §8.1 Lemmas 8.6–8.7 proof passage only; Theorems 8.12/8.15 and the full general Weil-algebra comparison are supplier inputs, not claimed fully read.

Access recorded: 2026-10-06. SHA-256: `da6ba8c4b08bf447d1575788c33b96c52d8d0d0a377e8f2990ead6aed73f65ea`.

## Layer overview

| Layer | Declarations | Planets | Status | Main exports |
| --- | ---: | ---: | --- | --- |
| [M.1](#m-1) | 11 | 5 | planned | Finite and adic twists, coefficient transitions, étale/Galois realizations, Kummer and Dedekind localization. The generic derived-limit and continuous-cohomology theorems retain their suppliers. |
| [M.2](#m-2) | 8 | 3 | planned | Real restriction, positive and kernel groups, cohomological dimension, S-integer Brauer and mod-two diagrams. Arithmetic finiteness hypotheses are explicit. |
| [M.3](#m-3) | 13 | 5 | planned | The actual cup-symbol map, norms and residues, local/global Tate arguments, adic and S-integer formulations, and the auxiliary results used in the proof. |
| [M.4](#m-4) | 21 | 5 | planned | Simplicial/cubical cycles, moving, localization and products; low weights, the field Milnor diagonal and the separate Dedekind sheaf complexes and Gersten maps. |
| [M.5](#m-5) | 1 | 1 | planned | A summary milestone importing the mod-prime geometric proof and M.5d prime-power passage. It is an output, not a premise of that induction. |
| [M.5a](#m-5a) | 12 | 6 | planned | Correspondences, sheaves with transfers, effective motivic complexes, cancellation, the cycle transfer action, étale realization, rigidity and permitted imperfect-field passage. |
| [M.5b](#m-5b) | 10 | 5 | planned | Motivic operations and their relations, norm varieties, degree formulas and the Čech simplicial scheme, with the actual characteristic and induction hypotheses. |
| [M.5c](#m-5c) | 6 | 4 | planned | Rost motives, symmetric operations and Hilbert-90 induction; the mod-ℓ symbol isomorphism is exported for every field of characteristic different from ℓ. |
| [M.5d](#m-5d) | 27 | 6 | planned | Absolute logarithmic differential symbols and BGK, logarithmic Witt coefficients, compatible prime-power induction and finite-symbol field reductions. The characteristic-p and prime-to-p branches stay separate. |
| [M.6](#m-6) | 2 | 2 | planned | The spectral sequence and eigenspace comparison assembled from M.6a–b. The displayed page does not define the filtered spectrum. |
| [M.6a](#m-6a) | 6 | 5 | planned | Admissible supports and their K-spectra, moving/excision, well-connectedness, cycle layers and the still-open full filtered comparison of global models. |
| [M.6b](#m-6b) | 5 | 5 | planned | The derived differentials, connectivity and limits, filtered products and Adams actions, and rational degeneration after their compatibility has been proved. |
| [M.7](#m-7) | 14 | 6 | planned | Étale descent and Quillen–Lichtenbaum, separate arithmetic/Dedekind/adic degree statements, complex and real comparisons, and the dyadic extension data. |
| [M.8](#m-8) | 13 | 6 | planned | Early Chern/Deligne exports, supported classes, integral images and lattices, actual Tate/elliptic realizations, norm families and conditional Selmer/determinant applications. |

Read M.5a–c and then M.5d to discharge the M.5 milestone; construct M.6a–b before its M.6 assembly. Within each part the catalogue follows the roadmap layer order. Each construction has the packet's consumer-derived planning API and discriminating tests. Proposed module and namespace names are design targets, never claims that those modules already exist.

<a id="m-1"></a>

## M.1 — Coefficient modules and continuous arithmetic cohomology

Finite and adic twists, coefficient transitions, étale/Galois realizations, Kummer and Dedekind localization. The generic derived-limit and continuous-cohomology theorems retain their suppliers.

**Planets:** Finite Tate twists, ℓ-adic Tate twists, Continuous ℓ-adic cohomology, Étale–Galois comparison, Étale localization sequence.

**Other-layer prerequisites:** None.

<a id="m-1-finite-tate-twist"></a>

### M.1/finite-tate-twist — Finite Tate twists of the roots of unity

**Construction.** Identifier: `MotivicEtaleKTheory:M.1/finite-tate-twist`. Implementation: unchecked.

Let F be a field with separable closure F^s and absolute Galois group G_F, let m ≥ 1 be an integer invertible in F, and let j ∈ ℤ. The finite Tate twist μ_m^{⊗j} is the discrete G_F-module defined as follows. For j = 0 it is ℤ/m with trivial action. For j = 1 it is Tau Ceti's KummerCoeff F m, the group μ_m(F^s) written additively, with its discrete topology. For j ≥ 2 it is the j-fold tensor product over ℤ/m of μ_m with the diagonal action. For j < 0 it is Hom_{ℤ/m}(μ_m^{⊗(−j)}, ℤ/m) with g·φ = φ ∘ g^{−1}. In every case the underlying group is free of rank one over ℤ/m, and g ∈ G_F acts as multiplication by χ_m(g)^j, where χ_m : G_F → (ℤ/m)^× is the mod-m cyclotomic character (Mathlib's modularCyclotomicCharacter on the automorphisms of F^s). The action factors through Gal(F(μ_m)/F), so it is continuous for the discrete topology. The construction comes with equivariant ℤ/m-bilinear pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)} for all i, j ∈ ℤ, which are associative and graded-symmetric through the swap isomorphism.

**Hypotheses and conventions.**

- F a field; m ≥ 1 with m invertible in F; j ∈ ℤ.
- Twists are taken over ℤ/m; no primitive m-th root of unity is assumed to lie in F.

**Construction or proof.**

1. Take μ_m = KummerCoeff F m (the m-th roots of unity in the separable closure, discrete) and form tensor powers over ℤ/m with the diagonal action; for negative j use the ℤ/m-dual with the contragredient action (Tate §3 defines the ℓ-adic analogue inductively by Z_l(m+1) = Z_l(m) ⊗ Z_l(1) and Z_l(m−1) = Hom(Z_l(1), Z_l(m))).
2. Show the underlying group is free of rank one over ℤ/m: μ_m(F^s) is cyclic of order m because m is invertible in F, and tensor powers and duals of a free rank-one module are free of rank one.
3. Compute the action on a generator ζ^{⊗j}: g(ζ^{⊗j}) = (ζ^{χ_m(g)})^{⊗j} = χ_m(g)^j ζ^{⊗j}; it factors through the finite quotient Gal(F(μ_m)/F), hence is continuous for the discrete topology.
4. Define the pairings by concatenation of tensors (and evaluation for negative twists), check equivariance on generators, and record associativity and the swap symmetry.

**Direct prerequisites.** `tauceti:TauCeti.KummerCoeff`, `tauceti:TauCeti.AbsoluteGaloisGroup`, `mathlib:modularCyclotomicCharacter`, `mathlib:rootsOfUnity`

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

**Planning API.**

- **TauCeti.TateTwist.finite** (constructor): For a field F, m invertible in F and j ∈ ℤ, the discrete G_F-module μ_m^{⊗j}.
- **TauCeti.TateTwist.finite_one** (equivalence): μ_m^{⊗1} ≅ KummerCoeff F m as discrete G_F-modules.
- **TauCeti.TateTwist.finite_zero** (equivalence): μ_m^{⊗0} ≅ ℤ/m with the trivial action.
- **TauCeti.TateTwist.smul_eq_cyclotomic** (characterisation): g • x = χ_m(g)^j • x for g ∈ G_F and x ∈ μ_m^{⊗j}.
- **TauCeti.TateTwist.card_finite** (simp): The underlying group of μ_m^{⊗j} has exactly m elements and is free of rank one over ℤ/m.
- **TauCeti.TateTwist.pairing** (constructor): The equivariant ℤ/m-bilinear pairing μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}.
- **TauCeti.TateTwist.pairing_assoc** (relation): The pairings are associative under the canonical identifications of iterated twists.
- **TauCeti.TateTwist.pairing_comm** (relation): pairing(x, y) corresponds to pairing(y, x) under the swap isomorphism μ_m^{⊗(i+j)} ≅ μ_m^{⊗(j+i)}; on μ_m ⊗ μ_m the swap is the identity of the underlying cyclic group.
- **TauCeti.TateTwist.homEquiv** (equivalence): Cartier duality: the pairing μ_m^{⊗j} × μ_m^{⊗(1−j)} → μ_m^{⊗1} induces a G_F-equivariant isomorphism μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j}, μ_m), with g acting on Hom by φ ↦ g ∘ φ ∘ g^{−1}.
- **TauCeti.TateTwist.dualEquiv** (equivalence): The pairing μ_m^{⊗j} × μ_m^{⊗(1−j)} → μ_m^{⊗1} = μ_m is perfect: it induces an isomorphism of discrete G_F-modules μ_m^{⊗(1−j)} ≅ Hom_{ℤ/m}(μ_m^{⊗j}, μ_m) (Cartier duality), compatible with reduction for m | m'.
- **TauCeti.TateTwist.trivialise** (equivalence): If ζ ∈ F is a primitive m-th root of unity, 1 ↦ ζ^{⊗j} is a G_F-equivariant isomorphism ℤ/m ≅ μ_m^{⊗j} (the change-of-root rule itself is K2SymbolsBrauer T.7's).
- **TauCeti.TateTwist.res** (functoriality): For a field extension E/F with chosen embedding of separable closures, the restriction of μ_m^{⊗j}(F) along G_E → G_F is μ_m^{⊗j}(E); identity and composition laws hold.
- **TauCeti.TateTwist.reduce** (functoriality): For m | m′, the reduction μ_{m′}^{⊗j} → μ_m^{⊗j}: for j ≥ 0, ζ ↦ ζ^{m′/m} on each tensor factor; for j < 0, φ ↦ (x ↦ φ(x̃) mod m) with x̃ any lift of x along the reduction of μ^{⊗(−j)} (well defined because φ(m·y) = m·φ(y)). It is surjective, G_F-equivariant and semilinear over ℤ/m′ → ℤ/m, and reductions compose.

**Discriminating tests.**

- **TateTwist.test_zero_trivial** (degenerate): For j = 0, every g ∈ G_F acts trivially on μ_m^{⊗0} = ℤ/m.
- **TateTwist.test_m_one** (degenerate): For m = 1, μ_1^{⊗j} = 0 for every j.
- **TateTwist.test_kummer_coeff** (compatibility): μ_m^{⊗1} is TauCeti.KummerCoeff F m, with the same action and discrete topology.
- **TateTwist.test_rat_three_square** (computation): For F = ℚ and m = 3, complex conjugation acts trivially on μ_3^{⊗2} and by −1 on μ_3^{⊗1}.
- **TateTwist.test_not_trivial_without_root** (non-example): For F = ℚ and m = 4, μ_4^{⊗1} and ℤ/4 (trivial action) are not isomorphic G_ℚ-modules, since complex conjugation acts by −1 on μ_4.

**Consumers.**

- Kbook2013 III.6.10.3 (Galois symbol): μ_m^{⊗2} is the target H²(F, μ_m^{⊗2}) of the Galois symbol built in M.3.
- K2SymbolsBrauer:T.7/twisted-roots-of-unity and T.7/symbol-formula: T.7 trivialises μ_m^{⊗j} by a primitive root and lands explicitCup11 of two Kummer classes in H²(F, μ_m^{⊗2}); it requests exactly these twists with their pairings.
- ArithmeticKTheory:N.4 and N.6, HabiroNumberFields:HB.1, KTheoryFiniteLocalFields:L.6: Coefficients μ_m^{⊗j} of the étale cohomology groups that compute K-groups with finite coefficients.
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The graded target ⊕_j H^j(F, μ_m^{⊗j}) of the all-degree norm residue map uses the pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}.
- KTheoryFiniteLocalFields:L.6/local-duality-for-tate-twists: Cartier duality Hom(ℤ/p^ν(j), μ_{p^ν}) ≅ ℤ/p^ν(1 − j) of the twists, the coefficient side of local Tate duality.
- KTheoryFiniteLocalFields:L.6 (request to M.1): Cartier duality Hom(ℤ/p^ν(j), μ_{p^ν}) ≅ ℤ/p^ν(1 − j) of the twists, used for local duality of Tate twists (homEquiv).

**Acceptance.**

- For F = ℚ and m = 3, complex conjugation acts on μ_3 by −1 and on μ_3^{⊗2} trivially; the computation goes through χ_3(c) = −1 and (−1)^2 = 1.
- The j = 1 twist is literally Tau Ceti's KummerCoeff F m, so Tau Ceti's kummerMap takes values in H¹(F, μ_m^{⊗1}).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10 (Sketch of Galois cohomology), printed p. 242 (PDF p. 250). The K-book defines μ_m^{⊗2} as the diagonal tensor square and notes Z/m, μ_m, μ_m^{⊗2} share an underlying group; the node extends this to all j ∈ ℤ.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10, printed p. 242 (PDF p. 250). Source of the non-example test: the twists must not be identified with ℤ/m without a root of unity in F.

<a id="m-1-adic-tate-twist"></a>

### M.1/adic-tate-twist — ℓ-adic Tate twists and their coefficient sequences

**Construction.** Identifier: `MotivicEtaleKTheory:M.1/adic-tate-twist`. Implementation: unchecked.

Let F be a field, ℓ a prime different from the characteristic of F, and j ∈ ℤ. Define the compact G_F-module ℤ_ℓ(1) = lim_ν μ_{ℓ^ν} (transition maps ζ ↦ ζ^ℓ), a free ℤ_ℓ-module of rank one on which g ∈ G_F acts by Mathlib's cyclotomicCharacter ℓ (g) ∈ ℤ_ℓ^×; ℤ_ℓ(j) = ℤ_ℓ(1)^{⊗j} for j ≥ 0 and ℤ_ℓ(j) = Hom_{ℤ_ℓ}(ℤ_ℓ(−j), ℤ_ℓ) for j < 0, with the ℓ-adic topology; ℚ_ℓ(j) = ℤ_ℓ(j) ⊗ ℚ_ℓ; and the discrete module ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, the colimit taken along the inclusions ι below (b = 1); along the factorwise inclusions of roots of unity the colimit would be 0 for j ≥ 2. The canonical identifications are ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j}, ℚ_ℓ/ℤ_ℓ(j) ≅ ℚ_ℓ(j)/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j} ≅ ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν]. The coefficient sequences 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0, 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0, 0 → μ_{ℓ^ν}^{⊗j} → ℚ_ℓ/ℤ_ℓ(j) --ℓ^ν--> ℚ_ℓ/ℤ_ℓ(j) → 0 and 0 → μ_{ℓ^a}^{⊗j} --ι--> μ_{ℓ^{a+b}}^{⊗j} → μ_{ℓ^b}^{⊗j} → 0 are exact, where ι is the map induced by multiplication by ℓ^b on ℤ_ℓ(j), ℤ_ℓ(j)/ℓ^a → ℤ_ℓ(j)/ℓ^{a+b}. For j ≥ 2 this ι is not the map induced factorwise by the inclusions μ_{ℓ^a} ⊂ μ_{ℓ^{a+b}}.

**Hypotheses and conventions.**

- F a field, ℓ a prime with ℓ ≠ char F, j ∈ ℤ, ν, a, b ≥ 1.
- ℤ_ℓ(j) and ℚ_ℓ(j) carry the ℓ-adic topology; ℚ_ℓ/ℤ_ℓ(j) and μ_{ℓ^ν}^{⊗j} are discrete.

**Construction or proof.**

1. Build ℤ_ℓ(1) as the inverse limit of finite-tate-twist for m = ℓ^ν along the ℓ-th power maps; the limit of free rank-one ℤ/ℓ^ν-modules with surjective transitions is free of rank one over ℤ_ℓ (Tate §3: 'Z_l(1) = lim (μ_{l^i}) is a free Z_l-module of rank 1').
2. Identify the action with cyclotomicCharacter ℓ: both are the limit of the mod-ℓ^ν characters.
3. Define the other twists by tensor powers and duals as in Tate §3 and check the quotient identifications on a generator.
4. Exactness of the coefficient sequences is exactness for free rank-one modules over ℤ_ℓ, ℤ/ℓ^ν; the map ι is multiplication by ℓ^b, and on generators the factorwise inclusion sends ζ_{ℓ^a}^{⊗j} to ℓ^{bj} times a generator, which is ℓ^{b(j−1)}·ι(generator).

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), `mathlib:cyclotomicCharacter`, `mathlib:TopRep`, `ArithmeticGaloisDuality:R02.1/mittag-leffler`

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

**Planning API.**

- **TauCeti.TateTwist.adic** (constructor): The compact G_F-module ℤ_ℓ(j), free of rank one over ℤ_ℓ.
- **TauCeti.TateTwist.adic_smul** (characterisation): g • x = (cyclotomicCharacter ℓ g)^j • x on ℤ_ℓ(j).
- **TauCeti.TateTwist.adicQuotientEquiv** (equivalence): ℤ_ℓ(j)/ℓ^ν ≅ μ_{ℓ^ν}^{⊗j} as discrete G_F-modules, compatibly in ν.
- **TauCeti.TateTwist.adicLimitEquiv** (equivalence): ℤ_ℓ(j) ≅ lim_ν μ_{ℓ^ν}^{⊗j} as topological G_F-modules.
- **TauCeti.TateTwist.rational** (constructor): ℚ_ℓ(j) = ℤ_ℓ(j) ⊗_{ℤ_ℓ} ℚ_ℓ with the ℓ-adic topology.
- **TauCeti.TateTwist.divisible** (constructor): ℚ_ℓ/ℤ_ℓ(j) = colim_ν μ_{ℓ^ν}^{⊗j}, the colimit along the inclusions ι (induced by multiplication by ℓ on ℤ_ℓ(j)), discrete, with ℚ_ℓ/ℤ_ℓ(j)[ℓ^ν] = μ_{ℓ^ν}^{⊗j}.
- **TauCeti.TateTwist.coeffInclusion** (data): ι : μ_{ℓ^a}^{⊗j} → μ_{ℓ^{a+b}}^{⊗j}, induced by multiplication by ℓ^b on ℤ_ℓ(j); it is injective with cokernel μ_{ℓ^b}^{⊗j}.
- **TauCeti.TateTwist.shortExact_mul** (relation): 0 → ℤ_ℓ(j) --ℓ^ν--> ℤ_ℓ(j) → μ_{ℓ^ν}^{⊗j} → 0 is exact and admits a continuous set-theoretic section.
- **TauCeti.TateTwist.shortExact_rational** (relation): 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0 is exact.
- **TauCeti.TateTwist.adic_pairing** (constructor): Equivariant pairings ℤ_ℓ(i) × ℤ_ℓ(j) → ℤ_ℓ(i+j) reducing mod ℓ^ν to the finite pairings.

**Discriminating tests.**

- **TateTwist.test_adic_zero** (degenerate): ℤ_ℓ(0) = ℤ_ℓ with trivial G_F-action.
- **TateTwist.test_adic_char** (compatibility): On ℤ_ℓ(1), g acts by Mathlib's cyclotomicCharacter ℓ g.
- **TateTwist.test_rat_three_w2** (computation): H⁰(ℚ, ℚ_3/ℤ_3(2)) ≅ ℤ/3.
- **TateTwist.test_factorwise_inclusion_wrong** (non-example): For j = 2 and a = b = 1, the factorwise inclusion μ_ℓ ⊗ μ_ℓ → μ_{ℓ²} ⊗ μ_{ℓ²} is the zero map, whereas ι is injective.
- **TateTwist.test_factorwise_colimit_zero** (non-example): For j = 2, the colimit of the μ_{ℓ^ν}^{⊗2} along the factorwise inclusions μ_{ℓ^ν} ⊂ μ_{ℓ^{ν+1}} is 0: k steps send a generator to ℓ^{2k} times a generator of ℤ/ℓ^{ν+k}, which vanishes once k ≥ ν. Along ι the colimit is ℚ_ℓ/ℤ_ℓ(2), whose ℓ-torsion μ_ℓ^{⊗2} is nonzero.

**Consumers.**

- Tate1976 (3.1): Target H²(F, ℤ_ℓ(2)) of Tate's adic Galois symbol (M.3/adic-galois-symbol).
- ArithmeticKTheory:N.5/edge-normalised-chern-torsion and N.6: Continuous coefficient sequences for ℤ_ℓ(j), ℚ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) and their connecting maps.
- PadicHodgeRegulators:D.2/etale-regulator: Target H¹(F, ℤ_p(n)) = lim H¹(F, μ_{p^ν}^{⊗n}) of the continuous étale regulator.
- MotivicEtaleKTheory:M.5d/prime-power-norm-residue: The coefficient triangle with the correct inclusion map ι drives the Bockstein induction from ℓ to ℓ^r.

**Acceptance.**

- For F = ℚ, ℓ = 3 and j = 2, H⁰(ℚ, ℚ_3/ℤ_3(2)) is cyclic of order 3 (the 3-part of w_2(ℚ) = 24).
- ℤ_ℓ(0) = ℤ_ℓ with trivial action and ℚ_ℓ/ℤ_ℓ(0) = ℚ_ℓ/ℤ_ℓ.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §3, p. 262. Tate's definition of Z_l(1) and of Z_l(m) for m ∈ ℤ (Z_l(m+1) = Z_l(m) ⊗ Z_l(1), Z_l(m−1) = Hom(Z_l(1), Z_l(m))); excerpt typed from the scan.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2 proof and Corollary 8.3, printed pp. 513-514 (PDF pp. 521-522). The K-book uses ℤ_ℓ(i) with ℤ_ℓ(i)/ℓ ≅ μ_ℓ^{⊗i}; the coefficient sequences are the ones its proofs use.

<a id="m-1-primewise-q-mod-z-twist"></a>

### M.1/primewise-q-mod-z-twist — The primewise twist ℚ/ℤ(j)

**Construction.** Identifier: `MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist`. Implementation: unchecked.

Let F be a field of characteristic p ≥ 0 and j ∈ ℤ. Define the discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ p} ℚ_ℓ/ℤ_ℓ(j), the sum of the divisible ℓ-adic twists of adic-tate-twist over the primes ℓ different from p. Equivalently ℚ/ℤ(j) is the group μ(F^s) of all roots of unity of F^s, with g ∈ G_F acting by ζ ↦ g^j(ζ) in the sense of K-book Definition VI.1.7. It is not the tensor power (ℚ/ℤ)^{⊗j}, which vanishes for j ≥ 2. Its invariants W_j(F) = H⁰(F, ℚ/ℤ(j)), their order w_j(F) when finite and the ℓ-parts w_j^{(ℓ)}(F) = #H⁰(F, ℚ_ℓ/ℤ_ℓ(j)) are defined in ArithmeticKTheory N.4 (N.4/the-w-invariant), which imports this module; they are not defined again here.

**Hypotheses and conventions.**

- F a field of characteristic p ≥ 0 (p = 0 allowed); j ∈ ℤ.

**Construction or proof.**

1. Form the direct sum over ℓ ≠ p of the discrete modules ℚ_ℓ/ℤ_ℓ(j) of adic-tate-twist.
2. Identify it with μ(F^s) twisted by g ↦ g^j (K-book VI.1.7) through the Sylow decomposition μ(F^s) = ⊕_{ℓ≠p} μ_{ℓ^∞}.
3. Show (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0 (a divisible group tensored with a torsion group), so the tensor-power definition is wrong for j ≥ 2.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist)

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

**Planning API.**

- **TauCeti.TateTwist.ratModInt** (constructor): The discrete G_F-module ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j).
- **TauCeti.TateTwist.ratModIntEquivRootsOfUnity** (equivalence): ℚ/ℤ(j) ≅ μ(F^s) with g acting by ζ ↦ g^j(ζ).
- **TauCeti.TateTwist.ratModInt_primary** (projection): The ℓ-primary part of ℚ/ℤ(j) is ℚ_ℓ/ℤ_ℓ(j).

**Discriminating tests.**

- **TateTwist.test_w2_rat** (computation): H⁰(ℚ, ℚ/ℤ(2)) is cyclic of order 24: its 2-primary part has order 8 (the squares of ℤ_2^× are 1 + 8ℤ_2) and its 3-primary part order 3, the other parts being 0 (K-book Example VI.2.1.2). The untwisted module gives an infinite group and the tensor square gives 0.
- **TateTwist.test_ratModInt_zero** (degenerate): ℚ/ℤ(0) has trivial action, so H⁰(F, ℚ/ℤ(0)) = ⊕_{ℓ≠p} ℚ_ℓ/ℤ_ℓ is infinite.
- **TateTwist.test_one_roots** (compatibility): ℚ/ℤ(1) ≅ μ(F^s) with its natural action, whose m-torsion is KummerCoeff F m for m invertible in F.
- **TateTwist.test_tensor_square_zero** (non-example): (ℚ/ℤ) ⊗_ℤ (ℚ/ℤ) = 0, so ℚ/ℤ(2) is not the tensor square of ℚ/ℤ(1).

**Consumers.**

- ArithmeticKTheory:N.4/the-w-invariant: W_j(F) = H⁰(F, ℚ/ℤ(j)) is defined from this module (N.1 packet request to M.1).
- Kbook2013 VI.2.1 (e-invariant): The e-invariant takes values in µ(i)^G = H⁰(F, ℚ/ℤ(i)).
- HabiroNumberFields:HB.1/the-chern-class-map-c-zeta: ℚ_p/ℤ_p(m) and its invariants w_m(F) (CGZ §3.1).

**Acceptance.**

- H⁰(ℚ, ℚ/ℤ(2)) ≅ ℤ/24, the value w_2(ℚ) = 24 of K-book Example VI.2.1.2 and Lemma VI.2.4 (the denominator of B_1/4, with the K-book's B_1 = 1/6).
- For F separably closed, H⁰(F, ℚ/ℤ(j)) = ℚ/ℤ(j) is infinite.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition VI.1.7, printed p. 468 (PDF p. 476). Definition of the twist by the j-th power of the action; the Sylow decomposition µ(i) = ⊕Z/ℓ∞(i) is the primewise description.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition VI.2.1, printed p. 469 (PDF p. 477). Definition of w_i(F) as the order of μ(i)^G; that invariant is ArithmeticKTheory N.4's, built on the module of this node.

<a id="m-1-twisted-cohomology-ring"></a>

### M.1/twisted-cohomology-ring — The Galois cohomology ring of the twists

**Construction.** Identifier: `MotivicEtaleKTheory:M.1/twisted-cohomology-ring`. Implementation: unchecked.

For a field F and m invertible in F, set H^{i}(F, μ_m^{⊗j}) = the continuous cohomology (Mathlib's continuousCohomology) of G_F with coefficients in the discrete module μ_m^{⊗j} of finite-tate-twist, and H^{i}(F, ℤ_ℓ(j)), H^{i}(F, ℚ_ℓ(j)), H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) likewise for the modules of adic-tate-twist. The cup product of ProfiniteCohomology Layer 12 composed with the twist pairings gives an associative bigraded product H^{i}(F, μ_m^{⊗a}) × H^{k}(F, μ_m^{⊗b}) → H^{i+k}(F, μ_m^{⊗(a+b)}), graded-commutative with the sign (−1)^{ik}. In particular H^{*}(F, μ_m^{⊗*}) = ⊕_{n} H^{n}(F, μ_m^{⊗n}) is a graded-commutative ℤ/m-algebra. For an open subgroup G_E ⊂ G_F (E/F finite separable) the restriction is a ring map, the corestriction is a module map over it (projection formula cor(res(a) ∪ b) = a ∪ cor(b)) and cor ∘ res is multiplication by [E : F]. In degrees ≤ 2 these groups and maps agree with Tau Ceti's explicit H1/H2 model and its explicitCup11, explicitCor and explicitRes, through ProfiniteCohomology Layer 3.

**Hypotheses and conventions.**

- F a field; E/F finite separable inside F^s; m invertible in F; ℓ ≠ char F.

**Construction or proof.**

1. Instantiate Layer 10's continuous cohomology at the topological G_F-modules of finite-tate-twist and adic-tate-twist (TopRep of the absolute Galois group).
2. Compose Layer 12's graded cup product with TateTwist.pairing; associativity and graded commutativity follow from Layer 12 and pairing_assoc/pairing_comm.
3. Restriction and corestriction at open subgroups, the projection formula and cor ∘ res = index are Layer 10's and Layer 12's statements applied to these coefficients; in degree (1,1) the projection formula is Tau Ceti's explicitCup_projection11.
4. Compare with Tau Ceti's low-degree model by Layer 3's comparison isomorphisms.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `mathlib:continuousCohomology`, `tauceti:TauCeti.ofDiscreteModule`, `tauceti:TauCeti.ContCohomology.explicitCup11`, `tauceti:TauCeti.ContCohomology.explicitCup_projection11`, `tauceti:TauCeti.ContCohomology.explicitCor2_comp_res2`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms`

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/TateTwist`, namespace `TauCeti.TateTwist`.

**Planning API.**

- **TauCeti.TateTwist.H** (constructor): H^{i}(F, M) for the twist modules, as Layer 10's continuous cohomology of G_F.
- **TauCeti.TateTwist.cup** (constructor): The bigraded cup product H^{i}(μ_m^{⊗a}) × H^{k}(μ_m^{⊗b}) → H^{i+k}(μ_m^{⊗(a+b)}).
- **TauCeti.TateTwist.cup_assoc** (relation): The cup product is associative.
- **TauCeti.TateTwist.cup_comm** (relation): x ∪ y = (−1)^{ik} y ∪ x for x of degree i and y of degree k, through the twist swap.
- **TauCeti.TateTwist.res_cup** (functoriality): Restriction to G_E is multiplicative.
- **TauCeti.TateTwist.cor_res** (relation): cor_{E/F} ∘ res_{E/F} = [E : F] on H^{i}(F, μ_m^{⊗j}).
- **TauCeti.TateTwist.projection_formula** (relation): cor_{E/F}(res(a) ∪ b) = a ∪ cor_{E/F}(b).
- **TauCeti.TateTwist.H_le_two_equiv** (compatibility): For i ≤ 2 the groups and the (1,1) cup agree with Tau Ceti's H1, H2 and explicitCup11.

**Discriminating tests.**

- **TateTwist.test_H0** (degenerate): H⁰(F, μ_m^{⊗0}) = ℤ/m and the unit of the ring is 1 ∈ ℤ/m.
- **TateTwist.test_real_mod_two** (computation): For F = ℝ, m = 2: H^{n}(ℝ, μ_2^{⊗n}) ≅ ℤ/2 for all n ≥ 0, generated by κ(−1)^n.
- **TateTwist.test_explicitCup11** (compatibility): For i = k = 1 the cup product equals TauCeti.ContCohomology.explicitCup11 at the twist pairing.
- **TateTwist.test_not_commutative** (non-example): For F = ℝ and m = 2 the degree-one class x = κ(−1) has x ∪ x ≠ 0, so the ring is not exterior on degree one (graded commutativity does not force x² = 0 when 2 = 0).

**Consumers.**

- MotivicEtaleKTheory:M.3/galois-symbol: Defines h_F{a, b} = κ(a) ∪ κ(b) in H²(F, μ_m^{⊗2}).
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The graded target of the norm residue ring homomorphism K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}).
- Tate1976 Lemma (3.2): Projection formula tr_{E/F}(a, b)_E = (a, N_{E/F} b)_F, used for norm compatibility.

**Acceptance.**

- κ(a) ∪ κ(b) ∈ H²(F, μ_m^{⊗2}) for a, b ∈ F^×, with κ the Kummer map, is the explicitCup11 of two Kummer classes for the pairing KummerCoeff × KummerCoeff → μ_m^{⊗2}.
- For F = ℝ and m = 2, H^{*}(ℝ, μ_2^{⊗*}) = 𝔽_2[κ(−1)] with κ(−1) of degree one.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10, (6.10.2), printed p. 242 (PDF p. 250). The product F^× ⊗ F^× → H¹ ⊗ H¹ → H²(F; μ_m^{⊗2}) and its projection formula tr(a ∪ b) = a ∪ N(b) are the degree-(1,1) case of this node.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Corollary 4.1.1, printed p. 480 (PDF p. 488). The graded ring ⊕ H^i(k, μ_m^{⊗i}) is the target of the norm residue ring isomorphism.

<a id="m-1-continuous-limit-comparison"></a>

### M.1/continuous-limit-comparison — Continuous cohomology of ℓ-adic twists as limits

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/continuous-limit-comparison`. Implementation: unchecked.

Let F be a field, ℓ ≠ char F a prime and j ∈ ℤ, and identify ℤ_ℓ(j) with lim_ν μ_{ℓ^ν}^{⊗j} (adic-tate-twist). This node instantiates ArithmeticGaloisDuality R02.1 at G = G_F and these coefficients. (a) For i ≥ 1 there is a natural short exact sequence 0 → lim^1_ν H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) → H^{i}(F, ℤ_ℓ(j)) → lim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}) → 0; if H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) is finite for every ν, then H^{i}(F, ℤ_ℓ(j)) ≅ lim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}); and H⁰(F, ℤ_ℓ(j)) = lim_ν H⁰(F, μ_{ℓ^ν}^{⊗j}). (b) H^{i}(F, ℚ_ℓ/ℤ_ℓ(j)) ≅ colim_ν H^{i}(F, μ_{ℓ^ν}^{⊗j}), the colimit along the maps induced by ι. (c) H^{i}(F, ℚ_ℓ(j)) ≅ H^{i}(F, ℤ_ℓ(j)) ⊗_{ℤ_ℓ} ℚ_ℓ for every i and every field F, with no finiteness hypothesis. (d) The coefficient sequences of adic-tate-twist give natural long exact sequences, among them … → H^{i}(F, ℤ_ℓ(j)) --ℓ^ν--> H^{i}(F, ℤ_ℓ(j)) → H^{i}(F, μ_{ℓ^ν}^{⊗j}) → H^{i+1}(F, ℤ_ℓ(j)) → … and the Bockstein sequence for ι. (e) For E/F finite separable inside F^s, restriction to G_E and corestriction (transfer) to G_F act on H^{i}(−, ℤ_ℓ(j)) and H^{i}(−, ℚ_ℓ(j)), commute with the maps of (a)–(d), and satisfy cor ∘ res = [E : F] and cor(res(a) ∪ b) = a ∪ cor(b); on the finite levels they are those of twisted-cohomology-ring.

**Hypotheses and conventions.**

- F a field, ℓ ≠ char F, j ∈ ℤ, i ≥ 0.
- The limit formula in (a) needs every H^{i−1}(F, μ_{ℓ^ν}^{⊗j}) finite (or surjective transition maps, Tate (2.2) Corollary); for rings of S-integers this finiteness is ArithmeticGaloisDuality R02.4/global-finiteness, used in M.2/adic-s-integer-cohomology. For a general field the lim^1 term need not vanish (H¹(ℚ, μ_ℓ) = ℚ^×/ℚ^{×ℓ} is infinite).
- (c) holds for every field: no finite-generation hypothesis on H^{i}(F, ℤ_ℓ(j)) is needed.

**Construction or proof.**

1. The groups T_ν = μ_{ℓ^ν}^{⊗j} are finite and discrete with surjective transitions, and ℤ_ℓ(j) = lim_ν T_ν as topological G_F-modules (adic-tate-twist, adicLimitEquiv).
2. (a) is ArithmeticGaloisDuality R02.1/tate-inverse-limit for G = G_F and the T_ν, read in the canonical carrier through R02.1/carrier-comparison (Tate (2.2) and its Corollary; NSW (2.7.5)–(2.7.6)). For i = 0, invariants commute with limits.
3. (b) is R02.1/discrete-quotient-colimit for T = ℤ_ℓ(j), W = ℚ_ℓ/ℤ_ℓ(j) and W[ℓ^ν] = μ_{ℓ^ν}^{⊗j}; the transition maps W[ℓ^ν] ⊂ W[ℓ^{ν+1}] are the inclusions ι.
4. (c) is R02.1/rationalization for the free rank-one ℤ_ℓ-module ℤ_ℓ(j): a continuous cochain of the compact group G_F into ℚ_ℓ(j) has compact image, hence lands in ℓ^{−k}ℤ_ℓ(j) for some k, and cohomology commutes with the colimit over k.
5. (d) is R02.1/continuous-section-long-exact, the sections existing by R02.1/continuous-section-exists (discrete quotients, or finitely generated ℤ_ℓ-modules).
6. (e) Tate §2 defines restriction and the transfer on continuous cochains for every topological G-module, independent of the coset representatives up to homotopy, commuting with the connecting maps and satisfying tr(x ∪ res y) = (tr x) ∪ y. The cochain transfer commutes with the reductions modulo ℓ^ν and with ℤ_ℓ(j) ⊂ ℚ_ℓ(j), hence with (a)–(d); on discrete coefficients it agrees with ProfiniteCohomology Layer 10's corestriction, both being morphisms of effaceable δ-functors that agree in degree 0.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.1/discrete-quotient-colimit`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`, `ArithmeticGaloisDuality:R02.1/rationalization`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/continuous-section-exists`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Acceptance.**

- For F a finite field 𝔽_q with ℓ ∤ q and j ≠ 0: H¹(𝔽_q, ℤ_ℓ(j)) ≅ ℤ_ℓ/(q^j − 1), the limit of H¹(𝔽_q, μ_{ℓ^ν}^{⊗j}) = μ_{ℓ^ν}^{⊗j}/(Frob − 1).

**Sources.**

[NSW2020](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), II §7, (2.7.6) Corollary, printed p. 142 (PDF p. 156). The finite-coefficient case of (a).

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §2, pp. 258-261. Tate's §2 is the source of the limit and exact-sequence properties of continuous cochain cohomology used throughout M.3; excerpt typed from the scan.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §2, (2.2) Proposition and Corollary, p. 261. Tate's lim^1 sequence 0 → lim^1 H^{n−1}(G, T/l^iT) → H^n(G, T) → lim H^n(G, T/l^iT) → 0 and its Corollary (finite groups or surjective transitions), the source of (a); excerpt typed from the scan.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §2, Restriction and Transfer, pp. 259-260. Tate defines restriction and the cochain transfer for arbitrary topological G-modules, commuting with exact cohomology sequences, with tr(x ∪ res y) = (tr x) ∪ y: the source of (e); excerpt typed from the scan.

<a id="m-1-etale-twist-sheaf"></a>

### M.1/etale-twist-sheaf — Étale Tate twists on schemes and continuous étale cohomology

**Construction.** Identifier: `MotivicEtaleKTheory:M.1/etale-twist-sheaf`. Implementation: unchecked.

Let X be a scheme and m ≥ 1 with m invertible in Γ(X, O_X). The étale sheaf μ_m^{⊗j} on the small étale site X_et (Mathlib's smallEtaleTopology) is the Tate-twist sheaf (ℤ/m)(j) of EtaleDualityAndPerverseSheaves EDC.0/tate-twist with Λ = ℤ/m: μ_m is U ↦ μ_m(Γ(U, O_U)), locally free of rank one over ℤ/m, and μ_m^{⊗j} is its j-th tensor power for j ≥ 0 and the ℤ/m-dual of μ_m^{⊗(−j)} for j < 0. It is imported, not constructed again; this node identifies its stalks with finite-tate-twist and adds the ℓ-adic and divisible coefficients. Étale cohomology H^{i}_et(X, μ_m^{⊗j}) is Mathlib's sheaf cohomology Sheaf.H of this sheaf. For a prime ℓ invertible on X, continuous ℓ-adic étale cohomology is H^{i}_cont(X, ℤ_ℓ(j)) = H^{i}(R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j})), the cohomology of the derived limit of the tower of complexes with transition maps induced by ℤ_ℓ(j)/ℓ^{ν+1} → ℤ_ℓ(j)/ℓ^ν; it sits in the Milnor sequence 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) → H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0. H^{i}_cont(X, ℚ_ℓ(j)) = H^{i}_cont(X, ℤ_ℓ(j)) ⊗ ℚ and H^{i}_et(X, ℚ_ℓ/ℤ_ℓ(j)) = colim_ν H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) along the maps induced by ι (for X quasi-compact and quasi-separated this is the cohomology of the sheaf colim_ν μ_{ℓ^ν}^{⊗j}). All are contravariant in X, and the pairings of finite-tate-twist give cup products.

**Hypotheses and conventions.**

- X a scheme; m invertible on X; ℓ a prime invertible on X; j ∈ ℤ.
- The derived limit is taken in the derived category of abelian groups; no left-completeness of the étale topos is assumed.

**Construction or proof.**

1. Take μ_m^{⊗j} = (ℤ/m)(j) from EtaleDualityAndPerverseSheaves EDC.0/tate-twist; the exactness of the Kummer sequence, which makes μ_m locally free of rank one when m is invertible, is SchemeAndStackFoundations SF.2's import from ConstructibleEtale (requested).
2. The stalk at a geometric point x̄ is μ_m(𝒪^{sh}_{X,x̄})^{⊗j} = μ_m(κ(x̄))^{⊗j} (reduction is bijective on m-th roots of unity since m is invertible); for X = Spec F and x̄ = Spec F^s it is the module μ_m^{⊗j} of finite-tate-twist with its G_F-action.
3. Use Mathlib's Sheaf.H (Ext from the constant sheaf) for H^{i}_et; obtain the derived-limit model of continuous cohomology from a functorial injective (or Godement) resolution of the tower and R02.1's Milnor sequence for towers of complexes.
4. Pullback along X' → X maps μ_m to μ_m and so acts on all the groups; cup products come from the pairings.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`, `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`, `mathlib:CategoryTheory.Sheaf.H`, `ArithmeticGaloisDuality:R02.1/milnor-sequence`, `SchemeAndStackFoundations:SF.2`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Etale/TateTwist`, namespace `TauCeti.EtaleTwist`.

**Planning API.**

- **TauCeti.EtaleTwist.sheaf** (compatibility): The étale sheaf μ_m^{⊗j} on X_et for m invertible on X is EDC.0's Tate-twist sheaf (ℤ/m)(j) (TauCeti.EtaleDuality.tateTwistSheaf and its tensor powers), used under this name and not constructed a second time.
- **TauCeti.EtaleTwist.stalk** (characterisation): The stalk at a geometric point x̄ is μ_m(κ(x̄))^{⊗j}, free of rank one over ℤ/m.
- **TauCeti.EtaleTwist.H** (constructor): H^{i}_et(X, μ_m^{⊗j}) := Sheaf.H of the sheaf.
- **TauCeti.EtaleTwist.Hcont** (constructor): H^{i}_cont(X, ℤ_ℓ(j)) as cohomology of R lim_ν RΓ_et(X, μ_{ℓ^ν}^{⊗j}).
- **TauCeti.EtaleTwist.milnor_sequence** (relation): 0 → lim^1 H^{i−1}_et(X, μ_{ℓ^ν}^{⊗j}) → H^{i}_cont(X, ℤ_ℓ(j)) → lim H^{i}_et(X, μ_{ℓ^ν}^{⊗j}) → 0.
- **TauCeti.EtaleTwist.pullback** (functoriality): Pullback along f : X' → X, with id and composition laws.
- **TauCeti.EtaleTwist.cup** (constructor): Cup products H^{i}_et(X, μ_m^{⊗a}) × H^{k}_et(X, μ_m^{⊗b}) → H^{i+k}_et(X, μ_m^{⊗(a+b)}).
- **TauCeti.EtaleTwist.coeff_long_exact** (relation): Long exact sequences for the coefficient sequences of adic-tate-twist, natural in X.

**Discriminating tests.**

- **EtaleTwist.test_empty** (degenerate): For X = ∅ every H^{i}_et(X, μ_m^{⊗j}) and H^{i}_cont(X, ℤ_ℓ(j)) is zero.
- **EtaleTwist.test_field_H0** (compatibility): For X = Spec F, H⁰_et(X, μ_m^{⊗j}) = (μ_m^{⊗j})^{G_F}, the H⁰ of finite-tate-twist.
- **EtaleTwist.test_finite_field_H1** (computation): For X = Spec 𝔽_5, m = 4, j = 1: H¹_et(X, μ_4) ≅ 𝔽_5^×/(𝔽_5^×)^4 ≅ ℤ/4.
- **EtaleTwist.test_cont_not_naive_limit** (non-example): For X = Spec 𝔽_q and ℓ ∤ q, the constant étale sheaf with value the abstract group ℤ_ℓ (discrete topology) has H¹_et(X, ℤ_ℓ) = Hom_cont(Ẑ, ℤ_ℓ^{disc}) = 0, since a continuous homomorphism from a profinite group to a torsion-free discrete group is zero, whereas H¹_cont(X, ℤ_ℓ(0)) = lim_ν ℤ/ℓ^ν = ℤ_ℓ ≠ 0: continuous ℓ-adic cohomology is not the cohomology of an abstract ℤ_ℓ-valued sheaf.

**Consumers.**

- MotivicEtaleKTheory:M.5d request to M.1: Finite/adic Tate twists as coherent coefficient objects and continuous étale hypercohomology after derived inverse limits.
- MotivicEtaleKTheory:M.3/tate-s-integer: Target H²_et(O_{F,S}, μ_{ℓ^r}^{⊗2}) of Tate's S-integer comparison.
- Kbook2013 VI.8.2-8.4: H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) computes K_{2i}(O_S){ℓ}.
- HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift: H¹_et(O_L[1/p], μ_n) in the étale Kummer sequence.

**Acceptance.**

- For X = Spec F, F a field, H⁰_et(X, μ_m^{⊗j}) = H⁰(F, μ_m^{⊗j}) (field-etale-galois-comparison).
- For X = Spec 𝔽_q with ℓ ∤ q and j = 1, H¹_cont(X, ℤ_ℓ(1)) ≅ ℤ_ℓ/(q − 1).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4, printed p. 480 (PDF p. 488). The étale twists μ_m^{⊗i} on schemes are the targets of the motivic-to-étale map; this node provides them.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2 proof, printed p. 514 (PDF p. 522). The K-book uses continuous ℓ-adic étale cohomology H_et(R, ℤ_ℓ(i)) of S-integer rings.

<a id="m-1-field-etale-galois-comparison"></a>

### M.1/field-etale-galois-comparison — Étale cohomology of a field is Galois cohomology

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/field-etale-galois-comparison`. Implementation: unchecked.

Let F be a field, F^s a separable closure and G_F = Gal(F^s/F). The functor 𝓕 ↦ colim_E 𝓕(Spec E) (E/F finite separable inside F^s) is an equivalence between étale sheaves of abelian groups on Spec F and discrete G_F-modules, and the derived functors of global sections and of invariants agree: H^{i}_et(Spec F, 𝓕) ≅ H^{i}(G_F, 𝓕(F^s)) (Stacks 03QQ; imported through SchemeAndStackFoundations SF.2, and for finite coefficients it is AnabelianGeometryAndNonabelianChabauty NC.0/field, 'fields are étale K(π,1)'). This node realises the twists in it: for m invertible in F, the stalk of μ_m^{⊗j} (etale-twist-sheaf) at Spec F^s is the module μ_m^{⊗j} of finite-tate-twist, so H^{i}_et(Spec F, μ_m^{⊗j}) ≅ H^{i}(F, μ_m^{⊗j}) of twisted-cohomology-ring, and H^{i}_cont(Spec F, ℤ_ℓ(j)) ≅ H^{i}(F, ℤ_ℓ(j)) for ℓ invertible in F. The identification is compatible with long exact sequences, with cup products, with pullback along a field extension F → F′ (with compatible separable closures) on the left and restriction on the right, and, for E/F finite separable inside F^s, with corestriction, which defines the transfer H^{i}_et(Spec E, μ_m^{⊗j}) → H^{i}_et(Spec F, μ_m^{⊗j}). Two invariance properties follow: for a filtered colimit of fields F = colim F_α with compatible separable closures, H^{i}(F, μ_m^{⊗j}) = colim_α H^{i}(F_α, μ_m^{⊗j}); and for E/F purely inseparable, restriction H^{i}(F, μ_m^{⊗j}) → H^{i}(E, μ_m^{⊗j}) is an isomorphism, because G_E → G_F is an isomorphism of profinite groups.

**Hypotheses and conventions.**

- F a field; 𝓕 an étale sheaf of abelian groups on Spec F (a discrete G_F-module); m, ℓ invertible in F where the twists occur.
- The general sheaf–module comparison is imported (SF.2, requested); this node does not prove it again.

**Construction or proof.**

1. The equivalence and the comparison of derived functors are imported from SchemeAndStackFoundations SF.2 (Stacks 03QQ; requested); for finite coefficients the comparison map is the canonical one of AnabelianGeometryAndNonabelianChabauty NC.0/field in every degree.
2. The stalk of μ_m^{⊗j} at Spec F^s is μ_m(F^s)^{⊗j} with its G_F-action, which is the module of finite-tate-twist (KummerCoeff F m for j = 1); this gives the identification of the twisted groups.
3. Naturality, cup products and long exact sequences follow from the uniqueness of morphisms of universal δ-functors; the transfer is ProfiniteCohomology Layer 10's corestriction transported along the comparison. Continuous ℓ-adic cohomology is compared through the derived limits of both sides: the étale side is the derived limit of etale-twist-sheaf, and lim_ν C^•(G_F, μ_{ℓ^ν}^{⊗j}) = C^•(G_F, ℤ_ℓ(j)) with surjective transitions (ArithmeticGaloisDuality R02.1/cochains-inverse-limit, continuous-limit-comparison).
4. Filtered colimits: F^s = ∪_α F_α^s, so G_F = lim_α G_{F_α} and μ_m^{⊗j}(F^s) = colim_α μ_m^{⊗j}(F_α^s); NSW (1.5.1) (continuity of the cohomology of profinite groups with discrete coefficients, proved on cochains like ProfiniteCohomology Layer 10's finite-quotient colimit) gives the colimit formula. Purely inseparable E/F: E^s = E·F^s and restriction Gal(E^s/E) → Gal(F^s/F) is bijective and bicontinuous, compatibly with μ_m.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `AnabelianGeometryAndNonabelianChabauty:NC.0/field`, `SchemeAndStackFoundations:SF.2`, `ArithmeticGaloisDuality:R02.1/cochains-inverse-limit`

**Acceptance.**

- For F = 𝔽_q, H¹_et(Spec 𝔽_q, ℤ/n) ≅ ℤ/n, matching H¹(Ẑ, ℤ/n) = ℤ/n.
- For F separably closed, H^{i}_et(Spec F, 𝓕) = 0 for i > 0.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10, printed p. 242 (PDF p. 250). The K-book writes Galois cohomology as H_et(F; M); this node proves that the étale cohomology of Spec F computes it.

[NSW2020](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), I §5, (1.5.1) Proposition, printed p. 45 (PDF p. 59). NSW (1.5.1): H^n(lim G_i, colim A_i) ≅ colim H^n(G_i, A_i) for a projective system of profinite groups with compatible discrete modules; the filtered-colimit invariance of this node.

<a id="m-1-s-integer-galois-comparison"></a>

### M.1/s-integer-galois-comparison — Étale cohomology of S-integers is cohomology of G_{F,S}

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/s-integer-galois-comparison`. Implementation: unchecked.

Let F be a number field, S a finite set of places of F containing the archimedean places, O_{F,S} the ring of S-integers, U = Spec O_{F,S}, F_S ⊂ F^s the maximal extension unramified outside S and G_{F,S} = Gal(F_S/F) (ArithmeticGaloisDuality R02.3/restricted-ramification-group). Let M be a finite discrete G_{F,S}-module whose order is invertible on U, and 𝓕 the corresponding locally constant étale sheaf on U. Then H^{i}_et(U, 𝓕) ≅ H^{i}(G_{F,S}, M) for all i ≥ 0, naturally in M and compatibly with long exact sequences, cup products, enlarging S, and pullback to the generic point (inflation H^{i}(G_{F,S}, M) → H^{i}(F, M) under field-etale-galois-comparison). In particular, for m invertible on U, H^{i}_et(U, μ_m^{⊗j}) ≅ H^{i}(G_{F,S}, μ_m^{⊗j}) (μ_m ⊂ F_S because the primes dividing m lie in S), and, passing to limits, H^{i}_cont(U, ℤ_ℓ(j)) ≅ H^{i}(G_{F,S}, ℤ_ℓ(j)) for ℓ invertible on U. For i = 1 and M = μ_m the isomorphism carries the étale Kummer sequence 0 → O_{F,S}^×/m → H¹_et(U, μ_m) → Pic(O_{F,S})[m] → 0 of etale-kummer-sequences to the S-unit Kummer sequence of ArithmeticGaloisDuality R02.3/s-unit-kummer-sequence. For a finite extension E ⊂ F_S of F, the comparison for O_{E,S} is that for O_{F,S} restricted to the open subgroup G_{E,S} = Gal(F_S/E), and corestriction G_{E,S} → G_{F,S} defines the transfer H^{i}_et(Spec O_{E,S}, μ_m^{⊗j}) → H^{i}_et(U, μ_m^{⊗j}), with cor ∘ res = [E : F].

**Hypotheses and conventions.**

- F a number field (the supplier R02.3 treats number fields only); S finite with S ⊇ S_∞; the order of M invertible on O_{F,S}.
- For ℓ = 2 and F with real places the comparison is for the ordinary groups H^{i}(G_{F,S}, M), which do not vanish in high degrees; modified groups are M.2's.

**Construction or proof.**

1. Galois descent along the pro-finite-étale cover Ũ = Spec O_{F_S,S} = lim_L Spec O_{L,S} → U (L ⊂ F_S finite over F) identifies locally constant sheaves split by Ũ with discrete G_{F,S}-modules, and gives the Cartan–Leray (Hochschild–Serre) spectral sequence H^{r}(G_{F,S}, H^{s}(Ũ, 𝓕)) ⇒ H^{r+s}(U, 𝓕) (SchemeAndStackFoundations SF.2, requested). Since 𝓕|Ũ is constant and μ_ℓ ≅ ℤ/ℓ on Ũ, it suffices that H^{s}(Ũ, ℤ/ℓ) = 0 for s ≥ 1 and ℓ invertible on U (Milne ADT II.2.9).
2. s = 1: Ũ has no nontrivial connected finite étale covers. s = 2: by etale-kummer-sequences on each U_L = Spec O_{L,S} and the colimit, H²(Ũ, μ_ℓ) is an extension of Br'(Ũ)[ℓ] by Pic(Ũ)/ℓ. Pic(Ũ) = colim_L Pic(O_{L,S}) = 0, since the Hilbert class field of L lies in F_S and the principal ideal theorem holds (ClassFieldTheory Layer 13). A class of Br'(O_{L,S})[ℓ] is determined by its local invariants at the places of S (localization-gysin-sequence for U_L ⊂ Spec L, with the Brauer sequence of ClassFieldTheory Layer 10), and these vanish after an extension L′ ⊂ L(μ_{ℓ^∞}) ⊂ F_S whose local degrees at the places of S are divisible by ℓ.
3. s ≥ 3: for L ⊂ F_S totally imaginary (L ∋ √−1), H^{s}(O_{L,S}, μ_ℓ) sits between ⊕_{w∉S} H^{s−2}(k(w), ℤ/ℓ) and H^{s}(L, μ_ℓ) (localization-gysin-sequence). The latter vanishes since cd_ℓ(G_L) ≤ 2 (ArithmeticGaloisDuality R02.4/cohomological-dimension-bound with every place in S); the former vanishes for s ≥ 4 (finite residue fields have cohomological dimension 1), and for s = 3 it is the image of Br(L)[ℓ], because local invariants outside S can be completed at a finite place of S to sum zero (ClassFieldTheory Layer 10). Pass to the colimit over L.
4. The ℓ-adic statement follows from the finite one: both sides are derived limits whose lim^1 terms vanish, the finite-level groups being finite (ArithmeticGaloisDuality R02.4/global-finiteness, continuous-limit-comparison). The Kummer compatibility: the sections over Ũ of the étale sequence 1 → μ_m → G_m → G_m → 1 give R02.3's sequence 0 → μ_m → E_S → E_S → 0 of G_{F,S}-modules, and the comparison is a morphism of δ-functors whose edge maps identify the unit and Picard terms. The transfer is ProfiniteCohomology Layer 10's corestriction transported along the comparison.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), `ArithmeticGaloisDuality:R02.3/restricted-ramification-group`, `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence`, `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `SchemeAndStackFoundations:SF.2`

**Acceptance.**

- For F = ℚ, S = {2, ∞} and M = μ_2: H¹_et(Spec ℤ[1/2], μ_2) ≅ H¹(G_{ℚ,S}, μ_2) ≅ ℤ[1/2]^×/(ℤ[1/2]^×)^2 ≅ (ℤ/2)^2, generated by −1 and 2.

**Sources.**

[MilneADT](https://www.jmilne.org/math/Books/ADTnot.pdf), II §2, Proposition 2.9 and its proof, printed pp. 170-171 (PDF pp. 178-179). Milne's statement for locally constant ℤ-constructible sheaves on an open affine U of X (so S finite); the node specialises to finite modules of invertible order and their twists. The proof uses the Hochschild–Serre sequence for Ũ/U, the Kummer sequence, Pic(Ũ) = 0, Br(Ũ)(ℓ) = 0 via the S-integer Brauer sequence, and high-degree vanishing for totally imaginary fields, as in the proof steps.

<a id="m-1-etale-kummer-sequences"></a>

### M.1/etale-kummer-sequences — Étale Kummer sequences with units, Picard and Brauer terms

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/etale-kummer-sequences`. Implementation: unchecked.

Let X be a scheme and n ≥ 1 invertible on X. The sequence of étale sheaves 1 → μ_n → G_m --n--> G_m → 1 is exact, and, writing Pic(X) = H¹_et(X, G_m) and Br'(X) ⊂ H²_et(X, G_m) for the cohomological Brauer group of SchemeAndStackFoundations SF.2/cohomological-brauer (the torsion subgroup, so that H²_et(X, G_m)[n] = Br'(X)[n]), it gives natural exact sequences 0 → O(X)^×/n → H¹_et(X, μ_n) → Pic(X)[n] → 0 and 0 → Pic(X)/n → H²_et(X, μ_n) → Br'(X)[n] → 0. For X = Spec F the first map O(X)^×/n → H¹_et(X, μ_n) ≅ H¹(F, μ_n) is Tau Ceti's kummerMap, and it is an isomorphism (Hilbert 90, ProfiniteCohomology Layer 9). For X = Spec O_{F,S} with n invertible these are the sequences used in K-book VI.8.5 and in HabiroNumberFields HB.1 for O_L[1/p], and the inclusion O_{F,S} → F makes them compatible with the field sequences; their identification with the Galois-side S-unit Kummer sequence of ArithmeticGaloisDuality R02.3/s-unit-kummer-sequence is part of s-integer-galois-comparison.

**Hypotheses and conventions.**

- X a scheme; n invertible on X.
- The exactness of 1 → μ_n → G_m → G_m → 1 on X_et and Pic(X) = H¹_et(X, G_m) (Hilbert 90 for G_m) are SchemeAndStackFoundations SF.2's imports from ConstructibleEtale (requested); this node derives the cohomology sequences and their compatibilities.

**Construction or proof.**

1. Exactness of the Kummer sequence on X_et is imported from SF.2 (étale locally every unit has an n-th root, t^n − u being étale when n is invertible).
2. Take the long exact cohomology sequence and identify H⁰_et(X, G_m) = O(X)^× and H¹_et(X, G_m) = Pic(X) (Hilbert 90 for G_m, requested from SF.2); H²_et(X, G_m)[n] = Br'(X)[n] because Br'(X) is the torsion subgroup (SF.2/cohomological-brauer).
3. For X = Spec F, compare the connecting map with Tau Ceti's kummerMap through field-etale-galois-comparison (the Kummer map is the degree-zero connecting homomorphism).

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.ker_kummerMap`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.2/cohomological-brauer`

**Acceptance.**

- For X = Spec ℤ[1/2] and n = 2: ℤ[1/2]^×/2 ≅ (ℤ/2)^2, Pic = 0, so H¹_et(X, μ_2) ≅ (ℤ/2)^2 and H²_et(X, μ_2) ≅ Br'(ℤ[1/2])[2] ≅ ℤ/2 (by (8.1.1) of M.2/s-integer-brauer-sequence).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Example 8.5, printed p. 514 (PDF p. 522). The two Kummer sequences for S-integers (split when μ_ℓ ⊂ O_S).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III Example 6.10.1, printed p. 242 (PDF p. 250). The field case.

<a id="m-1-henselian-residue-comparison"></a>

### M.1/henselian-residue-comparison — Henselian local rings: cohomology of the closed point

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/henselian-residue-comparison`. Implementation: unchecked.

Let A be a henselian local ring with residue field k (for example a complete discrete valuation ring 𝒪_v), and m invertible in k. For every j ∈ ℤ and i ≥ 0, restriction to the closed point induces isomorphisms H^{i}_et(Spec A, μ_m^{⊗j}) ≅ H^{i}_et(Spec k, μ_m^{⊗j}) ≅ H^{i}(k, μ_m^{⊗j}), natural in A and compatible with cup products; passing to limits, the same holds for H^{i}_cont(−, ℤ_ℓ(j)) with ℓ invertible in k.

**Hypotheses and conventions.**

- A henselian local; m invertible in the residue field k (hence in A); j ∈ ℤ.

**Construction or proof.**

1. Apply Gabber's affine analogue of proper base change for the henselian pair (A, 𝔪_A), imported from ClassicalAdicEtaleCohomology, to the torsion sheaf μ_m^{⊗j}.
2. Identify the closed-point cohomology with Galois cohomology of k (field-etale-galois-comparison) and pass to ℓ-adic limits (continuous-limit-comparison).

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), `ClassicalAdicEtaleCohomology:H1:henselian/affine-henselian-comparison-3-2-5`, `mathlib:HenselianLocalRing`

**Acceptance.**

- For A = ℤ_p and m prime to p: H¹_et(Spec ℤ_p, μ_m) ≅ H¹(𝔽_p, μ_m), the Frobenius coinvariants of μ_m(𝔽̄_p), ≅ 𝔽_p^×/(𝔽_p^×)^m ≅ ℤ/gcd(m, p − 1); directly, ℤ_p^×/(ℤ_p^×)^m ≅ ℤ/gcd(m, p − 1) because 1 + pℤ_p is m-divisible.
- Non-example: for the non-henselian A = ℤ_(3), m = 2, H¹_et(Spec ℤ_(3), μ_2) ⊇ ℤ_(3)^×/(ℤ_(3)^×)² is infinite (every prime q ≠ 3 is a unit), while H¹(𝔽_3, μ_2) = ℤ/2.

**Sources.**

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Theorem 1.2(3), p. 774. Geisser's motivic rigidity has the same shape; the étale statement of this node is the classical henselian comparison, which Geisser's proof combines with Beilinson–Lichtenbaum.

[MilneADT](https://www.jmilne.org/math/Books/ADTnot.pdf), II §1, Proposition 1.1(b), printed p. 149 (PDF p. 157). For X the spectrum of a henselian discrete valuation ring with closed point x, restriction to x is an isomorphism for every étale sheaf: the discrete-valuation case of this node, which ClassicalAdicEtaleCohomology's Gabber theorem extends to henselian local rings and torsion sheaves.

<a id="m-1-localization-gysin-sequence"></a>

### M.1/localization-gysin-sequence — The étale localization sequence of a Dedekind scheme

**Theorem.** Identifier: `MotivicEtaleKTheory:M.1/localization-gysin-sequence`. Implementation: unchecked.

Let B be a Dedekind scheme (for example Spec O_{F,S} or the spectrum of a discrete valuation ring), Z ⊂ B a finite set of closed points with open complement V, m invertible on B and j ∈ ℤ. For each closed point v, purity gives isomorphisms H^{i}_{\{v\}}(B, μ_m^{⊗j}) ≅ H^{i−2}(k(v), μ_m^{⊗(j−1)}), and hence a natural long exact sequence … → H^{i}_et(B, μ_m^{⊗j}) → H^{i}_et(V, μ_m^{⊗j}) --∂--> ⊕_{v∈Z} H^{i−1}(k(v), μ_m^{⊗(j−1)}) → H^{i+1}_et(B, μ_m^{⊗j}) → … . If B is integral with function field F, passing to the colimit over Z gives the sequence with Spec F in place of V and the sum over all closed points. The residue ∂_v : H^{i}(F, μ_m^{⊗j}) → H^{i−1}(k(v), μ_m^{⊗(j−1)}) satisfies ∂_v(κ(a)) = v(a) mod m in H⁰(k(v), μ_m^{⊗0}) = ℤ/m for j = 1, i = 1, and ∂_v(κ(u) ∪ x) = −κ_{k(v)}(ū) ∪ ∂_v(x) for a v-unit u (equivalently ∂_v(x ∪ κ(u)) = ∂_v(x) ∪ κ_{k(v)}(ū)). For ℓ invertible on B the sequence for finite Z holds with continuous ℤ_ℓ(j) and ℚ_ℓ(j) coefficients, and both sequences hold with ℚ_ℓ/ℤ_ℓ(j) coefficients. The generic-point sequence with ℤ_ℓ(j) coefficients is not asserted: ℓ-adic completion does not commute with the infinite direct sum (for B = Spec ℤ[1/ℓ] and j = 1, H¹_cont(ℚ, ℤ_ℓ(1)) is the ℓ-adic completion of ℚ^×, whose image is not contained in ⊕_p ℤ_ℓ).

**Hypotheses and conventions.**

- B a Dedekind scheme (noetherian, regular, of dimension ≤ 1); m invertible on B, so that every residue characteristic is prime to m; for the generic-point form, B integral with function field F.
- A closed point of a Dedekind scheme of mixed characteristic is not a smooth pair over a field, so EtaleDualityAndPerverseSheaves EDC.3/smooth-pair-purity does not apply (that node excludes regular pairs over a trait); purity is proved here from the henselian trait. No perfectness of the residue fields is needed.
- The sign of ∂_v on cup products is fixed by the convention ∂_v(κ(π)) = 1 for a uniformiser π; M.3/symbol-residue-compatibility compares it with K2SymbolsBrauer's tame symbol.

**Construction or proof.**

1. Cohomology with supports, the long exact sequence of the pair and excision along étale neighbourhoods are EtaleDualityAndPerverseSheaves EDC.0/cohomology-with-supports; passing to the limit over the étale neighbourhoods of v (étale cohomology of quasi-compact quasi-separated schemes commutes with such limits, SF.2) reduces H^{i}_{\{v\}}(B, −) to the henselian trait X = Spec 𝒪^h_{B,v} with generic point u = Spec F^h_v.
2. On X, H^{i}(X, μ_m^{⊗j}) = H^{i}(k(v), μ_m^{⊗j}) (henselian-residue-comparison) and H^{i}(u, −) is Galois cohomology of F^h_v (field-etale-galois-comparison). Let I ⊂ G_{F^h_v} be the inertia group, with quotient G_{k(v)}, and p the residue characteristic. An extension of degree prime to p of the maximal unramified extension has trivial residue extension and trivial defect, so it is totally and tamely ramified and generated by a root of a uniformiser; hence the prime-to-p quotient of I is ∏_{ℓ≠p} ℤ_ℓ(1) and its kernel is pro-p, so for #M prime to p: H⁰(I, M) = M, H¹(I, M) = M(−1) and H^{q}(I, M) = 0 for q ≥ 2.
3. The Hochschild–Serre spectral sequence for I ⊂ G_{F^h_v} (ArithmeticGaloisDuality R02.2/hochschild-serre-spectral-sequence) then has two rows; G_{F^h_v} → G_{k(v)} splits on the tame quotient (choose compatible roots of a uniformiser), so the sequences 0 → H^{i}(k(v), M) → H^{i}(F^h_v, M) → H^{i−1}(k(v), M(−1)) → 0 are exact. Comparing with the sequence of the pair (X, u) gives H^{i}_{v}(X, μ_m^{⊗j}) ≅ H^{i−2}(k(v), μ_m^{⊗(j−1)}) (Milne ADT II, Remark 1.7(b): R²i^!μ_n ≅ ℤ/n and R^{r}i^!μ_n = 0 otherwise, without perfectness of k).
4. Insert purity into the long exact sequence of the pair (B, V); for B integral take the colimit over Z, with which étale cohomology commutes, the limit of the V being Spec F.
5. Compute ∂ on Kummer classes from etale-kummer-sequences: the boundary of κ(a) is the divisor of a at v, v(a) mod m, normalised by ∂_v(κ(π)) = 1. The connecting map of the pair is right linear over H^{*}(B, −) for the supported cup product, which on the left introduces the Koszul sign (−1)^{deg κ(u)} = −1.
6. ℓ-adic and divisible coefficients: apply the derived limit (finite Z, a finite sum) or the colimit along ι to the finite-level sequences; derived limits do not commute with the infinite sum of the generic-point form.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/henselian-residue-comparison](#m-1-henselian-residue-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`, `ArithmeticGaloisDuality:R02.2/hochschild-serre-spectral-sequence`, `SchemeAndStackFoundations:SF.2`

**Acceptance.**

- For B = Spec ℤ_p (or the henselisation of ℤ_(p)), m prime to p, Z the closed point and V = Spec ℚ_p, the degree-one part is 0 → H¹(𝔽_p, μ_m) → H¹(ℚ_p, μ_m) --∂--> ℤ/m → H²(𝔽_p, μ_m) = 0, that is ℚ_p^×/m ≅ ℤ_p^×/m ⊕ ℤ/m with ∂ the valuation mod m.
- For B = Spec ℤ[1/3], m = 3 and the generic point: ∂_v(κ(a)) = v(a) mod 3 for the primes v ≠ 3, and the kernel of ⊕_v ∂_v on H¹(ℚ, μ_3) = ℚ^×/ℚ^{×3} is H¹_et(ℤ[1/3], μ_3) = ℤ[1/3]^×/3 ≅ ℤ/3, generated by the class of 3 (Pic = 0 and −1 is a cube).

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §5, (5.3), p. 269. Tate's K₂ localization sequence 0 → K_2O_S → K_2F → ⊕ k(v)^× → 0, whose étale counterpart is this sequence in degree two; excerpt typed from the scan.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §1, Theorem 1.2(1) (Purity), p. 774. Purity with shift 2 and twist one along a closed fibre of a Dedekind base, of which the étale form is used here.

[MilneADT](https://www.jmilne.org/math/Books/ADTnot.pdf), II §1, Remark 1.7(b), printed p. 152 (PDF p. 160). Purity on a henselian discrete valuation ring: R²i^!μ_n ≅ ℤ/nℤ and R^r i^!μ_n = 0 for r ≠ 2 when n is prime to the residue characteristic, with no perfectness of k; the local input of this node.

### Remaining work for M.1

- Read Jannsen, 'Continuous étale cohomology' (Math. Ann. 280, 1988) and cite it beside the K-book for the derived-limit model of etale-twist-sheaf.
- Lemma-level split of twisted-cohomology-ring into the cup-product, restriction and corestriction declarations once ProfiniteCohomology Layer 12 is built.
- Replace the SchemeAndStackFoundations:SF.2 stage prerequisites of etale-twist-sheaf, field-etale-galois-comparison, s-integer-galois-comparison, etale-kummer-sequences and localization-gysin-sequence by SF.2 node ids (Stacks 03QQ field comparison, Kummer exactness and Hilbert 90 for G_m, Cartan–Leray spectral sequence of a pro-finite-étale Galois cover, limits of qcqs schemes) when SF.2 plans its ConstructibleEtale integration.

<a id="m-2"></a>

## M.2 — Local/global duality and the real places

Real restriction, positive and kernel groups, cohomological dimension, S-integer Brauer and mod-two diagrams. Arithmetic finiteness hypotheses are explicit.

**Planets:** Real restriction maps, Real places in high degrees, Degree-two comparison diagram.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist](#m-1-primewise-q-mod-z-twist), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison)

<a id="m-2-real-restriction-map"></a>

### M.2/real-restriction-map — Restriction to the real places

**Construction.** Identifier: `MotivicEtaleKTheory:M.2/real-restriction-map`. Implementation: unchecked.

Let F be a number field with r_1 real embeddings σ : F → ℝ, S a set of places containing S_∞ and the places above 2, R = O_{F,S}, and M one of the coefficient modules ℤ/2^ν(j) = μ_{2^ν}^{⊗j}, ℤ_2(j) or ℤ/2^∞(j) = ℚ_2/ℤ_2(j). For each real place σ the decomposition group G_ℝ = Gal(ℂ/ℝ) ⊂ G_{F,S} gives a restriction H^{n}_et(R, M) ≅ H^{n}(G_{F,S}, M) → H^{n}(ℝ, M); their sum is α^{n}_S(j) : H^{n}_et(R, M) → ⊕_{σ real} H^{n}(ℝ, M). The targets are periodic: for n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if j − n is odd and 0 if j − n is even; H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for all n ≥ 0; and, for n > 0, H^{n}(ℝ; ℤ_2(j)) ≅ ℤ/2 if n ≡ j (mod 2) and 0 otherwise. Complex conjugation acts on ℤ_2(j) by (−1)^j.

**Hypotheses and conventions.**

- F a number field with r_1 ≥ 0 real places; S ⊇ S_∞ ∪ {v | 2}; ν ≥ 1, j ∈ ℤ.

**Construction or proof.**

1. Choose for each real place σ an extension to F_S ⊂ ℂ; the image of complex conjugation is nontrivial in G_{F,S} because F(√−1) ⊂ F_S (F(√−1)/F is unramified outside the places above 2 and ∞, which lie in S), so it generates a decomposition group of order 2, well defined up to conjugacy, so restriction is independent of the choice.
2. Compose the comparison of M.1/s-integer-galois-comparison with restriction to these subgroups.
3. Compute H^{n}(ℤ/2, M) from the 2-periodic resolution of the cyclic group of order 2, with c acting on ℤ/2^ν(j) and ℤ_2(j) by (−1)^j.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `ArithmeticGaloisDuality:R02.3/localisation-maps`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`, `mathlib:NumberField.InfinitePlace`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/RealPlaces`, namespace `TauCeti.RealPlaces`.

**Planning API.**

- **TauCeti.RealPlaces.alpha** (constructor): α^{n}_S(j) : H^{n}_et(O_{F,S}, M) → ⊕_{σ real} H^{n}(ℝ, M).
- **TauCeti.RealPlaces.alpha_natural** (functoriality): α commutes with the maps induced by S ⊆ T and by coefficient maps.
- **TauCeti.RealPlaces.alpha_cup** (compatibility): α is multiplicative for cup products.
- **TauCeti.RealPlaces.realCohomology_divisible** (simp): For n > 0, H^{n}(ℝ; ℤ/2^∞(j)) ≅ ℤ/2 if j − n is odd and 0 if j − n is even.
- **TauCeti.RealPlaces.realCohomology_modTwo** (simp): H^{n}(ℝ; ℤ/2) ≅ ℤ/2 for every n ≥ 0.
- **TauCeti.RealPlaces.alpha_one_sign** (characterisation): On H¹(O_{F,S}, ℤ/2) ⊇ O_{F,S}^×/2, α¹ is the sign map u ↦ (sign σ(u))_σ.

**Discriminating tests.**

- **RealPlaces.test_totally_imaginary** (degenerate): If r_1 = 0 the target of α^{n}_S(j) is 0.
- **RealPlaces.test_rat_sign** (computation): For F = ℚ, S = {2, ∞}: α¹(−1) ≠ 0 and α¹(2) = 0.
- **RealPlaces.test_localisation_compat** (compatibility): For n ≥ 1, α^{n}_S(j) is the sum over the real places v of ArithmeticGaloisDuality R02.3's localisation maps loc_v : H^{n}(G_{F,S}, M) → Ĥ^{n}(G_v, M), under the equality Ĥ^{n} = H^{n} of Tate and ordinary cohomology of G_ℝ in positive degrees. In degree 0 they differ: loc_v is α⁰ followed by M^{G_ℝ} → M^{G_ℝ}/N·M, and for M = ℤ/2^∞(0) this quotient is ℚ_2/ℤ_2 → 0, so α⁰ ≠ 0 while R02.3's localisation map is 0.
- **RealPlaces.test_parity** (non-example): H²(ℝ; ℤ/2^∞(2)) = 0 although H²(ℝ; ℤ/2) ≠ 0: the divisible and mod-2 targets differ, so α for ℤ/2^∞(j) is not the mod-2 α.

**Consumers.**

- Kbook2013 VI Theorem 9.4 and Theorem 9.7: The morphism α_S of motivic spectral sequences from O_S to r_1 copies of ℝ is α^{p−q}_S(−q) on E_2.
- ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions and modified-mod-two-dimensions: The image and kernel of α¹, α² determine the mod-2 K-groups.
- MotivicEtaleKTheory:M.7/real-place-correction: Real-place correction terms in the dyadic comparison.

**Acceptance.**

- For F = ℚ and S = {2, ∞}, α^{1}_S(0) : H¹(ℤ[1/2], ℤ/2) ≅ ⟨−1, 2⟩ → H¹(ℝ, ℤ/2) = ℝ^×/ℝ^{×2} sends −1 to the nonzero class and 2 to 0.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, (9.2), printed p. 518 (PDF p. 526). Definition of α^n_S(i) and the values of H^n(ℝ; ℤ/2^∞(i)).

<a id="m-2-positive-and-modified-cohomology"></a>

### M.2/positive-and-modified-cohomology — Positive and modified étale cohomology at the real places

**Definition.** Identifier: `MotivicEtaleKTheory:M.2/positive-and-modified-cohomology`. Implementation: unchecked.

In the setting of real-restriction-map, three theories are kept separate. (i) Ordinary cohomology H^{n}_et(R, M). (ii) Positive (Kahn's totally positive) cohomology H^{n}_+(R, M), the cohomology of RΓ_+(R, M) = fibre(RΓ_et(R, M) → ⊕_{σ real} RΓ(G_ℝ, M)); it sits in the exact sequence … → ⊕_σ H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}_et(R, M) --α^n--> ⊕_σ H^{n}(ℝ, M) → … . (iii) The kernel groups H̃^{n}(R, M) = ker(α^{n}) of K-book VI.9, which receive H^{n}_+(R, M) surjectively with kernel coker(α^{n−1}). Neither (ii) nor (iii) is the compactly supported or Tate-modified cohomology of ArithmeticGaloisDuality D7, which uses Tate cohomology at the real places; for ℓ odd, H^{n}(ℝ, M) = 0 for n ≥ 1, so H̃^{n} = H^{n} for n ≥ 1 and H^{n}_+ = H^{n} for n ≥ 2, while H⁰_+ = ker α⁰ and H¹_+ is an extension of H¹ by coker α⁰, because the ordinary H⁰(ℝ, M) = M^{G_ℝ} is not zero.

**Hypotheses and conventions.**

- As in real-restriction-map; M a 2-primary coefficient module; the same fibre is formed for ℓ-primary M with ℓ odd, where it differs from ordinary cohomology only in degrees 0 and 1.
- H̃ is a subgroup of ordinary cohomology; H_+ is defined by a mapping fibre; D7's modified complexes are imported, not redefined.

**Construction or proof.**

1. Form the mapping fibre of α on cochain complexes (continuous cochains of G_{F,S} and of each G_ℝ), take cohomology, and read off the long exact sequence.
2. Define H̃^{n} = ker α^{n} and show H^{n}_+ → H^{n} factors through H̃^{n} surjectively, with kernel the image of ⊕ H^{n−1}(ℝ, M), i.e. coker α^{n−1}.
3. For ℓ odd the real cohomology of ℓ-primary modules vanishes in positive degrees, so H̃^{n} = H^{n} for n ≥ 1 and H^{n}_+ = H^{n} for n ≥ 2; in degrees 0 and 1 the ordinary H⁰(ℝ, M) = M^{G_ℝ} still contributes ker α⁰ and coker α⁰.

**Direct prerequisites.** [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), `ArithmeticGaloisDuality:D7/compact-support-without-p`

**Proposed library location.** `TauCeti/NumberTheory/GaloisCohomology/RealPlaces`, namespace `TauCeti.RealPlaces`.

**Planning API.**

- **TauCeti.RealPlaces.positiveCohomology** (constructor): H^{n}_+(R, M) as cohomology of the fibre of α on cochains.
- **TauCeti.RealPlaces.positive_long_exact** (relation): The long exact sequence … → ⊕_σ H^{n−1}(ℝ, M) → H^{n}_+(R, M) → H^{n}(R, M) → ⊕_σ H^{n}(ℝ, M) → ….
- **TauCeti.RealPlaces.kernelCohomology** (constructor): H̃^{n}(R, M) = ker α^{n}.
- **TauCeti.RealPlaces.positive_to_kernel** (relation): 0 → coker α^{n−1} → H^{n}_+(R, M) → H̃^{n}(R, M) → 0 is exact.
- **TauCeti.RealPlaces.odd_agree** (characterisation): For ℓ-primary M with ℓ odd: H̃^{n} = H^{n} for n ≥ 1, H^{n}_+ = H^{n} for n ≥ 2, H⁰_+ = ker α⁰, and 0 → coker α⁰ → H¹_+ → H¹ → 0 is exact.
- **TauCeti.RealPlaces.positive_to_tateModified** (compatibility): The map from ordinary to Tate cochains of G_ℝ (bijective on H^{n} for n ≥ 1, the quotient M^{G_ℝ} → M^{G_ℝ}/N·M on H⁰) induces a map from H^{n}_+(R, M) to the cohomology of the fibre of RΓ(R, M) → ⊕_σ R̂Γ(G_ℝ, M) with Tate complexes at the real places (as in ArithmeticGaloisDuality D7); it is bijective for n ≥ 2 and surjective for n = 1. D7's compactly supported cohomology also has the finite places of S in its fibre and is not identified with H_+.

**Discriminating tests.**

- **RealPlaces.test_totally_imaginary_agree** (degenerate): If r_1 = 0 then H^{n}_+ = H̃^{n} = H^{n} for all n.
- **RealPlaces.test_rat_kernel** (computation): For F = ℚ, S = {2, ∞}, M = ℤ/2: H̃¹ is spanned by the class of 2 and has dimension 1.
- **RealPlaces.test_high_degree** (computation): For n ≥ 3, H̃^{n}(R, ℤ/2) = 0 (α^n is bijective) and H^{n}_+(R, ℤ/2) = 0 (α^{n−1} is surjective, by high-degree-real-isomorphism), although H^{n}(R, ℤ/2) ≅ (ℤ/2)^{r_1}.
- **RealPlaces.test_not_ordinary** (non-example): For F = ℚ, S = {2, ∞}, M = ℤ/2, n = 3: H³ ≅ ℤ/2 but H̃³ = 0, so the kernel groups are not ordinary cohomology.
- **RealPlaces.test_odd_degree_one** (non-example): For F = ℚ(√2), ℓ = 3, M = ℤ/3 and S = S_∞ ∪ {v | 3}: α⁰ : ℤ/3 → (ℤ/3)² is the diagonal, so coker α⁰ ≅ ℤ/3 and the canonical map H¹_+(R, ℤ/3) → H¹(R, ℤ/3) has kernel ℤ/3, although H̃¹(R, ℤ/3) = H¹(R, ℤ/3): positive cohomology differs from ordinary cohomology in degree 1 even for ℓ odd.

**Consumers.**

- ArithmeticKTheory:N.6 (modified-mod-two-dimensions, request: 'distinct modified H̃ and totally positive H₊ cohomology'): The mod-2 dimension formulas use H̃; the positive groups enter the positive even K-subgroup.
- Kbook2013 VI Theorem 9.4 (n = 8k + 7 row): K_{8k+7}(O_S; ℤ/2^∞) ≅ H̃¹(O_S; ℤ/2^∞(4k + 4)).
- MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions: Extension data at 2 are stated with these groups.

**Acceptance.**

- For F = ℚ, S = {2, ∞}, M = ℤ/2: dim H̃¹ = 1 (spanned by 2), and H¹_+ has dimension 1 = dim H̃¹ + dim coker α⁰ with coker α⁰ = 0.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, after (9.2) and before Lemma 9.3, printed p. 518 (PDF p. 526). K-book's H̃¹(O_S; ℤ/2^∞(i)) := ker α¹_S(i), and (9.6): H̃^n(R; ℤ/2) the kernel of α^n.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), (9.6.2), printed p. 521 (PDF p. 529). The exact sequence relating H̃¹ to the narrow Picard group, which presupposes the kernel definition.

<a id="m-2-high-degree-real-isomorphism"></a>

### M.2/high-degree-real-isomorphism — Cohomological dimension and the real places in high degrees

**Theorem.** Identifier: `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`. Implementation: unchecked.

Let F be a number field, S ⊇ S_∞ ∪ {v | ℓ} and R = O_{F,S}. (a) If ℓ is odd, or F is totally imaginary, then cd_ℓ(G_{F,S}) ≤ 2, so H^{n}_et(R, M) = 0 for n ≥ 3 and every ℓ-primary torsion module M. For every F (ℓ = 2 included), the open subgroup Gal(F_S/F(√−1)) = G_{F(√−1),S}, of index at most 2 (F(√−1) ⊂ F_S because S contains the places above 2), has cd_ℓ ≤ 2, so vcd_ℓ(G_{F,S}) ≤ 2: this is the finite virtual cohomological dimension that étale descent uses. (b) For ℓ = 2 and every 2-primary torsion discrete G_{F,S}-module M (finite, or a filtered colimit of finite ones such as ℤ/2^∞(j)), α^{n}_S : H^{n}_et(R, M) → ⊕_σ H^{n}(ℝ, M) is an isomorphism for n ≥ 3. (c) For ℓ = 2 and every finite 2-primary M, α² : H²_et(R, M) → ⊕_σ H²(ℝ, M) is surjective; in particular α² is onto for M = ℤ/2. For S finite, i ∈ ℤ and M = ℤ/2^∞(i), α²_S(i) is surjective with kernel the divisible subgroup H²_cont(R, ℤ_2(i)) ⊗ ℚ_2/ℤ_2, so α²_S(i) is an isomorphism exactly when H²_cont(R, ℤ_2(i)) is finite. That finiteness for i ≥ 2 (K-book Exercises VI.8.1–8.2, used in Exercise VI.9.1) rests on the finiteness of K_{2i−2}(R) through the motivic spectral sequence, not on Poitou–Tate duality, and is not part of this theorem. Here cd_ℓ is ProfiniteCohomology Layer 11's cohomological dimension.

**Hypotheses and conventions.**

- F a number field; S ⊇ S_∞ ∪ {v | ℓ}; M an ℓ-primary torsion G_{F,S}-module.
- In (c) for ℤ/2^∞(i), S is finite, so that H²_cont(R, ℤ_2(i)) is a finitely generated ℤ_2-module.

**Construction or proof.**

1. (a) is ArithmeticGaloisDuality R02.4's cohomological-dimension bound for G_{F,S}, transported by M.1/s-integer-galois-comparison; the vcd bound applies it to the totally imaginary field F(√−1), whose ring of S-integers has Galois group G_{F(√−1),S} = Gal(F_S/F(√−1)), and uses the open-subgroup definition of vcd of ProfiniteCohomology Layer 11.
2. (b) is the high-degree part of Poitou–Tate (R02.4/cohomological-dimension-bound and R02.4/poitou-tate (c), with Ĥ^{n} = H^{n} for n ≥ 1), transported by M.1/s-integer-galois-comparison and extended to filtered colimits of finite modules because both sides commute with filtered colimits: for n ≥ 3 the localisation H^{n}(G_{F,S}, M) → ⊕_{v real} H^{n}(F_v, M) is bijective (NSW (8.6.10)(ii); Milne ADT I.4.10).
3. (c): for finite M, ArithmeticGaloisDuality R02.4/h2-localisation-surjective with T the set of real places, which omits the finite places of S above 2, gives the surjectivity of α²; this replaces K-book Exercise 9.2, whose hint goes through Exercise 9.1. For ℤ/2^∞(i), compare 0 → H²_cont(R, ℤ_2(i)) ⊗ ℚ_2/ℤ_2 → H²(R, ℤ/2^∞(i)) → H³_cont(R, ℤ_2(i))_tors → 0 with its real analogue, in which H²(ℝ, ℤ_2(i)) ⊗ ℚ_2/ℤ_2 = 0; H³_cont(R, ℤ_2(i)) = lim_ν H³(R, μ_{2^ν}^{⊗i}) ≅ ⊕_σ H³(ℝ, ℤ_2(i)) is finite by (b) and adic-s-integer-cohomology (a), so α²_S(i) is onto with kernel H²_cont(R, ℤ_2(i)) ⊗ ℚ_2/ℤ_2, which vanishes exactly when the finitely generated ℤ_2-module H²_cont(R, ℤ_2(i)) is finite.

**Direct prerequisites.** [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `ArithmeticGaloisDuality:R02.4/h2-localisation-surjective`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension`, [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology)

**Acceptance.**

- For F = ℚ, S = {2, ∞}: H³_et(ℤ[1/2], ℤ/2) ≅ ℤ/2 = H³(ℝ, ℤ/2).
- For F = ℚ(i) and ℓ = 2, H^{n}_et(O_{F,S}, ℤ/2) = 0 for n ≥ 3.
- For F = ℚ, S = {2, ∞}, M = ℤ/2: α² : H²_et(ℤ[1/2], ℤ/2) → H²(ℝ, ℤ/2) ≅ ℤ/2 is onto, and it is bijective because H²_et(ℤ[1/2], ℤ/2) ≅ Br'(ℤ[1/2])[2] ≅ ℤ/2 (Pic(ℤ[1/2]) = 0).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, after (9.2), printed p. 518 (PDF p. 526). Part (b). The next sentence, 'It is also an isomorphism for n = 2 and i ≥ 2, as shown in Exercise 9.1', depends on Exercise 8.1 (finiteness from K-theory) and is restated in (c) as an equivalence with the finiteness of H²_cont(R, ℤ_2(i)). The citation [128, I(4.20)] here should be Milne ADT I.4.10(c) (sourceIssues).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2 proof, printed p. 513 (PDF p. 521). Part (a).

[NSW2020](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), VIII §6, (8.6.10), PDF p. 503. Source of the high-degree localisation isomorphism.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, after (9.6), printed p. 520 (PDF p. 528). Part (c) for M = ℤ/2: α² onto.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Exercise VI.9.1, printed p. 525 (PDF p. 533). The n = 2, i ≥ 2 isomorphism for ℤ/2^∞(i) is derived from Exercise 8.1, which uses the finiteness of K_{2i−2}(R); hence (c) states only the equivalence with finiteness of H²_cont(R, ℤ_2(i)).

<a id="m-2-s-integer-brauer-sequence"></a>

### M.2/s-integer-brauer-sequence — The Brauer group of a ring of S-integers

**Theorem.** Identifier: `MotivicEtaleKTheory:M.2/s-integer-brauer-sequence`. Implementation: unchecked.

Let F be a number field, S a finite set of places containing S_∞ and at least one finite place, and O_S = O_{F,S}. Then H²_et(Spec O_S, G_m) is a torsion group, so it equals the cohomological Brauer group Br'(O_S) of SchemeAndStackFoundations SF.2, and it fits into the exact sequence 0 → Br'(O_S) → (ℤ/2)^{r_1} ⊕ ⊕_{v ∈ S finite} ℚ/ℤ --add--> ℚ/ℤ → 0, where the maps to the summands are the local invariants inv_v (ℤ/2 = ½ℤ/ℤ at real places) and the last map is the sum. In particular, for ℓ odd, Br'(O_S)[ℓ] ≅ (ℤ/ℓ)^{s−1} with s the number of finite places in S. No prime needs to be invertible on O_S: the sequence describes every ℓ-primary part, including those for the residue characteristics of primes outside S. Without a finite place in S the sum map is not onto (for S = S_∞ its image is ½ℤ/ℤ if r_1 > 0 and 0 if r_1 = 0); its cokernel is then H³_et(Spec O_F, G_m) (Milne ADT II.2.1).

**Hypotheses and conventions.**

- F a number field; S finite, S ⊇ S_∞; for the surjectivity of the sum map, S contains at least one finite place.
- No invertibility condition on any prime.

**Construction or proof.**

1. Let g : Spec F → U = Spec O_S be the generic point. On U_et there is the exact sequence 0 → G_m → g_*G_m → ⊕_{v∈U⁰} i_{v*}ℤ → 0, and R^s g_*G_m = 0 for s ≥ 1 (Hilbert 90, and the vanishing of the Brauer group of the fraction field of a strictly henselian discrete valuation ring with perfect residue field), so H^r(U, g_*G_m) = H^r(F, G_m) (SchemeAndStackFoundations SF.2 request; Milne ADT II.2.1, proof).
2. H^r(U, i_{v*}ℤ) = H^r(k(v), ℤ), which is 0 for r = 1 and H¹(k(v), ℚ/ℤ) ≅ ℚ/ℤ for r = 2. The long exact sequence gives 0 → H²(U, G_m) → Br(F) → ⊕_{v∈U⁰} H¹(k(v), ℚ/ℤ), whose last map at v is the local invariant inv_v (ClassFieldTheory Layer 5). In particular H²(U, G_m) ⊂ Br(F) is torsion.
3. Insert the Brauer–Hasse–Noether sequence 0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0 of ClassFieldTheory Layer 10, with Br(F_v) = ℚ/ℤ at finite v, ½ℤ/ℤ at real v and 0 at complex v: Br'(O_S) is the group of families (a_v)_{v∈S} with Σ a_v = 0, which is the stated sequence; the sum map is onto when S contains a finite place v₀, because Br(F_{v₀}) = ℚ/ℤ.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `SchemeAndStackFoundations:SF.2/cohomological-brauer`, `SchemeAndStackFoundations:SF.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

**Acceptance.**

- For O_S = ℤ[1/2]: r_1 = 1 and S_f = {2}, so Br'(ℤ[1/2]) ≅ ℤ/2, the kernel of ℤ/2 ⊕ ℚ/ℤ → ℚ/ℤ.
- For F = ℚ(i): with S = S_∞ the sequence reads 0 → Br'(ℤ[i]) → 0 → ℚ/ℤ, so Br'(ℤ[i]) = 0 and the sum map is not onto; with S = S_∞ ∪ {(1 + i)} (r_1 = 0, s = 1), Br'(ℤ[i, 1/2]) = 0 and the sum map ℚ/ℤ → ℚ/ℤ is the identity.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, (8.1.1), printed p. 513 (PDF p. 521). The displayed sequence (8.1.1) 0 → Br(O_S) → (ℤ/2)^{r_1} ⊕ ∐_{v∈S finite} ℚ/ℤ → ℚ/ℤ → 0.

[MilneADT](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter II, Proposition 2.1, printed p. 163 (PDF p. 171). The exact sequence 0 → H²(U, G_m) → ⊕_{v∈S} Br(K_v) → ℚ/ℤ → H³(U, G_m) → 0, with archimedean places in S; its proof is the divisor-sequence argument of the proof steps.

<a id="m-2-mod-two-dimension-formulas"></a>

### M.2/mod-two-dimension-formulas — Mod-2 dimensions, the narrow Picard group and the signature defect

**Theorem.** Identifier: `MotivicEtaleKTheory:M.2/mod-two-dimension-formulas`. Implementation: unchecked.

Let F be a number field with r_1 > 0 real and r_2 complex places, R = O_{F,S} with 1/2 ∈ R, s the number of finite places in S, t = dim_{𝔽_2} Pic(R)/2 and u = dim_{𝔽_2} Pic^+(R)/2, where Pic^+(R) is the narrow Picard group (cokernel of the restricted divisor map F^×_+ → ⊕_{𝔭 ∉ S} ℤ; it is the quotient of Tau Ceti's NumberField.NarrowClassGroup F by the classes of the finite places of S). Then (a) dim H¹_et(R, ℤ/2) = r_1 + r_2 + s + t and dim H²_et(R, ℤ/2) = r_1 + s + t − 1; (b) there is an exact sequence 0 → H̃¹(R; ℤ/2) → H¹(R; ℤ/2) --α¹--> (ℤ/2)^{r_1} → Pic^+(R)/2 → Pic(R)/2 → 0; (c) the signature defect j(R) = dim coker α¹ satisfies u = t + j(R) and 0 ≤ j(R) < r_1; (d) dim H̃¹(R, ℤ/2) = r_2 + s + u and dim H̃²(R, ℤ/2) = t + s − 1.

**Hypotheses and conventions.**

- F a number field with r_1 > 0; S ⊇ S_∞ ∪ {v | 2} finite.

**Construction or proof.**

1. (a): Kummer theory (M.1/etale-kummer-sequences) gives 0 → R^×/2 → H¹_et(R, ℤ/2) → Pic(R)[2] → 0 and 0 → Pic(R)/2 → H²_et(R, ℤ/2) → Br'(R)[2] → 0. Dirichlet's unit theorem for O_F (Mathlib's NumberField.Units.finrank_eq) and the S-unit valuation sequence (ArithmeticKTheory N.2, whose last term is the finite class group) give rank R^× = r_1 + r_2 + s − 1, and μ(F)/μ(F)² = ℤ/2, so dim R^×/2 = r_1 + r_2 + s. Pic(R) is finite (a quotient of the class group of O_F), so dim Pic(R)[2] = dim Pic(R)/2 = t. By s-integer-brauer-sequence, Br'(R)[2] is the kernel of the sum map (ℤ/2)^{r_1+s} → ℤ/2, of dimension r_1 + s − 1 (s ≥ 1 because 1/2 ∈ R).
2. (b): the diagram chase of K-book (9.6.2) comparing the sign map on units with the narrow and ordinary Picard groups.
3. (c) and (d): read off from (b) and the surjectivity of α² (high-degree-real-isomorphism (c)).

**Direct prerequisites.** [MotivicEtaleKTheory:M.2/positive-and-modified-cohomology](#m-2-positive-and-modified-cohomology), [MotivicEtaleKTheory:M.2/s-integer-brauer-sequence](#m-2-s-integer-brauer-sequence), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `mathlib:CommRing.Pic`, `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, `mathlib:NumberField.Units.finrank_eq`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `tauceti:NumberField.NarrowClassGroup`

**Acceptance.**

- For R = ℤ[1/2]: r_1 = 1, r_2 = 0, s = 1, t = u = 0, j = 0, so dim H¹ = 2, dim H² = 1, dim H̃¹ = 1, dim H̃² = 0.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, after (9.6.2), printed p. 521 (PDF p. 529). Part (a); Lemma 9.6.3 gives part (d).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition 9.6.1, printed p. 520 (PDF p. 528). Part (c).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition 9.6.1, printed p. 520 (PDF p. 528). Definition 9.6.1: Pic^+(R), the cokernel of the restricted divisor map F^×_+ → ⊕_{𝔭∉S} ℤ, used in (b)–(d).

<a id="m-2-even-twist-real-surjection"></a>

### M.2/even-twist-real-surjection — Surjectivity onto the real places in even weight

**Lemma.** Identifier: `MotivicEtaleKTheory:M.2/even-twist-real-surjection`. Implementation: unchecked.

Let F be a number field with r_1 > 0 and i even. Then α¹(i) : H¹(F, ℤ/2^∞(i)) → ⊕_σ H¹(ℝ, ℤ/2^∞(i)) ≅ (ℤ/2)^{r_1} is a split surjection, and for all sufficiently large finite S, H¹(O_S; ℤ/2^∞(i)) ≅ (ℤ/2)^{r_1} ⊕ H̃¹(O_S; ℤ/2^∞(i)).

**Hypotheses and conventions.**

- F a number field with r_1 > 0; i even; S ⊇ S_∞ ∪ {v | 2} finite and large enough that the S-units realise every sign vector in (ℤ/2)^{r_1}.

**Construction or proof.**

1. By weak approximation for units of F the sign map F^×/F^{×2} → ⊕_σ ℝ^×/ℝ^{×2} is split surjective.
2. Compare via F^×/F^{×2} ≅ H¹(F, ℤ/2) → H¹(F, ℤ/2^∞(i)) and the isomorphism H¹(ℝ, ℤ/2) ≅ H¹(ℝ, ℤ/2^∞(i)) for i even (K-book Lemma 9.3).
3. Pass to O_S using F^×/F^{×2} = colim_S O_S^×/O_S^{×2}.

**Direct prerequisites.** [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), [MotivicEtaleKTheory:M.2/positive-and-modified-cohomology](#m-2-positive-and-modified-cohomology), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison)

**Acceptance.**

- For F = ℚ and i = 2: −1 ∈ ℚ^× maps to the generator of H¹(ℝ, ℤ/2^∞(2)) ≅ ℤ/2.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma VI.9.3, printed p. 518 (PDF p. 526). Statement of Lemma 9.3, with the splitting for sufficiently large S.

<a id="m-2-adic-s-integer-cohomology"></a>

### M.2/adic-s-integer-cohomology — ℓ-adic cohomology of S-integers: finiteness and rationalisation

**Theorem.** Identifier: `MotivicEtaleKTheory:M.2/adic-s-integer-cohomology`. Implementation: unchecked.

Let F be a number field, ℓ a prime, S ⊇ S_∞ ∪ {v | ℓ} finite and R = O_{F,S}. For every j ∈ ℤ and n ≥ 0: (a) H^{n}_et(R, μ_{ℓ^ν}^{⊗j}) is finite, so H^{n}_cont(R, ℤ_ℓ(j)) = lim_ν H^{n}_et(R, μ_{ℓ^ν}^{⊗j}) is a finitely generated ℤ_ℓ-module; (b) H^{n}_cont(R, ℚ_ℓ(j)) = H^{n}_cont(R, ℤ_ℓ(j)) ⊗ ℚ_ℓ; (c) the torsion subgroup is H^{n}_cont(R, ℤ_ℓ(j))_tors ≅ coker(H^{n−1}_cont(R, ℚ_ℓ(j)) → H^{n−1}_et(R, ℚ_ℓ/ℤ_ℓ(j))); in particular for j ≠ 0, H¹_cont(R, ℤ_ℓ(j))_tors ≅ H⁰(R, ℚ_ℓ/ℤ_ℓ(j)) = ℤ/w_j^{(ℓ)}(F). (d) Tate's Euler characteristic formula gives rank H¹_cont(R, ℤ_ℓ(j)) − rank H²_cont(R, ℤ_ℓ(j)) = r_2 for j even and r_1 + r_2 for j odd, for every j ≠ 0 and every prime ℓ (for ℓ = 2 a real place contributes the bounded factor #H⁰(ℝ, μ_{2^ν}^{⊗j}) = 2 when j is odd, which does not change ranks).

**Hypotheses and conventions.**

- F a number field; S ⊇ S_∞ ∪ {v | ℓ} finite; j ∈ ℤ.
- (d) holds for every ℓ: R02.4/global-euler-characteristic uses ordinary H⁰ at the real places, and only H⁰, H¹, H² enter it.

**Construction or proof.**

1. (a) ArithmeticGaloisDuality R02.4/global-finiteness for finite coefficients, then ArithmeticGaloisDuality R02.1/tate-inverse-limit for the profinite group G_{F,S} through M.1/s-integer-galois-comparison (the lim¹ term vanishes because the groups H^{n−1} are finite) and Nakayama for the compact ℤ_ℓ-module.
2. (b) ArithmeticGaloisDuality R02.1/rationalization for the profinite group G_{F,S} and the finitely generated ℤ_ℓ-module ℤ_ℓ(j).
3. (c) the long exact sequence of 0 → ℤ_ℓ(j) → ℚ_ℓ(j) → ℚ_ℓ/ℤ_ℓ(j) → 0 (R02.1/continuous-section-long-exact, R02.1/lattice-torsion-sequence), in which H^{n}(R, ℤ_ℓ(j)) → H^{n}(R, ℚ_ℓ(j)) = H^{n}(R, ℤ_ℓ(j)) ⊗ ℚ_ℓ has kernel the torsion subgroup; for n = 1 and j ≠ 0, H⁰(R, ℚ_ℓ(j)) = 0 because the cyclotomic character has infinite image.
4. (d) the global Euler characteristic formula R02.4/global-euler-characteristic applied to μ_{ℓ^ν}^{⊗j}: by (a), #H^{i}(R, μ_{ℓ^ν}^{⊗j}) = ℓ^{ν·rank H^{i}_cont(R, ℤ_ℓ(j)) + O(1)}; at a real place #H⁰(ℝ, μ_{ℓ^ν}^{⊗j})/ℓ^ν is 1 for j even and 1/ℓ^ν (ℓ odd) or 2/2^ν (ℓ = 2) for j odd, and at a complex place it is ℓ^ν/ℓ^{2ν}; comparing the coefficients of ν gives (d), since H⁰_cont(R, ℤ_ℓ(j)) = 0 for j ≠ 0.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.1/primewise-q-mod-z-twist](#m-1-primewise-q-mod-z-twist), `ArithmeticGaloisDuality:R02.4/global-finiteness`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.1/rationalization`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/lattice-torsion-sequence`

**Acceptance.**

- For F = ℚ, ℓ = 3, j = 2: H¹_cont(ℤ[1/3], ℤ_3(2))_tors ≅ ℤ/3 = ℤ/w_2^{(3)}(ℚ).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Exercise 8.3, printed p. 516 (PDF p. 524). The torsion of H¹(O_S, ℤ_ℓ(i)) is ℤ/w_i^{(ℓ)}(F) and its rank is r_2 or r_1 + r_2; this node proves the cohomological parts that do not need K-theory.

[NSW2020](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), II §7, (2.7.6), PDF p. 156. Limit step in (a).

<a id="m-2-degree-two-localization-diagram"></a>

### M.2/degree-two-localization-diagram — The degree-two comparison diagram of localization sequences

**Theorem.** Identifier: `MotivicEtaleKTheory:M.2/degree-two-localization-diagram`. Implementation: unchecked.

Let F be a number field, S ⊇ S_∞ a finite set of places, O_S = O_{F,S}, and m = ℓ^r with ℓ invertible on O_S. (a) The K-theory row. Tate's sequence 0 → K_2(O_S) → K_2(F) --d^S--> ⊕_{v∉S} k(v)^× → 0 (K2SymbolsBrauer T.5; d^S = (d_v) the tame symbols) and the snake lemma for multiplication by m give the exact sequence 0 → K_2(O_S)[m] → K_2(F)[m] --d^S--> ⊕_{v∉S} μ_m(k(v)) → K_2(O_S)/m → K_2(F)/m --d^S--> ⊕_{v∉S} k(v)^×/m → 0, using k(v)^×[m] = μ_m(k(v)). (b) The étale row. The localization sequence of M.1 for O_S ⊂ F gives the exact sequence H¹_et(O_S, μ_m^{⊗2}) → H¹(F, μ_m^{⊗2}) --∂--> ⊕_{v∉S} H⁰(k(v), μ_m) → H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) --∂--> ⊕_{v∉S} H¹(k(v), μ_m) → 0; the last map is onto because H³_et(O_S, μ_m^{⊗2}) → H³(F, μ_m^{⊗2}) is injective: both groups vanish when ℓ is odd or F is totally imaginary, and for ℓ = 2 both are identified with ⊕_{σ real} H³(ℝ, μ_m^{⊗2}) by the real restriction maps. (c) The residue columns. For v ∉ S, μ_m(k(v)) = H⁰(k(v), μ_m) and the Kummer map k(v)^×/m → H¹(k(v), μ_m) are isomorphisms. The residue maps of the two rows satisfy, for a v-unit u, x ∈ F^× and z ∈ μ_m(F): ∂_v(κ(u) ∪ κ(x)) = −v(x)·κ_{k(v)}(ū) and d_v{u, x} = ū^{v(x)}; d_v{z, x} = z^{v(x)}. (d) The ring column is not determined by the field column: the kernel of H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) is the cokernel of ∂ : H¹(F, μ_m^{⊗2}) → ⊕_{v∉S} H⁰(k(v), μ_m); when μ_m ⊂ F it is (Pic(O_S)/m) ⊗ μ_m, which is nonzero for F = ℚ(μ_37), S the places above 37 and ∞, and m = 37. So a map K_2(O_S)/m → H²_et(O_S, μ_m^{⊗2}) compatible with a map K_2(F)/m → H²(F, μ_m^{⊗2}) is not unique, and the ring column is a separate construction. Given vertical maps that commute with both rows (the identity, up to the sign of the conventions, on ⊕_{v∉S} μ_m(k(v)) and the Kummer isomorphisms on ⊕_{v∉S} k(v)^×/m), if the field map is bijective and the images of K_2(F)[m] and of H¹(F, μ_m^{⊗2}) in ⊕_{v∉S} μ_m(k(v)) coincide, then the ring map is bijective.

**Hypotheses and conventions.**

- F a number field; S ⊇ S_∞ finite; m = ℓ^r invertible on O_S.
- The tame symbol convention is K2SymbolsBrauer T.3's (d_v{u, π} = ū); the cohomological residue is M.1's (∂_v(κ(π)) = 1 and ∂_v(κ(u) ∪ y) = −κ(ū) ∪ ∂_v(y)).
- No vertical map out of K_2(O_S)/m or K_2(F)/m is constructed here: the Galois symbol and its compatibility with residues are M.3/galois-symbol and M.3/symbol-residue-compatibility.

**Construction or proof.**

1. (a): K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence and the snake lemma for multiplication by m; k(v)^×[m] = μ_m(k(v)) because k(v) is finite.
2. (b): the degree-one and degree-two part of M.1/localization-gysin-sequence for B = Spec O_S, passed to the colimit over finite Z. Injectivity of H³_et(O_S, μ_m^{⊗2}) → H³(F, μ_m^{⊗2}) is high-degree-real-isomorphism (a) when ℓ is odd or F is totally imaginary; for ℓ = 2, part (b) of that theorem for O_S and for every O_T with T ⊇ S finite identifies H³_et(O_S) and H³(F) = colim_T H³_et(O_T) with ⊕_σ H³(ℝ, μ_m^{⊗2}) compatibly.
3. (c): the Kummer isomorphism for the finite field k(v) (M.1/etale-kummer-sequences); the residue formula is M.1's convention, the tame-symbol formulas are K2SymbolsBrauer T.3/tame-symbol-hom, and d_v{z, x} = z^{v(x)} is the identity Tate uses in the proof of (6.2).
4. (d): exactness of (b) identifies the kernel with the cokernel of ∂ on H¹. For μ_m ⊂ F, μ_m^{⊗2} = μ_m ⊗ μ_m with trivial action on the second factor, and the Kummer sequences of M.1 for O_S and for F show that the kernel of H²_et(O_S, μ_m) → H²(F, μ_m) = Br(F)[m] is Pic(O_S)/m. For F = ℚ(μ_37) and S the places above 37 and ∞, Pic(O_S) is the class group of ℚ(μ_37) (the prime above 37 is generated by 1 − ζ_37), whose order is divisible by the irregular prime 37. The last assertion is the five lemma for 0 → coker(d^S on K_2(F)[m]) → K_2(O_S)/m → ker(d^S on K_2(F)/m) → 0 and its étale analogue.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.3/tame-symbol-hom`

**Acceptance.**

- For F = ℚ(μ_37), S the places above 37 and ∞, and m = 37: H²_et(O_S, μ_37^{⊗2}) → H²(F, μ_37^{⊗2}) has the nonzero kernel (Pic(O_S)/37) ⊗ μ_37, so the left square does not determine a ring-level map.
- For F = ℚ, S = {ℓ, ∞} with ℓ odd and m = ℓ: H³_et(ℤ[1/ℓ], μ_ℓ^{⊗2}) = 0, so ∂ : H²(ℚ, μ_ℓ^{⊗2}) → ⊕_{p≠ℓ} H¹(𝔽_p, μ_ℓ) is onto, matching the surjectivity of d^S : K_2(ℚ)/ℓ → ⊕_{p≠ℓ} 𝔽_p^×/ℓ.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §5, (5.3), p. 269. Tate's sequence (5.3) 0 → K_2O_S → K_2F → ∐_{v∉S} k(v)^× → 0 is the top row; excerpt typed from the scan.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §6, proof of (6.2), p. 270. The torsion columns: Tate compares (K_2F)_ℓ → ∐_{v∉S} μ_ℓ with μ_ℓ ⊗ F^× → μ_ℓ ⊗ I_S through (d^S γ(z ⊗ a))_v = d_v{z, a} = z^{v(a)}; Tate's diagram uses Galois cohomology of F only, not H²_et(O_S, μ_m^{⊗2}); excerpt typed from the scan.

### Remaining work for M.2

- Render and read §6.2 of Weibel's 'Higher wild kernels' (its text layer is unreadable) to cite Kahn's positive cohomology beside the K-book kernel groups.
- ArithmeticKTheory N.6 also asks M.2 for the top-degree corestriction/coinvariant statement under cd ≤ 2 and for the corrected cyclotomic ring-to-field localisation of Weibel's 'Higher wild kernels' §§4.5 and 6.11; plan them as M.2 nodes after reading that paper.

<a id="m-3"></a>

## M.3 — Tate's degree-two arithmetic theorem

The actual cup-symbol map, norms and residues, local/global Tate arguments, adic and S-integer formulations, and the auxiliary results used in the proof.

**Planets:** Cohomological Steinberg relation, Galois symbol, Tate's local theorem, Tate's global theorem, Tate's S-integer theorem.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism)

<a id="m-3-cohomological-steinberg"></a>

### M.3/cohomological-steinberg — The cohomological Steinberg relation

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/cohomological-steinberg`. Implementation: unchecked.

Let F be a field and m ≥ 1 invertible in F, and let κ : F^× → H¹(F, μ_m) be the Kummer map (Tau Ceti's kummerMap). For every a ∈ F with a ≠ 0, 1, κ(a) ∪ κ(1 − a) = 0 in H²(F, μ_m^{⊗2}), the cup product being that of M.1/twisted-cohomology-ring for the tensor pairing μ_m × μ_m → μ_m ⊗ μ_m = μ_m^{⊗2}, (ζ, ξ) ↦ ζ ⊗ ξ (multiplication of roots of unity μ_m × μ_m → μ_m is not biadditive and is not used). The same holds for Tate's ℓ-adic classes: d_F a ∪ d_F(1 − a) = 0 in H²(F, ℤ_ℓ(2)) for every prime ℓ ≠ char F (Tate's relation (∗) in the proof of (3.1)). The adic form does not follow from the finite-level statements alone, because the kernel of H²(F, ℤ_ℓ(2)) → lim_ν H²(F, μ_{ℓ^ν}^{⊗2}) is lim¹_ν H¹(F, μ_{ℓ^ν}^{⊗2}).

**Hypotheses and conventions.**

- F a field, m invertible in F (ℓ ≠ char F in the adic form); a ∈ F ∖ {0, 1}.
- The coefficient pairing is the tensor pairing μ_m × μ_m → μ_m^{⊗2} with the diagonal Galois action; no primitive root of unity is assumed.

**Construction or proof.**

1. Factor t^m − a = ∏_i f_i(t) into monic irreducibles in F[t] (t^m − a is separable because m is invertible and a ≠ 0), let x_i ∈ F^s be a root of f_i and F_i = F(x_i). Evaluating at t = 1 gives 1 − a = ∏_i f_i(1) = ∏_i N_{F_i/F}(1 − x_i), and 1 − x_i ≠ 0 because x_i^m = a ≠ 1.
2. Kummer theory in finite separable extensions (ProfiniteCohomology Layer 9: kummerIso_res and kummerIso_norm) gives res_{F_i/F} κ(a) = κ_{F_i}(x_i^m) = m·κ_{F_i}(x_i) and κ(N_{F_i/F}(1 − x_i)) = cor_{F_i/F} κ_{F_i}(1 − x_i). The projection formula cor(res(α) ∪ β) = α ∪ cor(β) (M.1/twisted-cohomology-ring; Tau Ceti's explicitCup_projection11 in degrees (1, 1)) then gives κ(a) ∪ κ(1 − a) = Σ_i cor_{F_i/F}(res κ(a) ∪ κ_{F_i}(1 − x_i)) = m·Σ_i cor_{F_i/F}(κ_{F_i}(x_i) ∪ κ_{F_i}(1 − x_i)).
3. H²(F, μ_m^{⊗2}) has exponent m, so the sum vanishes (Weibel's proof of Proposition III.6.10.3).
4. Adic form (Tate's proof of (3.1)): let D_F ⊆ H²(F, ℤ_ℓ(2)) be the subgroup generated by the classes cor_{E/F}(d_E a ∪ d_E(1 − a)) for E/F finite separable and a ∈ E ∖ {0, 1}. Steps one and two with m = ℓ over E, where d commutes with restriction and corestriction (the limit over ν of the Kummer compatibilities, M.1/continuous-limit-comparison) and the projection formula holds for the adic cup product, give cor_{E/F}(d_E a ∪ d_E(1 − a)) = ℓ·Σ_i cor_{E_i/F}(d_{E_i} a_i ∪ d_{E_i}(1 − a_i)) ∈ ℓD_F. So D_F is ℓ-divisible, and Tate's Proposition (2.1) (H²(F, ℤ_ℓ(2)) has no nonzero ℓ-divisible subgroup; ArithmeticGaloisDuality R02.1/rationalization) gives D_F = 0.

**Direct prerequisites.** [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `tauceti:TauCeti.kummerMap`, `tauceti:TauCeti.ContCohomology.explicitCup_projection11`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), `ArithmeticGaloisDuality:R02.1/rationalization`

**Acceptance.**

- For F = ℚ, m = 2, a = 2: κ(2) ∪ κ(−1) = 0 in H²(ℚ, μ_2^{⊗2}) = Br(ℚ)[2], i.e. the quaternion algebra (2, −1) is split.
- For F = ℝ, m = 2: no a ∈ ℝ ∖ {0, 1} has both a < 0 and 1 − a < 0, consistent with κ(−1) ∪ κ(−1) ≠ 0.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Proposition III.6.10.3 and proof, printed pp. 242-243 (PDF pp. 250-251). The proof via factorisation of t^m − a and the projection formula.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (3.1) Theorem and its proof, relation (∗), pp. 262-263. The adic Steinberg relation, (a, b)_F = d_F a ∪ d_F b; Tate writes F˙ for the multiplicative group F^×. Excerpt read from the page image; the OCR garbles the display (∗).

<a id="m-3-galois-symbol"></a>

### M.3/galois-symbol — The Galois symbol on K₂ of a field

**Construction.** Identifier: `MotivicEtaleKTheory:M.3/galois-symbol`. Implementation: unchecked.

Let F be a field and m ≥ 1 invertible in F. The Galois symbol (norm residue symbol of degree two) is the unique homomorphism h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}) with h_{F,m}{a, b} = κ(a) ∪ κ(b) for all a, b ∈ F^×, where K_2(F) is classical K₂ (K2SymbolsBrauer T.1) presented by Matsumoto's theorem (K2SymbolsBrauer T.2/matsumoto), κ is the Kummer map, and the cup product is that of M.1/twisted-cohomology-ring for the tensor pairing μ_m × μ_m → μ_m ⊗ μ_m = μ_m^{⊗2}, (ζ, ξ) ↦ ζ ⊗ ξ. It is natural for every field extension E/F: res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F)/m → K_2(E)/m), restriction being taken along G_E → G_F for an F-embedding of separable closures (the map on cohomology does not depend on the embedding). It is compatible with change of m: for m | m' and x ∈ K_2(F), h_{F,m}(x mod m) = (r ⊗ r)_*(h_{F,m'}(x mod m')) with r : μ_{m'} → μ_m, ζ ↦ ζ^{m'/m}. For m = ℓ prime it is Tate's h_1 of diagram (3.3). Its compatibility with norms and residues is symbol-norm-compatibility and symbol-residue-compatibility. M.3 constructs no Chern class: the degree-two étale Chern class c_{2,2} is MotivicEtaleKTheory:M.8/finite-etale-chern (RS-08 keeps the étale Chern classes in M.8), and its comparison with h_{F,m} is K2SymbolsBrauer T.7/chern-class-agreement, which consumes this node.

**Hypotheses and conventions.**

- F a field; m invertible in F. No primitive m-th root of unity is assumed.

**Construction or proof.**

1. The pairing (a, b) ↦ κ(a) ∪ κ(b) is bilinear (κ is a homomorphism and the cup product is bilinear).
2. It satisfies the Steinberg relation by cohomological-steinberg, hence factors through K_2(F) by Matsumoto's presentation, and through K_2(F)/m since the target has exponent m.
3. Naturality and change of m follow from naturality of κ and of the cup product.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/cohomological-steinberg](#m-3-cohomological-steinberg), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.1/k2-definition`, `tauceti:TauCeti.kummerMap`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Proposed library location.** `TauCeti/KTheory/GaloisSymbol`, namespace `TauCeti.GaloisSymbol`.

**Planning API.**

- **TauCeti.GaloisSymbol.symbol** (constructor): h_{F,m} : K_2(F)/m → H²(F, μ_m^{⊗2}).
- **TauCeti.GaloisSymbol.symbol_steinberg** (simp): h_{F,m}{a, b} = κ(a) ∪ κ(b).
- **TauCeti.GaloisSymbol.symbol_unique** (extensionality): Two homomorphisms K_2(F)/m → A agreeing on all Steinberg symbols are equal.
- **TauCeti.GaloisSymbol.symbol_res** (functoriality): res_{E/F} ∘ h_{F,m} = h_{E,m} ∘ (K_2(F)/m → K_2(E)/m) for every field extension E/F, restriction along G_E → G_F for an F-embedding of separable closures.
- **TauCeti.GaloisSymbol.symbol_reduce** (functoriality): For m | m' and x ∈ K_2(F): h_{F,m}(x mod m) = (r ⊗ r)_*(h_{F,m'}(x mod m')), where r : μ_{m'} → μ_m is ζ ↦ ζ^{m'/m} and r ⊗ r : μ_{m'}^{⊗2} → μ_m^{⊗2} is the reduction of coefficients.
- **TauCeti.GaloisSymbol.symbol_skew** (relation): h{a, b} = −h{b, a} and h{a, −a} = 0.

**Discriminating tests.**

- **GaloisSymbol.test_one** (degenerate): For m = 1 the symbol is the zero map between zero groups; and for every a ∈ F^× and every m-th power b = c^m, h_{F,m}{a, b} = κ(a) ∪ κ(c^m) = 0, since the Kummer class of an m-th power vanishes. A definition through a cocycle not built from the Kummer classes fails the second clause.
- **GaloisSymbol.test_hamilton** (computation): For F = ℝ and m = 2, h{−1, −1} ≠ 0 (Hamilton's quaternions are not split).
- **GaloisSymbol.test_explicitCup11** (compatibility): h{a, b} = explicitCup11(kummerMap a, kummerMap b) for the tensor pairing KummerCoeff × KummerCoeff → μ_m^{⊗2} (Tau Ceti's low-degree model).
- **GaloisSymbol.test_not_untwisted** (non-example): For F = ℚ and m = 3: h_{ℚ,3}{3, 7} ≠ 0, because by symbol-residue-compatibility its residue at 7 is −κ(3 mod 7) ∈ H¹(𝔽_7, μ_3) = 𝔽_7^×/𝔽_7^{×3}, and 3 is not a cube modulo 7. By contrast every G_ℚ-equivariant biadditive pairing μ_3 × μ_3 → μ_3 is zero (writing it (ζ^i, ζ^j) ↦ w^{ij}, complex conjugation forces w = w^{−1}, so w = 1), so a symbol built from κ(a) and κ(b) with untwisted coefficients μ_3 vanishes identically.

**Consumers.**

- K2SymbolsBrauer:T.7/symbol-formula, brauer-valued-symbol, chern-class-agreement: T.7 imports the general-field symbol and identifies its formula and sign with the pinned Kummer map and the Chern class.
- ArithmeticKTheory:N.6/the-two-primary-corrections and N.7/tame-kernel-vanishing-at-a-regular-prime: Tate's comparison through this symbol.
- HabiroNumberFields:HB.2/etale-bloch-group-and-K2: K_2(F)/n ≅ H²(F, ℤ/n(2)) through this map.
- MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees: The degree-two component of the all-degree norm residue map is this symbol.

**Acceptance.**

- h_{ℚ,2}{−1, −1} ≠ 0: its image in Br(ℝ)[2] is the class of Hamilton's quaternions.
- h_{F,m}{a, −a} = 0 for all a ∈ F^×.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Proposition III.6.10.3, printed p. 242 (PDF p. 250). Statement: the pairing induces a Steinberg symbol K_2(F)/mK_2(F) → H²(F; μ_m^{⊗2}) for every m prime to char(F).

<a id="m-3-adic-galois-symbol"></a>

### M.3/adic-galois-symbol — Tate's ℓ-adic Galois symbol

**Construction.** Identifier: `MotivicEtaleKTheory:M.3/adic-galois-symbol`. Implementation: unchecked.

Let F be a field and ℓ ≠ char F a prime. Tate's adic Galois symbol is the unique homomorphism h_F : K_2(F) → H²(F, ℤ_ℓ(2)) with h_F{a, b} = d_F a ∪ d_F b (cup product for the pairing ℤ_ℓ(1) × ℤ_ℓ(1) → ℤ_ℓ(2) of M.1/adic-tate-twist), where d_F : F^× = H⁰(F, F_s^×) → H¹(F, ℤ_ℓ(1)) is the connecting map of Tate's exact sequence 0 → ℤ_ℓ(1) → lim_i F_s^× → F_s^× → 0 (the limit taken along x ↦ x^ℓ, the last map (x_i)_i ↦ x_0; Tate §3). Under H¹(F, ℤ_ℓ(1)) ≅ lim_ν H¹(F, μ_{ℓ^ν}), which is bijective because the groups μ_{ℓ^ν}(F) are finite, d_F a is the compatible family of Kummer classes (κ_{ℓ^ν}(a))_ν. The reduction of h_F modulo ℓ^ν, composed with H²(F, ℤ_ℓ(2))/ℓ^ν → H²(F, μ_{ℓ^ν}^{⊗2}), is the Galois symbol h_{F,ℓ^ν}.

**Hypotheses and conventions.**

- F a field; ℓ ≠ char F prime.

**Construction or proof.**

1. Define d_F as the limit over ν of Kummer maps into H¹(F, μ_{ℓ^ν}) and identify it with the connecting map into H¹(F, ℤ_ℓ(1)) (M.1/continuous-limit-comparison).
2. Bilinearity is clear; the Steinberg relation is cohomological-steinberg (adic form), so Matsumoto's presentation gives h_F.
3. Compatibility with the mod-ℓ^ν symbol is naturality of the cup product under reduction of coefficients.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/cohomological-steinberg](#m-3-cohomological-steinberg), [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), `K2SymbolsBrauer:T.2/matsumoto`, [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), `tauceti:TauCeti.kummerMap`

**Proposed library location.** `TauCeti/KTheory/GaloisSymbol`, namespace `TauCeti.GaloisSymbol`.

**Planning API.**

- **TauCeti.GaloisSymbol.adicSymbol** (constructor): h_F : K_2(F) → H²(F, ℤ_ℓ(2)).
- **TauCeti.GaloisSymbol.adicSymbol_steinberg** (simp): h_F{a, b} = d_F a ∪ d_F b.
- **TauCeti.GaloisSymbol.adicSymbol_reduce** (compatibility): Reducing h_F mod ℓ^ν gives h_{F,ℓ^ν}.
- **TauCeti.GaloisSymbol.adicSymbol_divisible** (relation): h_F vanishes on the ℓ-divisible subgroup of K_2(F) (Tate (3.5)(a)).
- **TauCeti.GaloisSymbol.adicSymbol_res** (functoriality): Natural for field extensions.

**Discriminating tests.**

- **GaloisSymbol.test_adic_one** (degenerate): If b ∈ F^× is an ℓ^ν-th power for every ν (b is ℓ-divisible in F^×), then h_F{a, b} = 0 in H²(F, ℤ_ℓ(2)) for every a ∈ F^×, since every component h_{F,ℓ^ν}{a, b} = κ(a) ∪ κ(b) vanishes; for F = ℂ, ℓ any prime, h_F is the zero map.
- **GaloisSymbol.test_adic_closed** (computation): For F algebraically closed, H²(F, ℤ_ℓ(2)) = 0, so h_F = 0.
- **GaloisSymbol.test_adic_reduce** (compatibility): For F = ℚ, ℓ = 2, ν = 1: the reduction of h_ℚ{−1, −1} is h_{ℚ,2}{−1, −1} ≠ 0.
- **GaloisSymbol.test_adic_not_injective** (non-example): For F a local field, h_F is not injective on K_2(F): it kills the uncountable divisible summand of Moore's decomposition.

**Consumers.**

- Tate1976 (3.5), (5.4): The l-primary part of K_2 of a global field is identified with the torsion of H²(F, Z_l(2)) through h.
- HabiroNumberFields:HB.2 (request to M.3): K_2(F)[n] ≅ H²(F, ℤ_p(2))[n] for n = p^m.
- SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology: ℓ-parts of K_2(O_F) as étale cohomology, compatibly in r.

**Acceptance.**

- h_F is zero on the ℓ-divisible subgroup of K_2(F) (Tate (3.5)(a)), e.g. on all of K_2(ℂ).

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (3.1) Theorem, p. 262. h = h_F : K_2F → H²(F, Z_l(2)) such that h({a, b}) = d_F a ∪ d_F b; excerpt typed from the scan.

<a id="m-3-symbol-norm-compatibility"></a>

### M.3/symbol-norm-compatibility — The Galois symbol commutes with norms

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/symbol-norm-compatibility`. Implementation: unchecked.

Let E/F be a finite extension of fields and m invertible in F. Let N_{E/F} : K_2(E) → K_2(F) be the Milnor norm (transfer) of K2SymbolsBrauer T.4, which agrees with Quillen's transfer on K₂ (K2SymbolsBrauer T.3/milnor-quillen-transfer-comparison). Then cor_{E/F} ∘ h_{E,m} = h_{F,m} ∘ N_{E/F} : K_2(E)/m → H²(F, μ_m^{⊗2}), where cor is corestriction for E/F separable and, for E/F purely inseparable of degree p^a, cor is multiplication by p^a after the identification G_E = G_F, and in general cor_{E/F} = cor_{E_0/F} ∘ cor_{E/E_0} with E_0 the separable closure of F in E. On symbols with one entry from F this is Tate's Lemma (3.2): cor_{E/F} h_E{a, b} = h_F{a, N_{E/F} b} for a ∈ F^×, b ∈ E^×.

**Hypotheses and conventions.**

- E/F finite; m invertible in F.

**Construction or proof.**

1. Symbols {a, b} with a ∈ F^× and b ∈ E^×, E/F separable (Tate's Lemma (3.2)): cor_{E/F}(κ_E(a) ∪ κ_E(b)) = cor_{E/F}(res κ(a) ∪ κ_E(b)) = κ(a) ∪ cor_{E/F} κ_E(b) = κ(a) ∪ κ(N_{E/F} b), by the projection formula (M.1/twisted-cohomology-ring) and the Kummer–norm square (ProfiniteCohomology Layer 9, kummerIso_norm); and N_{E/F}{a, b} = {a, N_{E/F} b} (K2SymbolsBrauer T.4/milnor-projection-formula).
2. E/F purely inseparable of degree p^a (p = char F, prime to m): G_E = G_F and c^{p^a} ∈ F for every c ∈ E, so p^a{a', c} = {a', c^{p^a}}; as p^a is invertible modulo m, K_2(E)/m is generated by symbols with one entry in F, and on {a', b} with b ∈ F both sides equal κ(a'^{p^a}) ∪ κ(b) = p^a·h_E{a', b}, since N_{E/F} a' = a'^{p^a}.
3. Separable E/F: by the Chinese remainder theorem take m = ℓ^ν, ℓ prime. Both sides are transitive in towers (Kato's theorem, K2SymbolsBrauer T.4/milnor-transfer-transitivity, and transitivity of corestriction) and commute with base change to an algebraic extension F'/F: res_{F'/F} ∘ N_{E/F} = Σ_i N_{E_i/F'} ∘ res for E ⊗_F F' = ∏_i E_i (T.4/transfer-base-change), and res ∘ cor = Σ cor ∘ res by the Mackey double-coset formula (ProfiniteCohomology Layer 6).
4. Let F' be a prime-to-ℓ closure of F (T.4/prime-to-p-closure). Restriction to F' is injective on ℓ-primary torsion (an element it kills dies over a finite subextension F_1 of degree prime to ℓ, and cor ∘ res = [F_1 : F] on both sides), so it suffices to work over F'. There every finite separable extension is a tower of extensions of degree ℓ (its Galois closure has an ℓ-group as Galois group), and for [E : F'] = ℓ the group K_2(E) is generated by symbols {a, b} with a ∈ F'^× (T.4/p-closed-generation), to which step one applies.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/p-closed-generation`, `K2SymbolsBrauer:T.4/transfer-base-change`, `K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups`

**Acceptance.**

- For E = F(√d) with F = ℚ, m = 2: cor h_E{−1, √d} = h_ℚ{−1, N(√d)} = h_ℚ{−1, −d}.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (3.2) Lemma, p. 263. Tate's projection formula on symbols; excerpt typed from the scan.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.10, (6.10.2), printed p. 242 (PDF p. 250). The projection formula tr_{E/F}(a ∪ b) = a ∪ N_{E/F}(b).

<a id="m-3-symbol-residue-compatibility"></a>

### M.3/symbol-residue-compatibility — The Galois symbol commutes with residues

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/symbol-residue-compatibility`. Implementation: unchecked.

Let F be a field with a discrete valuation v, residue field k(v) and uniformiser π, and let m be invertible in k(v). Let ∂^{tame}_v : K_2(F) → k(v)^× be K2SymbolsBrauer's tame symbol homomorphism (T.3/tame-symbol-hom; with its convention ∂^{tame}_v{u, π} = ū for a v-unit u) and ∂_v : H²(F, μ_m^{⊗2}) → H¹(k(v), μ_m) the residue of M.1/localization-gysin-sequence. Then ∂_v ∘ h_{F,m} = −κ_{k(v)} ∘ ∂^{tame}_v mod m, i.e. ∂_v(κ(u) ∪ κ(π)) = −κ_{k(v)}(ū) and ∂_v(κ(u) ∪ κ(w)) = 0 for v-units u, w.

**Hypotheses and conventions.**

- (F, v) a discretely valued field; m invertible in the residue field. The residue ∂_v is that of M.1/localization-gysin-sequence for the Dedekind scheme Spec O_v with its closed point.

**Construction or proof.**

1. Both sides are bilinear and Steinberg, so it suffices to check on {u, π} and {u, w} (K_2(F) is generated by these, Matsumoto).
2. For units u, w, κ(u) ∪ κ(w) is unramified (comes from H²_et of the henselised valuation ring), so its residue is 0.
3. For {u, π}: by M.1/localization-gysin-sequence, ∂_v(κ(u) ∪ x) = −κ(ū) ∪ ∂_v(x) and ∂_v(κ(π)) = 1, giving −κ(ū); the tame symbol gives ū.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.2/matsumoto`

**Acceptance.**

- For F = ℚ, v = 3, m = 2: ∂_3 h{−1, 3} = −κ_{𝔽_3}(−1) ≠ 0 in H¹(𝔽_3, μ_2) = 𝔽_3^×/𝔽_3^{×2}.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §6, proof of (6.2), p. 270. Tate uses the special case ∂^{tame}_v{z, a} = z^{v(a)} for z ∈ μ_ℓ in proving (6.2); the cohomological residue compatibility is not stated in the paper. Excerpt read from the page image.

<a id="m-3-tate-local"></a>

### M.3/tate-local — Tate's theorem for local fields

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-local`. Implementation: unchecked.

Let F be a locally compact non-discrete field (a finite extension of ℚ_p or of 𝔽_p((t)), or ℝ, or ℂ) and ℓ ≠ char F a prime. (a) h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is bijective (Tate, Corollary to (4.5)). (b) For every r ≥ 1, h_{F,ℓ^r} : K_2(F)/ℓ^r → H²(F, μ_{ℓ^r}^{⊗2}) is bijective. When μ_ℓ ⊂ F, Tate reads h_{F,ℓ} through H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] as z ⊗ (a, b), (a, b) the class of the cyclic algebra A_z(a, b), with the appropriate sign convention (Tate (4.2)); that normalised comparison, with the Hilbert symbol and the local invariant, is K2SymbolsBrauer T.7's and is not restated here.

**Hypotheses and conventions.**

- F locally compact non-discrete; ℓ ≠ char F prime. For F = ℝ only ℓ = 2 gives nonzero groups; for F = ℂ both sides vanish.

**Construction or proof.**

1. By Tate's Lemma (4.1) (tate-injectivity-criterion (a)) it suffices to treat E = F(μ_ℓ), again locally compact non-discrete, so assume μ_ℓ ⊂ F.
2. Injectivity: Br(F)[ℓ] is cyclic — Br(F) ≅ ℚ/ℤ by the local invariant for F nonarchimedean (ClassFieldTheory Layer 5), Br(ℝ) ≅ ½ℤ/ℤ and Br(ℂ) = 0 (the archimedean half of ClassFieldTheory Layer 10) — so Tate's Proposition (4.5) (tate-injectivity-criterion (d)) gives injectivity.
3. Surjectivity: for F nonarchimedean the unramified extension L of degree ℓ is cyclic, and L = F(u^{1/ℓ}) for a unit u since μ_ℓ ⊂ F; restriction to L multiplies local invariants by ℓ, so L splits Br(F)[ℓ], and the classes of H²(F, μ_ℓ^{⊗2}) split by L are the h_{F,ℓ}{u, b} (tate-injectivity-criterion (b)). For F = ℝ and ℓ = 2, h_{ℝ,2}{−1, −1} is the nonzero class; for F = ℂ there is nothing to prove.
4. (b) follows from (a) by tate-adic-comparison (d).

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/tate-injectivity-criterion](#m-3-tate-injectivity-criterion), [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

**Acceptance.**

- For F = ℝ and ℓ = 2: K_2(ℝ)/2 ≅ ℤ/2 generated by {−1, −1}, mapping to Hamilton's quaternions.
- For F = ℚ_p, ℓ odd with μ_ℓ ⊂ ℚ_p: K_2(ℚ_p)/ℓ ≅ μ_ℓ.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §4, Corollary after (4.5), p. 268. Part (a); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (4.2), p. 266. The cyclic-algebra reading of h_1 holds only up to a sign convention; excerpt read from the page image.

<a id="m-3-tate-global"></a>

### M.3/tate-global — Tate's theorem for global fields

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-global`. Implementation: unchecked.

Let F be a number field and ℓ a prime. (a) h_{F,ℓ} : K_2(F)/ℓ → H²(F, μ_ℓ^{⊗2}) is bijective (Tate (5.1)). (b) K_2(F) is a torsion group with no nonzero divisible subgroup, and the adic symbol h_F of adic-galois-symbol induces an isomorphism from the ℓ-primary part K_2(F){ℓ} onto the torsion subgroup of H²(F, ℤ_ℓ(2)) (Tate (5.4)). (c) For every r ≥ 1, h_{F,ℓ^r} : K_2(F)/ℓ^r → H²(F, μ_{ℓ^r}^{⊗2}) is bijective, also for ℓ = 2 when F has real places. Tate proves (a) and (b) for every global field and ℓ ≠ char F; the case of global function fields is a recorded gap of this packet, because ClassFieldTheory's global layers and K2SymbolsBrauer T.5 are stated for number fields only.

**Hypotheses and conventions.**

- F a number field; ℓ any prime.

**Construction or proof.**

1. (a) By Tate's Lemma (4.1) (tate-injectivity-criterion (a)) assume μ_ℓ ⊂ F. Surjectivity: for α ∈ H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] choose d ∈ F^× (weak approximation) that is not an ℓ-th power in F_v at the finitely many places v with α_v ≠ 0; then F_v(d^{1/ℓ}) has degree ℓ over F_v and splits α_v (restriction multiplies local invariants by the local degree; ClassFieldTheory Layers 5 and 10), so F(d^{1/ℓ}) splits α by the Albert–Brauer–Hasse–Noether injectivity (Layer 10), and α = h_{F,ℓ}{d, b} for some b ∈ F^× (tate-injectivity-criterion (b)).
2. Injectivity: verify conditions (i) and (ii) of the Corollary to Tate's Theorem (4.4) (tate-injectivity-criterion (c)). (ii): two classes have a common cyclic splitting field F(d^{1/ℓ}), d chosen as in step one. (i): given h{a, b} = h{c, d} = α, take local solutions at the places where α_v ≠ 0 by Proposition (4.5) applied to F_v (tate-injectivity-criterion (d)), find y = d·N(t), N the norm from F(c^{1/ℓ}), with h{c, y} = α and y close to the local solutions, and find x with h{x, b} = h{x, y} = α by Tate's Lemma (5.2). The proof of (5.2) uses the sum formula Σ_v inv_v = 0 (ClassFieldTheory Layer 10, sumLocalInv_eq_zero), the self-duality of J/J^ℓ under Σ_v inv_v(ξ_v, η_v)_v with F^×/F^{×ℓ} its own exact orthogonal (global reciprocity and the norm-index and existence theorems, ClassFieldTheory Layers 11 and 12), and Kummer theory: an element that is an ℓ-th power locally everywhere is an ℓ-th power.
3. (b) By K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence with S = ∅ (Tate (5.3)), K_2(F) is an extension of ⊕_v k(v)^×, a sum of finite cyclic groups, by K_2(O_F), which is finite (ArithmeticKTheory N.3:ranks/even-K-groups-of-S-integers-are-finite; Tate cites Garland). Such a group is torsion and has no nonzero divisible subgroup. With (a), the Corollary to Tate's Theorem (3.5) (tate-adic-comparison (c)) gives K_2(F){ℓ} ≅ H²(F, ℤ_ℓ(2)){ℓ}, which is the whole torsion subgroup of the ℤ_ℓ-module H²(F, ℤ_ℓ(2)).
4. (c) follows from (a) by tate-adic-comparison (d), valid for every field on which h_{F,ℓ} is bijective. No vanishing of H³(F, μ_ℓ^{⊗2}) is used (for ℓ = 2 it is ⊕_{v real} ℤ/2): bijectivity of h_{F,ℓ} already forces H³(F, ℤ_ℓ(2))[ℓ] = 0.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/adic-galois-symbol](#m-3-adic-galois-symbol), [MotivicEtaleKTheory:M.3/tate-local](#m-3-tate-local), [MotivicEtaleKTheory:M.3/tate-injectivity-criterion](#m-3-tate-injectivity-criterion), [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`

**Acceptance.**

- For F = ℚ and ℓ = 2: K_2(ℚ)/2 ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^×/2 via {−1, −1} and tame symbols, matching H²(ℚ, μ_2^{⊗2}) = Br(ℚ)[2].

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (5.1) Theorem, p. 268. Part (a); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (5.4) Theorem, p. 270. Part (b); Tate's l is any prime different from char F. Excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), §5, after (5.3), p. 270. The input to (b); excerpt read from the page image.

<a id="m-3-tate-torsion-symbols"></a>

### M.3/tate-torsion-symbols — Torsion in K₂ of a global field is generated by root-of-unity symbols

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-torsion-symbols`. Implementation: unchecked.

Let F be a number field and ℓ a prime, E = F(μ_ℓ) and Δ = Gal(E/F). The top row (μ_ℓ ⊗ E^×)^Δ --γ--> K_2F --ℓ--> K_2F → K_2F/ℓK_2F → 0 of Tate's diagram (3.3) (tate-adic-comparison (a)) is exact; that is, the image of γ is the ℓ-torsion (K_2F)_ℓ (Tate (6.1)). In particular, if F contains a primitive ℓ-th root of unity z, every element of order ℓ in K_2F is of the form {z, a} with a ∈ F^×. The kernel of γ is tate-gamma-kernel (Tate (6.3)).

**Hypotheses and conventions.**

- F a number field; ℓ prime. Tate proves the statement for every global field and ℓ ≠ char F; the function-field case belongs to the gap recorded for tate-global.

**Construction or proof.**

1. Tate's proof of (6.1): for x ∈ (K_2F)_ℓ, h_F(x) lies in H²(F, ℤ_ℓ(2))_ℓ = δ(H¹(F, μ_ℓ^{⊗2})) (exactness of the bottom row of (3.3)); i is surjective and δ ∘ i = h_F ∘ γ (tate-adic-comparison (a)), so h_F(x) = h_F(γ(y)) for some y; h_F is injective on K_2(F){ℓ} (tate-global (b)), so x = γ(y).

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison), [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/adic-galois-symbol](#m-3-adic-galois-symbol)

**Acceptance.**

- For F = ℚ and ℓ = 2 (z = −1): every element of order 2 in K_2ℚ is {−1, a} for some a ∈ ℚ^×; for example {−1, −1} itself, and {−1, 2} = 0 because 2 = 1 − (−1).

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (6.1) Theorem, p. 270. Statement; Tate prints F˙ for F^*. Excerpt read from the page image.

<a id="m-3-tate-s-integer"></a>

### M.3/tate-s-integer — Tate's theorem for rings of S-integers

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-s-integer`. Implementation: unchecked.

Let F be a number field, ℓ a prime, S a finite set of places of F containing the archimedean places and all places above ℓ (so 1/ℓ ∈ O_S), O_S = O_{F,S} and r ≥ 1. (a) H²_cont(O_S, ℤ_ℓ(2)) is finite, and the map H²_cont(O_S, ℤ_ℓ(2)) → H²(F, ℤ_ℓ(2)) induced by Spec F → Spec O_S (inflation along G_F → G_{F,S}) is injective, with image the torsion classes whose residues at all v ∉ S vanish. (b) Tate's adic symbol h_F (adic-galois-symbol) maps K_2(O_S) ⊆ K_2(F) (K2SymbolsBrauer T.5) into that image, and the resulting S-integer Galois symbol h_{O_S} : K_2(O_S) ⊗ ℤ_ℓ → H²_cont(O_S, ℤ_ℓ(2)) is an isomorphism. (c) Its reduction h_{O_S,ℓ^r} : K_2(O_S)/ℓ^r → H²_cont(O_S, ℤ_ℓ(2))/ℓ^r → H²_et(O_S, μ_{ℓ^r}^{⊗2}) is an isomorphism; this includes ℓ = 2 when F has real places. (d) h_{O_S} and h_{O_S,ℓ^r} are natural for S ⊆ T, agree with h_F and h_{F,ℓ^r} after restriction to Spec F, and are compatible with the residues at the places outside S. This ring statement is a separate declaration from the field statement tate-global.

**Hypotheses and conventions.**

- F a number field; ℓ prime; S ⊇ S_∞ ∪ {v | ℓ} finite; r ≥ 1.
- The places above ℓ must lie in S (ℓ invertible on O_S): μ_{ℓ^r}^{⊗2} is a locally constant étale sheaf of invertible order on Spec O_S only then, and K-book VI.8.6 quotes Tate's theorem under 1/m ∈ O_S.
- No restriction at ℓ = 2: the real places enter only through H³_cont(O_S, ℤ_2(2)), which vanishes.

**Construction or proof.**

1. Finiteness: H²_cont(O_S, ℤ_ℓ(2)) is a finitely generated ℤ_ℓ-module (M.2/adic-s-integer-cohomology (a)). Tate's global Euler characteristic (ArithmeticGaloisDuality R02.4/global-euler-characteristic) gives rank H¹_cont(O_S, ℤ_ℓ(2)) − rank H²_cont(O_S, ℤ_ℓ(2)) = r_2 for every ℓ, including ℓ = 2, because complex conjugation acts trivially on μ_{ℓ^ν}^{⊗2}, so each real place contributes H⁰(ℝ, μ_{ℓ^ν}^{⊗2}) in full. Inflation H¹_cont(O_S, ℤ_ℓ(2)) → H¹(F, ℤ_ℓ(2)) is injective and H¹(F, ℤ_ℓ(2)) has rank r_2 (Tate (6.5), tate-gamma-kernel (b)), so rank H²_cont(O_S, ℤ_ℓ(2)) = 0.
2. Injectivity and image: put W = ℚ_ℓ/ℤ_ℓ(2). For a compact group G, Tate's Proposition (2.3) (the long exact sequence of 0 → ℤ_ℓ(2) → ℚ_ℓ(2) → W → 0, ArithmeticGaloisDuality R02.1/continuous-section-long-exact and R02.1/rationalization) identifies the torsion of H²(G, ℤ_ℓ(2)) with H¹(G, W)/div, div the maximal divisible subgroup; apply it to G_{F,S} (M.1/s-integer-galois-comparison; H² is torsion by step one) and to G_F. The localization sequence with the discrete coefficients W (M.1/localization-gysin-sequence for Spec O_S, colimit to the generic point) gives 0 → H¹(O_S, W) → H¹(F, W) --∂--> ⊕_{v∉S} H⁰(k(v), ℚ_ℓ/ℤ_ℓ(1)) = ⊕_{v∉S} μ_{ℓ^∞}(k(v)), a sum of finite groups. So the maximal divisible subgroup of H¹(F, W) lies in H¹(O_S, W) and is its maximal divisible subgroup, and H²_cont(O_S, ℤ_ℓ(2)) = H¹(O_S, W)/div → H¹(F, W)/div = H²(F, ℤ_ℓ(2))_tors is injective with image the kernel of ∂.
3. Comparison: K_2(O_S) is finite (ArithmeticKTheory N.3:ranks/even-K-groups-of-S-integers-are-finite) and K_2(F) is torsion (tate-global (b)), so K_2(O_S) ⊗ ℤ_ℓ = K_2(O_S){ℓ}, and Tate's sequence (5.3) (K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence) gives the exact row 0 → K_2(O_S){ℓ} → K_2(F){ℓ} --(∂^{tame}_v)--> ⊕_{v∉S} k(v)^×{ℓ}, with k(v)^×{ℓ} = μ_{ℓ^∞}(k(v)). h_F maps K_2(F){ℓ} isomorphically onto H²(F, ℤ_ℓ(2))_tors (tate-global (b)), and ∂ ∘ h_F = −∂^{tame} on K_2(F){ℓ} (symbol-residue-compatibility at the levels m = ℓ^ν, passed to the colimit). Hence x ∈ K_2(F){ℓ} lies in K_2(O_S){ℓ} if and only if h_F(x) has zero residues, which gives (b).
4. (c): K_2(O_S)/ℓ^r = (K_2(O_S) ⊗ ℤ_ℓ)/ℓ^r ≅ H²_cont(O_S, ℤ_ℓ(2))/ℓ^r by (b), and the coefficient sequence 0 → ℤ_ℓ(2) --ℓ^r--> ℤ_ℓ(2) → μ_{ℓ^r}^{⊗2} → 0 (M.1/etale-twist-sheaf) gives 0 → H²_cont(O_S, ℤ_ℓ(2))/ℓ^r → H²_et(O_S, μ_{ℓ^r}^{⊗2}) → H³_cont(O_S, ℤ_ℓ(2))[ℓ^r] → 0. Here H³_cont(O_S, ℤ_ℓ(2)) = 0: for ℓ odd or F totally imaginary because cd_ℓ G_{F,S} ≤ 2 (M.2/high-degree-real-isomorphism (a)); for ℓ = 2 because H³_cont(O_S, ℤ_2(2)) = lim_ν H³_et(O_S, μ_{2^ν}^{⊗2}) (the H² terms are finite, so there is no lim¹ term; M.1/etale-twist-sheaf) = lim_ν ⊕_{v real} H³(ℝ, μ_{2^ν}^{⊗2}) (M.2/high-degree-real-isomorphism (b)), and H³(ℝ, μ_{2^ν}^{⊗2}) = H³(C_2, ℤ/2^ν) with trivial action is ℤ/2, generated by the class of 2^{ν−1}, with zero transition maps.
5. (d): naturality in S ⊆ T and agreement with h_F follow from the construction through h_F and the naturality of inflation and of the localization sequences.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/adic-galois-symbol](#m-3-adic-galois-symbol), [MotivicEtaleKTheory:M.3/symbol-residue-compatibility](#m-3-symbol-residue-compatibility), [MotivicEtaleKTheory:M.3/tate-gamma-kernel](#m-3-tate-gamma-kernel), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `ArithmeticGaloisDuality:R02.1/rationalization`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`

**Acceptance.**

- For F = ℚ, S = {2, ∞}, ℓ = 2: K_2(ℤ[1/2]) = K_2(ℤ) = ℤ/2, generated by {−1, −1} (Tate's sequence (5.3); 𝔽_2^× = 1), and H²_et(ℤ[1/2], μ_2^{⊗2}) ≅ Br(ℤ[1/2])[2] ≅ ℤ/2 (Pic(ℤ[1/2]) = 0; the invariants at 2 and ∞ sum to 0).
- For F = ℚ, S = {2, ∞}, ℓ = 2, r = 2: K_2(ℤ[1/2])/4 = ℤ/2, and |H²_et(ℤ[1/2], μ_4^{⊗2})| = 2 by the global Euler characteristic (μ_4^{⊗2} ≅ ℤ/4 with trivial action, |H⁰| = 4, |H¹| = |Hom(ℤ_2^×, ℤ/4)| = 8, Euler characteristic |H⁰(ℝ, ℤ/4)|/|ℤ/4| = 1): the theorem holds at ℓ = 2 with a real place.
- Consumers (SpecialValuesBirchTate B.4, B.7, B.8; ArithmeticKTheory N.6, N.7) use the naturality for S ⊆ T.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6 discussion, printed p. 515 (PDF p. 523). The K-book quotes Tate [198] for K_2(O_S)/m ≅ H²_et(O_S, μ_m^{⊗2}) when 1/m ∈ O_S, with no restriction for even m.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (2.3) Proposition, p. 261. The identification of torsion in H² with H¹(G, W)/div used for G_{F,S} and G_F; excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (5.4) Theorem, p. 270. The field input of the comparison; excerpt read from the page image.

<a id="m-3-tate-picard-sequence"></a>

### M.3/tate-picard-sequence — K₂ of S-integers modulo ℓ and the Picard group

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-picard-sequence`. Implementation: unchecked.

Let F be a number field containing μ_ℓ (ℓ prime), S a finite set of places of F containing the archimedean places and the places above ℓ, O_S the ring of S-integers and S_c ⊆ S the set of complex places. There is a natural exact sequence 0 → μ_ℓ ⊗ Pic(O_S) → K_2(O_S)/ℓK_2(O_S) --h_ℓ^S--> (⊕_{v∈S∖S_c} μ_ℓ)_0 → 0, where (⊕ μ_ℓ)_0 is the subgroup of elements (z_v) with Σ_v z_v = 0 (μ_ℓ written additively) and h_ℓ^S, Tate's map induced by the ℓ-th power norm residue symbols at v ∈ S ∖ S_c, is the composite K_2(O_S)/ℓ → K_2(F)/ℓ --h_{F,ℓ}--> H²(F, μ_ℓ^{⊗2}) ≅ μ_ℓ ⊗ Br(F)[ℓ] → ⊕_{v∈S∖S_c} μ_ℓ ⊗ Br(F_v)[ℓ] ≅ ⊕_{v∈S∖S_c} μ_ℓ, the last map by the local invariants (Tate (6.2)). Real places occur in S ∖ S_c only for ℓ = 2.

**Hypotheses and conventions.**

- F a number field with μ_ℓ ⊂ F; S ⊇ S_∞ ∪ {v | ℓ} finite. Tate states (6.2) for global fields, with S finite and nonempty in the function-field case; that case belongs to the gap recorded for tate-global.

**Construction or proof.**

1. Reduce Tate's sequence (5.3) (K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence) modulo ℓ by the snake lemma: (K_2F)_ℓ --d^S--> ⊕_{v∉S} (k(v)^×)_ℓ → K_2(O_S)/ℓ → K_2F/ℓ → ⊕_{v∉S} k(v)^×/ℓ → 0, and identify k(v)^×/ℓ ≅ (k(v)^×)_ℓ ≅ μ_ℓ (raising to the power (q_v − 1)/ℓ, then the root of unity of F reducing to it).
2. By tate-torsion-symbols (K_2F)_ℓ = γ(μ_ℓ ⊗ F^×), and d_v{z, a} = z^{v(a)} for z ∈ μ_ℓ (definition of the tame symbol), so the cokernel of d^S on ℓ-torsion is that of μ_ℓ ⊗ F^× → μ_ℓ ⊗ I_S, which is μ_ℓ ⊗ Pic(O_S) by the exact sequence F^× → I_S → Pic(O_S) → 0 (I_S the fractional ideals of O_S). Tate cites Theorem (5.1) for the surjectivity of γ at this point; the statement used is (6.1).
3. Replace K_2F/ℓ by μ_ℓ ⊗ Br(F)[ℓ] through h_{F,ℓ} (tate-global (a)) and M.1/etale-kummer-sequences. For v ∉ S the residue of symbol-residue-compatibility matches the tame symbol with the local invariant at v, and by the Brauer–Hasse–Noether sequence (ClassFieldTheory Layer 10) with Br(F_v)[ℓ] ≅ ℤ/ℓ for v ∉ S_c (½ℤ/ℤ at real v, which matters only for ℓ = 2), the kernel of K_2F/ℓ → ⊕_{v∉S} μ_ℓ is identified with (⊕_{v∈S∖S_c} μ_ℓ)_0. Exactness of the rows gives the sequence (Tate's proof of (6.2)).

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/tate-torsion-symbols](#m-3-tate-torsion-symbols), [MotivicEtaleKTheory:M.3/symbol-residue-compatibility](#m-3-symbol-residue-compatibility), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`

**Acceptance.**

- For F = ℚ, ℓ = 2, S = {2, ∞}: Pic(ℤ[1/2]) = 0 and (μ_2 ⊕ μ_2)_0 ≅ ℤ/2, so K_2(ℤ[1/2])/2 ≅ ℤ/2, generated by {−1, −1}.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (6.2) Theorem, p. 270. Hypotheses of (6.2); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (6.2) Theorem, p. 270. 0 → μ_l ⊗ Pic O_S → K_2O_S/lK_2O_S → (∐_{v∈S−S_c} μ_l)_0 → 0; excerpt read from the page image.

<a id="m-3-tate-adic-comparison"></a>

### M.3/tate-adic-comparison — Tate's diagram (3.3) and the comparison of K₂ with ℓ-adic cohomology

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-adic-comparison`. Implementation: unchecked.

Let F be a field, ℓ ≠ char F a prime, E = F(μ_ℓ) and Δ = Gal(E/F). (a) (Tate (3.3), (3.4)) There are homomorphisms γ : (μ_ℓ ⊗ E^×)^Δ → (K_2F)_ℓ and i : (μ_ℓ ⊗ E^×)^Δ → H¹(F, μ_ℓ^{⊗2}), with γ(z ⊗ a) = {z, a} and i(z ⊗ a) = z ∪ κ(a) when μ_ℓ ⊂ F, and in general defined through the restriction maps (K_2F)_ℓ → ((K_2E)_ℓ)^Δ and H¹(F, μ_ℓ^{⊗2}) → H¹(E, μ_ℓ^{⊗2})^Δ, which are bijective because [E : F] divides ℓ − 1; i is an isomorphism. They make Tate's diagram (3.3) commute: its top row (μ_ℓ ⊗ E^×)^Δ --γ--> K_2F --ℓ--> K_2F → K_2F/ℓ → 0 is exact except possibly at the left-hand K_2F, its bottom row H¹(F, μ_ℓ^{⊗2}) --δ--> H²(F, ℤ_ℓ(2)) --ℓ--> H²(F, ℤ_ℓ(2)) → H²(F, μ_ℓ^{⊗2}) is exact, and the vertical maps are i, h_F, h_F and h_{F,ℓ}. (b) (Tate (3.5)(a)) ker h_F contains the maximal ℓ-divisible subgroup (K_2F)_{ℓ-div}, and h_F maps (K_2F)_ℓ onto H²(F, ℤ_ℓ(2))_ℓ. (c) (Tate (3.5)(b) and Corollary) If h_{F,ℓ} is injective, then ker h_F = (K_2F)_{ℓ-div}, coker h_F has no ℓ-torsion, and K_2F{ℓ} is the direct sum of its maximal divisible subgroup, killed by h_F, and a subgroup mapped isomorphically by h_F onto H²(F, ℤ_ℓ(2)){ℓ}. (d) If h_{F,ℓ} is bijective, then H³(F, ℤ_ℓ(2))[ℓ] = 0 and h_{F,ℓ^r} : K_2F/ℓ^r → H²(F, μ_{ℓ^r}^{⊗2}) is bijective for every r ≥ 1.

**Hypotheses and conventions.**

- F a field; ℓ ≠ char F prime; r ≥ 1.
- (c) needs only injectivity of h_{F,ℓ}; (d) needs bijectivity.

**Construction or proof.**

1. (a) For μ_ℓ ⊂ F, i is an isomorphism by Kummer theory (F^×/ℓ ≅ H¹(F, μ_ℓ), Hilbert 90). In general, Tate's Lemma (3.4): for a finite Galois extension with group of order n, the kernel and cokernel of K_2F → (K_2E)^Δ and of H^j(F, M) → H^j(E, M)^Δ are killed by n, because of transfers with tr ∘ res = n and res ∘ tr = Σ_{s∈Δ} s (K2SymbolsBrauer T.4/restriction-transfer-degree, M.1/twisted-cohomology-ring); n divides ℓ − 1. The left square commutes: δ(i(z ⊗ a)) is the class of the cocycle l⁻¹d(lζ ∪ dα) = dζ ∪ dα, which is h(γ(z ⊗ a)) (Tate, p. 264); the other squares commute by construction (adic-galois-symbol). Exactness of the bottom row is the coefficient sequence 0 → ℤ_ℓ(2) --ℓ--> ℤ_ℓ(2) → μ_ℓ^{⊗2} → 0 (M.1/continuous-limit-comparison (d)).
2. (b) h_F((K_2F)_{ℓ-div}) is an ℓ-divisible subgroup of H²(F, ℤ_ℓ(2)), hence zero by Tate's Proposition (2.1) (ArithmeticGaloisDuality R02.1/rationalization); the surjectivity onto H²(F, ℤ_ℓ(2))_ℓ = δ(H¹(F, μ_ℓ^{⊗2})) follows from the left square and the surjectivity of i.
3. (c) Diagram chase in (3.3) using (b) and the injectivity of h_{F,ℓ}; for the Corollary, the image of h_F contains H²(F, ℤ_ℓ(2)){ℓ} because coker h_F has no ℓ-torsion, and an extension of an ℓ-primary group by an ℓ-divisible group splits.
4. (d) The composite K_2F/ℓ → H²(F, ℤ_ℓ(2))/ℓ → H²(F, μ_ℓ^{⊗2}) is h_{F,ℓ}; the second map is injective with cokernel H³(F, ℤ_ℓ(2))[ℓ], so bijectivity forces H³(F, ℤ_ℓ(2))[ℓ] = 0, hence H³(F, ℤ_ℓ(2))[ℓ^r] = 0 and H²(F, ℤ_ℓ(2))/ℓ^r ≅ H²(F, μ_{ℓ^r}^{⊗2}). K_2F/ℓ^r → H²(F, ℤ_ℓ(2))/ℓ^r is onto because H² = im h_F + ℓH² gives H² = im h_F + ℓ^r H², and one-to-one because h_F(x) = ℓ^r y forces y ∈ im h_F (coker h_F has no ℓ-torsion, by (c)), so x ∈ ℓ^r K_2F + ker h_F = ℓ^r K_2F, as ker h_F = (K_2F)_{ℓ-div} ⊆ ℓ^r K_2F.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/adic-galois-symbol](#m-3-adic-galois-symbol), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `ArithmeticGaloisDuality:R02.1/rationalization`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.2/matsumoto`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `K2SymbolsBrauer:T.4`

**Acceptance.**

- For F = ℝ and ℓ = 2, h_{ℝ,2} is bijective, and (d) gives K_2(ℝ)/2^r ≅ ℤ/2 ≅ H²(C_2, ℤ/2^r) (trivial action on μ_{2^r}^{⊗2}) for every r.
- For F algebraically closed, K_2(F) is divisible, so ker h_F = K_2(F) = (K_2F)_{ℓ-div}, and H²(F, ℤ_ℓ(2)) = 0.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (3.3) and (3.4) Lemma, pp. 263-264. Diagram (3.3); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (3.5) Theorem and Corollary, p. 265. Parts (b) and (c); (d) is the prime-power consequence drawn from (c). Excerpt read from the page image.

<a id="m-3-tate-injectivity-criterion"></a>

### M.3/tate-injectivity-criterion — Tate's criterion for injectivity of the Galois symbol modulo ℓ

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-injectivity-criterion`. Implementation: unchecked.

Let F be a field and ℓ ≠ char F a prime. (a) (Tate (4.1)) With E = F(μ_ℓ): if h_{E,ℓ} is injective (resp. bijective), so is h_{F,ℓ}. Assume now μ_ℓ ⊂ F. (b) (Tate (4.3)) For a, b ∈ F^×: {a, b} ∈ ℓK_2F ⟺ h_{F,ℓ}{a, b} = 0 ⟺ b is a norm from F(a^{1/ℓ}); and when a ∉ F^{×ℓ}, the classes of H²(F, μ_ℓ^{⊗2}) whose restriction to F(a^{1/ℓ}) vanishes are exactly the h_{F,ℓ}{a, b}, b ∈ F^×. (c) (Tate (4.4) and Corollary) Let u : F^× ⊗ F^× → H²(F, μ_ℓ^{⊗2}), a ⊗ b ↦ h_{F,ℓ}{a, b}. Then ker h_{F,ℓ} ≅ Ker u/(Ker u)', where (Ker u)' is the subgroup generated by the decomposable elements a ⊗ b of Ker u; so h_{F,ℓ} is injective if and only if Ker u is generated by decomposable elements, and this holds when (i) for a, b, c, d ∈ F^× with u(a ⊗ b) = u(c ⊗ d) there are x, y ∈ F^× with u(a ⊗ b) = u(x ⊗ b) = u(x ⊗ y) = u(c ⊗ y) = u(c ⊗ d), and (ii) for a_1, a_2, b_1, b_2 ∈ F^× there are c_1, c_2, d ∈ F^× with u(a_1 ⊗ b_1) = u(c_1 ⊗ d) and u(a_2 ⊗ b_2) = u(c_2 ⊗ d). (d) (Tate (4.5)) If Br(F)[ℓ] is cyclic, conditions (i) and (ii) hold and h_{F,ℓ} is injective.

**Hypotheses and conventions.**

- F a field; ℓ ≠ char F prime; in (b)–(d) μ_ℓ ⊂ F.
- u and conditions (i), (ii) are stated through h_{F,ℓ}, without choosing a primitive root; Tate's cyclic-algebra form (a, b) differs from them by the choice of z ⊗ −, and the normalised Brauer-valued symbol is K2SymbolsBrauer T.7's.

**Construction or proof.**

1. (a) [E : F] divides ℓ − 1, so restriction followed by transfer is an isomorphism on ℓ-primary groups on both sides (K2SymbolsBrauer T.4/restriction-transfer-degree, M.1/twisted-cohomology-ring), and h commutes with restriction and transfer (galois-symbol, symbol-norm-compatibility); the square K_2F/ℓ → (K_2E/ℓ)^Δ over H²(F) → H²(E)^Δ gives the claim (Tate's proof of (4.1)).
2. (b) For a ∉ F^{×ℓ}, L = F(α), α^ℓ = a, is cyclic of degree ℓ; choosing a primitive root z, κ(a) = z ⊗ χ with χ : Gal(L/F) ≅ ℤ/ℓ, and h{a, b} = z ⊗ (χ ∪ κ(b)), where χ ∪ κ(b) ∈ H²(F, μ_ℓ) ⊆ Br(F) (M.1/etale-kummer-sequences) is the inflation of the image of b under the periodicity isomorphism F^×/N L^× = Ĥ⁰(Gal(L/F), L^×) ≅ H²(Gal(L/F), L^×) (cup product with δχ; ClassFieldTheory Layer 0), and inflation H²(Gal(L/F), L^×) → Br(F) is injective with image the classes split by L (Hilbert 90, ProfiniteCohomology Layer 9). If b = N_{L/F} β then {a, b} = N_{L/F}{a, β} = N_{L/F}{α^ℓ, β} = ℓN_{L/F}{α, β} (K2SymbolsBrauer T.4/milnor-projection-formula).
3. (c) Tate's argument: Ker t ⊆ Ker u, where t : F^× ⊗ F^× → K_2F/ℓ is onto with kernel generated by the decomposable elements a ⊗ (1 − a) and a^ℓ ⊗ b (Matsumoto, K2SymbolsBrauer T.2/matsumoto); by (b) the decomposable elements of Ker t and of Ker u coincide, so ker h_{F,ℓ} ≅ Ker u/Ker t = Ker u/(Ker u)'. Under (i) and (ii) every element of F^× ⊗ F^× is congruent modulo (Ker u)' to a decomposable one (induction on the number of terms), so Ker u = (Ker u)'.
4. (d) For Br(F)[ℓ] ≅ ℤ/ℓ (or 0), view u as a bilinear form on the 𝔽_ℓ-space F^×/F^{×ℓ}; (ii) is clear and (i) is solved by linear algebra on the forms x ↦ u(x ⊗ b), x ↦ u(x ⊗ d), using that for ℓ ≠ 2 the form is alternating (Tate's proof of (4.5); for ℓ = 2 his Remark 3).

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/symbol-norm-compatibility](#m-3-symbol-norm-compatibility), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers`

**Acceptance.**

- For F = ℝ and ℓ = 2: Br(ℝ)[2] = ℤ/2 is cyclic, and (d) gives injectivity of h_{ℝ,2}; (b) reads: {−1, b} ∈ 2K_2(ℝ) iff b > 0, the norms from ℂ.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (4.1) Lemma, p. 265. Part (a); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (4.3) Proposition, p. 266. Part (b); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (4.4) Theorem, p. 266. Part (c); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (4.5) Proposition, p. 267. Part (d); excerpt read from the page image.

<a id="m-3-tate-gamma-kernel"></a>

### M.3/tate-gamma-kernel — The kernel of γ and the rank of H¹(F, ℤ_ℓ(2))

**Theorem.** Identifier: `MotivicEtaleKTheory:M.3/tate-gamma-kernel`. Implementation: unchecked.

Let F be a number field, ℓ a prime, r_2 the number of complex places of F, E = F(μ_ℓ) and Δ = Gal(E/F). (a) (Tate (6.3)) The kernel of γ : (μ_ℓ ⊗ E^×)^Δ → K_2F (tate-adic-comparison (a)) is an elementary abelian group of order ℓ^{r_2+ε}, where ε = 1 if H⁰(F, μ_ℓ^{⊗2}) ≠ 0, i.e. [F(μ_ℓ) : F] ≤ 2, and ε = 0 otherwise. In particular, if F contains a primitive ℓ-th root of unity z and A = {a ∈ F^× : {z, a} = 0}, then (A : F^{×ℓ}) = ℓ^{r_2+1}. (b) (Tate (6.5) and Corollary) H¹(F, ℤ_ℓ(2)) ≅ ℤ_ℓ^{r_2} × ℤ/ℓ^m, where m is the largest integer ≥ 0 such that F(μ_{ℓ^m}) is contained in a composite of quadratic extensions of F; so H¹(F, ℚ_ℓ(2)) has dimension r_2 over ℚ_ℓ.

**Hypotheses and conventions.**

- F a number field; ℓ prime. Tate states (6.3) and (6.5) for global fields (r_2 = 0 for function fields); the function-field case belongs to the gap recorded for tate-global.

**Construction or proof.**

1. (a), case μ_ℓ ⊂ F: take S as in tate-picard-sequence and large enough that Pic(O_S) has order prime to ℓ. Extending the diagram of (6.2) to the left gives 0 → Ker γ → μ_ℓ ⊗ O_S^× → (K_2O_S)_ℓ → 0, using the surjectivity of γ (tate-torsion-symbols). |μ_ℓ ⊗ O_S^×| = ℓ^s with s = |S| (S-unit theorem: O_S^× ≅ μ(F) × ℤ^{s−1}, from Dirichlet's unit theorem and the S-unit sequence, ArithmeticKTheory N.2/S-unit-and-class-group-sequence), and |(K_2O_S)_ℓ| = |K_2O_S/ℓ| = ℓ^{s−r_2−1} by tate-picard-sequence, so |Ker γ| = ℓ^{r_2+1}.
2. (a), general case: Galois descent along E/F with G = Δ of order prime to ℓ, computing in the Grothendieck group of finite G-modules (Tate's Lemma (6.4)): [μ_ℓ ⊗ O_S^×] = [μ_ℓ ⊗ μ_ℓ] + [(⊕_{v∈S} μ_ℓ)_0] from the regulator lattice of the S-units (whose real span is the hyperplane (⊕_{v∈S} ℝ)_0, a G-module defined over ℚ), [(K_2O_S)_ℓ] = [(⊕_{v∈S∖S_c} μ_ℓ)_0], hence [Ker γ] = [μ_ℓ ⊗ μ_ℓ] + [⊕_{v∈S_c} μ_ℓ]; taking G-invariants gives the order ℓ^{r_2+ε}.
3. (b) X = H¹(F, ℤ_ℓ(2)): X/ℓX ≅ ker δ ≅ Ker γ (h_F injective on K_2(F){ℓ}, tate-global (b); i an isomorphism), finite of order ℓ^{r_2+ε} by (a), so X is finitely generated (Corollary to Tate's Proposition (2.1)); its torsion is the image of H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) (Tate's Proposition (2.3)), cyclic of order ℓ^m and nonzero exactly when ε = 1. Hence X ≅ ℤ_ℓ^{r_2} × ℤ/ℓ^m.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/tate-picard-sequence](#m-3-tate-picard-sequence), [MotivicEtaleKTheory:M.3/tate-torsion-symbols](#m-3-tate-torsion-symbols), [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison), [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, `mathlib:NumberField.Units.finrank_eq`, [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), `ArithmeticGaloisDuality:R02.1/rationalization`

**Acceptance.**

- For F = ℚ and ℓ = 2: r_2 = 0 and ε = 1, so Ker γ has order 2: the classes of 1 and 2 in ℚ^×/ℚ^{×2} satisfy {−1, a} = 0, while {−1, −1} ≠ 0. And H¹(ℚ, ℤ_2(2)) ≅ ℤ/8 (m = 3: ℚ(μ_8) = ℚ(i, √2) is a composite of quadratic fields, ℚ(μ_16) is not), matching w_2(ℚ) = 24.

**Sources.**

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (6.3) Theorem, p. 271. Part (a); excerpt read from the page image.

[Tate1976](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0036/LOG_0020.pdf), (6.5) Theorem, p. 272. Part (b); excerpt read from the page image.

### Remaining work for M.3

- Lemma-level refinement of tate-global into a node for Tate's Lemma (5.2) (global Kummer duality).
- The global function-field case of Tate's theorems (gap: no global class field theory for function fields upstream).

<a id="m-4"></a>

## M.4 — Cycle complexes and motivic cohomology

Simplicial/cubical cycles, moving, localization and products; low weights, the field Milnor diagonal and the separate Dedekind sheaf complexes and Gersten maps.

**Planets:** Bloch's higher Chow groups, Moving lemma, Bloch's localization theorem, Weight-one motivic cohomology, Nesterenko–Suslin–Totaro isomorphism.

**Other-layer prerequisites:** None.

<a id="m-4-algebraic-simplex"></a>

### M.4/algebraic-simplex — The algebraic simplices and the cubes

**Construction.** Identifier: `MotivicEtaleKTheory:M.4/algebraic-simplex`. Implementation: unchecked.

For a base scheme B and n ≥ 0, the algebraic n-simplex is Δ^n_B = Spec_B O_B[t_0, …, t_n]/(t_0 + ⋯ + t_n − 1) ≅ 𝔸^n_B. An order-preserving map g : [m] → [n] gives the affine map Δ(g) : Δ^m_B → Δ^n_B with Δ(g)^*(t_j) = Σ_{i ∈ g^{−1}(j)} t_i, making Δ^•_B a cosimplicial B-scheme; the coface ∂_i : Δ^{n−1} → Δ^n has ∂_i^*(t_j) = t_j for j < i, 0 for j = i, t_{j−1} for j > i (its image is the face t_i = 0), and the codegeneracy s_i : Δ^n → Δ^{n−1} has s_i^*(t_j) = t_j for j < i, t_i + t_{i+1} for j = i, t_{j+1} for j > i. A face of Δ^n is a closed subscheme t_{i_1} = ⋯ = t_{i_r} = 0 with r ≤ n; the intersection of all n + 1 hyperplanes t_i = 0 is empty. The algebraic n-cube is □^n_B = (ℙ^1_B ∖ {1})^n with coordinates y_1, …, y_n; its codimension-one faces are y_i = 0 and y_i = ∞, its faces are their intersections, and its degeneracies are the coordinate projections □^n → □^{n−1} forgetting one coordinate. The isomorphism 𝔸^1 ≅ ℙ^1 ∖ {1}, x ↦ 1 − 1/x, sends 0 ↦ ∞ and 1 ↦ 0, so □^n_B ≅ 𝔸^n_B, carrying Totaro's faces y_i ∈ {∞, 0} to the faces x_i ∈ {0, 1} of the cube (𝔸^1)^n used by Levine.

**Hypotheses and conventions.**

- B a scheme (in applications a field or a Dedekind scheme).

**Construction or proof.**

1. Define Δ^n_B as the relative spectrum; verify the cosimplicial identities on coordinate rings.
2. Faces are complete intersections of codimension r, defined by a regular sequence; their intersections are faces.
3. Define □^n as (ℙ^1 ∖ {1})^n with its faces δ^ε_i (coordinate i set to ε ∈ {0, ∞}) and degeneracies (coordinate projections); the coordinatewise isomorphism x ↦ 1 − 1/x identifies it with 𝔸^n and its faces with those of Levine's cube.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.AffineSpace`

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.simplex** (constructor): Δ^n_B as a B-scheme, functorial in B.
- **TauCeti.HigherChow.coface** (data): The coface closed immersions ∂_i : Δ^{n−1}_B → Δ^n_B.
- **TauCeti.HigherChow.codegeneracy** (data): The codegeneracy maps s_i : Δ^n_B → Δ^{n−1}_B.
- **TauCeti.HigherChow.cosimplicial_identities** (relation): ∂_j ∂_i = ∂_i ∂_{j−1} for i < j, and the remaining cosimplicial identities.
- **TauCeti.HigherChow.simplex_iso_affine** (equivalence): Δ^n_B ≅ 𝔸^n_B over B.
- **TauCeti.HigherChow.cube** (constructor): □^n_B = (ℙ¹_B ∖ {1})^n with faces δ^ε_i, ε ∈ {0, ∞}.
- **TauCeti.HigherChow.face_regular** (characterisation): Every face of Δ^n_B (resp. □^n_B) of codimension r is cut out by a regular sequence of length r.
- **TauCeti.HigherChow.simplexMap** (functoriality): For an order-preserving g : [m] → [n], the affine map Δ(g) : Δ^m_B → Δ^n_B with Δ(g)^*(t_j) = Σ_{i ∈ g^{−1}(j)} t_i; Δ(id) = id and Δ(g ∘ h) = Δ(g) ∘ Δ(h).
- **TauCeti.HigherChow.cubeFace** (data): The face closed immersions δ^ε_i : □^{n−1}_B → □^n_B (insert ε ∈ {0, ∞} as the i-th coordinate) and the degeneracies □^n_B → □^{n−1}_B forgetting the i-th coordinate, satisfying the cubical identities.
- **TauCeti.HigherChow.cube_iso_affine** (equivalence): □^n_B ≅ 𝔸^n_B over B by x ↦ 1 − 1/x in each coordinate, carrying the faces y_i = ∞ and y_i = 0 to x_i = 0 and x_i = 1.

**Discriminating tests.**

- **HigherChow.test_simplex_zero** (degenerate): Δ^0_B ≅ B.
- **HigherChow.test_simplex_one** (computation): Δ^1_k ≅ 𝔸^1_k with exactly two codimension-one faces, the k-points t_0 = 0 and t_1 = 0.
- **HigherChow.test_base_change** (compatibility): Δ^n_{B'} ≅ Δ^n_B ×_B B' for every B' → B.
- **HigherChow.test_faces_not_coordinate_hyperplanes** (non-example): Δ^n_B is not 𝔸^{n+1}_B with its coordinate hyperplanes: in Δ^n_B the n + 1 faces t_i = 0 have empty common intersection (t_0 + ⋯ + t_n = 1), whereas in 𝔸^{n+1}_B the coordinate hyperplanes meet in the origin; so Δ^n has exactly 2^{n+1} − 1 nonempty faces (3 for n = 1).

**Consumers.**

- MotivicEtaleKTheory:M.4/admissible-cycles: Cycles on X × Δ^n meeting all faces properly.
- Polylogarithms:P.5 (request to M.4): Goncharov's affine simplices and the cubical model with ∞-face normalisation.
- MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes: C_*F(U) = F(U × Δ^•) uses the same cosimplicial scheme.

**Acceptance.**

- Δ^1_B ≅ 𝔸^1_B with vertices t_0 = 0 and t_1 = 0; Δ^0_B = B.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 17.1, printed p. 135 (PDF p. 150). The simplices and their faces enter Bloch's definition.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed p. 180 (PDF p. 4). Totaro's identification 𝔸^1 ≅ ℙ^1 − {1} (scan text: x ↦ 1 − 1/x permutes 1, 0, ∞), which turns the cube faces {0, 1} into {∞, 0}.

<a id="m-4-admissible-cycles"></a>

### M.4/admissible-cycles — Cycles meeting the faces properly

**Definition.** Identifier: `MotivicEtaleKTheory:M.4/admissible-cycles`. Implementation: unchecked.

Let X be an equidimensional scheme of finite type over a field (or, in dimension-indexed form, essentially of finite type over a Dedekind scheme B) and q, n ≥ 0. Then z^q(X, n) is the free abelian group on the integral closed subschemes Z ⊂ X × Δ^n of codimension q such that for every face F ⊂ Δ^n, every irreducible component of Z ∩ (X × F) has codimension ≥ q in X × F. In the dimension indexing, for r ∈ ℤ (r may be negative: CH^1(Spec k, 1) = CH_{−1}(Spec k, 1)), z_r(X, n) is generated by the integral Z ⊂ X × Δ^n of dimension r + n such that every irreducible component of Z ∩ (X × F) has dimension ≤ r + dim F; it needs no equidimensionality. Over a Dedekind scheme B, for X of finite type over B, the dimension of an integral B-scheme V is Geisser's: the Krull dimension if V lies in a closed fibre, and the dimension of the generic fibre plus one if V is flat over B; for X essentially of finite type and equidimensional over B (local and semilocal schemes) the codimension-indexed groups z^q(X, n) are used, as in Geisser §3. Cycles are elements of Mathlib's AlgebraicCycle (locally finite functions on points) with finite support.

**Hypotheses and conventions.**

- X equidimensional of finite type over a field k for the codimension-indexed groups; X of finite type over a field or over a Dedekind scheme B for the dimension-indexed groups; X essentially of finite type and equidimensional over B for the codimension-indexed groups over B.

**Construction or proof.**

1. Define the condition 'meets all faces properly' componentwise; it is stable under passage to components, so the admissible cycles form a free subgroup of AlgebraicCycle(X × Δ^n, ℤ).
2. Show that intersection with a face X × ∂_i(Δ^{n−1}) is defined on admissible cycles (proper intersection with a regular codimension-one face; MVW 17A.1) and lands in z^q(X, n−1).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), `mathlib:AlgebraicGeometry.AlgebraicCycle`

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.cycles** (constructor): z^q(X, n) as a subgroup of AlgebraicCycle(X × Δ^n, ℤ).
- **TauCeti.HigherChow.mem_cycles_iff** (characterisation): A cycle lies in z^q(X, n) iff each component has codimension q and meets every face properly.
- **TauCeti.HigherChow.face_restrict** (data): Intersection with the i-th face, z^q(X, n) → z^q(X, n − 1).
- **TauCeti.HigherChow.cyclesDim** (constructor): The dimension-indexed groups z_r(X, n), r ∈ ℤ, over a field or (with Geisser's dimension) over a Dedekind base.
- **TauCeti.HigherChow.cycles_eq_cyclesDim** (compatibility): For X equidimensional of dimension d over a field, z^q(X, n) = z_{d−q}(X, n).

**Discriminating tests.**

- **HigherChow.test_cycles_zero_n** (degenerate): z^q(X, 0) is the group of codimension-q cycles of X.
- **HigherChow.test_point** (computation): z^1(Spec k, 1) is generated by the closed points of Δ^1_k ≅ 𝔸^1_k other than the two vertices.
- **HigherChow.test_algebraic_cycle** (compatibility): z^q(X, 0) agrees with the codimension-q part of Mathlib's AlgebraicCycle X ℤ with finite support.
- **HigherChow.test_vertex_not_admissible** (non-example): The vertex t_0 = 0 of Δ^1_k is a codimension-one cycle on Δ^1_k that does not meet the face t_0 = 0 properly, so it is not in z^1(Spec k, 1).

**Consumers.**

- Bloch's higher Chow groups (cycle-complex): Degree-n term of the cycle complex.
- Geisser2004 §1 notation and Theorem 1.1: The dimension-indexed groups over a Dedekind base define Z(n) for S-integers.
- MotivesAndAlgebraicCycles:MC.4 request to M.4: Bloch's cycle complexes z^i(X, *) (MVW 17.1).

**Acceptance.**

- z^q(X, n) = 0 if q > dim X + n.
- z^0(X, n) = ℤ^{(components of X × Δ^n)} since every codimension-0 subscheme meets faces properly.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 17.1, printed p. 135 (PDF p. 150). Bloch's condition, as stated in MVW.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §3, printed p. 778 (PDF p. 6). The codimension-indexed groups over a Dedekind base (X × Δ^i in the source).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §1, Notation, printed p. 775 (PDF p. 3). Geisser's dimension of integral B-schemes (generic fibre dimension plus one for flat V), used in the dimension indexing over B.

<a id="m-4-cycle-complex"></a>

### M.4/cycle-complex — Bloch's cycle complex and higher Chow groups

**Construction.** Identifier: `MotivicEtaleKTheory:M.4/cycle-complex`. Implementation: unchecked.

For X as in admissible-cycles and q ≥ 0, the groups z^q(X, n), n ≥ 0, with face maps the intersections with the faces ∂_i and degeneracy maps the flat pullbacks along the codegeneracies s_i, form a simplicial abelian group z^q(X, •); its associated chain complex has differential d = Σ_i (−1)^i ∂_i^*. Bloch's higher Chow groups are CH^q(X, n) = H_n(z^q(X, •)). The cycle complex of sheaves is Z(q)_X = z^q(−, •)[−2q] on the small Zariski (or étale) site of X, a cohomologically graded complex with z^q(−, 2q − i) in degree i; for X over a field, motivic cohomology is defined as H^{p}(X, Z(q)) := CH^q(X, 2q − p), the cohomology of the global sections Z(q)_X(X); zariski-descent identifies it with the Zariski hypercohomology of Z(q)_X. Over a Dedekind base the Zariski hypercohomology is the definition (dedekind-cycle-complex), since global sections compute it only over a semilocal base. For an abelian group A, Z(q) ⊗ A and H^{p}(X, A(q)) are defined by tensoring the free complex. The definition does not refer to K-theory.

**Hypotheses and conventions.**

- X equidimensional, of finite type over a field (or over a Dedekind scheme for the dimension-indexed version); q ≥ 0.

**Construction or proof.**

1. The intersections with faces satisfy the simplicial identities because faces are compatible (cosimplicial identities of algebraic-simplex); degeneracies are pullbacks along codegeneracies.
2. Define CH^q(X, n) as homology of the associated chain complex (equivalently of the normalised Moore complex) and Z(q)_X as the presheaf of complexes U ↦ z^q(U, 2q − •); each U ↦ z^q(U, n) is a sheaf for the Zariski topology (cycles glue) and for the étale topology (Geisser Lemma 3.1).
3. Define H^{p}(X, Z(q)) := CH^q(X, 2q − p) and H^{p}(X, A(q)) via the complex tensored with A.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles), [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex)

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.complex** (constructor): z^q(X, •) as a simplicial abelian group and its chain complex.
- **TauCeti.HigherChow.CH** (constructor): CH^q(X, n) = H_n(z^q(X, •)).
- **TauCeti.HigherChow.motivicComplex** (constructor): Z(q)_X = z^q(−, •)[−2q] as a complex of Zariski (and étale) sheaves on X.
- **TauCeti.HigherChow.H** (constructor): H^{p}(X, A(q)) for an abelian group A, with H^{p}(X, Z(q)) = CH^q(X, 2q − p).
- **TauCeti.HigherChow.d_sq** (relation): d ∘ d = 0 with d = Σ (−1)^i ∂_i^*.
- **TauCeti.HigherChow.CH_neg** (simp): CH^q(X, n) = 0 for n < 0, and H^{p}(X, Z(q)) = 0 for p > 2q.
- **TauCeti.HigherChow.coefficient_long_exact** (relation): For 0 → A' → A → A'' → 0 there is a long exact sequence … → H^{p}(X, A'(q)) → H^{p}(X, A(q)) → H^{p}(X, A''(q)) → H^{p+1}(X, A'(q)) → …; in particular the Bockstein triangle Z(q) --m--> Z(q) → Z/m(q).
- **TauCeti.HigherChow.H_mod_m** (relation): 0 → H^{p}(X, Z(q))/m → H^{p}(X, Z/m(q)) → H^{p+1}(X, Z(q))[m] → 0 is exact.

**Discriminating tests.**

- **HigherChow.test_CH_zero** (compatibility): CH^q(X, 0) is the Chow group CH^q(X) of SchemeAndStackFoundations SF.5.
- **HigherChow.test_q_zero** (degenerate): For X = Spec k: CH^0(Spec k, 0) = ℤ and CH^0(Spec k, n) = 0 for n > 0.
- **HigherChow.test_field_weight_one** (computation): CH^1(Spec k, 1) ≅ k^×, the class of a k-rational point (t_0, t_1) of Δ^1_k with t_0 t_1 ≠ 0 going to −t_0/t_1 (a closed point with residue field E goes to N_{E/k} of this value). The sign is forced: the line α t_0 + β t_1 + γ t_2 = 0 in Δ^2_k (αβγ ≠ 0, so it misses the vertices) has faces on t_0 = 0, t_1 = 0, t_2 = 0 with values γ/β, γ/α, β/α, (value 1 when the line is parallel to that edge), and (γ/β)(γ/α)^{−1}(β/α) = 1, whereas the unsigned ratio t_0/t_1 gives −1.
- **HigherChow.test_not_naive_cycles** (non-example): Requiring proper intersection only with the codimension-one faces does not give a simplicial abelian group: the line t_1 = t_2 in Δ^2_k meets each edge t_i = 0 in at most one point, so it meets every codimension-one face properly, but it passes through the vertex (1, 0, 0), and its face on t_1 = 0 is a vertex of Δ^1, which is not in z^1(Spec k, 1); so this line is not in z^1(Spec k, 2).

**Consumers.**

- Kbook2013 VI Theorem 4.1 and Remark 4.2.2: Motivic cohomology H^n(X, Z/m(i)) and higher Chow groups CH^i(X, n) in the norm residue and spectral-sequence statements.
- MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, M.6a/coniveau-cycle-layer, M.8/finite-etale-chern: The sibling packet's actual cycle complexes (request to M.4).
- MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow: Comparison H^{n,i}(X, ℤ) ≅ CH^i(X, 2i − n) (MVW 19.1) needs this side.
- Polylogarithms:P.5 and GeneralizedHeegnerCycles:GH.0/GH.1: Regulators on higher Chow groups and Chow groups with rational coefficients.

**Acceptance.**

- CH^q(X, 0) = CH^q(X) (chow-degree-zero).
- H^{p}(Spec k, Z(q)) = 0 for p > q (vanishing-above-weight) and H^{1}(Spec k, Z(1)) = k^× (weight-zero-and-one).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 17.1, printed p. 135 (PDF p. 150). Bloch's simplicial cycle group and its face maps.

[Spitzweck2018](https://arxiv.org/pdf/1207.4078v3), §3 (Motivic complexes I), PDF p. 8. The cohomological indexing Z(r) = z^r(−, 2r − •).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §3, Lemma 3.1, printed p. 778 (PDF p. 6). The termwise sheaf property of the cycle complex for the étale (hence Zariski) topology.

<a id="m-4-cubical-cycle-complex"></a>

### M.4/cubical-cycle-complex — The cubical cycle complex

**Construction.** Identifier: `MotivicEtaleKTheory:M.4/cubical-cycle-complex`. Implementation: unchecked.

For X as in admissible-cycles and q ≥ 0, let c^q(X, n) be the free abelian group on integral closed Z ⊂ X × □^n of codimension q meeting all faces of □^n properly, and let z^q_□(X, n) = c^q(X, n)/(degenerate cycles), the degenerate cycles being pullbacks along the coordinate projections □^n → □^{n−1}. With d = Σ_{i=1}^{n} (−1)^{i} (∂^∞_i − ∂^0_i), z^q_□(X, •) is a chain complex; the cubical higher Chow groups are its homology. The ∞-normalised subcomplex z^q_{□,N}(X, •), generated in degree n by the cycles Z with ∂^0_i Z = 0 for 1 ≤ i ≤ n and ∂^∞_i Z = 0 for 2 ≤ i ≤ n (on which d restricts to −∂^∞_1), includes quasi-isomorphically into z^q_□(X, •) for X of finite type over a field (Park 2021, Theorem 2.2.1, after Bloch). For X, Y over a field k there is an external product z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X ×_k Y, n + m) given by the product of cycles under □^n × □^m = □^{n+m}; it is not defined over a Dedekind base, where the product of two cycles in the same closed fibre does not meet the faces properly.

**Hypotheses and conventions.**

- X as in admissible-cycles; q ≥ 0; for the external product and the normalisation, X and Y of finite type over a field.

**Construction or proof.**

1. Faces of □^n are products of faces of ℙ¹ ∖ {1} at 0 and ∞; admissibility is preserved by intersection with faces and by external products of cycles.
2. Quotient by degenerate cycles; d² = 0 from the cubical identities.
3. Define the external product by the product of cycles; it is compatible with d up to the Koszul sign.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles)

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.cubeCycles** (constructor): z^q_□(X, n), admissible cubical cycles modulo degenerate ones.
- **TauCeti.HigherChow.cube_d_sq** (relation): d ∘ d = 0 for d = Σ (−1)^i (∂^∞_i − ∂^0_i).
- **TauCeti.HigherChow.cubeProduct** (constructor): For X, Y over a field k, the external product z^p_□(X, n) ⊗ z^r_□(Y, m) → z^{p+r}_□(X ×_k Y, n + m), Z ⊗ W ↦ Z × W under □^n × □^m = □^{n+m}.
- **TauCeti.HigherChow.cube_leibniz** (relation): d(x × y) = dx × y + (−1)^n x × dy.
- **TauCeti.HigherChow.milnorCycle** (constructor): For a_i ∈ F^× ∖ {1}, the point (a_1, …, a_n) ∈ □^n_F as a cycle in z^n_□(F, n).
- **TauCeti.HigherChow.cubeFaceMap** (data): ∂^ε_i : z^q_□(X, n) → z^q_□(X, n − 1), intersection with the face y_i = ε (ε ∈ {0, ∞}, 1 ≤ i ≤ n), with d = Σ_i (−1)^i (∂^∞_i − ∂^0_i).
- **TauCeti.HigherChow.cubeNormalized_quasiIso** (equivalence): For X of finite type over a field, the inclusion of the ∞-normalised subcomplex z^q_{□,N}(X, •) (cycles with ∂^0_i = 0 for all i and ∂^∞_i = 0 for i ≥ 2) into z^q_□(X, •) is a quasi-isomorphism.
- **TauCeti.HigherChow.cubeMap** (functoriality): Flat pullback and proper pushforward (dimension indexing) of cycles act on z_□ as maps of complexes, functorially, preserving degenerate cycles.

**Discriminating tests.**

- **HigherChow.test_cube_zero** (degenerate): z^q_□(X, 0) = z^q(X, 0).
- **HigherChow.test_cube_point** (computation): For a ∈ F^× ∖ {1}, the point a ∈ □^1_F is a cycle with d = 0 (it avoids 0 and ∞).
- **HigherChow.test_cube_vs_simplex** (compatibility): The cubical and simplicial complexes have isomorphic homology (simplicial-cubical-comparison).
- **HigherChow.test_degenerate_killed** (non-example): For X = Spec k and q = 0, the group of admissible cycles in degree n is ℤ·[□^n] with d[□^n] = Σ_i (−1)^i([□^{n−1}] − [□^{n−1}]) = 0, so before quotienting by degenerate cycles the homology is ℤ in every degree n ≥ 0; [□^n] is degenerate for n ≥ 1 (the pullback of [□^{n−1}] along a coordinate projection), and the quotient complex has homology ℤ in degree 0 and 0 in degrees n > 0, matching CH^0(Spec k, n).

**Consumers.**

- Totaro1992 Theorem 1: The explicit cycle {(a_1, …, a_n)} realises Milnor symbols.
- Polylogarithms:P.5/cubical-regulator and simplicial-cubical-comparison: Regulators are written on cubical cycles.
- MotivicEtaleKTheory:M.4/products: Products of higher Chow groups are defined cubically.

**Acceptance.**

- For X = Spec F, the cycle {(a_1, …, a_n)} ∈ z^n_□(F, n) is a cycle for a_i ∈ F^× ∖ {1}; Totaro's map sends {a_1, …, a_n} ∈ K^M_n(F) to its class.

**Sources.**

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed p. 180 (PDF p. 4). Totaro's cubical complex with faces at 0 and ∞, d = Σ(−1)^i(∂^∞_i − ∂^0_i), modulo degenerate cycles.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed p. 181 (PDF p. 5). Products on cubical cycles and their compatibility with the simplicial product.

[Park2021](https://arxiv.org/pdf/2108.13561v2), §2.2, Theorem 2.2.1, p. 4 (PDF p. 4). The ∞-normalised cubical subcomplex (Bloch's notes, Theorem 4.4.2), for Y of finite type over a field.

<a id="m-4-simplicial-cubical-comparison"></a>

### M.4/simplicial-cubical-comparison — Simplicial and cubical higher Chow groups agree

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/simplicial-cubical-comparison`. Implementation: unchecked.

Let X be an equidimensional scheme, separated and of finite type over a field k, and s a finite set of closed subsets of X (s = {X} for the plain complexes). Let Tot be the total complex of Levine's double complex z^q_s(X, m, n) of cycles on X × □^m × Δ^n meeting S × (every face) properly for S ∈ s, normalised as in Levine §4 (intersections with all faces vanish except with the last cubical face y_m = ∞ and the simplicial face t_0 = 0), with the cubical differential (intersection with y_m = ∞) in m and the simplicial differential (intersection with t_0 = 0) in n. The two augmentations ε′ : Tot → z^q_{□,s}(X, •) and ε″ : Tot → z^q_s(X, •) are quasi-isomorphisms, so z^q_{□,s}(X, •) and z^q_s(X, •) are naturally isomorphic in the derived category and H_n(z^q(X, •)) ≅ H_n(z^q_□(X, •)) for all q, n. The isomorphism is natural for flat pullback and proper pushforward, and it carries Bloch's simplicial external product to the cubical one (Totaro §1).

**Hypotheses and conventions.**

- X equidimensional, separated and of finite type over a field k; s a finite set of closed subsets of X.

**Construction or proof.**

1. Rows and columns of the double complex are acyclic in positive degree (Levine Lemma 4.6): an n-cube of complexes whose transition maps are split surjections (split by linear projections of simplices, resp. cubes) has kernel complex quasi-isomorphic to its total complex, and that total complex is acyclic by homotopy invariance with supports and the translation moving lemma for both models (homotopy-invariance (a)–(c)).
2. The spectral sequence E^1_{a,b} = H_b(z^q_s(X, a, •)) ⇒ H_{a+b}(Tot) degenerates, so ε″ is a quasi-isomorphism; symmetrically ε′ is one, and ε″ ∘ ε′^{−1} is the comparison (Levine Theorem 4.7).
3. Flat pullback and proper pushforward act on the double complex compatibly with both augmentations (functoriality); the product compatibility is Totaro's remark in §1.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/homotopy-invariance](#m-4-homotopy-invariance), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality)

**Acceptance.**

- For X = Spec F and q = n = 1 both sides are F^×.

**Sources.**

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), §4, Theorem 4.7, preprint p. 34. The comparison Z^q(X, *)^c_s → Z^q_s(X, *) in the derived category, via the total complex and its two augmentations; no quasi-projectivity is assumed.

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), Introduction, preprint p. 1. Integral comparison of the cubical and simplicial models.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed p. 181 (PDF p. 5). The comparison is multiplicative (Totaro states it for quasi-projective schemes over a field).

<a id="m-4-functoriality"></a>

### M.4/functoriality — Flat pullback and proper pushforward of higher Chow groups

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/functoriality`. Implementation: unchecked.

Let f : Y → X be a morphism of schemes of finite type over a field. (a) If X and Y are equidimensional and f is flat of relative dimension d, pullback of cycles f^* : z^q(X, •) → z^q(Y, •) (the cycle of the scheme-theoretic inverse image, multiplied out on X × Δ^n) is a map of simplicial abelian groups, inducing f^* on CH^q(−, n). (b) If f is proper, pushforward of cycles f_* : z_r(Y, •) → z_r(X, •), r ∈ ℤ, given termwise by Mathlib's pushforward of cycles with dimension weights (the coefficient of f(V) is [k(V) : k(f(V))] if dim f(V) = dim V and 0 otherwise), is a map of complexes inducing f_* on CH_r(−, n); for X, Y equidimensional of dimensions d_X, d_Y it reads CH^q(Y, n) → CH^{q + d_X − d_Y}(X, n). (c) Pullback and pushforward are functorial, satisfy base change g^* f_* = f′_* g′^* for a cartesian square with g flat and f proper, and in degree n = 0 are SF.5's flat pullback and proper pushforward on Chow groups. (d) The same holds over a Dedekind scheme B: flat pullback for flat morphisms of equidimensional schemes essentially of finite type over B (codimension indexing), and proper pushforward for proper morphisms of schemes of finite type over B in Geisser's dimension indexing.

**Hypotheses and conventions.**

- Morphisms of schemes of finite type over a field (or over a Dedekind scheme for (d)); for (a) flat of relative dimension d between equidimensional schemes; for (b) proper.

**Construction or proof.**

1. Flat pullback preserves codimension and proper intersection with faces (faces pull back to faces, and f × id_{Δ^n} is flat), and commutes with intersection with the faces.
2. Proper pushforward: take Mathlib's pushforward of cycles along f × id_{Δ^n} with dimension weights; images of proper maps have no larger dimension, so f(Z) ∩ (X × F) = f(Z ∩ (Y × F)) has dimension ≤ r + dim F, and pushforward commutes with intersection with a face (Fulton Proposition 2.3 and Theorem 6.2(a); MVW Lemma 17A.10 in the finite case).
3. Both commute with the face maps, hence with d; base change is the corresponding identity of cycles (Fulton Proposition 1.7); degree zero recovers SF.5. Over a Dedekind base the same arguments apply with Geisser's dimension.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), `mathlib:AlgebraicGeometry.AlgebraicCycle.map`, `SchemeAndStackFoundations:SF.5`

**Acceptance.**

- For f : Spec E → Spec F finite, f_* : CH^1(E, 1) = E^× → CH^1(F, 1) = F^× is the norm N_{E/F}.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lecture 17, after Exercise 17.3, printed p. 136 (PDF p. 151). Proper pushforward with the change of codimension index ([Blo86, 1.3]).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lecture 17, after Exercise 17.3, printed p. 136 (PDF p. 151). Flat pullback at chain level.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §3, printed p. 778 (PDF p. 6). Both functorialities over a Dedekind base, part (d).

[Spitzweck2018](https://arxiv.org/pdf/1207.4078v3), §3, before Lemma 3.7, PDF p. 9. Flat pullback of the cycle complexes over a Dedekind base.

<a id="m-4-homotopy-invariance"></a>

### M.4/homotopy-invariance — Homotopy invariance and the translation moving lemma

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/homotopy-invariance`. Implementation: unchecked.

Let X be an equidimensional scheme, separated and of finite type over a field k, s a finite set of closed subsets of X, and p : X × 𝔸^m → X the projection. (a) Flat pullback p^* : z^q_s(X, •) → z^q_{p^{−1}s}(X × 𝔸^m, •) is a quasi-isomorphism, where z^q_s denotes the subcomplex of cycles meeting S × F properly for every S ∈ s and every face F; for s = {X} this gives p^* : CH^q(X, n) ≅ CH^q(X × 𝔸^m, n) for all q, n (Bloch). (b) The same holds for the cubical complexes z^q_{□,s} (Levine). (c) (Translation moving lemma.) For closed subsets H_1, …, H_r of 𝔸^m_k, the inclusion of the subcomplex of z^q_{p^{−1}s}(X × 𝔸^m, •) (resp. of the cubical complex) consisting of cycles that also meet every X × H_j × F properly is a quasi-isomorphism. No smoothness or quasi-projectivity of X is needed.

**Hypotheses and conventions.**

- X equidimensional, separated and of finite type over a field k; s a finite set of closed subsets of X; H_j closed in 𝔸^m_k.

**Construction or proof.**

1. (c): let G = 𝔾_a^m act on 𝔸^m by translation and map 𝔸^1_K → G_K, x ↦ (t_1 + x u_1, …, t_m + x u_m), over the purely transcendental extension K = k(t, u). The homotopy built from the prism cycle (Levine's W_n in the cubical case, Bloch's subdivision of Δ^n × 𝔸^1 in the simplicial case) makes base change z_s/z_{y∪s} → (z_s/z_{y∪s})_K null-homotopic, and specialisation at k-points shows that base change is injective on homology when k is infinite; for k finite, pass to infinite algebraic pro-ℓ and pro-ℓ′ extensions for two primes ℓ ≠ ℓ′ and use π_* π^* = degree (Levine Lemma 4.3, Proposition 4.4; Bloch Lemma 2.3).
2. (a), (b): for m = 1, by (c) restrict to cycles meeting X × {0, 1} × F properly; the zero- and one-section pullbacks i_0^*, i_1^* agree on homology via an explicit homotopy H_n; the multiplication map τ(x, y) = xy on 𝔸^1 × 𝔸^1 is flat, and i_1^* τ^* = id, i_0^* τ^* = p^* i_0^* show that p^* is surjective on homology, while i_0^* p^* = id gives injectivity (Levine Theorem 4.5; Bloch Theorem 2.1). Induct on m.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality)

**Acceptance.**

- CH^1(𝔸^1_F, 1) ≅ CH^1(F, 1) = F^×, and CH^1(𝔸^1_F, 0) = Pic(𝔸^1_F) = 0 = CH^1(F, 0).
- For s = {X} and r = 0 statement (c) is trivial; for X = Spec k and q = 0 both sides of (a) have homology ℤ in degree 0 only.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Properties 17.4(1), printed p. 136 (PDF p. 151). Stated 'for any scheme X over k', proof [Blo86, 2.1].

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), §4, Bloch's property (1), preprint p. 33. The simplicial homotopy property with supports, part (a).

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), §4, Theorem 4.5, preprint p. 32. The cubical homotopy property with supports, part (b).

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), §4, Proposition 4.4, preprint p. 32. The translation moving lemma for X × 𝔸^n and closed subsets H_i ⊂ 𝔸^n, part (c).

<a id="m-4-moving-lemma"></a>

### M.4/moving-lemma — Bloch's moving lemma for cycle complexes

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/moving-lemma`. Implementation: unchecked.

(a) Let X be smooth and quasi-projective over a field and 𝒲 a finite set of locally closed subsets of X. Let z^q_𝒲(X, •) ⊂ z^q(X, •) be the subcomplex of cycles Z such that every component of Z ∩ (W × F) has codimension ≥ q in W × F for every W ∈ 𝒲 and every face F. Then the inclusion z^q_𝒲(X, •) ⊂ z^q(X, •) is a quasi-isomorphism (Bloch). (b) Let X be smooth and affine over a field k and w : W → X a morphism with W locally equidimensional (for example the support of a finite correspondence into X). The subcomplex z^q(X, •)_w of cycles T such that every component of w^{−1}(T) has codimension ≥ q in W × Δ^n and meets every W × F properly includes quasi-isomorphically into z^q(X, •) (Levine; MVW Proposition 17.6 and its proof). (c) Let S = Spec D for a Dedekind domain D of mixed characteristic, X smooth and affine over S, and F a finite set of closed immersions Z_i → X with each Z_i smooth over S. Then the inclusion of the subcomplex of cycles in good position with respect to the Z_i into the normalised chain complex of z^q(X, •) is a quasi-isomorphism (Levine; Spitzweck Theorem 5.8).

**Hypotheses and conventions.**

- (a) X smooth quasi-projective over a field, 𝒲 finite; (b) X smooth affine over a field, w : W → X with W locally equidimensional; (c) X smooth affine over the spectrum of a Dedekind domain of mixed characteristic, finitely many smooth closed subschemes.

**Construction or proof.**

1. (a): move cycles by a generic translation in an embedding X ⊂ ℙ^N (projecting cones), with the action of a group of automorphisms over a purely transcendental field extension, specialise, and descend for finite fields by a norm argument (Bloch, 'The moving lemma for higher Chow groups').
2. (b): Levine's moving lemma relative to a locally equidimensional w : W → X (MVW Proposition 17.6, refining Levine, Mixed Motives I.II.3.5.14).
3. (c): Levine's moving lemma for smooth affine S-schemes (Levine, K-theory and motivic cohomology of schemes, Theorem 4.9), as cited in Spitzweck Theorem 5.8.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality)

**Acceptance.**

- For 𝒲 = ∅ the inclusion is the identity.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 17.6, printed p. 137 (PDF p. 152). Part (b): Levine's moving lemma relative to w : W → X (stated for the support of a finite correspondence; the proof treats any locally equidimensional W).

[Spitzweck2018](https://arxiv.org/pdf/1207.4078v3), §5, Theorem 5.8, PDF p. 38. Part (c): F a finite set of closed immersions in Sm_S, S the spectrum of a Dedekind domain of mixed characteristic.

[Spitzweck2018](https://arxiv.org/pdf/1207.4078v3), Introduction, PDF p. 5. The arithmetic moving lemma is the input of the strictification of the cycle complexes over a Dedekind domain.

<a id="m-4-localization-sequence"></a>

### M.4/localization-sequence — Bloch's localization theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/localization-sequence`. Implementation: unchecked.

Let X be an equidimensional scheme, separated and of finite type over a field k, Z ⊂ X a closed subscheme of pure codimension c, and j : U = X ∖ Z → X. Then j^* : z^q(X, •) → z^q(U, •) has kernel i_* z^{q−c}(Z, •) and acyclic cokernel, so z^{q−c}(Z, •) --i_*--> z^q(X, •) --j^*--> z^q(U, •) extends to a distinguished triangle in the derived category of abelian groups and gives the long exact sequence … → CH^{q−c}(Z, n) → CH^q(X, n) → CH^q(U, n) → CH^{q−c}(Z, n − 1) → … → CH^q(U, 0) → 0, natural for flat pullback and proper pushforward of such triples. Without equidimensionality, in the dimension indexing (r ∈ ℤ): … → CH_r(Z, n) → CH_r(X, n) → CH_r(U, n) → CH_r(Z, n − 1) → … . The same holds for X essentially of finite type over the spectrum of a discrete valuation ring (Levine; Geisser Theorem 3.2). Over a Dedekind scheme B and X essentially of finite type over B, it holds as a distinguished triangle of Zariski sheaves i_* Z(q − c)_Z[−2c] → Z(q)_X → j_* Z(q)_U on X (Geisser Corollary 3.3(a)), hence as a long exact sequence of Zariski hypercohomology … → H^{p−2c}(Z, Z(q − c)) → H^p(X, Z(q)) → H^p(U, Z(q)) → H^{p−2c+1}(Z, Z(q − c)) → … .

**Hypotheses and conventions.**

- X equidimensional, separated and of finite type over a field (dimension indexing: of finite type, not necessarily equidimensional), or essentially of finite type over a discrete valuation ring; over a Dedekind scheme only the sheaf-level triangle and the hypercohomology sequence; Z closed of pure codimension c.

**Construction or proof.**

1. The kernel of j^* is the group of admissible cycles supported on Z × Δ^n, which is i_* z^{q−c}(Z, n) (admissibility on Z and on X agree for such cycles).
2. The cokernel of j^* is acyclic: every admissible cycle on U × □^n is, up to boundaries, the restriction of an admissible cycle on X × □^n. Bloch proves this for X quasi-projective by towers of blow-ups of faces of the cube (Hironaka's polyhedral game, solved by Spivakovsky), and Levine extends it to X of finite type over a field or a discrete valuation ring (Bloch 1994; Levine 2001). Park gives a purely cubical proof (Park 2021, Theorem 1.0.1); simplicial-cubical-comparison, natural for open restriction and closed pushforward, transports it to the simplicial complexes.
3. The short exact sequence 0 → i_* z^{q−c}(Z, •) → z^q(X, •) → im j^* → 0 and the quasi-isomorphism im j^* ≃ z^q(U, •) give the triangle and its long exact sequence.
4. Over a Dedekind base the triangle of Zariski sheaves is checked stalkwise; the cycle complex commutes with filtered colimits of rings, and the local rings are essentially of finite type over a field (Bloch) or over a discrete valuation ring (Levine), as in Geisser's proof of Corollary 3.3(a); then take hypercohomology, using j_* Z(q)_U ≃ Rj_* Z(q)_U (Geisser, Remark after Corollary 3.3).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/simplicial-cubical-comparison](#m-4-simplicial-cubical-comparison), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality)

**Acceptance.**

- For X = 𝔸^1_F, Z = {0}, U = 𝔾_m: … → CH^0(F, 1) = 0 → CH^1(𝔸^1, 1) = F^× → CH^1(𝔾_m, 1) → CH^0(F, 0) = ℤ → CH^1(𝔸^1, 0) = 0, so CH^1(𝔾_m, 1) ≅ F^× ⊕ ℤ.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Properties 17.4(2), printed p. 136 (PDF p. 151). Bloch's localization theorem over a field and its long exact sequence for Z of pure codimension c.

[Park2021](https://arxiv.org/pdf/2108.13561v2), §1, p. 2 (PDF p. 2). Bloch proved localization for quasi-projective schemes over a field; Levine extended it to schemes of finite type over a field or a DVR.

[Park2021](https://arxiv.org/pdf/2108.13561v2), Theorem 1.0.1, p. 1 (PDF p. 1). Cubical localization for Y of finite type over a field.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Theorem 3.2(a), printed p. 779 (PDF p. 7). Levine's localization for X essentially of finite type over a discrete valuation ring ([16, Theorem 1.7]).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Corollary 3.3(a), printed p. 780 (PDF p. 8). The sheaf-level localization triangle over a Dedekind base.

<a id="m-4-products"></a>

### M.4/products — Products and pullback for smooth schemes

**Construction.** Identifier: `MotivicEtaleKTheory:M.4/products`. Implementation: unchecked.

For X, Y equidimensional, separated and of finite type over a field k, the external product of cubical cycles z^p_□(X, •) ⊗ z^r_□(Y, •) → z^{p+r}_□(X ×_k Y, •), transported through simplicial-cubical-comparison (equivalently Bloch's product via a triangulation of Δ^n × Δ^m), gives a map in the derived category inducing CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m). For X smooth and quasi-projective over k, pullback along the diagonal (defined by the moving lemma) gives the cup product, making ⊕_{p,n} CH^p(X, n) a bigraded ring, graded-commutative in n and associative and unital; for any morphism f : Y → X of smooth quasi-projective k-schemes there is a pullback f^* : CH^q(X, n) → CH^q(Y, n), functorial, agreeing with flat pullback when f is flat, and multiplicative. Equivalently ⊕_{p,q} H^{p}(X, Z(q)) is a bigraded ring with H^{p}(X, Z(q)) · H^{p'}(X, Z(q')) ⊂ H^{p+p'}(X, Z(q+q')).

**Hypotheses and conventions.**

- X, Y equidimensional of finite type over a field; for the cup product and general pullback, smooth and quasi-projective.

**Construction or proof.**

1. Define the external product on cubical cycles (cubical-cycle-complex) and transport to the simplicial model (simplicial-cubical-comparison).
2. For smooth X, replace z(X × X, •) by the subcomplex of cycles meeting the diagonal properly (moving-lemma); intersect with Δ_X to get Δ^*.
3. For f : Y → X between smooth quasi-projective schemes, factor f as the graph Y → Y × X followed by the projection; pull back by moving to cycles in good position with respect to the graph.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/simplicial-cubical-comparison](#m-4-simplicial-cubical-comparison), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality)

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.extProduct** (constructor): CH^p(X, n) ⊗ CH^r(Y, m) → CH^{p+r}(X × Y, n + m).
- **TauCeti.HigherChow.cup** (constructor): The cup product on ⊕ CH^p(X, n) for X smooth.
- **TauCeti.HigherChow.pullback** (functoriality): f^* for f : Y → X between smooth quasi-projective k-schemes, with (g ∘ f)^* = f^* ∘ g^* and id^* = id.
- **TauCeti.HigherChow.pullback_flat** (compatibility): f^* agrees with flat pullback when f is flat.
- **TauCeti.HigherChow.cup_comm** (relation): x · y = (−1)^{nm} y · x for x ∈ CH^p(X, n), y ∈ CH^r(X, m).
- **TauCeti.HigherChow.projection_formula** (relation): f_*(f^*x · y) = x · f_*y for f proper between smooth schemes.

**Discriminating tests.**

- **HigherChow.test_unit** (degenerate): The class [X] ∈ CH^0(X, 0) is the unit of the ring.
- **HigherChow.test_symbol_product** (computation): For a, b ∈ F^× ∖ {1}, a · b ∈ CH^2(F, 2) is the class of the point (a, b) ∈ □^2_F.
- **HigherChow.test_degree_zero** (compatibility): On CH^*(X, 0) the cup product is SF.5's intersection product for X smooth.
- **HigherChow.test_sign** (non-example): For a ∈ F^×, a · a = a · (−1) in CH^2(F, 2), which is generally nonzero (e.g. F = ℝ, a = −1), so the product is graded-commutative but not alternating.

**Consumers.**

- MotivicEtaleKTheory:M.6b/filtered-motivic-products and M.8/motivic-chern-character: Products of motivic cohomology on the E_2-page and in the Chern character.
- Kbook2013 VI Addendum 4.2.1: The motivic spectral sequence is multiplicative with the product in motivic cohomology on E_2.
- K3BlochGroups:V.2 (request to M.4): Ring structure of ⊕ H^i(F, Z(i)) and its identification with Milnor K-theory.

**Acceptance.**

- For X = Spec F, the product CH^1(F, 1) ⊗ CH^1(F, 1) → CH^2(F, 2) sends a ⊗ b to the class of the cycle (a, b) ∈ □^2_F, i.e. to the image of {a, b} under nesterenko-suslin-totaro.

**Sources.**

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed pp. 180-181 (PDF pp. 4-5). External product on cubical cycles and the cup product by diagonal pullback.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 17.21, printed p. 142 (PDF p. 157). Functorial pullback on higher Chow groups of smooth schemes (MVW obtain it from the transfers W^* of 17.17 with W = Γ_f).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Example 17.12, printed p. 139 (PDF p. 154). Agreement of the general pullback with flat pullback.

[Levine1994](https://www.esaga.uni-due.de/f/marc.levine/publ/HigherChowRevisit.pdf), §5, preprint p. 46. The sign (−1)^{nm} of graded commutativity of the cubical product.

<a id="m-4-chow-degree-zero"></a>

### M.4/chow-degree-zero — Higher Chow groups in degree zero are Chow groups

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/chow-degree-zero`. Implementation: unchecked.

For X equidimensional of finite type over a field, CH^q(X, 0) = z^q(X, 0)/d(z^q(X, 1)) is canonically the Chow group CH^q(X) of SchemeAndStackFoundations SF.5 (codimension-q cycles modulo rational equivalence), compatibly with flat pullback, with proper pushforward (in the dimension indexing) and, for X smooth and quasi-projective, with the cup product of products, which in degree zero is SF.5's intersection product.

**Hypotheses and conventions.**

- X equidimensional of finite type over a field.
- For the product compatibility, X smooth and quasi-projective over the field.

**Construction or proof.**

1. z^q(X, 0) is the group of codimension-q cycles, and d = ∂_0^* − ∂_1^* on z^q(X, 1). An integral admissible Z ⊂ X × Δ^1 either lies in a fibre X × {a} with a ≠ 0, 1 (its boundary is 0) or dominates Δ^1 ≅ 𝔸^1; then, closing Z in X × ℙ^1 and applying the automorphism t ↦ t/(t − 1) of ℙ^1 (which fixes 0 and exchanges 1 and ∞), Z(0) − Z(1) is Fulton's generator [V(0)] − [V(∞)] of rational equivalence (Fulton, Proposition 1.6), and every such generator, V ⊂ X × ℙ^1 dominant over ℙ^1, arises this way from V ∩ (X × (ℙ^1 ∖ {1})). Hence d(z^q(X, 1)) is exactly the subgroup of cycles rationally equivalent to zero (SF.5).
2. Compatibilities: degree-zero parts of functoriality and products.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/products](#m-4-products), `SchemeAndStackFoundations:SF.5`

**Acceptance.**

- CH^1(X, 0) = Pic(X) for X smooth (with SF.5's identification).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 17.1 and the following paragraph, printed p. 135 (PDF p. 150). Degree zero of Bloch's complex is the classical Chow group; Exercise 17.3 treats the top codimension.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §1, printed p. 179 (PDF p. 3). CH^*(X, 0) is defined by killing Z(0) − Z(1) for Z ⊂ X × Δ^1 meeting X × {0}, X × {1} properly, which is rational equivalence (scan text).

<a id="m-4-weight-zero-and-one"></a>

### M.4/weight-zero-and-one — Motivic cohomology in weights zero and one

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/weight-zero-and-one`. Implementation: unchecked.

Let X be smooth over a field k. (a) Z(0)_X ≃ ℤ, so H^{p}(X, Z(0)) = H^{p}_Zar(X, ℤ), which is ℤ^{π_0(X)} for p = 0 and 0 for p ≠ 0. (b) There is a quasi-isomorphism Z(1)_X ≃ O_X^×[−1] of Zariski complexes; hence H^{1}(X, Z(1)) ≅ O(X)^×, H^{2}(X, Z(1)) ≅ Pic(X) (Tau Ceti's line-bundle classes), and H^{p}(X, Z(1)) = 0 for p ∉ {1, 2}. For X = Spec F: H^{1}(F, Z(1)) = F^× and H^{p}(F, Z(1)) = 0 for p ≠ 1.

**Hypotheses and conventions.**

- X smooth over a field k (essentially smooth allowed for local rings and fields).

**Construction or proof.**

1. (a) z^0(X, n) = ℤ^{π_0(X × Δ^n)} = ℤ^{π_0(X)} for all n, a constant simplicial group.
2. (b) Bloch 1986, Theorem 6.1: for X smooth over a field, CH^1(X, 0) = Pic(X), CH^1(X, 1) = O^×(X) and CH^1(X, n) = 0 for n ≥ 2, naturally in X. Structure of the proof for X affine: let M(n) be the group of rational functions on X × Δ^n that are units at the generic point of every face X × Δ^j. Since X × Δ^n is regular (local rings are factorial), a codimension-one cycle meets a face properly exactly when no face lies in its support, so the divisor map gives an exact sequence of simplicial abelian groups 0 → O^×(X × Δ^•) → M(•) → z^1(X, •) → Pic(X × Δ^•) → 0 (surjective on the right because a line bundle is trivial on the semilocal ring of the finitely many generic points of faces). The outer terms are constant: O^×(X × Δ^n) = O^×(X) as X is reduced, and Pic(X × Δ^n) = Pic(X) as X is regular (gap: homotopy invariance of Pic). Through the two long exact homotopy sequences the theorem is equivalent to the vanishing of the homotopy groups of M(•), which is the content of Bloch's argument (π_0 M = 0 is elementary: (1 − t) + t·a^{−1} has faces 1 and a^{−1}). Zariski descent (zariski-descent) then gives Z(1)_X ≃ O_X^×[−1] on every smooth X, so H^{p}(X, Z(1)) = H^{p−1}_Zar(X, O_X^×), which vanishes for p ≥ 3 because 0 → O_X^× → k(X)^× → ⊕_{x∈X^{(1)}} (i_x)_*ℤ → 0 is a flasque resolution on each component of the locally factorial X. The proof does not use Voevodsky's complexes: MVW Theorem 4.1 is the same statement for the motivic complex Z(1) of M.5a, and the two are identified only downstream (MotivesAndAlgebraicCycles MC.4).
3. The field case X = Spec F: CH^1(F, 1) ≅ F^×, in the cubical model by a ↦ the point a ∈ ℙ^1 ∖ {0, 1, ∞} (Totaro §2 and §4, the case n = 1, with inverse a closed point p ↦ N_{κ(p)/F}(x)); in the simplicial model via simplicial-cubical-comparison. Pic(Spec F) = 0 and O^×(F) = F^× give H^{p}(F, Z(1)) = 0 for p ≠ 1.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/chow-degree-zero](#m-4-chow-degree-zero), `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent)

**Acceptance.**

- H^{2}(ℙ^1_k, Z(1)) ≅ ℤ and H^{1}(ℙ^1_k, Z(1)) ≅ k^×.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Corollary 4.2, PDF p. 40. H^{p,q}(X, ℤ) for q ≤ 1: ℤ(X), O^*(X), Pic(X) in bidegrees (0,0), (1,1), (2,1), stated for Voevodsky's motivic complexes (Theorem 4.1: Z(1) ≃ O^*[−1]); the same groups for Bloch's cycle complex are proved directly in the proof steps, not deduced from this corollary.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §2, printed p. 182 (PDF p. 6). Totaro's computation of CH^1(F, 1) ≅ F^* in the cubical model, and his reference to Bloch's proof through divisors and line bundles (scan text).

<a id="m-4-vanishing-above-weight"></a>

### M.4/vanishing-above-weight — Vanishing above the weight for fields, and above weight plus dimension

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/vanishing-above-weight`. Implementation: unchecked.

Let A be an abelian group. (a) For a field F and integers q ≥ 0 and p > q, H^{p}(F, A(q)) = 0; in particular H^{p}(F, Z(q)) = CH^q(F, 2q − p) = 0 for p > q, and H^{p}(F, ℚ(q)) = 0 for p > q. (b) More generally, for X equidimensional of dimension d and of finite type over a field, H^{p}(X, A(q)) = 0 for p > q + d and for p > 2q. The local statement (the cohomology sheaves of Z(q) vanish in degrees above q on schemes essentially smooth over a field or a Dedekind scheme) is not part of this node: it is dedekind-gersten (c), Geisser's Corollary 4.4, whose proof uses (a) together with nesterenko-suslin-totaro.

**Hypotheses and conventions.**

- (a) F a field, q ≥ 0, A an abelian group.
- (b) X equidimensional of dimension d and of finite type over a field.

**Construction or proof.**

1. z^q(X, n) is generated by integral subschemes of codimension q in X × Δ^n, which has dimension d + n; so z^q(X, n) = 0 for n < q − d, and the complex is zero in negative degrees. With n = 2q − p this is p > q + d, respectively p > 2q. For X = Spec F (d = 0): z^q(F, n) = 0 for n < q, which is Totaro's argument for the first half of his Theorem 1 (there in the cubical model).
2. The complex z^q(X, •) ⊗ A is zero in the same degrees, so its homology vanishes there for every A.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles)

**Acceptance.**

- H^{2}(F, Z(1)) = 0, consistent with Pic(Spec F) = 0.
- H^{3}(F, ℚ(2)) = 0, the input EllipticKTheory E.4 requests.
- For a smooth curve X over a field (d = 1), H^{3}(X, Z(1)) = 0, consistent with H^{2}_Zar(X, O_X^×) = 0.

**Sources.**

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §2, Theorem 1 and the first line of its proof, printed p. 181 (PDF p. 5). Totaro's Theorem 1: CH^i(F, n) = 0 for i > n, proved by the dimension count (scan text: 'CHt(F, n) = 0, for i > n').

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Vanishing Theorem 3.6 and the following paragraph, printed pp. 22–23 (PDF pp. 37–38). The bounds p > q + dim X and p > 2q, stated for Voevodsky's motivic cohomology; for the cycle complex they are the dimension count of the proof steps.

<a id="m-4-nesterenko-suslin-totaro"></a>

### M.4/nesterenko-suslin-totaro — Milnor K-theory is motivic cohomology on the diagonal

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro`. Implementation: unchecked.

For every field F and n ≥ 0 there is a natural isomorphism φ_n : K^M_n(F) ≅ CH^n(F, n) = H^{n}(F, Z(n)), where K^M_*(F) is Milnor K-theory (K2SymbolsBrauer T.2/milnor-k-theory). On symbols, φ_n{a_1, …, a_n} is the class of the point (a_1, …, a_n) ∈ □^n_F for a_i ≠ 1 (cubical model); φ = ⊕ φ_n is a ring isomorphism K^M_*(F) ≅ ⊕_n H^{n}(F, Z(n)); φ commutes with norms (Milnor norm N_{E/F} on the left, proper pushforward on the right) and is natural for field extensions E/F (restriction on the left, flat pullback along Spec E → Spec F on the right). For a discrete valuation ring R with fraction field F, residue field k and valuation v, φ intertwines the higher residue ∂_v of K2SymbolsBrauer T.3 (∂_v{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}) with the boundary δ_R : H^{n}(F, Z(n)) → H^{n−1}(k, Z(n − 1)) of the localization sequence of Spec R: δ_R ∘ φ_n = ε_n · φ_{n−1} ∘ ∂_v with an explicit sign ε_n = ±1 fixed by the cubical boundary convention. Consequently H^{n}(F, Z/m(n)) ≅ K^M_n(F)/m for every m.

**Hypotheses and conventions.**

- F any field, of any characteristic and not necessarily perfect; n ≥ 0.
- For the residue compatibility, R a discrete valuation ring with fraction field F.

**Construction or proof.**

1. Map K^M_n(F) → CH^n(F, n) (Totaro §2): {a} ↦ [a], the point a ∈ ℙ^1 ∖ {0, 1, ∞}, and {1} ↦ 0; Totaro's explicit rational curve in □^2 (p. 182) shows [a] + [b] = [ab] and [a] + [1/a] = 0, and his rational curve in □^3, whose only face point is (a, 1 − a, 0), gives the Steinberg relation; multiplicativity of the cubical external product (products, cubical-cycle-complex) gives a ring homomorphism, transported to the simplicial model by simplicial-cubical-comparison.
2. Map back CH^n(F, n) → K^M_n(F) (Totaro §3): an element of z^n_□(F, n) is a 0-cycle on the open cube avoiding all faces; a closed point p with coordinates x_1, …, x_n ∈ κ(p) ∖ {0, 1} goes to N_{κ(p)/F}{x_1, …, x_n}, using Kato's Milnor norm for every finite extension, separable or not (K2SymbolsBrauer T.4/milnor-transfer-transitivity).
3. This kills boundaries (Totaro pp. 183–184, with the regular model in place of a smooth one): for an integral curve C ⊂ □^{n+1}_F in z^n_□(F, n + 1), let D be its normalisation and P(D) the regular proper model of the function field K = F(C); D is regular but need not be smooth over F when F is imperfect, and the residue fields κ(w) of closed points may be inseparable over F. The boundary of C is the pushforward of the boundary of D, with multiplicities [κ(w) : κ(p)] at a point w over p; by transitivity of norms and N_{κ(w)/κ(p)} ∘ res = [κ(w) : κ(p)] (K2SymbolsBrauer T.4/restriction-transfer-degree) its image in K^M_n(F) is Σ_{w ∈ D} N_{κ(w)/F} ∂_w{g_1, …, g_{n+1}} for the coordinate functions g_i, the residues computed by Milnor's formula since at most one g_i has a zero or pole at each w (K2SymbolsBrauer T.3/higher-milnor-residues). At points w ∈ P(D) ∖ D some g_i(w) = 1 (D → □^{n+1} is finite), so ∂_w vanishes there. Suslin's reciprocity law over all places of K/F (K2SymbolsBrauer T.4/weil-reciprocity, all degrees, regular proper model, no smoothness; places as closed points via T.4/valuation-comparison) gives Σ_{w ∈ P(D)} N_{κ(w)/F} ∂_w = 0. Degree-two Weil reciprocity alone would not suffice.
4. The two maps are inverse. K^M_n → CH^n → K^M_n is the identity on symbols. For CH^n → K^M_n → CH^n it suffices that every class in CH^n(F, n) is a sum of F-rational points: for F infinite by Totaro's Lemma 2 (induction on the degree of the last generating coordinate, using the curves q(t, u) = p_k(t) − (t_k − 1)^{d−1}(t_k − a_0)u and a general choice of c ∈ F^× to keep them admissible), and for F finite by Totaro §5 (κ(p)^× cyclic and the curve π(u) − (u − a_0)(u − 1)^{d−1}v = 0).
5. Norm compatibility: for a finite extension E/F and a closed point p of □^n_E over the point p' of □^n_F, f_*[p] = [κ(p) : κ(p')][p'], and N_{E/F} N_{κ(p)/E} = N_{κ(p)/F} = N_{κ(p')/F} N_{κ(p)/κ(p')}, with N_{κ(p)/κ(p')} ∘ res = [κ(p) : κ(p')] (T.4/milnor-transfer-transitivity, T.4/restriction-transfer-degree). Naturality for field extensions is immediate on symbols.
6. Residue compatibility: for a symbol {u_1, …, u_{n−1}, π} with u_i ∈ R^× the closure of the point (u_1, …, u_{n−1}, π) in Spec R × □^n is the R-section, admissible, whose only face is the point (ū_1, …, ū_{n−1}, 0) of the special fibre (empty if some ū_i = 1); so δ_R φ_n{u_1, …, u_{n−1}, π} = ± φ_{n−1}{ū_1, …, ū_{n−1}} by the definition of the localization boundary (localization-sequence over the Dedekind scheme Spec R); symbols {u_1, …, u_n} with all u_i units have boundary 0. These generate K^M_n(F) (with {π, π} = {π, −1}), giving the stated identity; this is Geisser–Levine's Lemma 3.2 as used in Geisser's proof of Corollary 4.4.
7. Mod-m: the coefficient sequence of the degreewise free complex z^n(F, •) gives 0 → H^{n}(F, Z(n))/m → H^{n}(F, Z/m(n)) → H^{n+1}(F, Z(n))[m] = 0 (vanishing-above-weight).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/weil-reciprocity`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, [MotivicEtaleKTheory:M.4/simplicial-cubical-comparison](#m-4-simplicial-cubical-comparison), `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.4/valuation-comparison`

**Acceptance.**

- φ_1 : F^× ≅ CH^1(F, 1) is weight-zero-and-one (b) for X = Spec F.
- K^M_n(𝔽_q) = 0 for n ≥ 2, so CH^n(𝔽_q, n) = 0 for n ≥ 2 (Totaro §5).
- For R = ℤ_(p) and a ∈ ℤ_(p)^×: δ_R φ_2{a, p} = ±φ_1(ā) = ±[ā] ∈ CH^1(𝔽_p, 1) = 𝔽_p^×.

**Sources.**

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §2, Theorem 1, printed p. 181 (PDF p. 5). Theorem 1 (scan text): CH^n(F, n) ≅ K^M_n(F).

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §3, printed pp. 183–184 (PDF pp. 7–8). The inverse map by Kato's norms and the vanishing on boundaries by Suslin's reciprocity over all points of the compactified normalisation (scan text); Totaro calls the normalisation smooth, which over an imperfect field must be read as regular (sourceIssues).

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §4, Lemma 2, printed p. 185 (PDF p. 9); §5, printed p. 189 (PDF p. 13). Every class is a sum of F-rational points: Lemma 2 for infinite F, §5 for finite F (scan text).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), proof of Corollary 4.4, printed p. 786 (PDF p. 14). The localization boundary of a discrete valuation ring agrees with the Milnor residue under the diagonal isomorphism (Geisser–Levine, Lemma 3.2).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4, printed p. 480 (PDF p. 488). The ring isomorphism K^M_*(k) ≅ ⊕ H^i(k, Z(i)) compatible with multiplication.

<a id="m-4-weight-two-symbol-comparison"></a>

### M.4/weight-two-symbol-comparison — The weight-two symbol comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/weight-two-symbol-comparison`. Implementation: unchecked.

For a field F: (a) H^{2}(F, Z(2)) ≅ K_2(F), the composite of nesterenko-suslin-totaro (n = 2) with Matsumoto's identification K^M_2(F) = K_2(F) (K2SymbolsBrauer T.2/matsumoto); on symbols {a, b} ↦ the class of the point (a, b) of □^2_F (a, b ≠ 1), and the Steinberg element (a, 1 − a) is the boundary of Totaro's rational curve in □^3_F; (b) for every m ≥ 1, H^{2}(F, Z/m(2)) ≅ K_2(F)/m, from the exact coefficient sequence 0 → H^{2}(F, Z(2))/m → H^{2}(F, Z/m(2)) → H^{3}(F, Z(2))[m] = 0; (c) H^{p}(F, Z(2)) = 0 and H^{p}(F, Z/m(2)) = 0 for p ≥ 3. This is the symbol half of the weight-two comparison. The Bloch-group half concerns H^{1}(F, Z(2)): K3BlochGroups V.2/indecomposable-motivic-edge-equivalence identifies it with K_3^ind(F) through the motivic spectral sequence, and K3BlochGroups V.4 (Suslin's exact sequence) compares that group with the Bloch group; those nodes depend on M.4, so M.4 does not import them. The identification of (b), composed with the motivic-to-étale map, with M.3's Galois symbol is M.5c/galois-symbol-all-degrees in degree two.

**Hypotheses and conventions.**

- F a field.

**Construction or proof.**

1. (a) is the n = 2 case of nesterenko-suslin-totaro followed by Matsumoto's theorem.
2. (b) the coefficient long exact sequence of the degreewise free complex z^2(F, •) (cycle-complex), with H^{3}(F, Z(2)) = 0 from (c).
3. (c) is vanishing-above-weight (a), for Z and for Z/m coefficients.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), `K2SymbolsBrauer:T.2/matsumoto`

**Acceptance.**

- H^{2}(𝔽_q, Z(2)) = K_2(𝔽_q) = 0.
- H^{2}(ℝ, Z/2(2)) ≅ K_2(ℝ)/2 ≅ ℤ/2, generated by {−1, −1}.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4, printed p. 480 (PDF p. 488). The diagonal mod-m identification used in the weight-two case.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §2, printed p. 182 (PDF p. 6). The rational curves whose boundaries give the relations [a] + [b] = [ab] in CH^1(F, 1) and the Steinberg relation (a, 1 − a) = 0 in CH^2(F, 2) (scan text).

<a id="m-4-projective-bundle-formula"></a>

### M.4/projective-bundle-formula — The projective bundle formula for higher Chow groups

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/projective-bundle-formula`. Implementation: unchecked.

Let X be smooth quasi-projective over a field, E a vector bundle of rank r + 1 on X, π : ℙ(E) → X its projectivisation and ξ = c_1(O(1)) ∈ CH^1(ℙ(E), 0). Then ⊕_{i=0}^{r} CH^{q−i}(X, n) → CH^q(ℙ(E), n), (x_i) ↦ Σ_i π^*(x_i) · ξ^i, is an isomorphism for all q, n; the classes ξ^i are the universal classes used for Chern classes in M.8.

**Hypotheses and conventions.**

- X smooth quasi-projective over a field; E locally free of rank r + 1.

**Construction or proof.**

1. The map is natural for flat pullback along open immersions U ⊂ X (functoriality, products), so the Mayer–Vietoris sequences of zariski-descent and the five lemma reduce it, by induction on the number of opens in a trivialisation of E, to E trivial, ℙ(E) = ℙ^r_X.
2. For ℙ^r_X use induction on r with the localization sequence for ℙ^{r−1}_X ⊂ ℙ^r_X (codimension one, complement 𝔸^r_X) and homotopy invariance CH^q(𝔸^r_X, n) ≅ CH^q(X, n); the classes π^*(x)·ξ^i restrict compatibly, so the long exact sequence splits into the stated decomposition (Bloch 1986, Theorem 7.1).
3. ξ = c_1(O(1)) is the class of a hyperplane section in CH^1(ℙ(E), 0) = Pic(ℙ(E)) (weight-zero-and-one, chow-degree-zero).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/homotopy-invariance](#m-4-homotopy-invariance), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one)

**Acceptance.**

- CH^1(ℙ^1_F, 1) ≅ CH^1(F, 1) ⊕ CH^0(F, 1) = F^× ⊕ 0.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), 14.5.2, printed p. 111 (PDF p. 126); Theorem 15.12, printed p. 123 (PDF p. 138). The projective bundle theorem for Voevodsky's motives, proved by the same Mayer–Vietoris reduction to X × ℙ^n; the higher Chow statement is Bloch 1986, Theorem 7.1 (not among the supplied sources).

<a id="m-4-purity-gysin-triangle"></a>

### M.4/purity-gysin-triangle — Purity for cycle complexes with supports

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/purity-gysin-triangle`. Implementation: unchecked.

Let X be as in localization-sequence: equidimensional of finite type over a field, or equidimensional and essentially of finite type over a Dedekind scheme B (dedekind-cycle-complex). Let i : Z → X be a closed subscheme of pure codimension c with open complement j : U → X. Then there is a distinguished triangle of complexes of Zariski sheaves on X, i_* Z(q − c)_Z[−2c] → Z(q)_X → Rj_* Z(q)_U → i_* Z(q − c)_Z[−2c + 1], equivalently a purity isomorphism Ri^! Z(q)_X ≅ Z(q − c)_Z[−2c]. Hence motivic cohomology with supports is H^{p}_Z(X, Z(q)) ≅ H^{p−2c}(Z, Z(q − c)) = CH^{q−c}(Z, 2q − p), with shift 2c and twist c, and there is a long exact Gysin sequence ⋯ → H^{p−2c}(Z, Z(q − c)) → H^{p}(X, Z(q)) → H^{p}(U, Z(q)) → H^{p−2c+1}(Z, Z(q − c)) → ⋯, natural for flat pullback of pairs. No smoothness of Z is needed for the cycle complex; when X and Z are smooth over a field it is the Gysin triangle of a smooth pair, and over B it applies in particular to a fibre X_b over a closed point b (c = 1), where Z is smooth over k(b) but not over B.

**Hypotheses and conventions.**

- X equidimensional of finite type over a field, or equidimensional and essentially of finite type over a Dedekind scheme B.
- Z ⊂ X closed of pure codimension c; U = X ∖ Z.

**Construction or proof.**

1. Over a field: the exact sequence 0 → z^{q−c}(Z, •) → z^q(X, •) → z^q(U, •) with acyclic cokernel (localization-sequence, MVW 17.4(2)), applied to every open of X, gives the triangle of presheaves; reindex cohomologically (Z(q) = z^q[−2q]) to get the shift 2c and twist c.
2. Over a Dedekind scheme: the stalks are local rings essentially of finite type over a field or over a discrete valuation ring, where Levine's theorem applies (Geisser, Theorem 3.2 and Corollary 3.3(a)); Geisser's remark after Corollary 3.3 identifies j_* Z(q)_U ≅ Rj_* Z(q)_U and Z(q − c)_Z[−2c] ≅ i^! Z(q)_X ≅ Ri^! Z(q)_X (Spitzweck, Corollary 3.2).
3. Taking Zariski hypercohomology (zariski-descent) gives the supported groups and the Gysin sequence.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent), [MotivicEtaleKTheory:M.4/dedekind-cycle-complex](#m-4-dedekind-cycle-complex)

**Acceptance.**

- For X = 𝔸^1_F and Z = {0}: H^{2}_{\{0\}}(𝔸^1, Z(1)) ≅ H^{0}(F, Z(0)) = ℤ.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Properties 17.4(2), printed p. 136 (PDF p. 151). Bloch's localization sequence z^{i−c}(Z, •) → z^i(X, •) → z^i(U, •) with acyclic cokernel, for Z of pure codimension c (no smoothness).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Remark after Corollary 3.3, display (6), printed p. 780 (PDF p. 8). Zariski purity Z(n − c)_Z[−2c] ≅ i^! Z(n)_X ≅ Ri^! Z(n)_X over a Dedekind base, unconditional; Geisser's Theorem 1.2(1) is the étale analogue for closed fibres, truncated and conditional on the Bloch–Kato conjecture, and is not used here.

[Spitzweck2018](https://arxiv.org/pdf/1207.4078v3), §3, Corollary 3.2, PDF p. 8. Ri^! M_X(r) ≅ M_Z(r − c)[−2c] for Z, X in Sm'_{S'} (components smooth over S' or over a closed point of S').

<a id="m-4-dedekind-cycle-complex"></a>

### M.4/dedekind-cycle-complex — Cycle complexes over a Dedekind base

**Construction.** Identifier: `MotivicEtaleKTheory:M.4/dedekind-cycle-complex`. Implementation: unchecked.

Let B be the spectrum of a Dedekind ring (for example O_{F,S}) and X an equidimensional scheme essentially of finite type over B (essentially smooth over B for the Gersten, vanishing and comparison theorems). For n ≥ 0 let z^n(X, •) be the simplicial group of integral closed subschemes of X × Δ^• of codimension n meeting all faces properly (admissible-cycles over B), and Z(n)_X the cohomological complex of presheaves U ↦ z^n(U, 2n − •) on the small Zariski site; its terms are sheaves for the Zariski and for the étale topology (Geisser, Lemma 3.1), and Z(n)_et denotes the same complex on the small étale site. For an abelian group A, A(n) = Z(n) ⊗ A. Motivic cohomology is Zariski hypercohomology, H^{p}(X, A(n)) = H^{p}_Zar(X, A(n)); étale motivic cohomology is H^{p}_et(X, A(n)). Dimensions of integral B-schemes follow Geisser's convention (Krull dimension inside a closed fibre, Krull dimension of the generic fibre plus one for B-flat ones), so that on equidimensional X codimension and dimension indexing agree. When B is local (a field or a discrete valuation ring) H^{p}(X, Z(n)) is the homology H_{2n−p}(z^n(X, •)) of the global complex (Geisser, Theorem 3.2(b)); for general B, H^{p}(X, Z(n)) = H^{p}_Zar(B, p_* Z(n)) (Corollary 3.3(b)). This is the construction used for S-integers; theorems stated only for smooth varieties over a field are not applied to Spec O_F.

**Hypotheses and conventions.**

- B the spectrum of a Dedekind ring; X equidimensional and essentially of finite type over B.
- Essential smoothness of X over B is assumed only where a theorem requires it (dedekind-gersten).

**Construction or proof.**

1. Admissible cycles over B are defined with codimension, which is well behaved because X is equidimensional and essentially of finite type over the regular one-dimensional B; with Geisser's dimension function it agrees with the dimension indexing of admissible-cycles. Flat pullback preserves admissibility, giving the presheaf of complexes (functoriality).
2. Geisser's Lemma 3.1: the terms are étale sheaves (a flat unramified cover pulls cycles back to reduced cycles, and exactness reduces to a finite étale algebra over a field).
3. For B local, localization over B (localization-sequence; Levine's theorem, Geisser Theorem 3.2(a)) gives the Mayer–Vietoris property and the Brown–Gersten criterion gives Theorem 3.2(b) (zariski-descent); for general B the stalks of p_* Z(n) are local over B, so p_* Z(n) ≃ Rp_* Z(n) (Corollary 3.3(b)).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent)

**Proposed library location.** `TauCeti/AlgebraicGeometry/HigherChow`, namespace `TauCeti.HigherChow`.

**Planning API.**

- **TauCeti.HigherChow.dedekindComplex** (constructor): Z(n)_X for X essentially of finite type over a Dedekind scheme.
- **TauCeti.HigherChow.dedekind_H** (constructor): H^{p}(X, A(n)) as Zariski hypercohomology.
- **TauCeti.HigherChow.dedekind_restrict_field** (compatibility): For X with generic fibre X_F, colim over nonempty opens V ⊂ B of z^n(X_V, •) is z^n(X_F, •), the cycle complex of cycle-complex over the field F; hence H^{p}(X_F, Z(n)) = colim_V H^{p}(X_V, Z(n)).
- **TauCeti.HigherChow.dedekind_flat_pullback** (functoriality): Flat pullback Z(n)_X → f_*Z(n)_Y.
- **TauCeti.HigherChow.dedekind_etale** (constructor): The étale version Z(n)_et, the same complex on the small étale site (its terms are étale sheaves), and the change-of-topology map H^{p}(X, Z(n)) → H^{p}_et(X, Z(n)).
- **TauCeti.HigherChow.dedekind_H_eq_homology_of_local** (characterisation): For B the spectrum of a discrete valuation ring, H^{p}(X, Z(n)) ≅ H_{2n−p}(z^n(X, •)) (Geisser Theorem 3.2(b)); for general B, H^{p}(X, Z(n)) ≅ H^{p}_Zar(B, p_* Z(n)).

**Discriminating tests.**

- **HigherChow.test_dedekind_weight_zero** (degenerate): Z(0)_X ≃ ℤ for X connected and essentially smooth over B.
- **HigherChow.test_dedekind_units** (computation): H^{1}(Spec ℤ[1/2], Z(1)) ≅ ℤ[1/2]^× ≅ {±1} × 2^ℤ and H^{2}(Spec ℤ[1/2], Z(1)) ≅ Pic(ℤ[1/2]) = 0.
- **HigherChow.test_dedekind_generic** (compatibility): For X = Spec ℤ[1/2] and n = 1, colim over nonempty opens V ⊂ Spec ℤ[1/2] of H^{1}(V, Z(1)) is ℚ^× = H^{1}(Spec ℚ, Z(1)), the field cycle complex of cycle-complex.
- **HigherChow.test_not_codimension** (non-example): Krull dimension is not the right dimension function: for X = 𝔸^1_{ℤ_(p)} (dimension 2) the integral closed subscheme V(pt − 1) ≅ Spec ℚ has codimension 1 in X but Krull dimension 0, the same as the closed points of the special fibre, which have codimension 2. With Geisser's convention (Krull dimension of the generic fibre plus one for B-flat integral schemes) it has dimension 1 = dim X − codim, so a definition indexed by Krull dimension would misplace this cycle.

**Consumers.**

- MotivicEtaleKTheory:M.7/dedekind-motivic-comparison: The cycle map Z/m(j)_et ≃ μ_m^{⊗j} and Beilinson–Lichtenbaum over Spec O_{F,S}[1/ℓ].
- MotivicEtaleKTheory:M.5d request to M.4: 'Arithmetic extension uses the Geisser Dedekind base hypotheses.'
- ArithmeticKTheory:N.5/N.6: Motivic cohomology of S-integer rings on the E_2-page.

**Acceptance.**

- For X = Spec O_{F,S}: H^{1}(X, Z(1)) = O_{F,S}^× and H^{2}(X, Z(1)) = Pic(O_{F,S}), from the localization triangle over the closed points (purity-gysin-triangle), the field case of weight-zero-and-one and the valuation as boundary (nesterenko-suslin-totaro, n = 1).

**Sources.**

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §1, Notation, printed p. 775 (PDF p. 3). Geisser's setting for the arithmetic cycle complex.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §1, Notation, printed p. 775 (PDF p. 3). The dimension function on B-schemes (generic-fibre dimension plus one for flat ones).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §3, Lemma 3.1 and Theorem 3.2(b), printed pp. 778–779 (PDF pp. 6–7). Z(n) = z^n(−, 2n − •) is a complex of étale sheaves (Lemma 3.1); over a discrete valuation ring hypercohomology is the homology of the global cycle complex (Theorem 3.2(b), Levine).

<a id="m-4-dedekind-gersten"></a>

### M.4/dedekind-gersten — Coniveau, Gersten complexes and vanishing over a field or a Dedekind base

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/dedekind-gersten`. Implementation: unchecked.

Let B be the spectrum of a Dedekind ring or of a field and X equidimensional and essentially smooth over B. (a) Coniveau: for X local, filtering z^n(X, •) by the codimension in X of the projection of supports gives a spectral sequence E_1^{s,t} = ⊕_{x∈X^{(s)}} H^{2n−s+t}(k(x), Z(n − s)) ⇒ H^{2n+s+t}(X, Z(n)), whose rows are the Gersten complexes. (b) If X is the local ring at a point x of an essentially smooth B-scheme, lying over b ∈ B, the Gersten complex 0 → H^{t}(X, Z(n)) → ⊕_{y∈X^{(0)}} H^{t}(k(y), Z(n)) → ⊕_{y∈X^{(1)}} H^{t−1}(k(y), Z(n − 1)) → ⋯ is exact except possibly at its first two terms. With V the local ring of X at the generic point of the fibre X_b, it is exact at the first term if H^{t}(V, Z(n)) → H^{t}(k(X), Z(n)) is injective and at the second if H^{t+1}(V, Z(n)) → H^{t+1}(k(X), Z(n)) is injective. If b is the generic point of B, in particular if X is essentially smooth over a field, then V = k(X) and the complex is exact. Geisser's Theorem 1.1 (the Gersten resolution of the sheaves H^{t}(Z(n)) on X) assumes this injectivity for every discrete valuation ring essentially of finite type over B; that hypothesis is not asserted here. (c) Unconditionally, for X essentially smooth over B the cohomology sheaves vanish above the weight: H^{i}(Z(n)_X) = 0 for i > n; for X local, H^{p}(X, Z(n)) = 0 for p > n. (d) For X semilocal and essentially smooth over a field k, H^{p}(X, Z(n)) → H^{p}(k(X), Z(n)) is injective for all p, n.

**Hypotheses and conventions.**

- B the spectrum of a Dedekind ring or of a field; X equidimensional and essentially smooth over B.
- (a), (b): X local; (d): X semilocal and essentially smooth over a field.
- No injectivity hypothesis for discrete valuation rings is assumed; (b) states exactly what depends on it.

**Construction or proof.**

1. (a) Geisser §4: F^s z^n(X, •) is the colimit of the images of z^{n−s}(Z, •) over closed Z of codimension ≥ s; the localization theorem over B (localization-sequence, purity-gysin-triangle) in the colimit over pairs Y ⊂ Z identifies gr^s with ⊕_{x∈X^{(s)}} z^{n−s}(k(x), •) by restriction to generic points.
2. (b) Geisser's Theorem 4.2 and Corollary 4.3: a cycle in F^{s+1} that comes from F^s of a principal effective divisor Y flat over Λ = O_{B,b} maps to zero in F^s. The proof uses the Gillet–Levine relative presentation lemma (after shrinking, a projection X → 𝔸^{d−1}_Λ smooth of relative dimension one at x and quasi-finite on Y; requested from SchemeKTheoryOperations S.4), Zariski's main theorem, the graph embedding (id, g/(g − 1)) into Z̄ × ℙ^1, and a homotopy along a finite flat Λ-point a of 𝔸^1 chosen in a dense open set by a moving argument on the generic and closed fibres (moving-lemma, homotopy-invariance); when the residue field is finite, a points of ℓ-power degree for each prime ℓ ≠ p and the norm identity p_* p^* = ℓ^m (functoriality). For s > 0 every cycle of F^{s+1} is of this form, so the rows of the diagram (8) break into short exact sequences; the first two terms are controlled by V as stated. Over a field the same argument uses Quillen's presentation lemma (SchemeKTheoryOperations S.4/quillen-presentation-lemma).
3. (c) Geisser's Corollary 4.4: reduce to X local; by (b) it suffices that H^{i}(V, Z(n)) = 0 for i > n. The localization sequence of the discrete valuation ring V with residue field k gives H^{t}(V, Z(n)) = 0 for t > n + 1 by vanishing-above-weight for k(X) and k, and H^{n+1}(V, Z(n)) = coker(δ : H^{n}(k(X), Z(n)) → H^{n−1}(k, Z(n − 1))). Under nesterenko-suslin-totaro δ is ± the Milnor residue K^M_n(k(X)) → K^M_{n−1}(k), which is surjective ({x_1, …, x_{n−1}} lifts to {x̃_1, …, x̃_{n−1}, π}).
4. (d) Over a field the effacement of (b) holds for semilocal rings, because Quillen's presentation lemma treats a finite set of points; the coniveau filtration then shows that the kernel of H^{p}(X, Z(n)) → H^{p}(k(X), Z(n)) vanishes (Bloch's Gersten argument for higher Chow groups).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/dedekind-cycle-complex](#m-4-dedekind-cycle-complex), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/purity-gysin-triangle](#m-4-purity-gysin-triangle), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma), [MotivicEtaleKTheory:M.4/homotopy-invariance](#m-4-homotopy-invariance), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), `SchemeKTheoryOperations:S.4/quillen-presentation-lemma`, `SchemeKTheoryOperations:S.4`

**Acceptance.**

- For X = Spec ℤ_(p), n = t = 1: 0 → H^{1}(ℤ_(p), Z(1)) = ℤ_(p)^× → ℚ^× → ℤ → 0 is exact (the injectivity conditions hold in weight one: H^{1}(V, Z(1)) = V^× and H^{2}(V, Z(1)) = Pic(V) = 0).
- For V = ℤ_(p), H^{2}(V, Z(1)) = 0 and H^{3}(V, Z(2)) = coker(K^M_2(ℚ) → K^M_1(𝔽_p)) = 0, the tame symbol at p being surjective.

**Sources.**

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Theorem 1.1, printed p. 774 (PDF p. 2). The Gersten resolution, conditional on injectivity H^s(V, Z(n)) → H^s(K, Z(n)) for every discrete valuation ring V essentially of finite type over B.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §4, coniveau filtration, printed p. 782 (PDF p. 10). The coniveau spectral sequence with E_1 terms the cycle complexes of residue fields.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Corollary 4.3, printed p. 786 (PDF p. 14). Exact except at the first two terms, which are controlled by V (unconditional local statement).

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Corollary 4.4 and its proof, printed p. 786 (PDF p. 14). Unconditional vanishing of the cohomology sheaves above the weight, via the Milnor residue.

<a id="m-4-zariski-descent"></a>

### M.4/zariski-descent — Zariski descent for cycle complexes

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/zariski-descent`. Implementation: unchecked.

Let X be equidimensional of finite type over a field, or equidimensional and essentially of finite type over the spectrum of a discrete valuation ring. The presheaf of complexes U ↦ z^q(U, •) on X_Zar has the Mayer–Vietoris property: for opens U, V the square z^q(U ∪ V, •) → z^q(U, •) ⊕ z^q(V, •) → z^q(U ∩ V, •) is homotopy cartesian. Hence it satisfies Zariski descent: CH^q(U, n) → H^{2q−n}_Zar(U, Z(q)) is an isomorphism for every open U ⊂ X. Over a general Dedekind scheme B and X essentially of finite type over B, p_* Z(q) → Rp_* Z(q) is a quasi-isomorphism on B_Zar, so H^{p}(X, Z(q)) = H^{p}_Zar(B, p_* Z(q)).

**Hypotheses and conventions.**

- X equidimensional of finite type over a field, or equidimensional and essentially of finite type over the spectrum of a discrete valuation ring; for the last sentence, X essentially of finite type over a Dedekind scheme B.

**Construction or proof.**

1. For a cover U = V_1 ∪ V_2, the localization theorem (localization-sequence) for the closed complements U ∖ V_1 = V_2 ∖ V_12 gives exact rows 0 → z^q(U ∖ V_1) → z^q(U) → z^q(V_1) → coker → 0 with acyclic cokernels; a diagram chase gives the homotopy cartesian square (MVW 19.12, Bloch).
2. Brown–Gersten: a complex of presheaves with the Mayer–Vietoris property on a noetherian space of finite dimension satisfies Zariski descent (MVW 19.11). Apply SchemeKTheoryOperations S.4/brown-gersten-vanishing to the presheaf of Eilenberg–MacLane spectra of the cone of z^q(−, •) → I^• (an injective resolution of Z(q)), which has the Mayer–Vietoris property and acyclic stalks.
3. Over a Dedekind scheme: the stalks of p_* Z(q) at b ∈ B are the cycle complexes of the localisations X̃_b, local over B, where the first two steps apply (Geisser, Theorem 3.2(b) and Corollary 3.3(b)).

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), `SchemeKTheoryOperations:S.4/brown-gersten-vanishing`

**Acceptance.**

- For X = ℙ^1_F covered by two affine lines, Mayer–Vietoris recovers CH^1(ℙ^1, 0) = ℤ from CH^1(𝔸^1, 0) = 0 and CH^1(𝔾_m, 1) = F^× ⊕ ℤ.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 19.12, printed p. 162 (PDF p. 177). Zariski descent for Bloch's complexes over a field.

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), proof of Theorem 3.2 and Corollary 3.3(b), printed p. 780 (PDF p. 8). Brown–Gersten descent over a discrete valuation ring, and p_* Z(n) ≃ Rp_* Z(n) over a Dedekind base.

<a id="m-4-gersten-graph-comparison"></a>

### M.4/gersten-graph-comparison — The last Gersten terms and graph cycles: CH^p(X) and CH^p(X, 1)

**Theorem.** Identifier: `MotivicEtaleKTheory:M.4/gersten-graph-comparison`. Implementation: unchecked.

Let X be smooth, equidimensional and quasi-projective over a field k, and p ≥ 1. Let G^p(X) be the last three terms of the Gersten complex, ⊕_{y∈X^{(p−2)}} K^M_2(k(y)) --T--> ⊕_{y∈X^{(p−1)}} k(y)^× --div--> Z^p(X), where for y with closure Y, div(f) = Σ_z ord_z(f)·z over the codimension-one points z of Y (orders defined through the normalisation Ỹ: ord_z = Σ_{w over z} [k(w) : k(z)] ord_w), and T is the Gersten differential, whose component from y to a codimension-one point z of Y is Σ_{w ∈ Ỹ over z} N_{k(w)/k(z)} ∂_w with ∂_w the tame symbol of K2SymbolsBrauer T.3 at w. Then: (a) div ∘ T = 0 and coker(div) = CH^p(X) (chow-degree-zero). (b) For f ∈ k(y)^× ∖ {1}, the graph cycle Γ_f ⊂ X × □^1 (the closure of the graph of f on Y in Y × ℙ^1, intersected with X × (ℙ^1 ∖ {1}); Γ_1 = 0) is admissible of codimension p, and its cubical boundary is d Γ_f = div(f) as cycles. (c) The map (f_y)_y ↦ Σ_y Γ_{f_y} sends ker(div) to cycles, and induces a natural isomorphism ker(div)/im(T) ≅ CH^p(X, 1) = H^{2p−1}(X, Z(p)) (in the simplicial model through simplicial-cubical-comparison). (d) For y ∈ X^{(p−2)} and f, g ∈ k(y)^× ∖ {1} whose divisors on Ỹ have no common component, the graph Γ_{f,g} ⊂ X × □^2 (pushed forward from Ỹ) is admissible and d Γ_{f,g} = Σ_D (ord_D(f)·Γ_{g|D} − ord_D(g)·Γ_{f|D}) over the prime divisors D of Ỹ (pushed forward to X). Since the tame symbol at such D is ∂_D{f, g} = f^{ord_D g} g^{−ord_D f} with no sign, d Γ_{f,g} + Σ_D Γ_{∂_D{f,g}} lies in the subgroup generated by the cycles Γ_{ab} − Γ_a − Γ_b, which are zero in CH^p(X, 1) by (c); so the graph map carries T to boundaries, with sign −1 for the conventions of cubical-cycle-complex and T.3, and Γ_{f,g} is an explicit witness. Part (c) does not depend on (d).

**Hypotheses and conventions.**

- X smooth, equidimensional and quasi-projective over a field k; p ≥ 1.
- Tame symbols, norms and the cubical boundary are normalised as in K2SymbolsBrauer T.3/T.4 and cubical-cycle-complex.

**Construction or proof.**

1. Coniveau: the filtration of z^p(X, •) by codimension of supports (dedekind-gersten (a), with B the spectrum of k, now for the global X using localization-sequence) gives E_1^{s,t} with terms ⊕_{x∈X^{(s)}} CH^{p−s}(k(x), m). By vanishing-above-weight (CH^{q}(F, m) = 0 for q > m) the terms with m ≤ 2 are Z^p(X) (m = 0), ⊕_{X^{(p−1)}} CH^1(k(y), 1) = ⊕ k(y)^× (m = 1, weight-zero-and-one; CH^0(F, 1) = 0) and ⊕_{X^{(p−2)}} CH^2(k(y), 2) = ⊕ K^M_2(k(y)) (m = 2, nesterenko-suslin-totaro; CH^1(F, 2) = CH^0(F, 2) = 0).
2. Degeneration in total degrees m = 0, 1: every higher differential into or out of these positions has source or target a group CH^{q}(F, m') with q > m', hence zero; so CH^p(X) = coker(d_1) and CH^p(X, 1) = ker(d_1)/im(d_1) on this row.
3. Identification of d_1: the localization boundary from the generic point of Y to a codimension-one point z is computed on the normalisation Ỹ by proper pushforward (functoriality) and equals Σ_{w over z} N_{k(w)/k(z)} of the residue at w (nesterenko-suslin-totaro, residue and norm compatibility): the valuation on k(y)^× and the tame symbol on K^M_2(k(y)), up to the stated sign.
4. Graph cycles: Γ_f has dimension dim Y, meets the faces t = 0, ∞ in div_0(f), div_∞(f) (codimension p in X), so it is admissible and d Γ_f = ∂^0 Γ_f − ∂^∞ Γ_f = div(f); it represents the class of f under the boundary isomorphism of the localization sequence for Y ⊃ (Y minus the support of div f). For Γ_{f,g} with no common components, the faces t_1 ∈ {0, ∞} give the graphs of g on the components of div(f) with multiplicities ord(f), and t_2 ∈ {0, ∞} those of f on div(g); since at each component at most one of the orders is nonzero, the tame symbol there is f^{ord g} g^{−ord f} with no sign, and the sum of graph cycles agrees with Σ Γ_{T{f,g}} modulo the boundaries realising [a] + [b] = [ab] (Totaro p. 182). This chain-level witness is (d); (c) follows from the coniveau steps alone.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/dedekind-gersten](#m-4-dedekind-gersten), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.4/chow-degree-zero](#m-4-chow-degree-zero), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/simplicial-cubical-comparison](#m-4-simplicial-cubical-comparison), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`

**Consumers.**

- Polylogarithms:P.5/gersten-green-assembly (request to M.4): The graph map from the final Gersten terms into the Bloch cycle complex, an isomorphism on CH^p and CH^p(X, 1), compatible with tame-symbol and divisor signs.

**Acceptance.**

- p = 1: G^1 is k(X)^× → Z^1(X), so CH^1(X, 1) = ker(div) = O^×(X) and CH^1(X) = Pic(X), agreeing with weight-zero-and-one.
- X = 𝔸^1_k, p = 1: k(t)^× → ⊕_{closed points} ℤ has kernel k^× = CH^1(𝔸^1, 1) and cokernel 0 = CH^1(𝔸^1).

**Sources.**

[Geisser2004](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §4, coniveau spectral sequence, printed p. 782 (PDF p. 10). The coniveau filtration and its E_1 terms ⊕_{x∈X^{(s)}} H^{2n−s+t}(k(x), Z(n − s)), here for a smooth quasi-projective variety over a field.

[Totaro1992](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf), §2, printed p. 182 (PDF p. 6). Graph-type rational curves realise [a] + [b] = [ab] and the Steinberg relation as cubical boundaries.

### Remaining work for M.4

- Read Bloch, 'Algebraic cycles and higher K-theory' (1986), Bloch, 'The moving lemma for higher Chow groups' (1994), Levine, 'Techniques of localization in the theory of algebraic cycles' (2001) and Levine, 'K-theory and motivic cohomology of schemes' (Theorem 4.9) to cite the original statements of moving-lemma (a) and (c) and of localization-sequence; Levine 1994 (Theorem 4.7, Proposition 4.4, Theorem 4.5) is read and cited.
- Read Bloch, 'Algebraic cycles and higher K-theory' (1986), Theorems 6.1 and 7.1 and §10, and Levine, 'Techniques of localization in the theory of algebraic cycles' (J. Algebraic Geom. 10, 2001), Theorem 1.7, to cite the original statements in weight-zero-and-one (b), projective-bundle-formula, dedekind-gersten (d) and the global form of zariski-descent over a non-local Dedekind base.
- MotivesAndAlgebraicCycles MC.4 also asks M.4 for Suslin's comparison of the cycle complex z^i(X, •) with the complex of equidimensional cycles for affine X (MVW Theorem 18.3); add it as an M.4 theorem node after moving-lemma, with MVW Lecture 18 as source.
- Homotopy invariance over a Dedekind base, H^p(X × 𝔸^1, Z(n)) ≅ H^p(X, Z(n)) for X essentially of finite type over B (Geisser Corollary 3.5): add it to dedekind-cycle-complex, which then also cites localization-sequence.

<a id="m-5"></a>

## M.5 — The norm-residue theorem

A summary milestone importing the mod-prime geometric proof and M.5d prime-power passage. It is an output, not a premise of that induction.

**Planets:** Norm residue theorem.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.5c/mod-l-norm-residue](#m-5c-mod-l-norm-residue), [MotivicEtaleKTheory:M.5d/prime-power-norm-residue](#m-5d-prime-power-norm-residue)

<a id="m-5-norm-residue-theorem"></a>

### M.5/norm-residue-theorem — The norm residue theorem (Rost–Voevodsky)

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5/norm-residue-theorem`. Implementation: unchecked.

Let F be a field, ℓ a prime invertible in F and r ≥ 1. For every j ≥ 0, the norm residue homomorphism h^j_F : K^M_j(F)/ℓ^r → H^j(F, μ_{ℓ^r}^{⊗j}) of M.5c/galois-symbol-all-degrees is an isomorphism; together they form a graded ring isomorphism K^M_*(F)/ℓ^r ≅ ⊕_j H^j(F, μ_{ℓ^r}^{⊗j}). Consequently, for every integer m invertible in F, h_F : K^M_*(F)/m → ⊕_j H^j(F, μ_m^{⊗j}) is a graded ring isomorphism. In degree one it is the Kummer isomorphism of ProfiniteCohomology Layer 9; in degree two it is the Merkurjev–Suslin theorem, whose arithmetic special cases are M.3's Tate theorems. Its Beilinson–Lichtenbaum form (Z/m(i) ≃ τ_{≤i}Rα_*μ_m^{⊗i} for smooth schemes over F) is MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, and the residue-characteristic statement (Bloch–Gabber–Kato) is M.5d/bloch-gabber-kato, a separate theorem.

**Hypotheses and conventions.**

- F a field; ℓ prime with ℓ ≠ char F; r ≥ 1; j ≥ 0.

**Construction or proof.**

1. Mod ℓ for every field of characteristic ≠ ℓ: M.5c/mod-l-norm-residue (characteristic 0 by the Hilbert 90 induction, positive characteristic by specialisation from the fraction field of W(k^perf)).
2. ℓ^r coefficients by the compatible Bockstein induction on the coefficient sequences ℤ/ℓ(j) → ℤ/ℓ^r(j) → ℤ/ℓ^{r−1}(j), not by tensoring the mod-ℓ theorem: M.5d/prime-power-norm-residue. Its map is the composite K^M_j(F)/ℓ^r ≅ H^{j,j}(F, ℤ/ℓ^r) → H^j(F, μ_{ℓ^r}^{⊗j}), which is h^j_F by M.5c/galois-symbol-all-degrees (v).
3. Assemble the graded ring statement from multiplicativity of h_F; for general m invertible in F use ℤ/m = ∏_ℓ ℤ/ℓ^{r_ℓ}, μ_m^{⊗j} = ⊕_ℓ μ_{ℓ^{r_ℓ}}^{⊗j} and the compatibility of h_F with change of coefficients (galois-symbol-all-degrees (ii)).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5c/mod-l-norm-residue](#m-5c-mod-l-norm-residue), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.5d/prime-power-norm-residue](#m-5d-prime-power-norm-residue), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Acceptance.**

- K^M_j(𝔽_q)/ℓ^r = 0 = H^j(𝔽_q, μ_{ℓ^r}^{⊗j}) for j ≥ 2.
- K^M_2(F)/ℓ^r ≅ H²(F, μ_{ℓ^r}^{⊗2}) for every field F with ℓ ≠ char F (Merkurjev–Suslin).

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Corollary 4.1.1, printed p. 480 (PDF p. 488). K^M_i(k)/m ≅ H^i_et(k, μ_m^{⊗i}) for all i, as a ring isomorphism.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 6.16, PDF p. 41. Mod-l statement for all fields of characteristic ≠ l.

### Remaining work for M.5

No additional refinement is listed for this milestone. Its dependencies remain planned and its implementation is unchecked.

<a id="m-5a"></a>

## M.5a — Transfers and motivic homotopy prerequisites

Correspondences, sheaves with transfers, effective motivic complexes, cancellation, the cycle transfer action, étale realization, rigidity and permitted imperfect-field passage.

**Planets:** Finite correspondences, Motivic complexes ℤ(q), Effective motives DM^eff, Cancellation theorem, Motivic-to-étale comparison, Suslin's rigidity theorem.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/homotopy-invariance](#m-4-homotopy-invariance), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma)

<a id="m-5a-finite-correspondence"></a>

### M.5a/finite-correspondence — Finite correspondences

**Definition.** Identifier: `MotivicEtaleKTheory:M.5a/finite-correspondence`. Implementation: unchecked.

Let k be a field. For X smooth and connected over k and Y separated of finite type over k, an elementary correspondence from X to Y is an integral closed subscheme W ⊂ X × Y that is finite and surjective over X; Cor_k(X, Y) is the free abelian group on elementary correspondences (for non-connected X, the direct sum over the connected components). For X and Y smooth, W ∈ Cor_k(X, Y) and W' ∈ Cor_k(Y, Z), the composition W' ∘ W ∈ Cor_k(X, Z) is the pushforward to X × Z of the intersection product (W × Z) · (X × W') on X × Y × Z, which is defined because the two cycles meet properly and every component of their intersection is finite and surjective over X (MVW Lemma 1.7, which needs Y normal; Y smooth suffices). Composition is bilinear and associative, and Cor_k, with objects the smooth separated k-schemes of finite type, is an additive category containing Sm/k through the graph functor f ↦ Γ_f, with disjoint union as direct sum; X ⊗ Y = X × Y and W ⊗ W' = [W × W'] make it a symmetric monoidal category (MVW 1.5, 1.9).

**Hypotheses and conventions.**

- k a field; X smooth over k and Y separated of finite type over k for Cor_k(X, Y).
- For the composition W' ∘ W, X and Y are smooth over k; Z is smooth in Cor_k, and separated of finite type for the representable presheaves of non-smooth schemes (MVW Exercise 2.11).

**Construction or proof.**

1. Proper intersection: (W × Z) ∩ (X × W') is the image of W ×_Y W', each of whose components is finite and surjective over X since W' is finite and surjective over the normal scheme Y (MVW 1.6, 1.7); hence the pushforward to X × Z is a finite correspondence (MVW 1.4).
2. Intersection multiplicities are Serre's Tor formula (or Fulton's refined intersection product) on the smooth scheme X × Y × Z, and pushforward is along the finite projection to X × Z (SchemeAndStackFoundations SF.5).
3. Associativity and bilinearity follow from the projection formula as in Fulton 16.1; Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id.

**Direct prerequisites.** `mathlib:AlgebraicGeometry.AlgebraicCycle`, [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), `SchemeAndStackFoundations:SF.5`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

**Planning API.**

- **TauCeti.Transfers.Cor** (constructor): Cor_k(X, Y) as a free abelian group on elementary correspondences.
- **TauCeti.Transfers.graph** (constructor): Γ_f ∈ Cor_k(X, Y) for f : X → Y.
- **TauCeti.Transfers.comp** (constructor): Composition Cor_k(Y, Z) × Cor_k(X, Y) → Cor_k(X, Z).
- **TauCeti.Transfers.comp_assoc** (relation): Composition is associative and bilinear.
- **TauCeti.Transfers.graph_comp** (simp): Γ_g ∘ Γ_f = Γ_{g∘f} and Γ_id = id.
- **TauCeti.Transfers.transpose_finite** (other): For f : Y → X finite and surjective with X smooth and Y smooth and connected, the transpose Γ_f^t ⊂ X × Y is an elementary correspondence in Cor_k(X, Y), and Γ_f ∘ Γ_f^t = deg(f) · id_X in Cor_k(X, X) when X is connected (MVW 1.11, Example 2.7).
- **TauCeti.Transfers.tensor** (structure): X ⊗ Y = X × Y and W ⊗ W' = [W × W'] make Cor_k an additive symmetric monoidal category with unit Spec k, and Γ_f ⊗ Γ_g = Γ_{f×g} (MVW 1.9).
- **TauCeti.Transfers.baseChange** (functoriality): For a field extension k ⊂ F, X ↦ X_F extends to an additive symmetric monoidal functor Cor_k → Cor_F compatible with graphs; for F/k finite separable and U smooth over F, Cor_F(U, X_F) = Cor_k(U, X) (MVW Exercise 1.12), and Cor_F(X_F, Y_F) is the colimit of Cor_E(X_E, Y_E) over the subextensions E of finite type (MVW Exercise 1.13).

**Discriminating tests.**

- **Transfers.test_point_source** (computation): Cor_k(Spec k, 𝔸^1_k) is the free abelian group on closed points of 𝔸^1_k.
- **Transfers.test_empty** (degenerate): Cor_k(∅, Y) = 0 and Cor_k(X, ∅) = 0 for X nonempty.
- **Transfers.test_galois_group_ring** (compatibility): For L/k finite Galois with group G, Cor_k(Spec L, Spec L) ≅ ℤ[G] as rings.
- **Transfers.test_not_all_cycles** (non-example): The diagonal of 𝔸^1 × 𝔸^1 is a correspondence from 𝔸^1 to 𝔸^1, but the line {0} × 𝔸^1 is not (it is not finite over the first factor).

**Consumers.**

- MVW2006 Lectures 1-2: Morphisms of the category Cor_k on which presheaves with transfers are defined.
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): Finite correspondences and their composition underlie geometric motives.
- MotivicEtaleKTheory:M.4/functoriality and M.5a/cycle-complex-transfers: Correspondences act on higher Chow groups (MVW 17.21).
- MotivicEtaleKTheory:M.5a/tensor-product-transfers: The symmetric monoidal structure X ⊗ Y = X × Y of Cor_k is extended to presheaves with transfers (MVW 8.2, 8.10).
- MotivicEtaleKTheory:M.5a/imperfect-field-passage and MVW 3.8–3.9: Base change of correspondences along field extensions and its colimit formula give the independence of motivic cohomology from finite separable base change and the colimit formulas.

**Acceptance.**

- Cor_k(Spec k, X) is the group of zero-cycles on X.
- For L/k finite Galois with group G, Cor_k(Spec L, Spec L) ≅ ℤ[G].

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 1.1, PDF p. 18. Definition.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 1.7, PDF p. 20 (printed p. 5); corrected by the authors' list of corrections: Y must be normal. The composition is defined.

<a id="m-5a-presheaf-with-transfers"></a>

### M.5a/presheaf-with-transfers — Presheaves and Nisnevich sheaves with transfers

**Definition.** Identifier: `MotivicEtaleKTheory:M.5a/presheaf-with-transfers`. Implementation: unchecked.

Let k be a field, Sm/k the category of smooth separated k-schemes of finite type and R a commutative ring. A presheaf with transfers over k (with coefficients in R) is an additive contravariant functor F : Cor_k → R-mod; its restriction along the graph functor Sm/k → Cor_k is a presheaf on Sm/k. The representable presheaf is ℤ_tr(X) = Cor_k(−, X) and R_tr(X) = ℤ_tr(X) ⊗ R; by Yoneda Hom(R_tr(X), F) ≅ F(X), and R_tr(X) is projective. A Nisnevich (respectively étale) sheaf with transfers is a presheaf with transfers whose underlying presheaf is a sheaf for the Nisnevich (respectively étale) topology on Sm/k; the Nisnevich covering families are the families of étale maps {U_i → X} such that every point x ∈ X has a preimage with the same residue field, and a presheaf is a Nisnevich sheaf if and only if it takes every elementary (upper) distinguished square to a pullback square (MVW Lemma 12.7). ℤ_tr(X) is an étale, hence Nisnevich, sheaf for every scheme X of finite type (MVW 6.2), and the Nisnevich (respectively étale) sheafification of a presheaf with transfers carries a unique structure of presheaf with transfers making F → F_Nis a map of presheaves with transfers (MVW 13.1, 6.17). Sh_Nis(Cor_k, R) and Sh_et(Cor_k, R) are Grothendieck abelian categories, with enough injectives, and for X smooth, Ext^n(R_tr(X), F) ≅ H^n_Nis(X, F) (respectively H^n_et(X, F)) (MVW 13.4, 6.24). For an étale or Nisnevich covering U → X the Čech complex … → R_tr(U ×_X U) → R_tr(U) → R_tr(X) → 0 is exact as a complex of étale and of Nisnevich sheaves, and for a Zariski covering the finite Čech complex of the cover is (MVW 6.12, 6.14).

**Hypotheses and conventions.**

- k a field; Sm/k the smooth separated schemes of finite type over k; R a commutative ring (R = ℤ unless stated).

**Construction or proof.**

1. Nisnevich topology on Sm/k: its covering families are those of SchemeKTheoryOperations S.4/nisnevich-site, applied to smooth k-schemes; the characterisation by elementary distinguished squares is MVW Lemma 12.7 (Noetherian induction).
2. ℤ_tr(T) is an étale sheaf (MVW 6.2, faithfully flat descent of finite cycles); the Čech complex of a cover is exact on henselian (respectively strictly henselian) stalks because finite schemes over them are henselian and the cover splits (MVW 6.12); with the lifting of correspondences along covers (MVW 6.16) this gives unique transfers on sheafifications (MVW 6.17, 13.1).
3. Sh_Nis(Cor_k, R) satisfies AB5 and is generated by the R_tr(X), so it is Grothendieck abelian and has enough injectives (MVW 6.19, 13.1; Mathlib's IsGrothendieckAbelian.enoughInjectives); the canonical flasque resolution has transfers, which gives the Ext formula (MVW 13.3, 13.4, 6.20–6.24).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), `mathlib:AlgebraicGeometry.Scheme.smallGrothendieckTopology`, `SchemeKTheoryOperations:S.4/nisnevich-site`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

**Planning API.**

- **TauCeti.Transfers.PST** (constructor): The abelian category of presheaves with transfers.
- **TauCeti.Transfers.ztr** (constructor): ℤ_tr(X) = Cor_k(−, X), with the Yoneda isomorphism Hom(ℤ_tr(X), F) ≅ F(X).
- **TauCeti.Transfers.nisnevichTopology** (constructor): The Nisnevich topology on Sm/k, with the covering families of SchemeKTheoryOperations S.4/nisnevich-site; a presheaf is a sheaf if and only if it sends elementary distinguished squares to pullback squares (MVW 12.7).
- **TauCeti.Transfers.NST** (constructor): Nisnevich sheaves with transfers, Sh_Nis(Cor_k).
- **TauCeti.Transfers.sheafify_transfers** (universal-property): The Nisnevich sheafification of F ∈ PST has a unique transfer structure making F → F_Nis a map in PST.
- **TauCeti.Transfers.ztr_sheaf** (characterisation): ℤ_tr(X) is an étale sheaf, hence a Nisnevich sheaf.
- **TauCeti.Transfers.NST_abelian** (instance): Sh_Nis(Cor_k, R) is a Grothendieck abelian category (hence has enough injectives), and the inclusion into presheaves with transfers has the exact left adjoint F ↦ F_Nis (MVW 13.1).
- **TauCeti.Transfers.EST** (constructor): Étale sheaves with transfers Sh_et(Cor_k, R): a Grothendieck abelian category with exact sheafification F ↦ F_et carrying unique transfers (MVW 6.17–6.19); every Nisnevich sheaf with transfers that is an étale sheaf is one.
- **TauCeti.Transfers.ext_ztr** (characterisation): For X smooth and F a Nisnevich (respectively étale) sheaf of R-modules with transfers, Ext^n(R_tr(X), F) ≅ H^n_Nis(X, F) (respectively H^n_et(X, F)), and the cohomology presheaves H^n(−, F) are presheaves with transfers (MVW 13.4, 6.21, 6.24).
- **TauCeti.Transfers.cech_resolution** (other): For an étale or Nisnevich covering U → X the Čech complex of R_tr(U) resolves R_tr(X) as a complex of étale and of Nisnevich sheaves; for a Zariski covering {U_1, …, U_n} the finite complex 0 → R_tr(U_1 ∩ ⋯ ∩ U_n) → ⋯ → ⊕ R_tr(U_i) → R_tr(X) → 0 is exact as Nisnevich sheaves (MVW 6.12, 6.14), but not as Zariski sheaves (MVW 6.13).
- **TauCeti.Transfers.nisnevich_excision** (other): For f : Y → X étale between smooth schemes and Z ⊂ X closed with f^{−1}(Z) → Z an isomorphism, ℤ(Y)/ℤ(Y − f^{−1}Z) → ℤ(X)/ℤ(X − Z) is an isomorphism of Nisnevich sheaves (MVW Exercise 12.20), and likewise R_tr(Y)/R_tr(Y − f^{−1}Z) → R_tr(X)/R_tr(X − Z) (a correspondence from a henselian local scheme meeting Z lifts uniquely along f), as used in MVW 13.19 and 15.15.

**Discriminating tests.**

- **Transfers.test_ztr_point** (computation): ℤ_tr(Spec k)(X) = ℤ^{π_0(X)}.
- **Transfers.test_zero_presheaf** (degenerate): The zero presheaf is a Nisnevich sheaf with transfers.
- **Transfers.test_units** (compatibility): O^× with transfers given by norms agrees with G_m on Sm/k.
- **Transfers.test_nisnevich_not_etale** (non-example): For k = ℚ and l = 2, the Nisnevich sheaf with transfers O^×/2 (the sheaf associated with U ↦ O^×(U)/O^×(U)^2, equal to O^× ⊗_Nis ℤ/2) has value ℚ^×/ℚ^{×2} ≠ 0 at Spec ℚ, while its étale sheafification is 0 (MVW Exercise 12.9, Example 13.2): Nisnevich sheaves with transfers are not étale sheaves with transfers.

**Consumers.**

- MVW2006 Definition 3.1: Motivic complexes are complexes of presheaves with transfers.
- MVW2006 Definition 14.1: DM^eff,− is a localisation of D^−(Sh_Nis(Cor_k)).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): Nisnevich sheaves with transfers and the exactness of the Čech complex of a Zariski cover (MVW 6.12, 6.14).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): The Čech resolution of a Zariski cover gives the Mayer–Vietoris triangle (MVW 6.14, 13.15, 14.5.1).

**Acceptance.**

- O^× and G_m with their norm transfers are Nisnevich sheaves with transfers (MVW Example 2.4).
- Every constant presheaf ℤ has transfers given by degrees.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 2.1, PDF p. 28. Definition of presheaves with transfers.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 13.1, PDF p. 114 (printed p. 99). Nisnevich sheafification preserves transfers; the theorem also gives abelianness and enough injectives.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 6.2, PDF p. 52 (printed p. 37). ℤ_tr is an étale, hence Nisnevich, sheaf.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 6.12, PDF p. 54 (printed p. 39); the Nisnevich case is stated after its proof (and in the authors' corrections, p. 40). Exactness of the Čech complex.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 12.7, PDF p. 105 (printed p. 90). Nisnevich sheaves via distinguished squares.

<a id="m-5a-suslin-complex-and-motivic-complexes"></a>

### M.5a/suslin-complex-and-motivic-complexes — The Suslin complex and the motivic complexes ℤ(q)

**Construction.** Identifier: `MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes`. Implementation: unchecked.

For a presheaf F on Sm/k, C_•F is the simplicial presheaf U ↦ F(U × Δ^•) and C_*F its chain complex; if F has transfers, so does C_*F, and the homology presheaves of C_*F are homotopy invariant (MVW 2.14, 2.19). For q ≥ 0 the motivic complex is ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q], a bounded-above cochain complex of presheaves with transfers, zero in degrees > q (ℤ_tr(𝔾_m^{∧q}) the direct summand of ℤ_tr(𝔾_m^{×q}) complementary to the images of the coordinate inclusions, 𝔾_m pointed at 1; MVW 2.12, 2.13); A(q) = ℤ(q) ⊗ A for an abelian group A. Motivic cohomology is H^{p,q}(X, A) = H^{p}_Zar(X, A(q)) for X smooth, contravariant in X and covariant in the base field (MVW 3.4, 3.7), and unchanged by finite separable extension of the base field (MVW 3.8). There are quasi-isomorphisms ℤ(0) ≃ ℤ and ℤ(1) ≃ O^×[−1] of complexes of presheaves with transfers (MVW 4.1), homotopy-associative products ℤ(q) ⊗ ℤ(q') → ℤ(q + q') of complexes of presheaves (MVW 3.11) factoring through ℤ(q) ⊗_tr ℤ(q') (MVW 10.4), and for every field F, H^{n,n}(Spec F, ℤ) ≅ K^M_n(F) (MVW 5.1).

**Hypotheses and conventions.**

- k a field; q ≥ 0; A an abelian group; X smooth over k (motivic cohomology of fields F is taken over the prime field, or any subfield over which F is essentially smooth).

**Construction or proof.**

1. Define C_• via the cosimplicial scheme Δ^• (M.4/algebraic-simplex); transfers pass to C_*F termwise (MVW 2.9, 2.14); homotopy invariance of the homology presheaves by the simplicial decomposition of Δ^n × 𝔸^1 (MVW 2.16–2.19).
2. Define ℤ_tr(𝔾_m^{∧q}) as the cokernel of the coordinate-inclusion maps; it is a direct summand by the idempotents 1 − [x_i] (MVW 2.12, 2.13); ℤ(q) as in MVW Definition 3.1.
3. Weight one: the divisor map identifies the kernel of ℤ_tr(𝔾_m) → ℤ ⊕ O^× with a presheaf whose Suslin complex is acyclic (MVW 4.3–4.6), giving ℤ(1) ≃ O^×[−1] and H^{1,1} = O^×, H^{2,1} = Pic (MVW 4.1, 4.2).
4. Products: external product of correspondences followed by the diagonal and the Eilenberg–Zilber map (MVW 3.10, 3.11), factoring through ⊗_tr (MVW 10.4, tensor-product-transfers).
5. Diagonal: H^{n,n}(Spec F, ℤ) = H_0 C_*ℤ_tr(𝔾_m^{∧n})(Spec F) (MVW 5.2); norms of fields (MVW 5.3) and the Weil–Suslin reciprocity law give mutually inverse maps with K^M_n(F) (MVW 5.1, following Nesterenko–Suslin).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/tensor-product-transfers](#m-5a-tensor-product-transfers), `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/weil-reciprocity`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

**Planning API.**

- **TauCeti.Transfers.suslinComplex** (constructor): C_*F for a presheaf (with transfers) F.
- **TauCeti.Transfers.motivicComplex** (constructor): ℤ(q) = C_*ℤ_tr(𝔾_m^{∧q})[−q] and A(q) = ℤ(q) ⊗ A.
- **TauCeti.Transfers.motivicCohomology** (constructor): H^{p,q}(X, A) = H^{p}_Zar(X, A(q)).
- **TauCeti.Transfers.motivicComplex_zero** (equivalence): ℤ(0) ≃ ℤ.
- **TauCeti.Transfers.motivicComplex_one** (equivalence): ℤ(1) ≃ O^×[−1] (MVW 4.1).
- **TauCeti.Transfers.mul** (constructor): Products ℤ(q) ⊗ ℤ(q') → ℤ(q + q') of complexes of presheaves, homotopy associative (MVW 3.11), factoring through ℤ(q) ⊗_tr ℤ(q') (MVW 10.4); they induce associative pairings H^{p,q}(X, ℤ) ⊗ H^{p',q'}(X, ℤ) → H^{p+p',q+q'}(X, ℤ) (MVW 3.12). Their graded commutativity (MVW 15.9) rests on the triviality of the symmetric group action on ℤ(n) over a perfect field, MotivesAndAlgebraicCycles MC.4/symmetric-group-acts-trivially-on-tate-twists.
- **TauCeti.Transfers.diagonal_milnor** (equivalence): H^{n,n}(Spec F, ℤ) ≅ K^M_n(F), sending {a_1, …, a_n} to the product of the classes of a_i (MVW 5.1).
- **TauCeti.Transfers.motivicCohomology_baseChange** (functoriality): For a field extension k ⊂ F there is a natural map H^{p,q}(X, A) → H^{p,q}(X_F, A), and for F/k finite separable and U smooth over F the motivic complexes of U over k and over F agree (MVW 3.7, 3.8).

**Discriminating tests.**

- **Transfers.test_weight_zero** (degenerate): H^{0,0}(X, ℤ) = ℤ^{π_0(X)} and H^{p,0} = 0 for p ≠ 0.
- **Transfers.test_weight_one_field** (computation): H^{1,1}(Spec F, ℤ) ≅ F^×.
- **Transfers.test_vs_cycle_complex** (compatibility): For X smooth over a perfect field, H^{p,q}(X, ℤ) ≅ H^{p}(X, Z(q)) of M.4 (MVW 19.1; the comparison is MotivesAndAlgebraicCycles MC.4's).
- **Transfers.test_negative_vanish** (non-example): H^{p,q}(Spec F, ℤ) = 0 for p > q (ℤ(q) vanishes in degrees > q and Spec F has Zariski cohomological dimension 0), and the smash product matters: with the unreduced complex C_*ℤ_tr(𝔾_m)[−1] in place of ℤ(1), the first cohomology at Spec F would be ℤ ⊕ F^× (MVW 4.4, 7.3) instead of H^{1,1}(Spec F, ℤ) = F^×.

**Consumers.**

- MotivicEtaleKTheory:M.5c: The cohomology H^{p,q} of simplicial schemes in which the inductive proof takes place is computed with these complexes.
- MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison and M.7/beilinson-lichtenbaum: Z/m(j) in the Beilinson–Lichtenbaum statement is this complex (compared with M.4's cycle complex).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): R(q) = C_*R_tr(G_m^{∧q})[−q] with R(1)^{⊗q} = R(q) and multiplication maps (MVW 3.1, 2.13, 10.4).

**Acceptance.**

- H^{1,1}(F, ℤ) = F^×; H^{2,1}(X, ℤ) = Pic(X) for X smooth.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 3.1, PDF p. 36. Definition of ℤ(q).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 5.1, PDF p. 44. H^{n,n}(Spec F, ℤ) ≅ K^M_n(F).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 2.14, PDF p. 31. The Suslin complex.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 4.1, PDF p. 40 (printed p. 25). ℤ(1) ≃ O^×[−1].

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Construction 3.11, PDF p. 39 (printed p. 24). Products ℤ(m) ⊗ ℤ(n) → ℤ(m + n).

<a id="m-5a-homotopy-invariant-sheaves"></a>

### M.5a/homotopy-invariant-sheaves — Voevodsky's theorem on homotopy invariant presheaves with transfers

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves`. Implementation: unchecked.

Let k be a perfect field and F a homotopy invariant presheaf with transfers (F(X) ≅ F(X × 𝔸^1) for X smooth). Then each presheaf H^{n}_Nis(−, F_Nis), n ≥ 0, is homotopy invariant (MVW Theorem 13.8; its proof is completed in MVW 24.1, the case n = 0 in 22.3), and it is a presheaf with transfers (MVW 13.4). Consequences over a perfect field: for a homotopy invariant Nisnevich sheaf with transfers F and X smooth, H^n_Zar(X, F) ≅ H^n_Nis(X, F) (MVW 13.9); for a bounded above complex C of Nisnevich sheaves with transfers with homotopy invariant cohomology sheaves, H^n_Zar(X, C) ≅ H^n_Nis(X, C) (MVW 13.10); if F is a presheaf with transfers with F_Nis = 0, then (C_*F)_Nis ≃ 0 and (C_*F)_Zar ≃ 0 (MVW 13.12); and a map of bounded above complexes of presheaves with transfers that is a quasi-isomorphism on all henselian local schemes induces a quasi-isomorphism of Tot C_* on all local schemes (MVW 13.14). Over any field k: if F is a homotopy invariant presheaf with transfers with F(Spec E) = 0 for every field E over k, then F_Zar = 0 (MVW 11.2), and a map A → B of complexes of presheaves with transfers with homotopy invariant cohomology presheaves which is a quasi-isomorphism on every field over k is a Zariski quasi-isomorphism (MVW 13.7).

**Hypotheses and conventions.**

- k perfect for MVW 13.8–13.14; MVW 11.2 and 13.7 hold over any field.
- F a homotopy invariant presheaf with transfers on Sm/k; complexes are bounded above.

**Construction or proof.**

1. Standard triples and the relative Picard pairing give, over any field, purity of homotopy invariant presheaves with transfers on smooth semilocal schemes (MVW 11.1, 11.3), hence MVW 11.2 and 13.7.
2. Over a perfect field, the Gersten-type and contraction arguments of MVW Lectures 21–24 give homotopy invariance of F_Nis (MVW 22.3) and of its cohomology presheaves (MVW 13.8, 24.1).
3. MVW 13.9 and 13.10 follow from 13.8, 13.4 and 11.2 by the Leray spectral sequence and induction on the length of the complex; 13.12 and 13.14 follow from 13.8 and MVW 12.19.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes)

**Acceptance.**

- F = O^× (homotopy invariant on smooth schemes since O(X × 𝔸^1)^× = O(X)^× for X reduced).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 13.8, PDF p. 115. Statement; the proof is completed in MVW 24.1, the case n = 0 in 22.3.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Remark before Theorem 13.8, PDF p. 115 (printed p. 100). Where the proof of 13.8 is completed.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Corollary 11.2, PDF p. 98 (printed p. 83). The field criterion, over any field.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 13.9, PDF p. 116 (printed p. 101). Zariski and Nisnevich cohomology agree.

<a id="m-5a-effective-motives"></a>

### M.5a/effective-motives — The triangulated category of effective motives

**Construction.** Identifier: `MotivicEtaleKTheory:M.5a/effective-motives`. Implementation: unchecked.

For a field k and a commutative ring R, let D^− = D^−(Sh_Nis(Cor_k, R)) be the derived category of cohomologically bounded above complexes and E_A ⊂ D^− the smallest thick subcategory containing the cones of R_tr(X × 𝔸^1) → R_tr(X) for all smooth X and closed under the direct sums that exist in D^−. The A¹-weak equivalences W_A are the morphisms with cone in E_A, and DM^{eff,−}_Nis(k, R) = D^−[W_A^{−1}] is the Verdier localisation (MVW Definition 14.1). The motive of X ∈ Sm/k is M(X), the image of R_tr(X); for every bounded above K the map K → Tot C_*K is an A¹-weak equivalence, so M(X) ≅ C_*R_tr(X) (MVW 14.4). The derived tensor product of tensor-product-transfers descends, making DM^{eff,−}_Nis(k, R) a tensor triangulated category with unit M(Spec k) = R and M(X) ⊗ M(Y) ≅ M(X × Y) (MVW 14.2), and the Tate objects are the images R(q) of the motivic complexes, with R(i) ⊗ R(j) ≅ R(i + j). If k is perfect, a complex is A¹-local exactly when its cohomology sheaves are homotopy invariant (MVW 14.8), C_* is left adjoint to the inclusion of the A¹-local complexes, which identifies DM^{eff,−}_Nis(k, R) with them as tensor triangulated categories (MVW 14.11), and motivic cohomology is representable: H^{n,i}(X, R) ≅ Hom(M(X), R(i)[n]) and more generally H^n_Zar(X, L) ≅ Hom(M(X), L[n]) for L A¹-local (MVW 14.16). Simplicial smooth schemes 𝒳 have motives M(𝒳), the class of the bounded above complex associated with the simplicial sheaf R_tr(𝒳_•), with reduced versions for pointed ones. The étale analogue DM^{eff,−}_et(k, R) = D^−(Sh_et(Cor_k, R))[W_A^{−1}] is defined in the same way (MVW Definition 9.2).

**Hypotheses and conventions.**

- k a field and R a commutative ring for the definition, the tensor structure and MVW 14.4.
- k perfect for the description by A¹-local complexes (MVW 14.8, 14.11) and the representability of motivic cohomology (MVW 14.16), which rest on homotopy-invariant-sheaves.

**Construction or proof.**

1. Define the localisation (Mathlib supplies the Verdier localisation: the A¹-weak equivalences are ObjectProperty.trW of the thick subcategory generated by the cones, whose localisation is triangulated (Triangulated.Localization); the tensor product descends by Localization.Monoidal once that class is shown stable under ⊗ with the representables, and exactness of ⊗ in each variable is checked on the Suslin complexes).
2. Over a perfect field, homotopy-invariant-sheaves shows that a complex with homotopy invariant cohomology sheaves is A¹-local and that C_*K is A¹-local for every K, so C_* realises the localisation (MVW 14.8, 14.9, 14.11).
3. Representability from MVW 13.10, 13.5 and 14.6.1 (MVW Proposition 14.16).
4. The tensor structure: W_A is stable under ⊗^L_{tr,Nis} with any object (MVW 9.5, 9.6, which go through for the Nisnevich topology by 14.2), so the monoidal structure descends (Mathlib's LocalizedMonoidal for a monoidal class of morphisms; MVW 8A.7); R(i) ⊗ R(j) ≅ R(i + j) because R(1)[1] ≅ R_tr(𝔾_m^{∧1}) by 14.4 and R_tr(𝔾_m^{∧1})^{⊗ q} = R_tr(𝔾_m^{∧q}) (MVW 8.10), as in MVW 10.5.
5. The localisation is Mathlib's Verdier localisation: E_A is a triangulated subcategory of the bounded-above derived category (DerivedCategory.Minus) of Sh_Nis(Cor_k, R), stable under the direct sums that exist there, and W_A is its class of morphisms ObjectProperty.trW.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves](#m-5a-homotopy-invariant-sheaves), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), `mathlib:DerivedCategory`, `mathlib:CategoryTheory.ObjectProperty.trW`, `mathlib:CategoryTheory.Triangulated.Localization.pretriangulated`, `mathlib:CategoryTheory.Localization.Monoidal.toMonoidalCategory`, [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.5a/tensor-product-transfers](#m-5a-tensor-product-transfers), `mathlib:DerivedCategory.Minus`, `mathlib:CategoryTheory.Triangulated.Localization.isTriangulated`, `mathlib:CategoryTheory.LocalizedMonoidal`, `mathlib:CategoryTheory.MorphismProperty.IsMonoidal`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

**Planning API.**

- **TauCeti.Transfers.DMeff** (constructor): DM^{eff,−}_Nis(k, R) = D^−(Sh_Nis(Cor_k, R))[W_A^{−1}], a tensor triangulated category, with the triangulated localisation functor from D^−(Sh_Nis(Cor_k, R)).
- **TauCeti.Transfers.motive** (constructor): M(X) for X ∈ Sm/k and M(𝒳) for smooth simplicial schemes.
- **TauCeti.Transfers.motive_tensor** (simp): M(X) ⊗ M(Y) ≅ M(X × Y).
- **TauCeti.Transfers.motive_A1** (simp): M(X × 𝔸^1) ≅ M(X).
- **TauCeti.Transfers.hom_motive_tate** (characterisation): For k perfect and X smooth, Hom(M(X), R(i)[n]) ≅ H^{n,i}(X, R), and Hom(M(X), L[n]) ≅ H^n_Zar(X, L) for L A¹-local (MVW 14.16).
- **TauCeti.Transfers.localisation_equiv** (equivalence): For k perfect, the A¹-local complexes are those with homotopy invariant cohomology sheaves; they form a full tensor triangulated subcategory equivalent to DM^{eff,−}_Nis(k, R), with C_* as left adjoint of the inclusion (MVW 14.8, 14.11).
- **TauCeti.Transfers.motive_suslin** (characterisation): K → Tot C_*K is an A¹-weak equivalence for every bounded above complex K, so M(X) ≅ C_*R_tr(X) (MVW 14.4).
- **TauCeti.Transfers.tate_tensor** (relation): R(i) ⊗ R(j) ≅ R(i + j) in DM^{eff,−}_Nis(k, R), induced by the product of MVW 10.4, and R(1)[1] ≅ M(𝔾_m^{∧1}) is the reduced motive of (𝔾_m, 1).
- **TauCeti.Transfers.rhom** (universal-property): For X smooth over a perfect field, RHom(R_tr(X), −) is right adjoint to − ⊗ M(X) on D^−(Sh_Nis(Cor_k, R)) and on DM^{eff,−}_Nis(k, R), and preserves A¹-local complexes (MVW 14.12).
- **TauCeti.Transfers.DMeffEt** (other): The étale analogue DM^{eff,−}_et(k, R) = D^−(Sh_et(Cor_k, R))[W_A^{−1}] (MVW Definition 9.2), with the tensor triangulated sheafification functor DM^{eff,−}_Nis(k, R) → DM^{eff,−}_et(k, R) (MVW 14.3).

**Discriminating tests.**

- **Transfers.test_point** (degenerate): M(Spec k) = R is the unit object.
- **Transfers.test_projective_line** (computation): Over a perfect field, Hom(M(ℙ^1), R(1)[2]) ≅ H^{2,1}(ℙ^1, R) ≅ Pic(ℙ^1) ⊗ R ≅ R, while Hom(M(Spec k), R(1)[2]) ≅ H^{2,1}(Spec k, R) = 0.
- **Transfers.test_hom_cycles** (compatibility): Over a perfect field and for X smooth, Hom(M(X), ℤ(1)[2]) ≅ Pic(X) = CH^1(X), Tau Ceti's group of line-bundle classes (MVW 4.2 and 14.16); the comparison Hom(M(X), ℤ(q)[p]) ≅ CH^q(X, 2q − p) in all weights is MotivesAndAlgebraicCycles MC.4/motivic-cohomology-higher-chow.
- **Transfers.test_affine_line** (non-example): M(𝔸^1) → M(Spec k) is an isomorphism, whereas ℤ_tr(𝔸^1) → ℤ is not an isomorphism in D^−(Sh_Nis(Cor_k)): at the point Spec k it is the degree map from the zero-cycles of 𝔸^1 to ℤ, whose kernel contains [0] − [1] ≠ 0. A definition omitting the A¹-localisation fails this test.

**Consumers.**

- Voevodsky2011 §§4-6: The Rost motive, the Čech motives M(Č(X)) and the degree theorem live in DM^{eff,−}(k, ℤ_(l)) and DM(k, ℤ/l).
- MotivesAndAlgebraicCycles:MC.4: Geometric motives and Tate stabilisation extend this category (MC.4 owns them).
- MotivicEtaleKTheory:M.5b/motivic-steenrod-operations: Operations are defined on motivic cohomology of pointed simplicial schemes, representable here.
- MotivicEtaleKTheory:M.5a/etale-motivic-comparison: The étale analogue DM^{eff,−}_et(k, ℤ/n), in which ℤ/n(1)^{⊗q} → ℤ/n(q) is an A¹-weak equivalence (MVW 10.5).
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): RHom(M(X), −) (MVW 14.12) for duals of geometric motives, and R(1)^{⊗q} ≅ R(q).

**Acceptance.**

- M(X × 𝔸^1) → M(X) is an isomorphism for every smooth X, by the definition of W_A.
- Over a perfect field, Hom(M(X), ℤ(1)[1]) ≅ O(X)^× and Hom(M(X), ℤ(1)[2]) ≅ Pic(X) for X smooth (MVW 4.2 and 14.16).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 14.1, PDF p. 124. Definition of DM^{eff,−}_Nis(k, R) and M(X).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 14.16, PDF p. 129. Representability.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lecture 14, before Definition 14.1, PDF p. 124 (printed p. 109). The A¹-weak equivalences.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 14.8, PDF p. 127 (printed p. 112). A¹-local complexes over a perfect field.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 14.11, PDF p. 128 (printed p. 113). The A¹-local complexes model DM^{eff,−}_Nis.

<a id="m-5a-cancellation"></a>

### M.5a/cancellation — Voevodsky's cancellation theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/cancellation`. Implementation: unchecked.

Let k be a perfect field. For all M, N in DM^{eff,−}_Nis(k, ℤ), tensoring with ℤ(1) induces a bijection Hom(M, N) → Hom(M(1), N(1)) (Voevodsky, Corollary 4.10), and the same argument with R_tr in place of ℤ_tr gives it in DM^{eff,−}_Nis(k, R) for every commutative ring R. In particular, for X smooth, H^{p,q}(X, ℤ) ≅ H^{p+1,q+1}(X × 𝔾_m, ℤ)/H^{p+1,q+1}(X, ℤ), the quotient by the split image of the pullback along the projection. No resolution of singularities is assumed. This is the input for the full faithfulness of Tate stabilisation, which MotivesAndAlgebraicCycles MC.4 owns.

**Hypotheses and conventions.**

- k a perfect field; integral coefficients in Voevodsky's Corollary 4.10, and any commutative ring R by the same argument.

**Construction or proof.**

1. For a finite correspondence Z : 𝔾_m × X → 𝔾_m × Y and n ≫ 0, intersect Z with the divisor of g_n = (f_1^{n+1} − 1)/(f_1^{n+1} − f_2), f_1, f_2 the coordinates of the two factors 𝔾_m, to get ρ_n(Z) ∈ Cor_k(X, Y); then ρ_n(id_{𝔾_m} ⊗ W) = W, ρ_n vanishes on correspondences through the base point 1, ρ_n is compatible with composition and products, and ρ_n, ρ_m are A¹-homotopic (Voevodsky, Lemmas 4.1–4.5, Remark 4.2).
2. Hence every φ : St_1 ⊗ F → St_1 ⊗ ℤ_tr(Y), St_1 = ℤ_tr(𝔾_m^{∧1}), is A¹-homotopic to id ⊗ ρ(φ) for a unique-up-to-A¹-homotopy ρ(φ), using that the permutation of St_1 ⊗ St_1 is A¹-homotopic to {−1} ⊗ id (Theorem 4.6, Lemma 4.8), and C_*ℤ_tr(Y) → C_*Hom(St_1, St_1 ⊗ ℤ_tr(Y)) is a quasi-isomorphism (Corollary 4.9).
3. Reduce to M = M(X)[n], N = M(Y) by generation, and identify Hom(St_1 ⊗ M(X), F[n]) with Hom(M(X), Hom(St_1, F)[n]) through the comparison of Zariski and Nisnevich cohomology of homotopy invariant sheaves with transfers over a perfect field (Corollary 4.10, homotopy-invariant-sheaves).
4. Over a field with resolution of singularities, MVW 16.25 gives a second proof through Friedlander–Voevodsky duality; it is not used.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves](#m-5a-homotopy-invariant-sheaves), [MotivicEtaleKTheory:M.5a/tensor-product-transfers](#m-5a-tensor-product-transfers), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence)

**Acceptance.**

- Hom(ℤ(1), ℤ(1)) = Hom(ℤ, ℤ) = ℤ.

**Sources.**

[Voevodsky2010Cancel](https://arxiv.org/pdf/math/0202012v1), Corollary 4.10, PDF p. 14. Cancellation over any perfect field (arXiv version read).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 16.25, PDF p. 146. MVW's version, assuming resolution of singularities.

[Voevodsky2010Cancel](https://arxiv.org/pdf/math/0202012v1), §1 Introduction, PDF p. 1 (arXiv v1). The main theorem, Corollary 4.9.

[Voevodsky2010Cancel](https://arxiv.org/pdf/math/0202012v1), §4, before Lemma 4.1, PDF p. 9. The function whose divisor defines ρ_n.

<a id="m-5a-cycle-complex-transfers"></a>

### M.5a/cycle-complex-transfers — Transfers on higher Chow groups

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/cycle-complex-transfers`. Implementation: unchecked.

Let k be a field. Finite correspondences act on higher Chow groups: for W ∈ Cor_k(X, Y) between smooth separated k-schemes of finite type there is W^* : CH^i(Y, m) → CH^i(X, m). For Y affine it is induced by the chain map W^*(𝒵) = π_*((W × Δ^m) · (X × 𝒵)) on the subcomplex z^i(Y, •)_W ⊂ z^i(Y, •) of cycles in good position for W, which is quasi-isomorphic to z^i(Y, •) (Levine's moving lemma, MVW 17.6, 17.10, 17.11); in general it is defined through affine vector bundle torsors given by Jouanolou's device (MVW 17.17), independently of choices. These maps make CH^i(−, m) a presheaf with transfers on Sm/k (MVW 17.21), compatible with the graph functor (W = Γ_f gives the Bloch–Levine pullback f^*, which is flat pullback when f is flat) and, for m = 0, equal to the action of correspondences on Chow groups of MVW Example 2.5. The comparison of motivic cohomology with higher Chow groups (MVW 19.1) and its compatibility with these transfers (MVW 19.6, 19.8) belong to MotivesAndAlgebraicCycles MC.4 (MC.4/suslin-friedlander-into-cycle-complex, MC.4/motivic-cohomology-higher-chow), which imports this node.

**Hypotheses and conventions.**

- k a field (no perfectness or resolution of singularities is needed); X, Y smooth separated of finite type over k; the moving lemma is applied with Y affine.

**Construction or proof.**

1. Y affine: z^i(Y, •)_W ⊂ z^i(Y, •) is a quasi-isomorphism by Levine's moving lemma (MVW 17.6, a form of M.4/moving-lemma for the locally closed subsets attached to W); W^* is a chain map by the intersection identities of MVW Appendix 17A (MVW 17.10); for X, Y, Z affine, (W_2 ∘ W_1)^* = W_1^* W_2^* (MVW 17.13, Theorem 17A.14).
2. General smooth X, Y: Jouanolou's device gives vector bundle torsors X' → X, Y' → Y with X', Y' affine, inducing isomorphisms on higher Chow groups by homotopy invariance and localisation (MVW 17.14); lift W to W' (MVW 17.15, 17.16), set W^* = (p^*)^{−1} W'^* q^*, and check independence of the choices by A¹-homotopy of lifts (MVW 17.18–17.20); composition follows (MVW 17.21).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.4/homotopy-invariance](#m-4-homotopy-invariance), `SchemeAndStackFoundations:SF.5`

**Acceptance.**

- For W = Γ_f with f flat, W^* is flat pullback of cycles (MVW 17.12).
- For m = 0, W^* is φ_W(α) = q_*(W · p^*α) on CH^i (MVW Example 2.5).
- For q = 1, W^* on CH^1(Y, 1) = O(Y)^× is the norm along W.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 17.21, PDF p. 157. Transfers on higher Chow groups.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 17.6, PDF p. 152 (printed p. 137). Levine's moving lemma for correspondences.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 17.17, PDF p. 155 (printed p. 140). Extension from affine to all smooth schemes.

<a id="m-5a-etale-motivic-comparison"></a>

### M.5a/etale-motivic-comparison — Étale motivic cohomology with finite coefficients and the comparison map

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/etale-motivic-comparison`. Implementation: unchecked.

Let k be a field and n invertible in k. (a) The map μ_n^{⊗q} → ℤ/n(q) of complexes of étale sheaves with transfers on Sm/k, obtained from the quasi-isomorphism μ_n ≃ ℤ/n(1)_et and the products of the motivic complexes, is a quasi-isomorphism (MVW Theorem 10.3). Hence H^{p,q}_L(X, ℤ/n) := H^{p}_et(X, ℤ/n(q)) ≅ H^{p}_et(X, μ_n^{⊗q}) for X smooth, where μ_n^{⊗q} restricts on X_et to the étale twist of M.1 (MVW Theorem 10.2). (b) Change of topology from the Zariski to the étale site gives a natural map H^{p,q}(X, ℤ/n) → H^{p}_et(X, ℤ/n(q)) ≅ H^{p}_et(X, μ_n^{⊗q}), multiplicative and a map of presheaves with transfers in X. In weight one and degree one it is an isomorphism H^{1,1}(X, ℤ/n) ≅ H^{1}_et(X, μ_n) (MVW 4.9), restricting on the subgroup O(X)^×/n to the Kummer map; for X = Spec F it is the Kummer isomorphism F^×/n ≅ H^1(F, μ_n). This is the motivic-to-étale map of the norm residue theorem.

**Hypotheses and conventions.**

- k a field; n invertible in k; X smooth over k.
- MVW's proof of 10.3 uses Lemma 9.31, which assumes cd_n(k) < ∞; the general case is reduced to it in the proof sketch.

**Construction or proof.**

1. q = 1: ℤ(1) ≃ O^×[−1] (MVW 4.1) and the étale Kummer sequence give μ_n ≃ ℤ/n(1)_et (MVW 4.8, which needs 1/n ∈ k, and 6.4); the Nisnevich sheaf O^×/n has zero étale sheafification (MVW 13.2).
2. Case cd_n(k) < ∞: the product ℤ/n(1)^{⊗^L_tr q} → ℤ/n(q) is an étale A¹-weak equivalence (MVW 10.4, 10.5, from tensor-product-transfers and MVW 8.10), and μ_n^{⊗q} → ℤ/n(1)^{⊗^L_tr q} is a quasi-isomorphism (MVW 8.13, 8.16, 8.18), so μ_n^{⊗q} → ℤ/n(q) is an étale A¹-weak equivalence (MVW 10.6); both ends are A¹-local (etale-a1-local-complexes, MVW 9.25, 9.31, 9.33), so it is a quasi-isomorphism (MVW 9.21).
3. General k: a map of étale complexes is a quasi-isomorphism if it is one on the stalks at the strict henselisations of smooth k-schemes. Such a stalk is the filtered colimit of the corresponding stalks over the finitely generated subfields k_0 ⊂ k over which the data are defined (MVW Exercise 1.13, Lemma 3.9), and replacing k_0 by the finite separable extension k_0(√−1) when n is even does not change the motivic complexes (MVW 3.8) or the stalks; finitely generated fields containing √−1 when n is even have cd_n < ∞, so the previous step applies.
4. (b): the comparison map is induced by the unit ℤ/n(q) → Rα_*α^*ℤ/n(q) for the change of topology α from the étale to the Zariski site of X, composed with (a); multiplicativity from the products, and compatibility with transfers since H^p_et(−, μ_n^{⊗q}) is a presheaf with transfers (MVW 6.21). In weight one the universal coefficient sequences and Hilbert 90 give MVW 4.9.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.5a/tensor-product-transfers](#m-5a-tensor-product-transfers), [MotivicEtaleKTheory:M.5a/etale-a1-local-complexes](#m-5a-etale-a1-local-complexes)

**Acceptance.**

- For X = Spec F, H^{1,1}(F, ℤ/n) = F^×/n → H^{1}(F, μ_n) is the Kummer isomorphism (Hilbert 90).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 10.2, PDF p. 90. H_L^{p,q}(X, ℤ/n) = H_et^p(X, μ_n^{⊗q}).

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.4, before Theorem 4.1, printed p. 480 (PDF p. 488). The comparison map H^n(X, ℤ/m(i)) → H^n_et(X, μ_m^{⊗i}).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 10.3 and its proof, PDF pp. 90–91 (printed pp. 75–76). The proof uses the étale A¹-local theory of MVW Lecture 9.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Corollary 4.9, PDF p. 42 (printed p. 27). Weight one: H^{1,1}(X, ℤ/l) ≅ H^1_et(X, μ_l).

<a id="m-5a-imperfect-field-passage"></a>

### M.5a/imperfect-field-passage — Imperfect fields and filtered colimits

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/imperfect-field-passage`. Implementation: unchecked.

(a) Let k ⊂ k' be a purely inseparable algebraic extension of fields of characteristic p > 0, X an equidimensional scheme of finite type over k and R a commutative ring in which p is invertible. Flat pullback along X_{k'} → X induces isomorphisms CH^q(X, n) ⊗ R ≅ CH^q(X_{k'}, n) ⊗ R for all q and n. For fields the same holds for motivic cohomology: if E/F is a purely inseparable extension of fields of characteristic p, restriction H^{a,b}(Spec F, R) → H^{a,b}(Spec E, R) is an isomorphism. (b) Filtered colimits: for a field extension k ⊂ F and X smooth over k, H^{*,*}(X_F, A) = colim H^{*,*}(X_E, A) over the subextensions k ⊂ E ⊂ F of finite type; for a smooth morphism X → S of smooth k-schemes with S connected and F = k(S), H^{*,*}(X ×_S Spec F, A) = colim H^{*,*}(X ×_S U, A) over the nonempty open U ⊂ S (MVW 3.9); the cycle complexes satisfy the same colimit formulas along flat pullback. The statement concerns cycle complexes over any base field and motivic cohomology of fields; it makes no claim about MVW's motivic complexes of smooth schemes over an imperfect base field.

**Hypotheses and conventions.**

- (a) p = char k > 0 invertible in R; X equidimensional of finite type over k; k'/k purely inseparable algebraic, finite or not; motivic cohomology of fields is taken over the prime field.
- (b) X smooth over k; S a connected smooth k-scheme; A an abelian group.

**Construction or proof.**

1. (a), cycles: for k'/k finite of degree p^r, π : X_{k'} → X is finite, flat and a universal homeomorphism; π_*π^* = p^r on z^q(X, •) (degree of a finite flat map), and π^*π_* = p^r on z^q(X_{k'}, •) because π_* is injective on cycles (π is a homeomorphism) and π_*(π^*π_*) = p^r π_*; both are maps of complexes (M.4/functoriality). Infinite extensions: colimit over the finite subextensions, by (b).
2. (a), fields: for E/F finite purely inseparable, N_{E/F} ∘ res = [E : F] by the projection formula and res ∘ N_{E/F} = [E : F]_insep = [E : F] since E has a single F-embedding into a normal closure (MVW 5.3 (1), (3), (4)); both are invertible in R.
3. (b): MVW 3.9, from the colimit formula for finite correspondences (MVW Exercise 1.13); for cycle complexes, a cycle on X_F × Δ^n is defined over some X_E, and proper intersection with the faces descends.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence)

**Acceptance.**

- For k' = k^{1/p}, CH^1(k', 1)[1/p] = k'^× ⊗ ℤ[1/p] ≅ k^× ⊗ ℤ[1/p] since k'^{×p} = k^×.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 3.9 (Colimits), PDF p. 38 (printed p. 23). The colimit formulas (b).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 5.3, PDF p. 45 (printed p. 30). Norms on motivic cohomology of fields and the formula res ∘ N = [E : F]_insep Σ j^*, used for (a) on fields.

<a id="m-5a-tensor-product-transfers"></a>

### M.5a/tensor-product-transfers — Tensor products of presheaves and sheaves with transfers

**Construction.** Identifier: `MotivicEtaleKTheory:M.5a/tensor-product-transfers`. Implementation: unchecked.

Let k be a field and R a commutative ring, and let PST(k, R) be the category of additive functors Cor_k^op → R-mod. The tensor product ⊗_tr on PST(k, R) is F ⊗_tr G = H_0(P ⊗ Q) for resolutions P → F, Q → G by direct sums of representables, where R_tr(X) ⊗ R_tr(Y) = R_tr(X × Y) on representables (MVW Definition 8.2); it is right exact, commutes with direct sums, and F ⊗_tr − is left adjoint to the internal Hom with Hom(G, H)(X) = Hom(G ⊗_tr R_tr(X), H) (MVW 8.3). The total derived tensor product C ⊗^L_tr D = Tot(P ⊗ Q) of bounded above complexes makes D^−(PST(k, R)) a tensor triangulated category (MVW 8.8). Its Nisnevich sheafification C ⊗^L_{tr,Nis} D = (C ⊗^L_tr D)_Nis depends only on C_Nis and D_Nis up to quasi-isomorphism, and makes D^−(Sh_Nis(Cor_k, R)) a tensor triangulated category with unit R and R_tr(X) ⊗ R_tr(Y) ≅ R_tr(X × Y) (MVW 14.2, the Nisnevich analogue of MVW 8.14–8.17); the same holds for the étale topology (MVW 8.17). There is a natural map F ⊗_R G → F ⊗_tr G from the presheaf tensor product (MVW 8.9), and for pointed smooth schemes R_tr(X_1, x_1) ⊗_tr ⋯ ⊗_tr R_tr(X_n, x_n) = R_tr(X_1 ∧ ⋯ ∧ X_n), in particular R_tr(𝔾_m^{∧1})^{⊗_tr q} = R_tr(𝔾_m^{∧q}) (MVW 8.10). Tensor triangulated means, as in MVW Definition 8A.1: a triangulated category with a symmetric monoidal structure whose tensor product commutes with the shift in each variable through isomorphisms l, r with rl = −lr, and sends distinguished triangles in either variable to distinguished triangles.

**Hypotheses and conventions.**

- k a field; R a commutative ring.
- Complexes are cohomologically bounded above.

**Construction or proof.**

1. Representables are projective and every presheaf with transfers is a quotient of a direct sum of them (MVW 8.1); extend X ⊗ Y = X × Y of finite-correspondence to direct sums and define ⊗_tr and the internal Hom by projective resolutions (MVW 8.2, 8.3).
2. D^−(PST(k, R)) is equivalent to the homotopy category K^−(P) of bounded above complexes of projectives, which is tensor triangulated for the additive symmetric monoidal category P (MVW 8.8, 8A.4); the derived category and its bounded-above part are Mathlib's DerivedCategory and DerivedCategory.Minus.
3. For an étale or Nisnevich cover U → X, R_tr(Y) ⊗_tr of the Čech complex of U is the Čech complex of U × Y → X × Y, exact as a complex of sheaves (presheaf-with-transfers, MVW 6.12); hence the left derived functors of R_tr(Y) ⊗_tr − kill presheaves with zero sheafification, and ⊗^L_tr preserves local quasi-isomorphisms (MVW 8.14–8.16, 14.2).
4. D^−(Sh_Nis(Cor_k, R)) is the localisation of D^−(PST(k, R)) at the Nisnevich-local quasi-isomorphisms (MVW 13.1), and a tensor triangulated structure descends to the localisation at a class stable under tensoring (MVW 8A.7): the monoidal part through Mathlib's LocalizedMonoidal, the triangulated part through Mathlib's triangulated localisation.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), `mathlib:DerivedCategory.Minus`, `mathlib:CategoryTheory.LocalizedMonoidal`, `mathlib:CategoryTheory.MorphismProperty.IsMonoidal`, `mathlib:CategoryTheory.Triangulated.Localization.isTriangulated`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Transfers`, namespace `TauCeti.Transfers`.

**Planning API.**

- **TauCeti.Transfers.tensorTr** (constructor): F ⊗_tr G for presheaves of R-modules with transfers (MVW 8.2), right exact in each variable and commuting with direct sums.
- **TauCeti.Transfers.internalHom** (universal-property): Hom(F ⊗_tr G, H) ≅ Hom(F, Hom(G, H)) with Hom(G, H)(X) = Hom(G ⊗_tr R_tr(X), H) (MVW 8.2, 8.3).
- **TauCeti.Transfers.ztr_tensor** (simp): R_tr(X) ⊗_tr R_tr(Y) ≅ R_tr(X × Y), natural in finite correspondences (MVW 8.10).
- **TauCeti.Transfers.ztr_smash** (simp): R_tr(X_1, x_1) ⊗_tr ⋯ ⊗_tr R_tr(X_n, x_n) ≅ R_tr(X_1 ∧ ⋯ ∧ X_n); in particular R_tr(𝔾_m^{∧1})^{⊗_tr q} ≅ R_tr(𝔾_m^{∧q}) (MVW 8.10).
- **TauCeti.Transfers.presheafTensor_toTensorTr** (data): The natural map F ⊗_R G → F ⊗_tr G, given on representables by the external product followed by the diagonal (MVW 8.9).
- **TauCeti.Transfers.derivedTensor** (structure): ⊗^L_tr on D^−(PST(k, R)) and ⊗^L_{tr,Nis}, ⊗^L_{tr,et} on D^−(Sh_Nis(Cor_k, R)), D^−(Sh_et(Cor_k, R)): symmetric monoidal with unit R and triangulated in each variable (MVW 8.8, 8.17, 14.2).
- **TauCeti.Transfers.derivedTensor_sheafify** (compatibility): (C ⊗^L_tr D)_Nis depends only on C_Nis and D_Nis up to quasi-isomorphism, and sheafification D^−(PST(k, R)) → D^−(Sh_Nis(Cor_k, R)) is tensor triangulated (MVW 8.16 and its Nisnevich analogue).

**Discriminating tests.**

- **Transfers.test_tensor_unit** (degenerate): R ⊗_tr F ≅ F for every presheaf of R-modules with transfers F, since R = R_tr(Spec k) and Spec k × X = X.
- **Transfers.test_tensor_torsion** (computation): ℤ/n ⊗_tr ℤ_tr(X) ≅ (ℤ/n)_tr(X) = ℤ_tr(X)/n, computed with the projective resolution ℤ --n--> ℤ of ℤ/n (MVW 8.11).
- **Transfers.test_not_presheaf_tensor** (non-example): For k = ℚ the map ℤ_tr(𝔾_m)(ℚ) ⊗ ℤ_tr(𝔾_m)(ℚ) → (ℤ_tr(𝔾_m) ⊗_tr ℤ_tr(𝔾_m))(ℚ) = Z_0(𝔾_m × 𝔾_m) of MVW 8.9 is not surjective: it sends [x] ⊗ [y] to the cycle of x × y, and for x = y the closed point t² + 1 = 0 this cycle is (i, i) + (i, −i), so the closed point (i, i) alone is not in the image. The objectwise tensor product is therefore not ⊗_tr.
- **Transfers.test_tensor_locally_constant** (compatibility): For étale sheaves of R-modules with transfers F, F' with F' locally constant, (F ⊗_tr F')_et ≅ F ⊗_et F', the tensor product of the underlying étale sheaves (MVW 8.13).

**Consumers.**

- MotivicEtaleKTheory:M.5a/effective-motives: The tensor triangulated structure of DM^{eff,−}_Nis(k, R) with M(X) ⊗ M(Y) ≅ M(X × Y) (MVW 14.2).
- MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes: The products ℤ(q) ⊗ ℤ(q') → ℤ(q + q') factor through ⊗_tr (MVW 10.4).
- MotivicEtaleKTheory:M.5a/etale-motivic-comparison: ℤ/n(1)^{⊗^L_tr q} → ℤ/n(q) and the comparison with μ_n^{⊗q} (MVW 8.13–8.18, 10.4–10.6).
- Voevodsky 2010, §4: St_1 ⊗ F and the internal Hom Hom(St_1, F) in the cancellation theorem.
- MotivesAndAlgebraicCycles:MC.4 (request to M.5a): R(1)^{⊗q} ≅ R(q) and the tensor triangulated structure of DM^{eff,−}_Nis(k, R) (MVW 8.10, 14.2).

**Acceptance.**

- R_tr(Spec k) = R is the unit: R ⊗_tr F ≅ F.
- R_tr(𝔾_m^{∧1}) ⊗_tr R_tr(𝔾_m^{∧1}) ≅ R_tr(𝔾_m^{∧2}) (MVW 8.10).

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 8.2, PDF p. 71 (printed p. 56). Definition of ⊗_tr and ⊗^L_tr.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Example 8.10, PDF p. 72 (printed p. 57). Representables and smash products.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Definition 14.2, PDF p. 124 (printed p. 109). The Nisnevich derived category is tensor triangulated.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Proposition 8A.7, PDF p. 79 (printed p. 64). Descent of the tensor structure to localisations.

<a id="m-5a-suslin-rigidity"></a>

### M.5a/suslin-rigidity — Suslin's rigidity theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/suslin-rigidity`. Implementation: unchecked.

Let k be a field and F a homotopy invariant presheaf with transfers on Sm/k whose groups F(X) are torsion of exponent prime to char k. Then the étale sheafification F_et is locally constant: F_et ≅ π^*M for the discrete Gal(k^sep/k)-module M = F(k^sep) = colim F(Spec l) over the finite separable extensions l/k (MVW Theorem 7.20). Equivalently, if k is separably closed then F(S) = F(Spec k) for the henselisation S of 𝔸^d at 0, for every d (MVW Proposition 7.21).

**Hypotheses and conventions.**

- k a field; F a homotopy invariant presheaf with transfers whose values are torsion groups of exponent prime to char k.

**Construction or proof.**

1. Relative Picard groups: for a smooth curve X → S with a good compactification (X̄, Y), H_0^sing(X/S) ≅ Pic(X̄, Y), and a homotopy invariant presheaf with transfers pairs with it, Pic(X̄, Y) ⊗ F(X) → F(S) (MVW 7.5, 7.16, 7.17).
2. Over a henselian local base S with closed fibre S_0 and n prime to char k, H_0^sing(X/S)/n → H_0^sing(X_0/S_0)/n is injective: the Kummer sequence for G_{X̄,Y} embeds Pic(X̄, Y)/n into H^2_et(X̄, j_!μ_n) = H^2_c(X, μ_n), which proper base change identifies with the group of the closed fibre (MVW 7.13, 7.19).
3. Reduce to k separably closed by passing to strict henselisations, and prove F(S_d) = F(S_{d−1}) for the henselisations S_d of 𝔸^d at 0 by induction: a curve fibration with good compactification over 𝔸^{d−1} (MVW 7.9) gives two sections agreeing on the closed fibre, whose classes agree modulo n by the previous step (MVW 7.21).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), `SchemeAndStackFoundations:SF.2`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`

**Acceptance.**

- F = μ_n with its norm transfers, n prime to char k, is locally constant.
- F = O^×/n (the Nisnevich sheaf O^× ⊗_Nis ℤ/n, n prime to char k) is homotopy invariant with transfers, and its étale sheafification is 0, the constant sheaf on (k^sep)^×/n = 0.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Theorem 7.20, PDF p. 66 (printed p. 51). Suslin's rigidity theorem.

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Example 12.4, PDF p. 105 (printed p. 90). Henselian local schemes used in the reduction.

<a id="m-5a-etale-a1-local-complexes"></a>

### M.5a/etale-a1-local-complexes — Étale A¹-local complexes with finite coefficients

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5a/etale-a1-local-complexes`. Implementation: unchecked.

Let k be a field, R a commutative ring and D^−_et = D^−(Sh_et(Cor_k, R)). An étale A¹-weak equivalence is a morphism of D^−_et whose cone lies in the smallest thick subcategory containing the cones of R_tr(X × 𝔸^1) → R_tr(X), X smooth, and closed under the direct sums that exist (MVW Definition 9.2; the localisation is DM^{eff,−}_et(k, R) of effective-motives), and K is A¹-local if Hom(−, K) inverts étale A¹-weak equivalences (MVW 9.17). Then: (a) K → Tot C_*K is an étale A¹-weak equivalence for every bounded above complex K of étale sheaves with transfers (MVW 9.15); (b) an étale A¹-weak equivalence between A¹-local complexes is a quasi-isomorphism (MVW 9.21); (c) an étale sheaf with transfers is A¹-local exactly when H^i_et(X × 𝔸^1, F) ≅ H^i_et(X, F) for all smooth X and i, so every locally constant étale sheaf of torsion prime to char k is A¹-local (MVW 9.23–9.25); (d) if 1/m ∈ k and cd_m(k) < ∞, then Tot C_*K is A¹-local for every bounded above complex K of étale sheaves of ℤ/m-modules with transfers, in particular ℤ/m(q) is A¹-local for every q (MVW 9.31, 9.33).

**Hypotheses and conventions.**

- k a field; R a commutative ring.
- (c): torsion prime to char k; (d): 1/m ∈ k and cd_m(k) < ∞, the running assumption of MVW Lecture 9 from 9.26 on.

**Construction or proof.**

1. (a), (b): the maps θ_i of MVW 2.17 give A¹-homotopies making K → C_nK A¹-homotopy equivalences (MVW 9.12–9.15); (b) is formal from the definition of A¹-local objects (MVW 9.21).
2. (c): Ext^i(R_tr(X), F) = H^i_et(X, F) (presheaf-with-transfers, MVW 6.24) translates A¹-locality into homotopy invariance of étale cohomology (MVW 9.20, 9.24), which holds for locally constant sheaves of torsion prime to char k (SGA 4 XV 2.2; MVW 9.23).
3. (d): the cohomology presheaves of Tot C_*K are homotopy invariant presheaves with transfers (MVW 2.19), so their étale sheafifications are locally constant by suslin-rigidity and A¹-local by (c); since cd_m(X) ≤ cd_m(k) + 2 dim X the hyperext spectral sequence converges (MVW 9.26–9.29) and Tot C_*K is A¹-local (MVW 9.30, 9.31).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/presheaf-with-transfers](#m-5a-presheaf-with-transfers), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/suslin-rigidity](#m-5a-suslin-rigidity), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), `SchemeAndStackFoundations:SF.2`

**Acceptance.**

- μ_n^{⊗q}, n invertible in k, is étale A¹-local by (c).
- For k separably closed of characteristic prime to m, cd_m(k) = 0 and (d) applies.

**Sources.**

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 9.21, PDF p. 86 (printed p. 71). (b).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Corollary 9.25, PDF p. 87 (printed p. 72). (c).

[MVW2006](https://www.claymath.org/library/monographs/cmim02c.pdf), Lemma 9.31, PDF p. 88 (printed p. 73). (d), with its hypothesis cd_m(k) < ∞.

### Remaining work for M.5a

- Read Suslin, 'Motivic complexes over nonperfect fields' (2017), to compare MVW's motivic complexes of smooth schemes over an imperfect field with ℤ[1/p] coefficients (MVW 13.8 and the comparison with higher Chow groups after inverting p), which imperfect-field-passage does not claim.
- MotivesAndAlgebraicCycles' request to M.5a (RS-08 owner) also names MVW Proposition 11.2 and Corollary 13.14 (homotopy invariant presheaves with transfers), Nisnevich excision (MVW 12.20), the cdh topology with Lemma 12.30 and Theorem 13.25, the internal Hom RHom(M(X), −) of MVW 14.12, and pullback of relative cycles with pushforward along finite maps (MVW Appendix 1A); none is a node yet. Plan them as theorem nodes or API items of presheaf-with-transfers, homotopy-invariant-sheaves, effective-motives and finite-correspondence.

<a id="m-5b"></a>

## M.5b — Cohomology operations and norm-variety geometry

Motivic operations and their relations, norm varieties, degree formulas and the Čech simplicial scheme, with the actual characteristic and induction hypotheses.

**Planets:** Motivic Steenrod operations, Norm varieties, Motivic degree theorem, Rost's Chain Lemma and Norm Principle, Existence of norm varieties.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes)

<a id="m-5b-motivic-steenrod-operations"></a>

### M.5b/motivic-steenrod-operations — Motivic reduced power operations

**Construction.** Identifier: `MotivicEtaleKTheory:M.5b/motivic-steenrod-operations`. Implementation: unchecked.

Let k be a perfect field and l a prime different from char k. For every pointed smooth simplicial scheme (more generally every pointed simplicial sheaf on (Sm/k)_Nis) 𝒳 over k there are natural operations on reduced motivic cohomology with ℤ/l coefficients: the Bockstein β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l), the connecting map of 0 → ℤ/l → ℤ/l² → ℤ/l → 0; the reduced powers P^i : H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)}; and the operations B^i : H̃^{p,q} → H̃^{p+2i(l−1)+1, q+i(l−1)} (i ∈ ℤ). For l = 2 one writes Sq^{2i} = P^i and Sq^{2i+1} = B^i. They come from the total power operation P_l : H̃^{2d,d}(𝒳) → H̃^{2dl,dl}(𝒳 ∧ (BS_l)_+) and the computation H̃^{*,*}(𝒳 ∧ (BS_l)_+, ℤ/l) = H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) for l = 2, resp. /(c² = 0) for l odd, with c ∈ H^{2l−3,l−1}(BS_l, ℤ/l), d = e(ξ_l/𝒪) ∈ H^{2l−2,l−1}(BS_l, ℤ/l), ρ the class of −1 in H^{1,1}(k, ℤ/2) = k^×/k^{×2} and τ the generator of H^{0,1}(k, ℤ/2) = μ_2(k): writing P_l(w) = Σ_{i≥0} (C_{i+1}(w)·c·d^i + D_i(w)·d^i) for w ∈ H̃^{2d,d}, one sets P^i(w) = D_{d−i}(w), B^i(w) = C_{d−i}(w), and extends P^i, B^i to all bidegrees by the simplicial and 𝔾_m suspension isomorphisms (RPO §9). Theorem numbers below are those of arXiv v1; the published version shifts the numbering in §§3, 7 and 9 by one.

**Hypotheses and conventions.**

- k a perfect field (the published RPO, §1, works over a perfect field; the arXiv v1 proof of Proposition 3.8 uses that k is perfect); l a prime different from char k.
- 𝒳 a pointed smooth simplicial scheme over k, or a pointed simplicial sheaf on (Sm/k)_Nis, with H̃^{p,q}(𝒳, A) = Hom_{H_•(k)}(𝒳, K(p, q, A)) in the pointed A¹-homotopy category H_•(k).

**Construction or proof.**

1. Represent motivic cohomology in H_•(k) by the objects K(p, q, A) and use the A¹-equivalences K_{n,R} → K(2n, n, R) compatible with products (RPO Theorem 2.1); build the total power operation from the l-th external power of cycles on K_{n,R}, using Thom classes and Euler classes from the projective bundle theorem (RPO §§4-5; MotivesAndAlgebraicCycles MC.4/projective-bundle-theorem).
2. Compute H̃^{*,*}(𝒳 ∧ (Bμ_l)_+) and H̃^{*,*}(𝒳 ∧ (BS_l)_+) (RPO Theorems 6.10, 6.14, 6.16; same numbers in the published version), reducing to μ_l ⊂ k by a transfer argument along an extension of degree prime to l.
3. Extract C_i and D_i from (9.1), set P^i = D_{d−i} and B^i = C_{d−i}, and extend to all bidegrees through P^i(u ∧ t) = P^i(u) ∧ t, B^i(u ∧ t) = B^i(u) ∧ t for the tautological class t ∈ H̃^{2,1}(T) (RPO Lemma 9.2).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), `MotivesAndAlgebraicCycles:MC.4/projective-bundle-theorem`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Operations`, namespace `TauCeti.MotivicSteenrod`.

**Planning API.**

- **TauCeti.MotivicSteenrod.bockstein** (constructor): β : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+1,q}(𝒳, ℤ/l).
- **TauCeti.MotivicSteenrod.reducedPower** (constructor): P^i : H̃^{p,q} → H̃^{p+2i(l−1), q+i(l−1)}.
- **TauCeti.MotivicSteenrod.natural** (functoriality): β and P^i commute with pullback along maps of pointed simplicial schemes.
- **TauCeti.MotivicSteenrod.suspension** (compatibility): β and P^i commute with the simplicial and 𝔾_m suspension isomorphisms.
- **TauCeti.MotivicSteenrod.BSl_cohomology** (characterisation): H̃^{*,*}(𝒳 ∧ (BS_l)_+, ℤ/l) = H̃^{*,*}(𝒳, ℤ/l)[[c, d]]/(c² = τd + ρc) for l = 2 and /(c² = 0) for l odd, with c ∈ H^{2l−3,l−1}, d ∈ H^{2l−2,l−1}, β̃(c) = d integrally and c restricting to 0 at the base point (RPO Theorems 6.14, 6.16).
- **TauCeti.MotivicSteenrod.etale_realisation** (compatibility): The comparison map H̃^{p,q}(𝒳, ℤ/l) → H̃^p_et(𝒳, μ_l^{⊗q}) commutes with β when the étale Bockstein is taken for 0 → μ_l^{⊗q} → μ_{l²}^{⊗q} → μ_l^{⊗q} → 0; for the untwisted étale ℤ/l-Bockstein this needs μ_{l²} ⊂ k (compare RPO Lemma 6.9).
- **TauCeti.MotivicSteenrod.betaPower** (constructor): B^i : H̃^{p,q}(𝒳, ℤ/l) → H̃^{p+2i(l−1)+1, q+i(l−1)}(𝒳, ℤ/l), the c-coefficient of the total power operation; Sq^{2i+1} = B^i for l = 2.
- **TauCeti.MotivicSteenrod.totalPower** (data): The total power operation P_l : H̃^{2d,d}(𝒳, ℤ/l) → H̃^{2dl,dl}(𝒳 ∧ (BS_l)_+, ℤ/l), P_l(w) = Σ_{i≥0}(C_{i+1}(w)·c·d^i + D_i(w)·d^i); its restriction along a rational point of BS_l is w ↦ w^l (RPO Lemma 5.10).
- **TauCeti.MotivicSteenrod.reducedPower_zero** (simp): P^0 = Id, and P^i = B^i = 0 for i < 0.
- **TauCeti.MotivicSteenrod.bockstein_tau** (simp): For l = 2 and char k ≠ 2: β(τ) = ρ in H^{1,1}(k, ℤ/2), and β(ρ) = 0 (ρ lifts to H^{1,1}(k, ℤ) = k^×).

**Discriminating tests.**

- **MotivicSteenrod.test_P0** (degenerate): P^0 = Id.
- **MotivicSteenrod.test_square** (computation): For u ∈ H̃^{2n,n}, P^n(u) = u^l (RPO Lemma 9.7).
- **MotivicSteenrod.test_bockstein_P** (compatibility): β P^i = B^i and β B^i = 0 (RPO Lemma 9.5).
- **MotivicSteenrod.test_rho_term** (non-example): For l = 2 the operations are not H^{*,*}(k, ℤ/2)-linear: Sq^1(τ) = β(τ) = ρ, which is nonzero for k = ℝ (−1 is not a square), whereas τ·Sq^1(1) = 0; a definition making Sq^i linear over the coefficients of the point fails here.
- **MotivicSteenrod.test_cartan_tau** (computation): Let l = 2, char k ≠ 2, and u ∈ H^{1,1}(Bμ_2, ℤ/2), v = β(u) ∈ H^{2,1}(Bμ_2, ℤ/2) the generators of RPO Theorem 6.10 (u² = τv + ρu). Then Sq^2(u²) = τ·v² ≠ 0 in H^{4,3}(Bμ_2, ℤ/2) (Cartan formula with Sq^2u = 0 by instability); the topological Cartan formula, with coefficient 1 on Sq^1u·Sq^1u, would give v², which lies in the wrong bidegree (4, 2).

**Consumers.**

- Voevodsky2011 Theorem 3.8 and Lemma 4.1: β P^n and the Milnor operations Q_n detect the Rost motive and the degree of characteristic numbers.
- Voevodsky2011 Lemmas 6.6-6.15: Margolis-type vanishing on H̃^{*,*}(X̃) drives the induction.
- MotivicEtaleKTheory:M.5c/rost-motive: φ_{l−1} = c·βP^n identifies the symmetric-power operation used to build the Rost motive.

**Acceptance.**

- P^0 = Id and P^i = B^i = 0 for i < 0 (RPO Theorems 9.3-9.4 in arXiv v1; Theorems 9.4-9.5 in the published version).
- For l = 2 and u ∈ H̃^{2n,n}, Sq^{2n}(u) = u² (RPO Lemma 9.7 in arXiv v1; Lemma 9.8 in the published version).

**Sources.**

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Theorem 6.16, PDF p. 27 (same number in the published version). The cohomology of F ∧ (BS_l)_+ used to define the operations.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), §9, (9.1) and the definition of P^i and B^i, PDF pp. 34-35. Definition of P^i(u) = D_{d−i}(u) and B^i(u) = C_{d−i}(u).

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Proof of Proposition 3.8, PDF p. 12 (published: Proposition 3.7; the published introduction states that k is perfect). The construction of the operations (through P^0 = Id) uses that the base field is perfect.

<a id="m-5b-steenrod-relations"></a>

### M.5b/steenrod-relations — Cartan formula, instability and Adem relations

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5b/steenrod-relations`. Implementation: unchecked.

Let k be a perfect field, l a prime different from char k, and β, P^i, B^i the operations of motivic-steenrod-operations. (a) P^i = B^i = 0 for i < 0 and P^0 = Id. (b) β² = 0, β(uv) = β(u)v + (−1)^p uβ(v) for u ∈ H̃^{p,*}, βP^i = B^i and βB^i = 0. (c) Cartan formula: for l odd and u ∈ H̃^{p,*}, P^i(uv) = Σ_{r=0}^{i} P^r(u)P^{i−r}(v) and B^i(uv) = Σ_{r=0}^{i} (B^r(u)P^{i−r}(v) + (−1)^p P^r(u)B^{i−r}(v)); for l = 2, Sq^{2i}(uv) = Σ_{r=0}^{i} Sq^{2r}(u)Sq^{2i−2r}(v) + τ Σ_{s=0}^{i−1} Sq^{2s+1}(u)Sq^{2i−2s−1}(v) and Sq^{2i+1}(uv) = Σ_{r=0}^{i} (Sq^{2r+1}(u)Sq^{2i−2r}(v) + Sq^{2r}(u)Sq^{2i−2r+1}(v)) + ρ Σ_{s=0}^{i−1} Sq^{2s+1}(u)Sq^{2i−2s−1}(v). (d) Instability: P^n(u) = u^l for u ∈ H̃^{2n,n}, and P^n(u) = 0 for u ∈ H̃^{p,q} with n > p − q and n ≥ q. (e) Adem relations: for l odd and 0 < a < lb, P^aP^b = Σ_{t=0}^{[a/l]} (−1)^{a+t} C((l−1)(b−t)−1, a−lt) P^{a+b−t}P^t, with the companion relation for P^aβP^b when 0 < a ≤ lb (RPO Theorem 10.3, whose printed range is a misprint: MotivicEtaleKTheory/E15), exactly as in topology; for l = 2 and 0 < a < 2b, Sq^aSq^b = Σ_{j=0}^{[a/2]} C(b−1−j, a−2j) Sq^{a+b−j}Sq^j for a, b odd, Sq^aSq^b = Σ_{j=0}^{[a/2]} τ^{j mod 2} C(b−1−j, a−2j) Sq^{a+b−j}Sq^j for a, b even, and for a + b odd the same sum plus ρ times a sum of terms Sq^xSq^y with x, y odd and x + y = a + b − 1; for a odd and b even this correction is ρ Σ_{j odd} C(b−1−j, a−1−2j) Sq^{a+b−j−1}Sq^j (RPO Theorem 10.2, whose printed odd case is not bidegree-homogeneous: MotivicEtaleKTheory/E10). (f) The motivic Steenrod algebra A^{*,*}(k, ℤ/l), the algebra of bistable operations generated by the P^i, B^i and multiplication by H^{*,*}(k, ℤ/l), is a free left H^{*,*}(k, ℤ/l)-module on the admissible monomials β^{ε_0}P^{s_1}β^{ε_1}⋯P^{s_m}β^{ε_m} with s_i ≥ l·s_{i+1} + ε_i (RPO Lemma 11.1, Corollary 11.5). For l odd it is the twisted tensor product of the topological mod-l Steenrod algebra (P^i in bidegree (2i(l−1), i(l−1)), β in (1, 0)) with H^{*,*}(k, ℤ/l) for the action of the operations on H^{*,*}(k, ℤ/l); for l = 2 it is not of this form even when ρ = 0, because the Adem relations carry τ (for instance Sq^2Sq^2 = τSq^3Sq^1).

**Hypotheses and conventions.**

- k a perfect field; l a prime different from char k.

**Construction or proof.**

1. (a)-(b): RPO Theorems 9.3, 9.4, Lemma 9.5 and (8.1) (published Theorems 9.4, 9.5, Lemma 9.6), from Propositions 3.7-3.8, Lemma 6.17 and Theorem 8.4 (βP_l(u) = 0 for u ∈ H̃^{2d,d}).
2. (c): RPO Proposition 9.6 (published 9.7) from the multiplicativity of the total power operation (Lemma 9.1) and (a). The second l = 2 formula has Sq^{2i−2r+1}(v), as Lemma 9.1 gives; both versions print Sq^{2i−2r−1}(v) (MotivicEtaleKTheory/E9). The sign (−1)^p for l odd is in the published version.
3. (d): RPO Lemmas 9.7-9.8 (published 9.8-9.9): P^n(u) = u^l from Lemma 5.10; the vanishing by suspending u to H̃^{2n,n} and using that the diagonal S^1_s → S^1_s ∧ S^1_s is null in H_•(k).
4. (e): RPO §10: the symmetry theorem 7.7 (published 7.8) for P(P(u)) on BS_l × BS_l, the values R(d_1), R(c_1) of Lemma 10.1, and comparison of coefficients (Theorems 10.2, 10.3); the l = 2 case with a odd, b even follows from the case a − 1, b even by applying β, using βP^i = B^i and β(τ) = ρ, as the proof of Theorem 10.2 indicates.
5. (f): RPO Lemma 11.1 (Adem relations and Cartan formula), Proposition 11.4 and Corollary 11.5 (linear independence tested on products of Bμ_l).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations)

**Acceptance.**

- For l = 2: Sq^1 = β, Sq^1Sq^{2i} = Sq^{2i+1}, Sq^{2n}(u) = u² on H̃^{2n,n}, Sq^2Sq^2 = τSq^3Sq^1 and Sq^3Sq^2 = ρSq^3Sq^1 (apply β to Sq^2Sq^2 = τSq^3Sq^1).
- For l odd: P^1P^1 = 2P^2 (Theorem 10.3 with a = b = 1: (−1)^1 C(l−2, 1) = 2 − l ≡ 2 mod l).

**Sources.**

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Lemmas 9.7-9.8, PDF p. 37 (arXiv v1 numbering; published Lemmas 9.8-9.9). Instability.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Proposition 9.6, PDF p. 36 (arXiv v1 numbering; published Proposition 9.7). Cartan formula.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Theorem 10.2, PDF p. 39 (same number in the published version). The motivic Adem relations for l = 2, with coefficients τ and ρ.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Lemma 11.1, PDF p. 43 (same number in the published version). Generation by admissible monomials; Corollary 11.5 gives their independence.

<a id="m-5b-milnor-operations"></a>

### M.5b/milnor-operations — The Milnor operations Q_i

**Construction.** Identifier: `MotivicEtaleKTheory:M.5b/milnor-operations`. Implementation: unchecked.

Let k be a perfect field and l a prime different from char k. The bigraded dual A_{*,*} of the motivic Steenrod algebra has the left H^{*,*}(k, ℤ/l)-basis of monomials τ(E)ξ(R) = ∏_i τ_i^{ε_i} ∏_j ξ_j^{r_j} (ε_i ∈ {0, 1}, r_j ≥ 0), with τ_i of bidegree (2l^i − 1, l^i − 1) and ξ_j of bidegree (2l^j − 2, l^j − 1) (RPO §12). The Milnor operation Q_i ∈ A^{2l^i−1, l^i−1}(k, ℤ/l) is the element of the dual basis dual to τ_i, and q_i ∈ A^{2l^i−2, l^i−1} the element dual to ξ_i (RPO §13). Then: Q_0 = β (Lemma 13.5); Q_i² = 0 for all i; for l = 2, Q_i = [Q_0, q_i] for i ≥ 1 (Proposition 13.6), the ℤ/2[ρ]-span of the products Q(E) = ∏Q_i^{ε_i} is the exterior algebra on the Q_i, and the coproduct is ψ*(Q_i) = 1 ⊗ Q_i + Q_i ⊗ 1 + ρ·Σ c_{E,E'} Q(E) ⊗ Q(E') (Proposition 13.4), so Q_i is a derivation up to ρ-multiples of products of lower Q_j; for l odd the Q_i have the properties of Milnor's topological operations: Q_{i+1} = P^{l^i}Q_i − Q_iP^{l^i}, Q_iQ_j = −Q_jQ_i and Q_i(uv) = Q_i(u)v + (−1)^p uQ_i(v) for u ∈ H̃^{p,*}. For the Thom class t_V of a vector bundle V, q_n(t_V) = s_{l^n−1}(V)·t_V (RPO Corollary 14.3), where s_{l^n−1} is the characteristic class of Σ_j t_j^{l^n−1}. For l odd and b = (l^n − 1)/(l − 1): Q_0P^b = Σ_{i=0}^{n} (−1)^i P^{b−(l^i−1)/(l−1)}Q_i; Voevodsky 2011 Lemma 5.13 prints all signs +, which is the same identity for the operations (−1)^iQ_i (MotivicEtaleKTheory/E11). For l = 2 the topological recursion Q_{i+1} = [Sq^{2^{i+1}}, Q_i] fails when ρ ≠ 0: Sq^4Q_1 − Q_1Sq^4 = Q_2 + ρQ_0Q_1Sq^2 (RPO Example 13.7).

**Hypotheses and conventions.**

- k a perfect field (characteristic 0 wherever the operations are used in this stage); l a prime different from char k.

**Construction or proof.**

1. Compute the dual A_{*,*} from the action on products of Bμ_l (RPO Lemmas 11.2-11.3, Proposition 11.4, §12 Theorem 12.6) and define Q_i, q_i as dual-basis elements; ρ(E, R) = Q(E)P^R (Proposition 13.2).
2. Q_0 = β by weight and the value on u ∈ H^{1,1}(Bμ_l) (Lemma 13.5); for l = 2 the exterior algebra, coproduct and Q_i = [Q_0, q_i] from Propositions 13.3, 13.4, 13.6; for l odd, A_top ≅ the topological Steenrod algebra (steenrod-relations (f)) and Milnor's relations transfer.
3. q_n(t_V) = s_{l^n−1}(V)t_V from the characteristic classes of operations (RPO Theorems 14.1-14.2, Corollary 14.3), using the Thom isomorphism.
4. The identity for Q_0P^b by induction on n from Milnor's commutation relation P^RQ_k − Q_kP^R = Σ_{j≥1} Q_{k+j}P^{R−l^k e_j} (Voevodsky 2011 Lemma 5.13); check n = 1: Q_0P^1 = P^1Q_0 − Q_1 with Q_1 = P^1β − βP^1.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/steenrod-relations](#m-5b-steenrod-relations), [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations)

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/Operations`, namespace `TauCeti.MotivicSteenrod`.

**Planning API.**

- **TauCeti.MotivicSteenrod.milnorOp** (constructor): Q_i ∈ A^{2l^i−1, l^i−1}.
- **TauCeti.MotivicSteenrod.milnorOp_zero** (simp): Q_0 = β.
- **TauCeti.MotivicSteenrod.milnorOp_sq** (relation): Q_i ∘ Q_i = 0.
- **TauCeti.MotivicSteenrod.milnorOp_anticomm** (relation): Q_iQ_j = −Q_jQ_i (for l = 2: Q_iQ_j = Q_jQ_i, the exterior algebra of RPO Proposition 13.4).
- **TauCeti.MotivicSteenrod.Q0_Pb** (relation): For l > 2 and b = (l^n − 1)/(l − 1): Q_0P^b = Σ_{i=0}^{n} (−1)^i P^{b−(l^i−1)/(l−1)}Q_i (Milnor's normalisation of Q_i).
- **TauCeti.MotivicSteenrod.milnorOp_dual** (characterisation): ⟨τ(E)ξ(R), Q_i⟩ = 1 if E = e_i and R = 0, and 0 for every other basis monomial of A_{*,*}.
- **TauCeti.MotivicSteenrod.milnorOp_succ** (relation): For l = 2 and i ≥ 1, Q_i = Q_0q_i − q_iQ_0; for l odd, Q_{i+1} = P^{l^i}Q_i − Q_iP^{l^i}.
- **TauCeti.MotivicSteenrod.milnorOp_mul** (relation): For l odd, Q_i(uv) = Q_i(u)v + (−1)^p uQ_i(v) for u ∈ H̃^{p,*}; for l = 2, ψ*(Q_i) = 1 ⊗ Q_i + Q_i ⊗ 1 + ρ·Σ c_{E,E'}Q(E) ⊗ Q(E'), so the same formula holds when ρ = 0 or when Q_j(u) = 0 for all j < i.
- **TauCeti.MotivicSteenrod.dualMilnorOp_thomClass** (relation): q_n(t_V) = s_{l^n−1}(V)·t_V for the Thom class t_V of a vector bundle V on a smooth quasi-projective scheme.

**Discriminating tests.**

- **MotivicSteenrod.test_Q0_beta** (degenerate): Q_0 is the Bockstein β.
- **MotivicSteenrod.test_Q_bidegree** (computation): Q_1 has bidegree (2l − 1, l − 1); for l = 2, (3, 1).
- **MotivicSteenrod.test_Q1_formula** (compatibility): For l odd, Q_1 = P^1β − βP^1 (Milnor's topological formula); for l = 2, Q_1 = Sq^3 + Sq^2Sq^1, which in topology is Milnor's Q_1 = Sq^3 + Sq^2Sq^1.
- **MotivicSteenrod.test_Q2_not_commutator** (non-example): For l = 2 and k = ℝ (ρ ≠ 0), Sq^4Q_1 − Q_1Sq^4 = Q_2 + ρQ_0Q_1Sq^2 with ρQ_0Q_1Sq^2 ≠ 0 (A^{*,*} is free over H^{*,*} on the Milnor basis), so defining Q_2 by the topological recursion [Sq^4, Q_1] gives the wrong operation.
- **MotivicSteenrod.test_Q0_Pb_sign** (characterisation): For l odd and n = 1 (b = 1): Q_0P^1 = P^1Q_0 − Q_1 with Q_1 = P^1β − βP^1; the all-plus display P^1Q_0 + Q_1 equals 2P^1β − βP^1 ≠ βP^1, since P^1β and βP^1 are distinct admissible monomials.

**Consumers.**

- Voevodsky2011 Lemma 4.1: Q_n(t̃) = (deg s_{l^n−1}(X)/l)·v computes the characteristic number.
- Voevodsky2011 Lemmas 6.6-6.7: Q_{n−1}⋯Q_0(δ) ≠ 0 for the class δ of a nonzero symbol.
- MotivicEtaleKTheory:M.5c/hilbert-ninety-induction: Margolis homology of Q_i on H̃^{*,*}(X̃) vanishes for a ν_n-variety (Lemma 4.3).

**Acceptance.**

- Q_0 = β; for l = 2, Q_1 = Sq^1Sq^2 + Sq^2Sq^1 = Sq^3 + Sq^2Sq^1 (Proposition 13.6 with q_1 = Sq^2).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Lemma 5.13, PDF p. 31. Q_0 P^b = P^b Q_0 + P^{b−1} Q_1 + ⋯ + P^0 Q_n.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Lemma 4.1, PDF p. 20. Definition of Q_n through q_n and β.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), §13, PDF p. 56 (same in the published version). Definition of Q_i as the dual of τ_i.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Example 13.7, PDF p. 58 (same in the published version). The topological recursive definition of Q_i fails for l = 2 when ρ ≠ 0.

[Voevodsky2003RPO](https://arxiv.org/pdf/math/0107109v1), Corollary 14.3, PDF p. 59 (same in the published version). q_n on Thom classes is the characteristic class s_{l^n−1}.

<a id="m-5b-nu-variety"></a>

### M.5b/nu-variety — ν_n-varieties and norm varieties

**Definition.** Identifier: `MotivicEtaleKTheory:M.5b/nu-variety`. Implementation: unchecked.

Let k be a field of characteristic 0 and l a prime. (i) For a smooth projective k-variety X of dimension d ≥ 1, s_d(X) = deg s_d(T_X) ∈ ℤ, where s_d is the characteristic class of the symmetric polynomial Σ_j t_j^d in the Chern roots; s_d(L) = c_1(L)^d for a line bundle L, s_d is additive on short exact sequences, and s_d(X) does not change under extension of the base field. For d = 0 one sets s_0(X) = deg X = dim_k Γ(X, 𝒪_X). (ii) For n ≥ 0, X is a ν_n-variety if dim X = l^n − 1 and s_{l^n−1}(X) ≢ 0 (mod l²); for n ≥ 1, l divides s_{l^n−1}(X) (degree-theorem (a)). X is a ν_{≤n}-variety if it is a ν_n-variety and for every i < n there are a ν_i-variety X_i and a morphism X_i → X (Voevodsky 2011 Definition 6.2). (iii) For a = (a_1, …, a_n) ∈ (k^×)^n, a field F ⊇ k splits a if {a_1, …, a_n} = 0 in K^M_n(F)/l, and a smooth connected X splits a if k(X) does. A splitting variety X is l-generic if every field F ⊇ k splitting a has a finite extension E of degree prime to l with X(E) ≠ ∅. (iv) For n ≥ 2 and {a} ≠ 0 in K^M_n(k)/l, a norm variety for a is a smooth projective l-generic splitting variety for a of dimension l^{n−1} − 1 (Haesemeyer–Weibel, introduction). (v) A Rost variety for a is a ν_{≤(n−1)}-variety X splitting a for which H_{−1,−1}(X × X) --pr_{1∗} − pr_{2∗}--> H_{−1,−1}(X) --N--> H_{−1,−1}(Spec k) = k^× is exact, where H_{−1,−1}(X) = Hom_DM(ℤ, M(X)(1)[1]) ≅ A_0(X, 𝒦_1) and N is induced by the structure map (Haesemeyer–Weibel Definition 0.5; the conditions of Voevodsky 2011 Theorem 6.3). Being a norm or Rost variety is a property proved for particular varieties: an arbitrary smooth projective variety of dimension l^{n−1} − 1, even a ν_{n−1}-variety, need not split a or be l-generic.

**Hypotheses and conventions.**

- k a field of characteristic 0 (the range of Voevodsky 2011 §§4-6 and of Haesemeyer–Weibel); l a prime; a ∈ (k^×)^n.
- Norm and Rost varieties are defined for n ≥ 2 and {a} ≠ 0 in K^M_n(k)/l, as in Haesemeyer–Weibel.

**Construction or proof.**

1. Define s_d from SF.5's Chern classes of vector bundles (Whitney formula, splitting principle; s_d = N_d(c_1, …, c_d) with N_d the Newton polynomial) and the degree map deg : CH_0(X) → ℤ of a proper k-variety; additivity and s_d(L) = c_1(L)^d follow from the splitting principle, base-change invariance from the compatibility of Chern classes and degree with field extension.
2. Define splitting through the function field and Milnor K-theory (K2SymbolsBrauer T.2), and l-genericity through points over finite extensions.
3. Define H_{−1,−1}(X) = Hom_DM(ℤ, M(X)(1)[1]) in M.5a's DM^{eff,−}_Nis(k) (identified with Rost's A_0(X, 𝒦_1) of Haesemeyer–Weibel Definition 0.2), and assemble the conditions of Voevodsky 2011 Definition 6.2 and Theorem 6.3 and Haesemeyer–Weibel Definitions 0.4-0.5.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `SchemeAndStackFoundations:SF.5`, [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives)

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Planning API.**

- **TauCeti.RostMotive.charNumber** (constructor): s_d(X) ∈ ℤ for X smooth projective of dimension d.
- **TauCeti.RostMotive.IsNuVariety** (characterisation): For n ≥ 0: X is a ν_n-variety iff dim X = l^n − 1 and s_{l^n−1}(X) ≢ 0 mod l² (with s_0(X) = deg X).
- **TauCeti.RostMotive.Splits** (characterisation): X splits a iff a ↦ 0 in K^M_n(k(X))/l.
- **TauCeti.RostMotive.IsNormVariety** (constructor): For n ≥ 2 and {a} ≠ 0: X is a norm variety for a iff X is smooth projective of dimension l^{n−1} − 1, splits a, and is l-generic.
- **TauCeti.RostMotive.splits_baseChange** (functoriality): If X splits a then X_{k'} splits a_{k'} for every field extension k'/k.
- **TauCeti.RostMotive.IsGenericSplitting** (constructor): X is l-generic for a iff every field F ⊇ k splitting a has a finite extension E of degree prime to l with X(E) ≠ ∅.
- **TauCeti.RostMotive.IsNuLeVariety** (constructor): X is a ν_{≤n}-variety iff X is a ν_n-variety and for each i < n some ν_i-variety maps to X.
- **TauCeti.RostMotive.IsRostVariety** (constructor): X is a Rost variety for a iff X is a ν_{≤(n−1)}-variety splitting a and H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× is exact.
- **TauCeti.RostMotive.charNumber_add** (relation): s_d(E) = s_d(E') + s_d(E'') for 0 → E' → E → E'' → 0, and s_d(L) = c_1(L)^d for a line bundle L.
- **TauCeti.RostMotive.charNumber_projectiveSpace** (example): s_d(ℙ^d) = d + 1.
- **TauCeti.RostMotive.charNumber_baseChange** (compatibility): s_d(X_K) = s_d(X) for every field extension K/k; hence X is a ν_n-variety iff X_K is.
- **TauCeti.RostMotive.charNumber_prod** (relation): s_{d+e}(X × Y) = 0 if dim X = d ≥ 1 and dim Y = e ≥ 1 (T_{X×Y} = pr_1^*T_X ⊕ pr_2^*T_Y and CH^{d+e} of each factor vanishes).

**Discriminating tests.**

- **RostMotive.test_projective_space** (computation): s_{l−1}(ℙ^{l−1}) = l, so ℙ^{l−1} is a ν_1-variety.
- **RostMotive.test_point** (degenerate): Spec k (dimension 0 = l^0 − 1) splits a iff a = 0 in K^M_n(k)/l.
- **RostMotive.test_splits_degree_one** (compatibility): If X has a k-rational point and splits a, then a = 0.
- **RostMotive.test_quadric_not_nu** (non-example): For l = 2: ℙ^3 has dimension 3 = 2² − 1 and s_3(ℙ^3) = 4 ≡ 0 (mod 4), so ℙ^3 is not a ν_2-variety although 2 divides s_3 (a definition testing divisibility by l instead of l² fails); a smooth conic has s_1 = 2 ≢ 0 (mod 4) and is a ν_1-variety; ℙ^1 × ℙ^1 has dimension 2 ≠ 2^n − 1 and is not a ν_n-variety for any n.
- **RostMotive.test_nu_zero** (computation): For l = 2 and a ∈ k^× not a square, Spec k(√a) is a ν_0-variety (degree 2 ≢ 0 mod 4); Spec K for a field K of degree 4 over k is not.
- **RostMotive.test_rational_curve_not_norm** (non-example): For l = 2, n = 2 and {a_1, a_2} ≠ 0 in K^M_2(k)/2, ℙ^1_k is a ν_1-variety of dimension 2^1 − 1 but not a norm variety for a: it has a rational point, so it splits a only if {a} = 0 (test_splits_degree_one).

**Consumers.**

- Voevodsky2011 Theorem 6.3 and Lemmas 6.8-6.9: A ν_{≤(n−1)}-variety splitting a gives M(X̃) = M(Č(X)) and the exact sequence used to prove H90.
- HW2009Chain Theorem 0.7: Existence of Rost varieties, from the Chain Lemma and the Norm Principle.
- MotivicEtaleKTheory:M.5c/rost-motive: The Rost motive is a summand of M(X) for a norm variety X.

**Acceptance.**

- ℙ^{l−1} is a ν_1-variety: s_{l−1}(ℙ^{l−1}) = l ≢ 0 (mod l²); ℙ^{l²−1} is not a ν_2-variety: s_{l²−1}(ℙ^{l²−1}) = l² (s_d(ℙ^d) = d + 1, Haesemeyer–Weibel after Definition 0.4).

**Sources.**

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Definition 0.4, PDF p. 2. Definition of ν_{n−1}-variety; Definition 0.5 defines Rost varieties.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §6, PDF p. 33. Splitting.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Introduction, PDF p. 1. Definition of a norm variety (l-generic splitting variety).

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Definition 0.5, PDF p. 2. Definition of a Rost variety: splitting, ν_i-varieties mapping to X, exactness of (0.6).

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Definition 6.2, PDF p. 34. Definition of ν_{≤n}-varieties.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Proof of Lemma 6.12, PDF p. 39. The convention for ν_0-varieties: zero-dimensional of degree prime to l².

<a id="m-5b-degree-theorem"></a>

### M.5b/degree-theorem — Voevodsky's motivic degree theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5b/degree-theorem`. Implementation: unchecked.

Let k be a field of characteristic 0, l a prime, n ≥ 1 and d = l^n − 1; coefficients ℤ means ℤ_(l). (a) (Voevodsky 2011 Lemma 4.1) Let X be a smooth projective variety of dimension d, V its stable normal bundle and τ : T^N → Th_X(V) the morphism defining the degree map (Voevodsky's construction for the ℤ/2 case), t ∈ H̃^{2N−2d,N−d}(Th_X(V), ℤ) the Thom class, t̃ ∈ H̃^{2N−2d,N−d}(Th_X(V)/T^N, ℤ) its unique lift along p : Th_X(V) → Th_X(V)/T^N (t restricts to zero on T^N for weight reasons), and v ∈ H̃^{2N+1,N}(Th_X(V)/T^N, ℤ) the pullback of the tautological class along ∂ : Th_X(V)/T^N → Σ_s T^N. Then l divides deg s_d(X) and Q_n(t̃) = (deg s_d(X)/l)·v mod l. (b) (Lemma 4.3) If 𝒳 is a simplicial scheme embedded with respect to ℤ/l-coefficients and some ν_n-variety X has M(X, ℤ/l) ∈ DM_𝒳, the Margolis homology of (H̃^{*,*}(𝒳̃, ℤ/l), Q_n) vanishes, where 𝒳̃ = cone(𝒳_+ → S^0). (c) (Theorem 4.4, the motivic degree theorem) In the setting of (b), let τ_𝒳 : ℤ/l_𝒳(d)[2d] → M(X) be the relative fundamental class and π_𝒳 : M(X) → ℤ/l_𝒳 the factorisation of the structure map, and let s : M(X) → N and r : N → ℤ/l_𝒳 be morphisms in DM_𝒳(ℤ/l) with r ∘ s = π_𝒳. If some α ∈ H^{p,q}(𝒳, ℤ/l) satisfies p > q, α ≠ 0, α ∘ r = 0 and Q_n(α) = 0, then s ∘ τ_𝒳 ≠ 0.

**Hypotheses and conventions.**

- k of characteristic 0 (Voevodsky's degree map and motivic duality for smooth projective varieties are established there); l prime; n ≥ 1; d = l^n − 1.
- (b), (c): 𝒳 embedded with respect to ℤ/l-coefficients; X a ν_n-variety with M(X, ℤ/l) ∈ DM_𝒳(ℤ/l).

**Construction or proof.**

1. (a) Q_n = βq_n ± q_nβ and β(t̃) = 0 since t̃ is integral (milnor-operations); q_n(t) = s_d(X)·t (RPO Corollary 14.3) yields a morphism of distinguished triangles from ℤ(d)[2d] → M(X) → cone(τ') to ℤ/l(d)[2d] → ℤ/l²(d)[2d] → ℤ/l(d)[2d] with left vertical map 1 ↦ c; the left square gives deg s_d(X) ≡ lc (mod l²), so l divides it, and the right square gives βq_n(t̃) = c·v mod l (Voevodsky 2011 Lemma 4.1).
2. (b) M(𝒳̃) ⊗ M(X) = 0 for M(X) ∈ DM_𝒳 (Voevodsky, Motives over simplicial schemes, Lemma 6.9), so Id ⊗ v is an isomorphism; with the Cartan formula for Q_n (for l = 2 using Q_i(t̃) = 0 for i < n by weights) one gets φQ_n − Q_nφ = ±s_d(X)·, a unit multiple of the identity, so Q_n-homology vanishes (Lemma 4.3).
3. (c) Reduce to N' = the cone of α; show t̃α ≠ 0 from Q_n(t̃α) = Q_n(t̃)α = c·vα with c = s_d(X)/l a unit, and vα ≠ 0 because the kernel of ∂_𝒳^* in that bidegree is covered by H^{p+2d,q+d}(X, ℤ/l) = 0 for p > q, using M(X) ⊗ ℤ_𝒳 ≅ M(X) (Theorem 4.4). Embedded simplicial schemes and DM_𝒳 are those of cech-simplicial-scheme.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/milnor-operations](#m-5b-milnor-operations), [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5b/cech-simplicial-scheme](#m-5b-cech-simplicial-scheme)

**Acceptance.**

- For X = ℙ^{l−1} (n = 1), deg s_{l−1} = l and (a) gives Q_1(t̃) = v mod l; for X = ℙ^{l²−1} (n = 2), deg s = l² and (a) gives Q_2(t̃) = l·v ≡ 0 mod l.
- For l = 2, n = 1 and X a smooth conic splitting a nonzero quaternion symbol, X is a ν_1-variety and (c) applies with 𝒳 = Č(X).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Lemma 4.1, PDF p. 20. Q_n(t̃) = (deg(s_{l^n−1}(X))/l) v mod l.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 4.4, PDF p. 23. The motivic degree theorem.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §4 before Theorem 4.4, PDF p. 22. The standing hypotheses of Theorem 4.4 (n > 0).

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 4.4, PDF p. 23. The conclusion of the motivic degree theorem.

<a id="m-5b-pfister-norm-variety"></a>

### M.5b/pfister-norm-variety — Pfister neighbours as norm varieties for l = 2

**Construction.** Identifier: `MotivicEtaleKTheory:M.5b/pfister-norm-variety`. Implementation: unchecked.

Let k be a field of characteristic 0, n ≥ 1 and a = (a_1, …, a_n) ∈ (k^×)^n. With the minus-sign convention ⟨⟨b⟩⟩ = ⟨1, −b⟩ of QuadraticFormInvariants Layer 4, let ⟨⟨a_1, …, a_{n−1}⟩⟩ = ⊗_{i<n} ⟨1, −a_i⟩ (the form ⟨1⟩ when n = 1) and q_a = ⟨⟨a_1, …, a_{n−1}⟩⟩ ⊥ ⟨−a_n⟩, a nondegenerate form of dimension 2^{n−1} + 1 that is a subform of the n-fold Pfister form ⟨⟨a_1, …, a_n⟩⟩ (a Pfister neighbour). Its quadric Q_a ⊂ ℙ^{2^{n−1}} is smooth projective of dimension 2^{n−1} − 1. (i) For n ≥ 2, s_{2^{n−1}−1}(Q_a) ≡ 2 (mod 4), and for n = 1, deg Q_a = 2; so Q_a is a ν_{n−1}-variety for l = 2. (ii) For i < n − 1 the quadric of ⟨⟨a_1, …, a_i⟩⟩ ⊥ ⟨−a_{i+1}⟩ is a ν_i-variety and a linear section of Q_a, so Q_a is a ν_{≤(n−1)}-variety. (iii) For every field F ⊇ k, Q_a(F) ≠ ∅ iff {a_1, …, a_n} = 0 in K^M_n(F)/2. Hence for n ≥ 2 the geometrically integral quadric Q_a splits a and is 2-generic, so it is a norm variety for a when {a} ≠ 0 (nu-variety). This is the l = 2 splitting variety of Voevodsky's proof of the Milnor conjecture.

**Hypotheses and conventions.**

- k of characteristic 0 (char k ≠ 2 suffices for (i)-(iii)); n ≥ 1; a_i ∈ k^×; l = 2.

**Construction or proof.**

1. Define q_a from QuadraticFormInvariants Layer 4's n-fold Pfister forms (pfisterForm) and its projective quadric; smoothness from nondegeneracy and char k ≠ 2.
2. (i) For a smooth quadric Q ⊂ ℙ^{d+1} of dimension d ≥ 1, [T_Q] = (d + 2)[𝒪(1)] − [𝒪] − [𝒪(2)] in K_0(Q) (Euler and normal bundle sequences), so s_d(Q) = (d + 2 − 2^d)·deg(h^d) = 2(d + 2 − 2^d); for d = 2^{n−1} − 1 with n ≥ 2 the factor 2^{n−1} + 1 − 2^d is odd.
3. (ii) ⟨⟨a_1, …, a_i⟩⟩ ⊥ ⟨−a_{i+1}⟩ is a subform of ⟨⟨a_1, …, a_{i+1}⟩⟩ ⊆ ⟨⟨a_1, …, a_{n−1}⟩⟩ ⊆ q_a; apply (i) to it (degree 2 when i = 0).
4. (iii) Q_a(F) ≠ ∅ iff q_a is isotropic over F iff ⟨⟨a_1, …, a_n⟩⟩ is isotropic (a Pfister neighbour is isotropic iff its Pfister form is) iff it is hyperbolic (an isotropic Pfister form is hyperbolic) iff {a_1, …, a_n} = 0 in K^M_n(F)/2 (Elman–Lam for one direction; Milnor's map K^M_n/2 → I^n/I^{n+1} and the Arason–Pfister Hauptsatz for the other). These Pfister-form facts in every degree are a recorded gap: QuadraticFormInvariants Layer 4 proves them only for n ≤ 2.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Planning API.**

- **TauCeti.RostMotive.pfisterNeighbourQuadric** (constructor): Q_a ⊂ ℙ^{2^{n−1}} for a ∈ (k^×)^n.
- **TauCeti.RostMotive.pfister_dim** (simp): dim Q_a = 2^{n−1} − 1.
- **TauCeti.RostMotive.pfister_splits** (characterisation): Q_a splits {a_1, …, a_n} mod 2.
- **TauCeti.RostMotive.pfister_isNu** (characterisation): Q_a is a ν_{n−1}-variety for l = 2.
- **TauCeti.RostMotive.pfister_point_iff** (characterisation): For every field F ⊇ k: Q_a(F) ≠ ∅ iff {a_1, …, a_n} = 0 in K^M_n(F)/2.
- **TauCeti.RostMotive.pfister_isNuLe** (characterisation): Q_a is a ν_{≤(n−1)}-variety for l = 2, through the linear sections Q_{(a_1, …, a_{i+1})} ⊂ Q_a.
- **TauCeti.RostMotive.pfister_isNormVariety** (characterisation): For n ≥ 2 and {a} ≠ 0 in K^M_n(k)/2, Q_a is a norm variety for a.

**Discriminating tests.**

- **RostMotive.test_pfister_n1** (degenerate): For n = 1, Q_a is the zero-dimensional quadric x² = a_1 z², which has a point iff a_1 is a square.
- **RostMotive.test_pfister_conic** (computation): For n = 2 and a = (−1, −1) over ℝ, q_a = ⟨1, 1⟩ ⊥ ⟨1⟩, so Q_a is the conic x² + y² + z² = 0 with no real point, matching {−1, −1} ≠ 0 in K^M_2(ℝ)/2.
- **RostMotive.test_pfister_quaternion** (compatibility): For n = 2, Q_a has a point iff the quaternion algebra (a_1, a_2) splits (QuadraticFormInvariants Layer 2).
- **RostMotive.test_not_full_pfister** (non-example): For n ≥ 2 the full Pfister quadric ⟨⟨a_1, …, a_n⟩⟩ = 0 has dimension 2^n − 2, which is even and ≥ 2, hence not of the form 2^m − 1; it is not a ν_m-variety for any m and not a norm variety, so the neighbour is required (for n = 1 the two quadrics coincide).

**Consumers.**

- Voevodsky2011 Theorem 6.3 (l = 2): The ν_{≤(n−1)}-variety splitting a for l = 2.
- MotivicEtaleKTheory:M.5c/rost-motive: The l = 2 Rost motive is a summand of M(Q_a).
- Haesemeyer–Weibel, Norm varieties and the chain lemma, Definition 0.5: Rost varieties for odd l generalise the l = 2 Pfister quadrics.

**Acceptance.**

- For n = 2, Q_a is the conic ax² + by² = z² (with a = a_1, b = a_2 up to signs), splitting the quaternion algebra (a, b).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §1, PDF p. 2. For l = 2 the ν_{n−1} splitting varieties are Pfister quadrics (neighbours).

<a id="m-5b-chain-lemma-and-norm-principle"></a>

### M.5b/chain-lemma-and-norm-principle — Rost's Chain Lemma and Norm Principle

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle`. Implementation: unchecked.

Let k be a field of characteristic 0, l a prime and n ≥ 2, and suppose k is l-special (l divides the degree of every finite extension of k; then μ_l ⊂ k). Let {a} = {a_1, …, a_n} ∈ K^M_n(k)/l be nonzero. (Chain Lemma, Haesemeyer–Weibel Theorem 0.1) There are a smooth projective cellular variety S over k and invertible sheaves J = J_1, J'_1, …, J_{n−1}, J'_{n−1} on S with nonzero l-forms γ = γ_1, γ'_1, …, γ_{n−1}, γ'_{n−1} such that: (1) dim S = l(l^{n−1} − 1) = l^n − l; (2) {a_1, …, a_n} = {a_1, …, a_{n−2}, γ_{n−1}, γ'_{n−1}} in K^M_n(k(S))/l and {a_1, …, a_{i−1}, γ_i} = {a_1, …, a_{i−2}, γ_{i−1}, γ'_{i−1}} in K^M_i(k(S))/l for 2 ≤ i < n, so {a} = {γ, γ'_1, …, γ'_{n−1}} in K^M_n(k(S))/l; (3) γ ∉ Γ(S, J)^{⊗(−l)}; (4) for every s ∈ V(γ_i) ∪ V(γ'_i), k(s) splits {a}; (5) I(V(γ_i)) + I(V(γ'_i)) ⊆ lℤ for all i, where I(V) ⊆ ℤ is generated by the degrees [k(v) : k] of the closed points of V; (6) deg(c_1(J)^{dim S}) is prime to l. For the sheaf of Kummer algebras A = ⊕_{i=0}^{l−1} J^{⊗i}, the projective bundle ℙ(A) over S has dimension l^n − 1 and l² ∤ s_{l^n−1}(ℙ(A)) (Theorem 8.1). (Norm Principle, Theorem 0.3) If X is a norm variety for {a} (nu-variety: smooth projective, l-generic, splitting, of dimension l^{n−1} − 1) and [z, β] ∈ Ā_0(X, 𝒦_1) with [k(z) : k] = l^ν, ν > 1, then there are a closed point x ∈ X with [k(x) : k] = l and α ∈ k(x)^× such that [z, β] = [x, α] in Ā_0(X, 𝒦_1), the quotient of A_0(X, 𝒦_1) ≅ H_{−1,−1}(X) by the image of pr_{1∗} − pr_{2∗} from A_0(X × X, 𝒦_1). Consequently (Corollary 9.8, which is Theorem 0.7(3)) every element of Ā_0(X, 𝒦_1) is of the form [x, α] with [k(x) : k] ∈ {1, l}, and the norm N : Ā_0(X, 𝒦_1) → k^× is injective.

**Hypotheses and conventions.**

- k of characteristic 0 and l-special (so μ_l ⊂ k, the standing hypothesis of Haesemeyer–Weibel); n ≥ 2; {a} ≠ 0 in K^M_n(k)/l.
- Norm Principle: X a norm variety for {a} in the sense of nu-variety (l-generic splitting variety); the injectivity of N is the conclusion, not a hypothesis. The Bloch–Kato conjecture in degree n − 1 is not used.

**Construction or proof.**

1. Chain Lemma: l-forms on line bundles and Kummer algebras (Haesemeyer–Weibel §1), the case n = 2 (§2), the symbol chain, the models P_{n−1} and the model for l moves (§§3-5); part (6) is Theorem 5.9, a computation in the Chow ring of an iterated projective bundle (SF.5).
2. Theorem 8.1: s_{l^n−1}(ℙ(A)) = a_{l−1}·deg(x^{dim S}), x = −c_1(J), by additivity of s_d and the projective bundle formula CH^*(ℙ(A)) = CH^*(S)[y]/∏_{i=0}^{l−1}(y − ix); a_{l−1} ≡ l (mod l²) by Lemma 8.2, and deg x^{dim S} is prime to l by (6).
3. Norm Principle: nice G-actions of G = μ_l^n and G-fixed point equivalences (§§6-7), Theorem 9.6 through Theorem 10.4 and the DN theorem (dn-degree-theorem), then Theorem 9.7 (N_{E/k} maps Ã_0(E) into Ã_0(k) for [E : k] = l), using Suslin–Joukhovitski's Multiplication Principle (Lemma 9.4) and Hilbert 90 (Lemma 9.5); Theorem 0.3 follows along a tower of degree-l subextensions of k(z)/k, and Corollary 9.8 from Theorem 9.7 and Lemma 9.5.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5b/dn-degree-theorem](#m-5b-dn-degree-theorem), `SchemeAndStackFoundations:SF.5`, `K2SymbolsBrauer:T.2/milnor-k-theory`

**Acceptance.**

- For n = 2 the Chain Lemma is the classical chain lemma for cyclic algebras of degree l (Haesemeyer–Weibel §2).
- If X has a k-rational point x_0, N : Ā_0(X, 𝒦_1) → k^× is an isomorphism split by α ↦ [x_0, α] (Haesemeyer–Weibel Example 9.5.1).

**Sources.**

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Theorem 0.1, PDF p. 1. Rost's Chain Lemma.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Theorem 0.3, PDF p. 2. Norm Principle.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Introduction, PDF p. 1. Standing hypotheses: characteristic 0 and μ_l ⊂ k.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Theorem 8.1, PDF p. 22. ℙ(A) over the Chain Lemma variety is a ν_n-variety.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Corollary 9.8, PDF p. 25. Every element of Ā_0(X, 𝒦_1) is [x, α] with [k(x) : k] ∈ {1, l}, and N is injective.

<a id="m-5b-norm-variety-existence"></a>

### M.5b/norm-variety-existence — Existence of norm varieties

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5b/norm-variety-existence`. Implementation: unchecked.

Let k be a field of characteristic 0 containing a primitive l-th root of unity, l a prime, n ≥ 2 and a = (a_1, …, a_n) ∈ (k^×)^n with {a} ≠ 0 in K^M_n(k)/l. Assume that the norm residue homomorphism K^M_{n−1}(F)/l → H^{n−1}_et(F, μ_l^{⊗(n−1)}) is bijective for every field F of characteristic 0 (the induction hypothesis under which M.5c applies this theorem). Then: (i) there is a geometrically irreducible norm variety X for a (nu-variety), which admits morphisms from ν_i-varieties for all i < n − 1; (ii) if k is l-special, every norm variety for a is geometrically irreducible and a ν_{n−1}-variety, and its norm N : Ā_0(X, 𝒦_1) → k^× is injective; (iii) consequently there is a Rost variety for a: a ν_{≤(n−1)}-variety X splitting a such that H_{−1,−1}(X × X) --pr_{1∗} − pr_{2∗}--> H_{−1,−1}(X) → k^× is exact integrally when k is l-special, and after ⊗ℤ_(l) for general k, the form used in Voevodsky 2011 Lemma 6.15 (Voevodsky 2011 Theorem 6.3). For l = 2 the Pfister neighbour quadric Q_a of pfister-norm-variety is a norm variety and a ν_{≤(n−1)}-variety without any induction hypothesis, so (ii)-(iii) apply to it. For n = 1 and a_1 ∉ k^{×l}, Spec k(a_1^{1/l}) is a ν_0-variety splitting a, and the norm Ā_0 → k^× is injective by Hilbert 90.

**Hypotheses and conventions.**

- k of characteristic 0 with μ_l ⊂ k (the standing hypothesis of Haesemeyer–Weibel; automatic for l = 2 and for l-special k); l prime; n ≥ 2; {a} ≠ 0 in K^M_n(k)/l.
- The norm residue homomorphism is bijective in degree n − 1 for all fields of characteristic 0: Haesemeyer–Weibel state that Theorem 0.7 assumes it, and Suslin–Joukhovitski use it to prove that their varieties are l-generic. Voevodsky 2011 states Theorem 6.3 without it but applies it only under it (MotivicEtaleKTheory/E12).

**Construction or proof.**

1. (i) Suslin–Joukhovitski's inductive construction (pp. 254-256, cited by Haesemeyer–Weibel for Theorem 0.7(0)): from a norm variety for (a_1, …, a_{n−1}) and bundles of Kummer algebras, a geometrically irreducible smooth projective variety of dimension l^{n−1} − 1 splitting a, l-generic by the degree-(n − 1) hypothesis, with morphisms from the ν_i-varieties of the earlier steps.
2. (ii) Over l-special k: geometric irreducibility (Suslin–Joukhovitski 5.4), the ν_{n−1} property from the Chain Lemma, the ν_n-bundle ℙ(A) and the degree theorem dn-degree-theorem (Suslin–Joukhovitski 5.2), and injectivity of N from the Norm Principle (chain-lemma-and-norm-principle, Corollary 9.8).
3. (iii) Let k' ⊆ k̄ be the fixed field of a pro-l Sylow subgroup of Gal(k̄/k), a union of finite extensions of k of degree prime to l. Then {a}_{k'} ≠ 0, X_{k'} is a norm variety over the l-special field k', so (ii) applies; s_d is invariant under base change, so X is a ν_{n−1}-variety over k. An element of the kernel of Ā_0(X, 𝒦_1) ⊗ ℤ_(l) → k^× ⊗ ℤ_(l) dies over some finite E ⊆ k' with [E : k] prime to l, and N_{E/k} ∘ res_{E/k} = [E : k] shows that it is zero.
4. For l = 2, pfister-norm-variety gives the norm variety and the ν_{≤(n−1)} property directly; apply (ii).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle](#m-5b-chain-lemma-and-norm-principle), [MotivicEtaleKTheory:M.5b/pfister-norm-variety](#m-5b-pfister-norm-variety), [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5b/dn-degree-theorem](#m-5b-dn-degree-theorem)

**Acceptance.**

- For n = 1 and a_1 ∉ k^{×l}, X = Spec E with E = k(a_1^{1/l}): Ā_0(X, 𝒦_1) → k^× is injective with cokernel Br(E/k) (Haesemeyer–Weibel §9, the cyclic example).
- For l = 2 and n = 2, the conic a_1x² + a_2y² = z² is a Rost variety for {a_1, a_2} over every 2-special field.

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 6.3, PDF p. 34. Rost's theorem as used by Voevodsky (proved in Suslin–Joukhovitski).

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Introduction, PDF p. 1. The deduction from the Chain Lemma and the Norm Principle.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Introduction, before Theorem 0.7, PDF p. 3. The existence theorem is proved under the degree-(n − 1) induction hypothesis.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Introduction, PDF p. 1. Standing hypotheses of Theorem 0.7.

<a id="m-5b-cech-simplicial-scheme"></a>

### M.5b/cech-simplicial-scheme — Čech simplicial schemes and motives over embedded simplicial schemes

**Construction.** Identifier: `MotivicEtaleKTheory:M.5b/cech-simplicial-scheme`. Implementation: unchecked.

Let k be a perfect field (of characteristic 0 in the norm-residue application) and X a smooth k-scheme. The Čech simplicial scheme Č(X) has Č(X)_n = X^{n+1}, with partial projections as faces and diagonals as degeneracies; its motive M(Č(X)) ∈ DM^{eff,−}(k) is the totalisation of the M(X^{n+1}) and comes with the structure map M(Č(X)) → ℤ. Let 𝒳̃ = cone(Č(X)_+ → S^0) be the unreduced suspension. The map Č(X) → Spec k is a simplicial weak equivalence if and only if X(k) ≠ ∅; if X has a point over an extension of k of degree e, then e·H̃^{*,*}(𝒳̃, A) = 0 for every coefficient group A (transfer argument), and Č(X) → Spec k induces an isomorphism on motivic cohomology with ℤ_(l)-coefficients if and only if X has a zero-cycle of degree prime to l (MCZ2 Appendix B, Lemmas 9.2-9.3). For X ≠ ∅ it induces isomorphisms H^{p,q}_L(k, ℤ) ≅ H^{p,q}_L(Č(X), ℤ) on Lichtenbaum (étale) motivic cohomology for all p, q (MCZ2 Lemma 7.3). Č(X) is embedded: the projections M(Č(X) × Č(X)) → M(Č(X)) are isomorphisms. For an embedded 𝒳, the motives over 𝒳 that matter form the full subcategory DM_𝒳 ⊂ DM^{eff,−}(k) of the N for which N ⊗ M(𝒳) → N is an isomorphism; it is a localising tensor ideal containing the Tate motives ℤ_𝒳(q)[p] = M(𝒳)(q)[p]. For N ∈ DM_𝒳 and P ∈ DM^{eff,−}(k), composition with P ⊗ M(𝒳) → P is a bijection Hom(N, P ⊗ M(𝒳)) ≅ Hom(N, P), so Hom(M(Y), ℤ_𝒳(q)[p]) = H^{p,q}(Y) when M(Y) ∈ DM_𝒳; M(Y) ∈ DM_{Č(X)} if and only if M(Y) → ℤ factors through M(Č(X)) → ℤ, in particular whenever Hom(Y, X) ≠ ∅; and M(𝒳̃) ⊗ N = 0 for N ∈ DM_𝒳 (Motives over simplicial schemes, Lemmas 6.9, 6.11, 6.18). For a symbol a = (a_1, …, a_n) mod l, 𝒳_a := Č(Y_a), where Y_a is the disjoint union of representatives of the isomorphism classes of smooth connected k-schemes splitting a; a smooth connected X has M(X) ∈ DM_{𝒳_a} if and only if X splits a (Voevodsky 2011 §6, before Lemma 6.6).

**Hypotheses and conventions.**

- k a perfect field (characteristic 0 in the application to the norm residue theorem); X, Y smooth k-schemes; the terms of simplicial schemes are disjoint unions of smooth k-schemes of finite type.
- Motives in DM^{eff,−}(k) with ℤ or ℤ_(l) coefficients, as indicated; H_L is Lichtenbaum (étale) motivic cohomology.

**Construction or proof.**

1. Define Č(X) as the Čech nerve of X → Spec k in simplicial smooth schemes and its motive by totalisation (M.5a/effective-motives).
2. For smooth U, Č(X)(U) is the simplex on the set Hom(U, X), contractible if and only if Hom(U, X) ≠ ∅; hence Č(X) → Spec k is a weak equivalence if and only if X(k) ≠ ∅, Č(Y) × X → X is a weak equivalence when Hom(X, Y) ≠ ∅, and for X ≠ ∅ the map ℤ(Č(X)) → ℤ is an étale-local quasi-isomorphism because X has points over strictly henselian local schemes (MCZ2 Lemmas 9.2, 7.3).
3. Exponent: for E/k of degree e with X(E) ≠ ∅, restriction to E followed by the transfer (finite correspondences, M.5a/finite-correspondence) is multiplication by e on H̃^{*,*}(𝒳̃, ℤ) and factors through H̃^{*,*}(𝒳̃_E, ℤ) = 0 (MCZ2 Lemma 9.3).
4. Motives over 𝒳: Voevodsky's DM^{eff,−}(𝒳) with the adjoint pair c^*, Lc_#, where Lc_#c^*(N) = N ⊗ M(𝒳); for embedded 𝒳, Lc_# embeds the localising subcategory generated by the c^*(N) fully faithfully into DM^{eff,−}(k), with image {N : N ⊗ M(𝒳) ≅ N} (Motives over simplicial schemes, Lemmas 6.5-6.9); Lemmas 6.11 and 6.18 follow formally, and M(𝒳̃) ⊗ N = 0 is the cone of the isomorphism N ⊗ M(𝒳) → N.
5. For 𝒳_a use the class of smooth schemes splitting a (Voevodsky 2011 §1: embedded simplicial schemes correspond to classes of smooth varieties closed under maps into them and Nisnevich-local).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison)

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Planning API.**

- **TauCeti.RostMotive.cech** (constructor): Č(X) as a simplicial smooth k-scheme with M(Č(X)) → ℤ.
- **TauCeti.RostMotive.cech_point** (characterisation): If X(k) ≠ ∅ then M(Č(X)) → ℤ is an isomorphism.
- **TauCeti.RostMotive.cech_suspension** (constructor): 𝒳̃ = cone(Č(X)_+ → S^0) and its reduced motivic cohomology.
- **TauCeti.RostMotive.cech_baseChange** (functoriality): Č(X)_{k'} = Č(X_{k'}) and M commutes with base change.
- **TauCeti.RostMotive.cech_idempotent** (relation): M(Č(X)) ⊗ M(Č(X)) ≅ M(Č(X)).
- **TauCeti.RostMotive.cech_weakEquiv_iff** (characterisation): Č(X) → Spec k is a simplicial weak equivalence if and only if X(k) ≠ ∅.
- **TauCeti.RostMotive.cech_exponent** (relation): If X(E) ≠ ∅ for an extension E/k of degree e then e·H̃^{*,*}(𝒳̃, ℤ) = 0; with ℤ_(l)-coefficients M(Č(X)) → ℤ_(l) induces isomorphisms on motivic cohomology when X has a zero-cycle of degree prime to l.
- **TauCeti.RostMotive.cech_lichtenbaum** (characterisation): For X ≠ ∅, H^{p,q}_L(k, ℤ) → H^{p,q}_L(Č(X), ℤ) is an isomorphism for all p, q; hence H̃^{*,*}_L(𝒳̃, A) = 0.
- **TauCeti.RostMotive.DMOver** (structure): For an embedded 𝒳, DM_𝒳 = {N ∈ DM^{eff,−}(k) : N ⊗ M(𝒳) → N is an isomorphism}, a localising tensor ideal containing the Tate motives ℤ_𝒳(q)[p] = M(𝒳)(q)[p].
- **TauCeti.RostMotive.mem_DMOver_cech_iff** (characterisation): M(Y) ∈ DM_{Č(X)} if and only if M(Y) → ℤ factors through M(Č(X)) → ℤ; in particular M(Y) ∈ DM_{Č(X)} whenever Hom(Y, X) ≠ ∅.
- **TauCeti.RostMotive.hom_tate_over** (universal-property): For N ∈ DM_𝒳 and P ∈ DM^{eff,−}(k), Hom(N, P ⊗ M(𝒳)) → Hom(N, P) is bijective; hence Hom(M(Y), ℤ_𝒳(q)[p]) = H^{p,q}(Y) for M(Y) ∈ DM_𝒳, and M(Y) → ℤ lifts uniquely to π_𝒳 : M(Y) → ℤ_𝒳.
- **TauCeti.RostMotive.suspension_tensor_eq_zero** (relation): M(𝒳̃) ⊗ N = 0 for every N ∈ DM_𝒳.
- **TauCeti.RostMotive.IsRestricted** (other): N ∈ DM_𝒳 is restricted if Hom(P, N) → Hom(P ⊗ M(𝒳), N) is bijective for all P ∈ DM^{eff,−}(k); M(X) is restricted for X smooth projective with M(X) ∈ DM_𝒳, and direct summands of restricted objects are restricted.
- **TauCeti.RostMotive.slice_conservative** (characterisation): On Tate motives over 𝒳 the slice functor s_* is conservative and commutes with tensor products; the truncations Π_{≥n}, Π_{<n} exist (Motives over simplicial schemes, Lemmas 5.14-5.18).
- **TauCeti.RostMotive.splittingCech** (constructor): 𝒳_a = Č(Y_a) for a symbol a mod l; for smooth connected X, M(X) ∈ DM_{𝒳_a} if and only if X splits a.

**Discriminating tests.**

- **RostMotive.test_cech_point** (degenerate): Č(Spec k) is the constant simplicial scheme and M(Č(Spec k)) = ℤ.
- **RostMotive.test_cech_conic** (computation): For a smooth conic C over a field of characteristic 0 splitting a nonzero quaternion symbol a = {a_1, a_2} mod 2 (so C(k) = ∅), H̃^{3,1}(𝒳̃_C, ℤ/2) ≠ 0: it contains the image of the nonzero class δ ∈ H^{2,1}(Č(C), ℤ/2) of Voevodsky 2011 Lemma 6.5, since H^{p,q}(𝒳) → H̃^{p+1,q}(𝒳̃) is injective for p > q.
- **RostMotive.test_cech_etale** (compatibility): For every nonempty smooth X the map Č(X) → Spec k induces isomorphisms H^{p,q}_L(k, ℤ) ≅ H^{p,q}_L(Č(X), ℤ) on Lichtenbaum motivic cohomology (étale-local contractibility), although M(Č(X)) → ℤ is not an isomorphism in DM^{eff,−}(k) when X has no zero-cycle of degree one (for instance a conic without rational point).
- **RostMotive.test_cech_not_X** (non-example): M(Č(X)) ≠ M(X) for X = ℙ^1: M(ℙ^1) = ℤ ⊕ ℤ(1)[2] while M(Č(ℙ^1)) = ℤ.
- **RostMotive.test_cech_galois_weight_zero** (computation): For E/k Galois of degree l, H^{p,0}(Č(Spec E), ℤ/l) ≅ H^p(Gal(E/k), ℤ/l) ≅ ℤ/l for every p ≥ 0; a definition replacing M(Č(X)) by ℤ whenever X ≠ ∅ gives 0 for p ≥ 1.

**Consumers.**

- Voevodsky2011 Lemmas 6.5-6.15: The inductive step computes H^{n+1,n}(𝒳, ℤ_(l)) for 𝒳 = Č(X).
- Voevodsky2011 Proposition 5.18: M(𝒳) ≅ M(Č(X)) for 𝒳 defined by a ν_{n−1}-variety splitting a.
- MotivicEtaleKTheory:M.5c/rost-motive: The Rost motive's triangles are over M(Č(X)).
- Voevodsky 2011 §5 and Lemmas 6.9-6.15: Tate motives over 𝒳, the Hom identification [9, Lemma 6.11], restrictedness [9, Lemma 6.15] and the criterion [9, Lemma 6.23] for M(𝒳) ≅ M(Č(X)).
- Voevodsky 2011 Lemmas 6.6 and 6.12: Étale contractibility H̃_L(𝒳̃) = 0 and the exponent bound l·H̃(𝒳̃, ℤ_(l)) = 0 (MCZ2 Lemmas 7.3, 9.3).

**Acceptance.**

- For E/k Galois of degree l, X = Spec E: H^{p,0}(Č(X), ℤ/l) ≅ H^p(Gal(E/k), ℤ/l) ≅ ℤ/l for every p ≥ 0 (weight-zero motivic cohomology of Č(Spec E) is computed by the homogeneous cochains of Gal(E/k)), while l·H̃^{*,*}(𝒳̃, ℤ) = 0 because X has a point over E.

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §1, PDF p. 2. Embedded simplicial schemes and the Čech construction.

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), Appendix B, Lemma 9.3, printed p. 102 (PDF p. 44). The exponent bound n·H̃^{*,*}(𝒳̃, ℤ) = 0; the same page states the weak-equivalence criterion X(k) ≠ ∅.

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §7, Lemma 7.3, printed p. 96 (PDF p. 38). Č(X) → Spec k is an isomorphism on Lichtenbaum motivic cohomology for X ≠ ∅.

[Voevodsky2010MSS](https://arxiv.org/pdf/0805.4431v1), §6, Lemma 6.9, PDF p. 30. DM_𝒳 is the full subcategory of N with N ⊗ M(𝒳) → N an isomorphism.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §6, before Lemma 6.6, PDF p. 36. The embedded simplicial scheme 𝒳_a of a symbol.

<a id="m-5b-dn-degree-theorem"></a>

### M.5b/dn-degree-theorem — Rost's DN degree theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5b/dn-degree-theorem`. Implementation: unchecked.

Let k be a field of characteristic 0, l a prime, n ≥ 1, d = l^n − 1 and G an algebraic group (μ_l^n in the application). Let u_1, …, u_r (r ≥ 1) be symbols in K^M_{n+1}(k)/l and X = X_1 × ⋯ × X_r, where the X_i are irreducible smooth projective G-varieties of dimension d such that (1) k(X_i) splits u_i, (2) u_i is nonzero over k(X_1 × ⋯ × X_{i−1}), and (3) l² ∤ s_d(X_i). Let Y be a smooth irreducible projective G-variety which is G-fixed point equivalent to the disjoint union of m copies of X with l ∤ m (the fixed loci are 0-dimensional, lie in the smooth loci, and correspond bijectively over a separable extension with isomorphic tangent representations), F a finite extension of k(Y) of degree prime to l, and Spec F → X a point with model f : W → X, where W → Y is finite. Then f is dominant and of degree prime to l (Haesemeyer–Weibel Theorem A.1).

**Hypotheses and conventions.**

- k of characteristic 0; l prime; n ≥ 1; d = l^n − 1.
- X_i, Y smooth projective G-varieties as stated; l ∤ m; [F : k(Y)] prime to l.

**Construction or proof.**

1. Levine–Morel's generalised degree formula [Y] − deg(f)[X] ∈ M(X) in Ω_*(k) (Haesemeyer–Weibel Theorem A.2) and higher degree formula t_{d,r}(W) = deg(f)·t_{d,r}(X) (Theorem A.5), with Ω_*(k) ≅ 𝕃_* ≅ MU_{2*} and t_{d,1}(X) = unit·s_d(X)/l (Lemma A.6).
2. ψ(M(X)) = 0 for the tower X = X^{(r)} → ⋯ → X^{(0)} = Spec k by induction (Lemma A.7, using (1)-(2) for the divisibility of degrees of zero-cycles), and its transfer to Y (Lemma A.8).
3. Compare t_{d,r}(Y) with t_{d,r}(X) = ∏ t_{d,1}(X_i) ≠ 0 through the G-fixed point equivalence and the localisation theorem in complex cobordism (Lemma A.10, via k ⊆ ℂ), and conclude that deg f is prime to l.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), `SchemeAndStackFoundations:SF.5`, `K2SymbolsBrauer:T.2/milnor-k-theory`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Consumers.**

- Haesemeyer–Weibel Theorem 10.4 and Theorem 9.6: Norms from Kummer points of X_E are products of norms from points of degree l.
- MotivicEtaleKTheory:M.5b/norm-variety-existence: The ν_{n−1} property of norm varieties over l-special fields.

**Acceptance.**

- If X (r = 1) carries a G-action with 0-dimensional fixed locus in its smooth locus, Y = X (m = 1), F = k(X) and Spec F → X is the generic point, then f = id has degree 1, as the theorem requires.
- Applied in Haesemeyer–Weibel §10 with X_i = ℙ(A) of chain-lemma-and-norm-principle (Theorem 8.1 gives (3)).

**Sources.**

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Appendix A, Theorem A.1, PDF p. 28. The DN theorem is the degree formula behind the Norm Principle.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Theorem A.1, PDF p. 28. Conclusion of the DN theorem.

[HW2009Chain](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chain-final.pdf), Appendix A, PDF p. 28. The proof rests on algebraic cobordism (a recorded gap) and complex cobordism.

### Remaining work for M.5b

- Read Suslin–Joukhovitski, 'Norm varieties' (JPAA 206, 2006) for norm-variety-existence; the present locators are Voevodsky 2011 Theorem 6.3 and Haesemeyer–Weibel Theorem 0.7.
- Read Voevodsky, 'Motivic cohomology with ℤ/2-coefficients' (Publ. Math. IHÉS 98, 2003) for the degree map τ : T^N → Th_X(V) of degree-theorem and for the original l = 2 argument (Pfister neighbours and Rost's computation of A_0(Q, 𝒦_1)).
- Read Levine–Morel, 'Algebraic cobordism', §4.4, to state the degree formulas behind dn-degree-theorem.
- Cite the published version of RPO (Publ. Math. IHÉS 98, 2003, read on Numdam) beside arXiv v1: its numbering in §§3, 7 and 9 is shifted by one.

<a id="m-5c"></a>

## M.5c — Rost motives and the symbol calculation

Rost motives, symmetric operations and Hilbert-90 induction; the mod-ℓ symbol isomorphism is exported for every field of characteristic different from ℓ.

**Planets:** Rost motive, Norm residue homomorphism, Hilbert 90 for K^M_n, Mod-l norm residue isomorphism.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/henselian-residue-comparison](#m-1-henselian-residue-comparison), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.3/cohomological-steinberg](#m-3-cohomological-steinberg), [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/symbol-norm-compatibility](#m-3-symbol-norm-compatibility), [MotivicEtaleKTheory:M.3/symbol-residue-compatibility](#m-3-symbol-residue-compatibility), [MotivicEtaleKTheory:M.5a/cancellation](#m-5a-cancellation), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves](#m-5a-homotopy-invariant-sheaves), [MotivicEtaleKTheory:M.5a/imperfect-field-passage](#m-5a-imperfect-field-passage), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5b/cech-simplicial-scheme](#m-5b-cech-simplicial-scheme), [MotivicEtaleKTheory:M.5b/degree-theorem](#m-5b-degree-theorem), [MotivicEtaleKTheory:M.5b/milnor-operations](#m-5b-milnor-operations), [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations), [MotivicEtaleKTheory:M.5b/norm-variety-existence](#m-5b-norm-variety-existence), [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5b/steenrod-relations](#m-5b-steenrod-relations)

<a id="m-5c-rost-motive"></a>

### M.5c/rost-motive — The generalised Rost motive

**Construction.** Identifier: `MotivicEtaleKTheory:M.5c/rost-motive`. Implementation: unchecked.

Let k be a field of characteristic 0 containing a primitive l-th root of unity, n ≥ 2, a = (a_1, …, a_n) nonzero in K^M_n(k)/l, 𝒳 = 𝒳_a (cech-simplicial-scheme), X a ν_{n−1}-variety splitting a (so M(X) ∈ DM_𝒳), and δ ∈ H^{n,n−1}(𝒳, ℤ/l) with Q_0Q_1⋯Q_{n−1}(δ) ≠ 0 (supplied by hilbert-ninety-induction (a)). All motives have ℤ_(l)-coefficients. Set b = (l^{n−1} − 1)/(l − 1), d = b(l − 1) = l^{n−1} − 1 = dim X and μ = Q̃_0Q_1⋯Q_{n−2}(δ) ∈ H^{2b+1,b}(𝒳, ℤ_(l)), with Q̃_0 the integral Bockstein; μ is l-torsion and Q_i(μ mod l) = 0 for i < n − 1. Let M be the Tate motive over 𝒳 defined by the triangle ℤ_𝒳(b)[2b] → M → ℤ_𝒳 →μ ℤ_𝒳(b)[2b + 1] (Voevodsky 2011 (5.3)) and M_i = S^i(M) for 0 ≤ i ≤ l − 1; they sit in triangles M_{i−1}(b)[2b] → M_i → ℤ_𝒳 → M_{i−1}(b)[2b + 1] and ℤ_𝒳(ib)[2ib] → M_i → M_{i−1} → ℤ_𝒳(ib)[2ib + 1] ((5.5), (5.6)), and M_i ⊗ ℚ ≅ ⊕_{j≤i} ℚ(jb)[2jb]. The generalised Rost motive is M_a := M_{l−1}. There is λ : M(X) → M_{l−1} lifting π_X : M(X) → ℤ_𝒳 (Lemma 5.11); with Dλ its dual for the internal Hom-objects (M(X), e_X) (Proposition 5.14, motivic duality) and (M_{l−1}, e_{l−1}) (Lemma 5.7), λ ∘ Dλ is an isomorphism (Lemma 5.15, Corollary 5.10), and with φ = (λ ∘ Dλ)^{−1} the endomorphism p = Dλ ∘ φ ∘ λ of M(X) is a projector with image M_{l−1}, so M_{l−1} is a direct summand of M(X). M_{l−1} is restricted (Theorem 5.16), (M_{l−1}, e'_M) is an internal Hom-object from M_{l−1} to ℤ(d)[2d] in DM^{eff,−}(k) (Corollary 5.17), and M(𝒳) ≅ M(Č(X)) (Proposition 5.18, Lemma 6.8).

**Hypotheses and conventions.**

- k a field of characteristic 0 containing a primitive l-th root of unity (Voevodsky 2011 §5 works in characteristic 0 to use Theorem 3.8 and motivic duality).
- n ≥ 2; a a symbol nonzero mod l; X a ν_{n−1}-variety splitting a; δ ∈ H^{n,n−1}(𝒳_a, ℤ/l) with Q_0Q_1⋯Q_{n−1}(δ) ≠ 0.
- Coefficients ℤ_(l) (every prime other than l invertible); symmetric powers S^i only for i < l.

**Construction or proof.**

1. Symmetric powers S^i (i < l) are images of the averaging projector in the Karoubian ℤ_(l)-linear tensor category of Tate motives over 𝒳; the triangles (5.5)-(5.6) are Voevodsky 2011 Lemma 3.1, proved on slices (cech-simplicial-scheme, slice_conservative); the internal Hom-objects (M_i, e_i) to ℤ_𝒳(bi)[2bi] come from the triangle defining M ([9, Theorem 8.3]) and from S^i of internal Hom-objects (Lemma 5.7).
2. Slices: End(M_i) → ⊕_{j≤i} ℤ lands in tuples congruent mod l because μ ≢ 0 mod l (Lemma 5.8), so an endomorphism acting on the zero slice by c prime to l is an isomorphism (Corollary 5.10).
3. λ exists because the obstructions lie in groups H^{2bj+1,bj}(X, ℤ_(l)) = 0 for X smooth (Lemma 5.11). Proposition 5.12: λτ_X is not divisible by l, by the degree theorem (M.5b/degree-theorem, Theorem 4.4) applied to α = Q_{n−1}(μ mod l): α ≠ 0 by Margolis vanishing (Lemma 4.3) and weights, Q_{n−1}(α) = 0, and α vanishes on M_{l−1} because φ_{l−1}(μ) = c·βP^b(μ) (symmetric-power-operation) vanishes on M_{l−1} and Q_{n−1}(μ) = βP^b(μ) for l > 2 (Lemma 5.13, M.5b/milnor-operations); for l = 2 the argument is that of MCZ2 §4.
4. Lemma 5.15: dualise λ with respect to (M(X), e_X), the motivic duality of the smooth projective X (MotivesAndAlgebraicCycles MC.4/dual-of-motive-of-smooth-scheme) transported to DM_𝒳 ([9, Lemma 6.12]), and (M_{l−1}, e_{l−1}); π_X = Dτ_X and S^{l−1}(y) = DS^{l−1}(x) show that λDλ acts on the zero slice by c, prime to l by Proposition 5.12; hence λDλ is an isomorphism and p is a projector onto M_{l−1}.
5. Theorem 5.16: M(X) is restricted ([9, Lemma 6.15]) and so is its direct summand M_{l−1}; Corollary 5.17 follows with Lemma 5.7 and [9, Lemma 6.17]; Proposition 5.18 follows from [9, Lemma 6.23], using c^{−1}Dλ : M_{l−1} → M(X) and Lemma 5.11.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/cech-simplicial-scheme](#m-5b-cech-simplicial-scheme), [MotivicEtaleKTheory:M.5c/symmetric-power-operation](#m-5c-symmetric-power-operation), [MotivicEtaleKTheory:M.5b/degree-theorem](#m-5b-degree-theorem), [MotivicEtaleKTheory:M.5b/milnor-operations](#m-5b-milnor-operations), [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations), [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5a/cancellation](#m-5a-cancellation), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), `MotivesAndAlgebraicCycles:MC.4/dual-of-motive-of-smooth-scheme`, `MotivesAndAlgebraicCycles:MC.4/symmetric-group-acts-trivially-on-tate-twists`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Planning API.**

- **TauCeti.RostMotive.rostMotive** (constructor): M_a = S^{l−1}(M_μ) ∈ DM_{𝒳_a} ⊂ DM^{eff,−}(k, ℤ_(l)), determined by (𝒳_a, δ); it is a direct summand of M(X) for every ν_{n−1}-variety X splitting a.
- **TauCeti.RostMotive.rost_triangle** (relation): Distinguished triangles M(𝒳)(ib)[2ib] → M_i → M_{i−1} → M(𝒳)(ib)[2ib + 1] and M_{i−1}(b)[2b] → M_i → M(𝒳) → M_{i−1}(b)[2b + 1] for 1 ≤ i ≤ l − 1.
- **TauCeti.RostMotive.rost_summand** (characterisation): M_a is a direct summand of M(X) via the projector p = Dλ ∘ (λ ∘ Dλ)^{−1} ∘ λ.
- **TauCeti.RostMotive.rost_dual** (relation): (M_a, e'_M) is an internal Hom-object from M_a to ℤ(d)[2d].
- **TauCeti.RostMotive.rost_split_after_splitting** (characterisation): After a field extension splitting a, M_a ≅ ⊕_{i=0}^{l−1} ℤ(ib)[2ib].
- **TauCeti.RostMotive.symmetric_power_operation** (relation): φ_{l−1}(α) = c·βP^m(α) for α ∈ H̃^{2m+1,m}(−, ℤ/l) and a constant c ∈ (ℤ/l)^× (Voevodsky 2011 Theorem 3.8, node symmetric-power-operation); for α = μ mod l and m = b it shows that βP^b(μ) vanishes on M_{l−1}.
- **TauCeti.RostMotive.rost_rational** (example): M_i ⊗ ℚ ≅ ⊕_{j=0}^{i} ℚ(jb)[2jb], since μ is l-torsion; with ℤ_(l)-coefficients M_i does not split.
- **TauCeti.RostMotive.rost_restricted** (characterisation): M_a is restricted, and M(𝒳_a) ≅ M(Č(X)) for every ν_{n−1}-variety X splitting a.

**Discriminating tests.**

- **RostMotive.test_rost_split** (degenerate): After base change to E = k(X), where X has a rational point, 𝒳_E ≃ Spec E and μ_E ∈ H^{2b+1,b}(E, ℤ_(l)) = 0, so (M_a)_E ≅ ⊕_{i=0}^{l−1} ℤ_(l)(ib)[2ib].
- **RostMotive.test_rost_conic** (computation): For l = 2, n = 2: b = 1, d = 1, and M_a = M(C) for the conic C, with triangle M(𝒳)(1)[2] → M(C) → M(𝒳).
- **RostMotive.test_rost_rank** (compatibility): Over k^sep, M_a has the Tate-motive decomposition of rank l, matching the l summands ℤ(ib)[2ib].
- **RostMotive.test_not_whole_X** (non-example): For n ≥ 3 and l = 2, M_a ≠ M(Q_a): the Pfister neighbour quadric has more Tate summands over k^sep than the Rost motive.

**Consumers.**

- Voevodsky2011 Lemmas 6.13-6.15: The vanishing of H^{n+1,n}(𝒳, ℤ_(l)) is computed through Hom(ℤ, M_{l−1}(1)[1]).
- Voevodsky2011 Lemmas 5.7-5.15: The properties of M_{l−1} that make the induction work (restricted, self-dual, a summand of M(X)).
- HW2009Chain introduction: 'If Rost varieties exist then Rost motives exist' is the step this node realises.

**Acceptance.**

- For l = 2 and n = 2, M_a is the motive of the conic splitting the quaternion symbol, M(C) itself (Rost).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 5.16 and Corollary 5.17, PDF p. 32. The Rost motive M_{l−1} is restricted and self-dual.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §5, PDF p. 32. The projector cutting out the Rost motive.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §5, (5.2)-(5.6), PDF pp. 26-27. μ = Q̃_0Q_1⋯Q_{n−1}(δ) in the indexing of §5 (ν_n-variety, δ ∈ H^{n+1,n}); the node uses §6 indexing, n replaced by n − 1.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §5 opening, PDF p. 25. The characteristic-0 hypothesis of the Rost motive construction.

<a id="m-5c-galois-symbol-all-degrees"></a>

### M.5c/galois-symbol-all-degrees — The norm residue homomorphism in all degrees

**Construction.** Identifier: `MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees`. Implementation: unchecked.

Let F be a field and m ≥ 1 invertible in F. The norm residue homomorphism is the unique graded ring homomorphism h_F = ⊕_n h^n_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}) = ⊕_{n≥0} H^n(F, μ_m^{⊗n}) whose degree-one part is the Kummer map κ : F^×/m ≅ H¹(F, μ_m) of ProfiniteCohomology Layer 9 (Tau Ceti's kummerMap, read in the canonical carrier through Layer 3); thus h^0_F is the identity of ℤ/m and h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n). The cup products are those of M.1/twisted-cohomology-ring, built from Layer 12's cup product and the equivariant tensor pairings μ_m^{⊗i} ⊗ μ_m^{⊗j} → μ_m^{⊗(i+j)} of M.1/finite-tate-twist (concatenation of tensors, not multiplication of roots of unity). The map is well defined because κ(a) ∪ κ(1 − a) = 0 (M.3/cohomological-steinberg), and h^2_F is M.3's Galois symbol under Matsumoto's identification K^M_2(F) = K_2(F). (i) Naturality: res_{E/F} ∘ h_F = h_E ∘ res_{E/F} for every field extension E/F with a chosen embedding of separable closures. (ii) Change of m: for m | m', the reduction μ_{m'}^{⊗n} → μ_m^{⊗n} (ζ ↦ ζ^{m'/m} on each factor) carries h_{F,m'} to h_{F,m}. (iii) Norms: for E/F finite, cor_{E/F} ∘ h_E = h_F ∘ N_{E/F}, with N_{E/F} the Milnor norm of K2SymbolsBrauer T.4 and cor_{E/F} the corestriction when E/F is separable and multiplication by [E : F] under G_E = G_F when E/F is purely inseparable (in general the composite along the separable closure of F in E). (iv) Residues: for a discrete valuation v on F with uniformiser π and residue field k(v) in which m is invertible, ∂_v ∘ h^n_F = (−1)^{n−1} h^{n−1}_{k(v)} ∘ ∂^M_v, where ∂^M_v is K2SymbolsBrauer T.3's higher residue (∂^M_v{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}) and ∂_v : H^n(F, μ_m^{⊗n}) → H^{n−1}(k(v), μ_m^{⊗(n−1)}) the residue of M.1/localization-gysin-sequence (∂_vκ(π) = 1); for v-units u_i, h^n_F{u_1, …, u_n} is unramified and specialises to h^n_{k(v)}{ū_1, …, ū_n}. (v) Motivic comparison: h^n_F equals the composite K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) of the diagonal isomorphism (M.5a/suslin-complex-and-motivic-complexes) and the motivic-to-étale map of M.5a/etale-motivic-comparison, normalised in weight one to be κ; for F not of finite type over a perfect field both sides are filtered colimits over smooth models (M.5a/imperfect-field-passage (b)).

**Hypotheses and conventions.**

- F a field; m ≥ 1 invertible in F; no primitive m-th root of unity is assumed.
- For (iv), m invertible in the residue field k(v); for (iii), E/F finite.

**Construction or proof.**

1. Degree one: κ is the isomorphism kummerIso of ProfiniteCohomology Layer 9 (Hilbert 90); M.5's degree-one case is this import, not a new proof.
2. Multiplicativity: the tensor algebra T(F^×) maps to ⊕_n H^n(F, μ_m^{⊗n}) by iterated cup products of Kummer classes (M.1/twisted-cohomology-ring with the pairings of M.1/finite-tate-twist); the two-sided ideal generated by the a ⊗ (1 − a) maps to 0 by M.3/cohomological-steinberg and associativity, and m·K^M_* maps to 0 since the target is a ℤ/m-module, so the map factors through K^M_*(F)/m (K2SymbolsBrauer T.2/milnor-k-theory; K-book III Theorem 7.11). Uniqueness: K^M_*(F) is generated in degree one.
3. Naturality and change of m: naturality of κ (Layer 9 restriction square) and of the cup product (Layer 12 cup_res, cup_coeffMap); κ_m(a) is the reduction of κ_{m′}(a) since (σα/α)^{m′/m} = σβ/β for β = α^{m′/m}.
4. Norms: both sides are transitive in towers (K2SymbolsBrauer T.4/milnor-transfer-transitivity; transitivity of corestriction), and the purely inseparable case is as in M.3/symbol-norm-compatibility. On ℓ-primary parts pass to a prime-to-ℓ closure F' of F (T.4/prime-to-p-closure; res is injective there since cor ∘ res is a degree prime to ℓ, and T.4/transfer-base-change); over F' an extension of degree ℓ has K^M_n(E) generated by symbols {y, x_2, …, x_n} with y ∈ E^× and x_i ∈ F'^× (T.4/p-closed-generation), and the projection formulas (T.4/milnor-projection-formula; Layer 12 cup_projection) reduce the claim to degree one, Layer 9's kummerIso_norm.
5. Residues: K^M_n(F) is generated by the symbols {u_1, …, u_n} and {u_1, …, u_{n−1}, π} with v-units u_i; the Kummer classes of units come from H¹_et(Spec 𝒪_v, μ_m) (M.1/etale-kummer-sequences), so the first kind are unramified with residue 0 and specialise to h_{k(v)}{ū_i}; on the second kind apply ∂_v(κ(u) ∪ x) = −κ(ū) ∪ ∂_v(x) (M.1/localization-gysin-sequence) n − 1 times and ∂_vκ(π) = 1.
6. Motivic comparison: both maps are ring homomorphisms out of K^M_*(F)/m (the motivic-to-étale map is multiplicative and the diagonal isomorphism is a ring isomorphism) that agree in degree one by the normalisation of M.5a/etale-motivic-comparison, hence agree.

**Direct prerequisites.** [MotivicEtaleKTheory:M.3/cohomological-steinberg](#m-3-cohomological-steinberg), [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/symbol-norm-compatibility](#m-3-symbol-norm-compatibility), [MotivicEtaleKTheory:M.3/symbol-residue-compatibility](#m-3-symbol-residue-compatibility), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5a/imperfect-field-passage](#m-5a-imperfect-field-passage), `tauceti:TauCeti.kummerMap`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/p-closed-generation`, `K2SymbolsBrauer:T.4/transfer-base-change`

**Proposed library location.** `TauCeti/KTheory/NormResidue`, namespace `TauCeti.NormResidue`.

**Planning API.**

- **TauCeti.NormResidue.map** (constructor): h_F : K^M_*(F)/m → H^{*}(F, μ_m^{⊗*}), a graded ring homomorphism.
- **TauCeti.NormResidue.map_symbol** (simp): h^n_F{a_1, …, a_n} = κ(a_1) ∪ ⋯ ∪ κ(a_n).
- **TauCeti.NormResidue.map_one** (equivalence): h^1_F is the Kummer isomorphism F^×/m ≅ H¹(F, μ_m).
- **TauCeti.NormResidue.map_two** (compatibility): h^2_F is M.3's Galois symbol.
- **TauCeti.NormResidue.map_res** (functoriality): res_{E/F} ∘ h_F = h_E ∘ res_{E/F} for every field extension E/F with a chosen embedding of separable closures.
- **TauCeti.NormResidue.map_norm** (compatibility): cor_{E/F} ∘ h_E = h_F ∘ N_{E/F} for E/F finite, with cor the corestriction for E/F separable and multiplication by [E : F] under G_E = G_F for E/F purely inseparable.
- **TauCeti.NormResidue.map_residue** (compatibility): ∂_v ∘ h^n_F = (−1)^{n−1} h^{n−1}_{k(v)} ∘ ∂^M_v for a discrete valuation v with m invertible in k(v), where ∂^M_v{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}} and ∂_vκ(π) = 1.
- **TauCeti.NormResidue.map_motivic** (compatibility): h_F equals the composite K^M_n(F)/m ≅ H^{n,n}(F, ℤ/m) → H^n_et(F, μ_m^{⊗n}) with the normalised weight-one identification.
- **TauCeti.NormResidue.map_reduce** (compatibility): For m | m', reduction of coefficients μ_{m'}^{⊗n} → μ_m^{⊗n} carries h_{F,m'} to h_{F,m} composed with K^M_n(F)/m' → K^M_n(F)/m.
- **TauCeti.NormResidue.map_unramified** (compatibility): For v-units u_1, …, u_n, h^n_F{u_1, …, u_n} is the restriction of κ(u_1) ∪ ⋯ ∪ κ(u_n) ∈ H^n_et(Spec 𝒪_v, μ_m^{⊗n}), whose restriction to the closed point is h^n_{k(v)}{ū_1, …, ū_n}.

**Discriminating tests.**

- **NormResidue.test_degree_zero** (degenerate): h^0_F : ℤ/m → H^0(F, ℤ/m) = ℤ/m is the identity.
- **NormResidue.test_real** (computation): For F = ℝ, m = 2: h^n{−1, …, −1} = κ(−1)^n ≠ 0.
- **NormResidue.test_kummer** (compatibility): h^1_F(a) is the image of TauCeti.kummerMap F m a under Layer 3's comparison of Tau Ceti's explicit H¹ with the canonical continuous cohomology; it is the class of σ ↦ σ(α)/α for any α ∈ F^s with α^m = a.
- **NormResidue.test_finite_field** (non-example): For F = 𝔽_q and n = 2 both sides vanish (K^M_2(𝔽_q) = 0, cd(𝔽_q) = 1); a map defined without the Steinberg relation on the tensor algebra would have nonzero source.
- **NormResidue.test_residue_sign** (computation): For F = ℚ_p (p odd), m = ℓ a prime dividing p − 1 and a unit u with ū not an ℓ-th power in 𝔽_p: ∂_p(h²{u, p}) = −κ(ū) ≠ 0 and ∂_p(h²{p, u}) = κ(ū); a residue formula with sign +1 in every degree fails here.

**Consumers.**

- MotivicEtaleKTheory:M.5 norm-residue-theorem: The map whose bijectivity is the norm residue theorem.
- MotivicEtaleKTheory:M.5d/prime-power-norm-residue: The prime-power induction uses the natural map in all degrees.
- KTheoryFiniteLocalFields:L.6/milnor-k-of-local-fields and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Higher symbols of local fields are evaluated through this map.

**Acceptance.**

- For F = ℝ and m = 2, h^n_ℝ{−1, …, −1} = κ(−1)^n ≠ 0 for every n (H^*(ℤ/2, ℤ/2) = 𝔽_2[x] with x = κ(−1)).
- For F = ℚ_p with p odd, m = ℓ a prime dividing p − 1 and a unit u whose residue ū is not an ℓ-th power: ∂_p h²{u, p} = −κ(ū) ≠ 0 and ∂_p h²{p, u} = κ(ū), the case n = 2 of (iv), matching M.3/symbol-residue-compatibility.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Corollary 4.1.1, printed p. 480 (PDF p. 488). The norm residue symbols K^M_i(k)/m → H^i_et(k, μ_m^{⊗i}) and their ring structure.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 6.1, PDF p. 33. The map whose bijectivity is proved.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III Theorem 7.11(2) and its proof, printed p. 256 (PDF p. 264). The construction of h_F from the Kummer map, cup products and the Steinberg identity (Bass–Tate), for every field with n invertible.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III proof of Theorem 7.11, printed p. 256 (PDF p. 264). Well-definedness through the cohomological Steinberg relation (M.3/cohomological-steinberg).

<a id="m-5c-hilbert-ninety-induction"></a>

### M.5c/hilbert-ninety-induction — The inductive step: Hilbert 90 for K^M_n and the vanishing of H^{n+1,n}(𝒳)

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5c/hilbert-ninety-induction`. Implementation: unchecked.

Let l be a prime and n ≥ 2, and assume H90(q, l) for every q ≤ n − 1: H^{q+1}_L(F, ℤ_(l)(q)) = 0 for every field F of characteristic 0 (so hilbert-ninety-implies-beilinson-lichtenbaum gives the norm residue isomorphism in degrees ≤ n − 1 and the Beilinson–Lichtenbaum comparison in weights ≤ n − 1 over such fields; H_L is Lichtenbaum motivic cohomology). Let k be a field of characteristic 0 containing a primitive l-th root of unity, a = (a_1, …, a_n) a symbol nonzero in K^M_n(k)/l, 𝒳 = 𝒳_a, and X a norm variety for a (M.5b/norm-variety-existence: a ν_{≤(n−1)}-variety splitting a with H_{−1,−1}(X × X) → H_{−1,−1}(X) → k^× exact). Then: (a) the image of a in H^n_et(k, μ_l^{⊗n}) is nonzero (Lemma 6.4), and there is δ ≠ 0 in H^{n,n−1}(𝒳, ℤ/l) (Lemma 6.5) with Q_{n−1}⋯Q_0(δ) ≠ 0 (Lemma 6.7); (b) H̃^{p,q}(𝒳̃, ℤ/l) = 0 for q ≤ n − 1 and p ≤ q + 1 (Lemma 6.6); (c) H^{n+1,n}(𝒳, ℤ_(l)) = 0 (Proposition 6.11, via Lemmas 6.12-6.15 and the Rost motive); (d) the sequence H^{n+1,n}(𝒳, ℤ_(l)) → H^{n+1,n}_L(k, ℤ_(l)) → H^{n+1,n}_L(k(X), ℤ_(l)) is exact (Lemma 6.9), so restriction H^{n+1}_L(k, ℤ_(l)(n)) → H^{n+1}_L(k(X), ℤ_(l)(n)) is injective, while a = 0 in K^M_n(k(X))/l; (e) consequently H90(n, l) holds: H^{n+1}_L(F, ℤ_(l)(n)) = 0 for every field F of characteristic 0 (Hilbert 90 for K^M_n; MCZ2, proof of Theorem 7.4, pp. 96-97).

**Hypotheses and conventions.**

- k of characteristic 0 containing a primitive l-th root of unity; n ≥ 2.
- Induction hypothesis H90(q, l) for all q ≤ n − 1 and all fields of characteristic 0.
- a a symbol nonzero mod l; X a norm variety for a.

**Construction or proof.**

1. (a) Lemma 6.4: by a transfer argument reduce to k without extensions of degree prime to l; with E = k(a_n^{1/l}), MCZ2 Proposition 5.2 and the norm residue isomorphism in degree n − 1 show that if the image of a vanished then (a_1, …, a_{n−1}) would be a norm from K^M_{n−1}(E) and a = 0. Lemma 6.5: by the Beilinson–Lichtenbaum comparison in weight n − 1, H^{n,n−1}(𝒳, ℤ/l) is the kernel of H^n_et(k, μ_l^{⊗(n−1)}) → ∏_α H^n_et(k(X_α), μ_l^{⊗(n−1)}), which contains the image of a twisted by the root of unity. Lemma 6.7: Margolis vanishing (M.5b/degree-theorem, Lemma 4.3, for the ν_i-varieties mapping to X) and (b) in the bidegrees reached.
2. (b) Lemma 6.6: by hilbert-ninety-implies-beilinson-lichtenbaum (a), H̃^{p,q}(𝒳̃, ℤ/l) ⊂ H̃^{p,q}_L(𝒳̃, ℤ/l) for q ≤ n − 1, p ≤ q + 1, and H̃_L(𝒳̃) = 0 (cech-simplicial-scheme, MCZ2 Lemma 7.3).
3. (c) Lemma 6.12: X has a point over an extension of degree prime to l², so H̃(𝒳̃, ℤ_(l)) has exponent l (MCZ2 Lemma 9.3) and one may reduce mod l; Q_{n−1}⋯Q_1 is injective on H^{n+2,n}(𝒳̃, ℤ/l) by Margolis vanishing and (b) and preserves images of integral classes (MCZ2 Lemma 7.2), giving H^{n+1,n}(𝒳, ℤ_(l)) ↪ H^{2lb+2,lb+1}(𝒳, ℤ_(l)). Lemmas 6.13-6.14: the triangles and the duality of rost-motive make the target a quotient of ker(Hom(ℤ_(l), M_{l−1}(1)[1]) → Hom(ℤ_(l), ℤ_(l)(1)[1])). Lemma 6.15: this map is injective, because Hom(ℤ_(l), M(𝒳)(1)[1]) = coker(H_{−1,−1}(X × X) → H_{−1,−1}(X)) (M(𝒳) = M(Č(X)), Lemma 6.8) injects into k^× by the norm condition of M.5b/norm-variety-existence.
4. (d) Lemma 6.9: factor Spec k(X) → X → 𝒳 → Spec k, the last map being an isomorphism on H_L; a class x of H^{n+1}_L(𝒳, ℤ_(l)(n)) vanishing on k(X) maps to zero in H^{n+1}(X, K(n)) by hilbert-ninety-implies-beilinson-lichtenbaum (c), hence on M_{l−1} through the split epimorphism λ of rost-motive, hence is zero by the triangle (5.5) and Lemma 6.10 (Hom(M_{l−2}(b)[2b], K(n)[n + 1]) = 0).
5. (e) MCZ2 pp. 96-97: for a field F of characteristic 0, H^{n+1}_L(F, ℤ_(l)(n)) injects into the same group of a prime-to-l closure (transfer, K2SymbolsBrauer T.4/prime-to-p-closure), which contains μ_l; iterating prime-to-l closures and the function fields k(X) of norm varieties of all symbols gives a filtered union F_∞ with no extensions of degree prime to l and K^M_n(F_∞) = l·K^M_n(F_∞), into whose H^{n+1}_L the group of F injects by (d) and continuity of étale cohomology; H^{n+1}_L(F_∞, ℤ_(l)(n)) = 0 by hilbert-ninety-implies-beilinson-lichtenbaum (d).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5c/rost-motive](#m-5c-rost-motive), [MotivicEtaleKTheory:M.5b/cech-simplicial-scheme](#m-5b-cech-simplicial-scheme), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum](#m-5c-hilbert-ninety-implies-beilinson-lichtenbaum), [MotivicEtaleKTheory:M.5b/norm-variety-existence](#m-5b-norm-variety-existence), [MotivicEtaleKTheory:M.5b/degree-theorem](#m-5b-degree-theorem), [MotivicEtaleKTheory:M.5b/milnor-operations](#m-5b-milnor-operations), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`

**Acceptance.**

- For n = 2 and l = 2 this recovers Merkurjev's theorem K_2(k)/2 ≅ H²(k, μ_2^{⊗2}) in characteristic 0, X being the conic of the quaternion symbol.
- For n = 2, (e) is H³_L(F, ℤ_(l)(2)) = 0, Hilbert 90 for K_2 (Merkurjev–Suslin), in characteristic 0.

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Proposition 6.11, PDF p. 39. The key vanishing H^{n+1,n}(𝒳, ℤ_(l)) = 0.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Lemma 6.4, PDF p. 34. The induction hypothesis.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §6, Lemma 6.9, PDF p. 38. Part (d).

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §6, after Theorem 6.1, PDF p. 33. The reduction of Hilbert 90 in weight n to the extensions K_a = k(X).

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §7, proof of Theorem 7.4, printed p. 97 (PDF p. 39). The tower argument of part (e), written for l = 2 and valid for every l given (d).

<a id="m-5c-mod-l-norm-residue"></a>

### M.5c/mod-l-norm-residue — The mod-l norm residue isomorphism

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5c/mod-l-norm-residue`. Implementation: unchecked.

Let l be a prime and k a field with char k ≠ l. For every n ≥ 0 the norm residue homomorphism h^n_k : K^M_n(k)/l → H^n(k, μ_l^{⊗n}) of galois-symbol-all-degrees is an isomorphism (Voevodsky 2011 Theorems 6.1 and 6.16). If char k = 0, H90(n, l) holds for k for every n, and by hilbert-ninety-implies-beilinson-lichtenbaum (a) for every pointed smooth simplicial scheme 𝒳 over k the maps H̃^{p,q}(𝒳, ℤ/l) → H̃^{p,q}_L(𝒳, ℤ/l) are isomorphisms for p ≤ q and monomorphisms for p = q + 1 (Theorem 6.17(1) for such k). The ℓ^r-coefficient theorem is M.5d/prime-power-norm-residue, and the comparison for smooth schemes over arbitrary fields is M.7/beilinson-lichtenbaum.

**Hypotheses and conventions.**

- l prime; k a field with char k ≠ l; n ≥ 0.
- The simplicial-scheme comparison is stated for char k = 0.

**Construction or proof.**

1. Characteristic 0: H90(0, l) is H¹_et(F, ℤ_(l)) = 0 and H90(1, l) is Hilbert 90, H²_L(F, ℤ(1)) = H¹_et(F, 𝔾_m) = 0 (ProfiniteCohomology Layer 9); hilbert-ninety-induction gives (H90(q, l) for all q ≤ n − 1) ⇒ H90(n, l) for all fields of characteristic 0, so H90(n, l) holds for all n by induction from n = 1, and hilbert-ninety-implies-beilinson-lichtenbaum (b) gives bijectivity of h^n_k for every k of characteristic 0 (no root of unity is needed here: the reduction to μ_l ⊂ k happens inside the H90 argument).
2. Characteristic p ≠ l, reduction to perfect fields: G_k = G_{k^perf}, and K^M_n(k)/l → K^M_n(k^perf)/l is bijective (every element of k^perf has a p-power in k, p is invertible mod l, and N ∘ res = p^e on finite subextensions, K2SymbolsBrauer T.4/restriction-transfer-degree), compatibly with h.
3. Characteristic p ≠ l, specialisation: for perfect k, R = W(k) is a complete discrete valuation ring with uniformiser p and residue field k (mathlib WittVector.isDiscreteValuationRing, isAdicCompleteIdealSpanP, quotientPEquiv) whose fraction field K has characteristic 0. Rigidity gives (λ_p, ∂^M_v) : K^M_n(K)/l ≅ K^M_n(k)/l ⊕ K^M_{n−1}(k)/l (K2SymbolsBrauer T.3/rigidity), and on the Galois side 0 → H^n(k, μ_l^{⊗n}) → H^n(K, μ_l^{⊗n}) →∂ H^{n−1}(k, μ_l^{⊗(n−1)}) → 0 is exact (M.1/localization-gysin-sequence for Spec R with M.1/henselian-residue-comparison; ∂ is surjective since ∂(κ(p) ∪ x̃) = ±x for the unramified lift x̃ of x).
4. The section {ū_1, …, ū_n} ↦ {u_1, …, u_n} and the inclusion of unramified classes commute with h, and ∂ ∘ h_K = (−1)^{n−1} h_k ∘ ∂^M_v (galois-symbol-all-degrees (iv)); h_K is bijective by the characteristic-0 case, so injectivity of h^n_k follows directly and surjectivity by induction on n (h^{n−1}_k injective) and a diagram chase.
5. The simplicial-scheme statement is hilbert-ninety-implies-beilinson-lichtenbaum (a) with ℤ/l coefficients, given H90(n, l) for all n.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5c/hilbert-ninety-induction](#m-5c-hilbert-ninety-induction), [MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum](#m-5c-hilbert-ninety-implies-beilinson-lichtenbaum), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.5b/norm-variety-existence](#m-5b-norm-variety-existence), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/henselian-residue-comparison](#m-1-henselian-residue-comparison), `K2SymbolsBrauer:T.3/rigidity`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `mathlib:WittVector.isDiscreteValuationRing`, `mathlib:WittVector.isAdicCompleteIdealSpanP`, `mathlib:WittVector.quotientPEquiv`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Acceptance.**

- For k = ℝ, l = 2: K^M_n(ℝ)/2 ≅ ℤ/2 ≅ H^n(ℝ, μ_2^{⊗n}) for all n (Milnor's computation and the cohomology of ℤ/2).
- For k = 𝔽_q with l ∤ q: h^1 is the Kummer isomorphism 𝔽_q^×/l ≅ H¹(𝔽_q, μ_l) and both sides vanish for n ≥ 2 (K^M_n(𝔽_q) = 0, cd(𝔽_q) = 1).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 6.1, PDF p. 33. Characteristic-zero statement with μ_l ⊂ k; the removal of the root of unity is a transfer argument.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 6.17, PDF p. 42. The simplicial-scheme form (Beilinson–Lichtenbaum).

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), §6, Theorem 6.16, PDF p. 41. The mod-l theorem for every field of characteristic ≠ l; the source attributes its deduction from Theorem 6.1 to [6] (see sourceIssues).

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §6, Corollary 6.10, printed p. 91 (PDF p. 33). Bijectivity of the norm residue map from Hilbert 90.

<a id="m-5c-symmetric-power-operation"></a>

### M.5c/symmetric-power-operation — Symmetric powers of Tate motives and the reduced power βP^m

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5c/symmetric-power-operation`. Implementation: unchecked.

Let k be a field of characteristic 0, l a prime and R = ℤ/l or ℤ_(l). For a smooth simplicial scheme 𝒳 and a Tate motive M over 𝒳 given with a triangle R(p)[2q] → M → R →α R(p)[2q + 1] (p, q ≥ 0), the symmetric powers S^i(M), i < l (images of the averaging projector of the symmetric group on M^{⊗i}), sit in distinguished triangles R(ip)[2iq] → S^i(M) → S^{i−1}(M) → R(ip)[2iq + 1] and S^{i−1}(M)(p)[2q] → S^i(M) → R → S^{i−1}(M)(p)[2q + 1] (Voevodsky 2011 Lemma 3.1); for i = l − 1 their connecting maps define a natural operation φ_{l−1} : H^{2q+1,p}(−, R) → H^{2ql+2,pl}(−, R), extended to reduced cohomology of pointed smooth simplicial schemes. Then for every m ≥ 0 there is c ∈ (ℤ/l)^× such that φ_{l−1}(α) = c·βP^m(α) for every pointed smooth simplicial scheme 𝒴 and every α ∈ H̃^{2m+1,m}(𝒴, ℤ/l) (Theorem 3.8), where β is the Bockstein and P^m the reduced power operation of M.5b/motivic-steenrod-operations.

**Hypotheses and conventions.**

- k of characteristic 0 (the uniqueness Theorem 2.1 uses the Tate decomposition of motivic Eilenberg–MacLane spaces over such k).
- l prime; coefficients in which every prime other than l is invertible; symmetric powers only below l.

**Construction or proof.**

1. Lemma 3.1: slices commute with tensor powers ([9, Lemma 5.15]), so s_*(S^i(M)) = ⊕_{j≤i} R(jp)[2jq] for p > 0, and the two triangles are the slice triangles Π_{≥ip} and Π_{≥p} of S^i(M) ([9, Lemma 5.18]).
2. Proposition 3.4 and Corollaries 3.5-3.6: φ_{l−1}(cα) = c^l φ_{l−1}(α) = cφ_{l−1}(α) for c ∈ ℤ/l, and φ_{l−1} vanishes on simplicial suspensions σ_sα; βP^m has the same two properties (additivity of the Steenrod operations, and βP^m(σ_sα) = σ_sβα^l = 0 by M.5b/steenrod-relations).
3. Theorem 2.1 (uniqueness): two operations H̃^{2m+1,m}(−, ℤ/l) → H̃^{2ml+2,ml}(−, ℤ/l) with these two properties are proportional. It is checked on the motivic Eilenberg–MacLane spaces K_{2m}, K_{2m+1}: K_{2m} has a motive that is a direct sum of Tate motives over a field of characteristic 0 ([11, Theorem 3.74]), which gives the Künneth isomorphism (Lemma 2.3), and the scalar-weight bound of Lemma 2.4 leaves a space of dimension at most one.
4. Hence φ_{l−1} = c·βP^m with c ∈ ℤ/l; c ≠ 0 because βP^m ≠ 0 (reduced power operations, Corollary 11.5) and φ_{l−1} ≠ 0 (Lemma 3.7, computed for m = 0 on K(ℤ/l, 1), where S^{l−1} of the standard two-dimensional representation of ℤ/l is the regular representation).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5b/cech-simplicial-scheme](#m-5b-cech-simplicial-scheme), [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations), [MotivicEtaleKTheory:M.5b/steenrod-relations](#m-5b-steenrod-relations), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives)

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/RostMotive`, namespace `TauCeti.RostMotive`.

**Acceptance.**

- For m = 0 and α the generator of H^{1,0}(K(ℤ/l, 1), ℤ/l), φ_{l−1}(α) is the class of the extension 0 → ℤ/l → ℤ/l[ℤ/l] → ℤ/l[ℤ/l] → ℤ/l → 0, which is a nonzero multiple of β(α).

**Sources.**

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 3.8, PDF p. 19. φ_{l−1}(α) = cβP^n(α); the node writes m for the source n.

[Voevodsky2011](https://arxiv.org/pdf/0805.4430v2), Theorem 2.1, PDF p. 4; Lemma 2.3, PDF p. 5. The uniqueness theorem rests on the Tate decomposition of motivic Eilenberg–MacLane spaces (characteristic 0).

<a id="m-5c-hilbert-ninety-implies-beilinson-lichtenbaum"></a>

### M.5c/hilbert-ninety-implies-beilinson-lichtenbaum — Hilbert 90 for K^M implies Beilinson–Lichtenbaum (Voevodsky, Z/2-coefficients paper §§5–6)

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum`. Implementation: unchecked.

Let k be a field, l a prime different from char k, and w ≥ 0. Write H^{p,q}_L(𝒳, A) = H^p_et(𝒳, A ⊗ ℤ(q)) for Lichtenbaum motivic cohomology (so H^{p,q}_L(𝒳, ℤ/l^ν) ≅ H^p_et(𝒳, μ_{l^ν}^{⊗q}), M.5a/etale-motivic-comparison), π : (Sm/k)_et → (Sm/k)_Nis, L(q) = τ_{≤q+1}Rπ_*π^*ℤ(q) and K(q) the cone of ℤ(q) → L(q) (MCZ2 (20)). Say that H90(q, l) holds over k if H^{q+1}_L(F, ℤ_(l)(q)) = 0 for every field extension F of k (equivalently, by passage to filtered colimits, for every F finitely generated over k). (a) If H90(q, l) holds over k for every q ≤ w, then K(w) ⊗ ℤ_(l) ≃ 0 (Theorem 6.6); for every smooth simplicial scheme 𝒳 over k the maps H^{p,q}(𝒳, ℤ_(l)) → H^{p,q}_L(𝒳, ℤ_(l)) are isomorphisms for p ≤ q + 1 and monomorphisms for p = q + 2, and H^{p,q}(𝒳, ℤ/l^ν) → H^{p,q}_L(𝒳, ℤ/l^ν) are isomorphisms for p ≤ q and monomorphisms for p = q + 1, whenever q ≤ w (Corollary 6.9). (b) Under the same hypothesis, for every field F over k and q ≤ w the norm residue map h^q_F : K^M_q(F)/l → H^q(F, μ_l^{⊗q}) of galois-symbol-all-degrees is bijective (Corollary 6.10), and for every cyclic extension E/F of degree l with generator σ the sequence K^M_q(E) →(1 − σ) K^M_q(E) →N_{E/F} K^M_q(F) is exact (Lemma 6.11). (c) If H90(q, l) holds over k for q ≤ w − 1, X is smooth over k and U ⊂ X is dense open, then H^*(X, K(w) ⊗ ℤ_(l)) → H^*(U, K(w) ⊗ ℤ_(l)) is an isomorphism (Lemmas 6.12-6.13). (d) If H90(q, l) holds over k for q ≤ w − 1 and F is a field over k with no extensions of degree prime to l and K^M_w(F) = l·K^M_w(F), then H^w_et(F, ℤ/l) = 0 (Theorem 5.9) and H^{w+1}_L(F, ℤ_(l)(w)) = 0.

**Hypotheses and conventions.**

- k a field; l a prime with l ≠ char k; w ≥ 0.
- In the norm residue induction (hilbert-ninety-induction) k has characteristic 0; part (c) uses the Gysin triangle, which MotivesAndAlgebraicCycles MC.4 supplies over fields with resolution of singularities.

**Construction or proof.**

1. (a) Theorem 6.6: Rπ_*π^*(A ⊗ ℤ(q)) has homotopy invariant cohomology sheaves with transfers (Lemma 6.7: rationally H_L = H by Lemma 6.8, and with ℚ/ℤ_(l) coefficients H_L is étale cohomology); H^{w+1}(K(w) ⊗ ℤ_(l)) is such a sheaf vanishing on fields by H90(w, l), hence zero (M.5a/homotopy-invariant-sheaves); for p ≤ w the comparison with ℚ/ℤ_(l) coefficients is surjective on fields and then an isomorphism by the Geisser–Levine argument comparing higher Chow groups and étale cohomology (M.5a/cycle-complex-transfers). Corollary 6.9 follows by hypercohomology on simplicial schemes and the universal coefficient sequences.
2. (b) Corollary 6.10 is (a) for 𝒳 = Spec F, p = q, with H^{q,q}(F, ℤ/l) ≅ K^M_q(F)/l and the identification of h^q_F with the motivic-to-étale map (galois-symbol-all-degrees (v)). Lemma 6.11: the complex 0 → ℤ_tr(F) → ℤ_tr(E) →(1−σ) ℤ_tr(E) → ℤ_tr(F) → 0 is exact in the étale topology, so Hom into ℤ_(l)(q)[q + 2] vanishes by (a), and the spectral sequence for maps out of this complex gives exactness, using H^{p,q}(E) = K^M_q(E) for p = q and 0 for p > q.
3. (c) Lemma 6.12: by cancellation (M.5a/cancellation, the suspension theorem) and H90(w − 1, l), H^*(−, K(w) ⊗ ℤ_(l))_{−1} = 0. Lemma 6.13: reduce to perfect k (M.5a/imperfect-field-passage) and to U = X − Z with Z smooth; the Gysin (homotopy purity) triangle reduces to the vanishing of H^*(Z_+ ∧ T^c, K(w) ⊗ ℤ_(l)) for c > 0, which is Lemma 6.12.
4. (d) Theorem 5.9 (Lemmas 5.3-5.8 and Proposition 5.2, from the norm residue isomorphism and Hilbert 90 of (b) in degrees ≤ w − 1, the projection formula and the generation of K^M(E) by symbols with one entry from E, K2SymbolsBrauer T.4) gives H^w_et(F, ℤ/l) = 0, F containing μ_l; then H^{w,w}_L(F, ℤ/l) = 0, so H^{w+1}_L(F, ℤ_(l)(w)) has no l-torsion, and it is torsion because it vanishes rationally (Lemma 6.8); being a ℤ_(l)-module it is zero (MCZ2, proof of Theorem 7.4).

**Direct prerequisites.** [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/homotopy-invariant-sheaves](#m-5a-homotopy-invariant-sheaves), [MotivicEtaleKTheory:M.5a/effective-motives](#m-5a-effective-motives), [MotivicEtaleKTheory:M.5a/cancellation](#m-5a-cancellation), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/imperfect-field-passage](#m-5a-imperfect-field-passage), [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), `MotivesAndAlgebraicCycles:MC.4/gysin-triangle`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/p-closed-generation`, `K2SymbolsBrauer:T.4/prime-to-p-closure`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`

**Proposed library location.** `TauCeti/AlgebraicGeometry/Motives/BeilinsonLichtenbaum`, namespace `TauCeti.NormResidue`.

**Acceptance.**

- For w = 1, H90(1, l) is Hilbert 90 (H²_L(F, ℤ(1)) = H¹_et(F, 𝔾_m) = 0), and (b) gives the Kummer isomorphism F^×/l ≅ H¹(F, μ_l) and exactness of E^× →(1−σ) E^× →N F^× (classical Hilbert 90).

**Sources.**

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §6, Theorem 6.6, printed p. 90 (PDF p. 32). Beilinson–Lichtenbaum in weight w from Hilbert 90 in weight w.

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §6, Corollaries 6.9-6.10, printed p. 91 (PDF p. 33). The norm residue isomorphism in weights ≤ w (Corollary 6.10).

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §6, Lemma 6.13, printed p. 94 (PDF p. 36). Part (c).

[Voevodsky2003MCZ2](http://www.numdam.org/item/10.1007/s10240-003-0010-6.pdf), §5, Theorem 5.9, printed p. 88 (PDF p. 30). Part (d), with the computation finishing the proof of Theorem 7.4 on p. 97.

### Remaining work for M.5c

- Lemma-level split of rost-motive and hilbert-ninety-induction along Voevodsky 2011 Lemmas 5.7-5.15 and 6.4-6.15.
- Read Voevodsky, 'Motivic Eilenberg–MacLane spaces' (2010) §3 and 'Simplicial radditive functors' (2010) and plan the inputs of symmetric-power-operation (Theorem 2.1, Lemma 2.3).
- Read Geisser–Levine (2001) and plan the resolution-free comparison step of hilbert-ninety-implies-beilinson-lichtenbaum.

<a id="m-5d"></a>

## M.5d — Prime powers, differential symbols and field reductions

Absolute logarithmic differential symbols and BGK, logarithmic Witt coefficients, compatible prime-power induction and finite-symbol field reductions. The characteristic-p and prime-to-p branches stay separate.

**Planets:** Logarithmic differential, Milnor differential symbol, Bloch–Gabber–Kato theorem, Witt logarithmic symbol, Prime-power differential comparison, Prime-power norm-residue theorem.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5c/mod-l-norm-residue](#m-5c-mod-l-norm-residue)

<a id="m-5d-logarithmic-one-form"></a>

### M.5d/logarithmic-one-form — Logarithmic one-form

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/logarithmic-one-form`. Implementation: unchecked.

Define logOne:F× (written additively)→Ω_(F/Z) by a↦a⁻¹ da. Its map structure encodes dlog(ab)=dlog(a)+dlog(b); zero is excluded by the unit domain.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. Use the existing universal derivation D, not a new differential-module carrier.
2. Apply Derivation.leibniz and commute field scalars: (ab)⁻¹(a db+b da)=b⁻¹ db+a⁻¹ da.
3. Derive the identity, inverse and natural-power formulas from this additive homomorphism.

**Direct prerequisites.** `mathlib:KaehlerDifferential.D`, `mathlib:Derivation.leibniz`, `mathlib:Derivation.map_one_eq_zero`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.logOne_apply** (simp): For a∈F×, logOne(a)=a⁻¹ da.
- **TauCeti.DifferentialSymbol.logOne_mul** (relation): For units a,b, logOne(ab)=logOne(a)+logOne(b).
- **TauCeti.DifferentialSymbol.logOne_inv** (simp): For a unit a, logOne(a⁻¹)=−logOne(a).
- **TauCeti.DifferentialSymbol.logOne_pow** (simp): For a unit a and m≥0, logOne(a^m)=m logOne(a).

**Discriminating tests.**

- **logOne_test_one** (degenerate): logOne(1)=0.
- **logOne_test_nonzero** (non-example): If da≠0 for a unit a, then logOne(a)≠0; the zero homomorphism fails this test.
- **logOne_test_inverse** (compatibility): logOne(a⁻¹)+logOne(a)=0 for every unit a.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-logarithmic-one-form-natural"></a>

### M.5d/logarithmic-one-form-natural — Naturality of the logarithmic differential

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural`. Implementation: unchecked.

For a Z-algebra homomorphism f:F→E between fields and a∈F×, the existing semilinear Kaehler map sends logOne(a) to logOne(fa).

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. Expand the evaluation formula for logOne.
2. Apply mapSemilinear_smul and mapSemilinear_D, and f(a⁻¹)=f(a)⁻¹.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form), `tauceti:KaehlerDifferential.mapSemilinear`, `tauceti:KaehlerDifferential.mapSemilinear_D`, `tauceti:KaehlerDifferential.mapSemilinear_smul`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- Taking f to be the identity recovers logOne(a).
- The scalar moves through f; no F-linearity is asserted for an arbitrary field homomorphism.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-tensor-differential-symbol"></a>

### M.5d/tensor-differential-symbol — Tensor differential symbol

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/tensor-differential-symbol`. Implementation: unchecked.

For n≥0, tensorSymbol is the Z-linear map (F×)^(⊗n)→Ω_F^n sending the pure tensor (a₁,…,a_n) to dlog(a₁)∧…∧dlog(a_n). Empty wedge means 1∈F under the existing degree-zero exterior equivalence.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. Compose each input with logOne, and then apply the existing alternating map into the exterior power.
2. Restrict its multilinearity to Z, using logOne as a homomorphism of additive groups.
3. Apply PiTensorProduct.lift. Its uniqueness supplies the extensionality rule.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form), `mathlib:PiTensorProduct.lift`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.zeroEquiv`, `mathlib:exteriorPower.oneEquiv`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.tensorSymbol_pure** (simp): Evaluate a pure tensor as the wedge of its logarithmic differentials.
- **TauCeti.DifferentialSymbol.tensorSymbol_unique** (universal-property): Any Z-linear map with the same values on every pure tensor equals tensorSymbol.
- **TauCeti.DifferentialSymbol.tensorSymbol_update_mul** (relation): Replacing the ith unit by bc gives the sum of the values with b and c in that position.

**Discriminating tests.**

- **tensorSymbol_test_zero** (degenerate): In degree zero the empty tensor maps to 1, not 0.
- **tensorSymbol_test_one** (compatibility): Under exteriorPower.oneEquiv the degree-one value is logOne(a).
- **tensorSymbol_test_repeated** (computation): In degree two the tensor (a,a) maps to zero, in every characteristic.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-steinberg-vanishing"></a>

### M.5d/steinberg-vanishing — Vanishing on Steinberg tensors

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/steinberg-vanishing`. Implementation: unchecked.

If i≠j and a_i+a_j=1 in F for a tuple of units, tensorSymbol(a₁⊗…⊗a_n)=0. This includes characteristic two.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. From D(1)=0 and additivity derive da_j=−da_i.
2. Write the two logarithmic entries as the field scalars a_i⁻¹ and −a_j⁻¹ multiplying the same differential da_i.
3. Pull both scalars out of the alternating map; apply AlternatingMap.map_eq_zero_of_eq. No division by 2 is used.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/tensor-differential-symbol](#m-5d-tensor-differential-symbol), [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form), `mathlib:Derivation.map_one_eq_zero`, `mathlib:AlternatingMap.map_eq_zero_of_eq`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- For n=2 the pair (a,1−a), a≠0,1, has zero image.
- Consecutive positions suffice for the imported presentation; arbitrary distinct positions also vanish in forms.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-milnor-differential-symbol"></a>

### M.5d/milnor-differential-symbol — Differential symbol on Milnor K-theory

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/milnor-differential-symbol`. Implementation: unchecked.

There is a unique additive differentialSymbol:K_n^M(F)→Ω_F^n taking {a₁,…,a_n} to the wedge of dlog(a_i). The source is the existing T.2 tensor/Steinberg presentation, not an exterior algebra on F×.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. Use tensorSymbol and steinberg-vanishing on the consecutive Steinberg generators of the T.2 relation module.
2. Linearity kills their Z-span; use Submodule.liftQ to descend.
3. Uniqueness on generators follows from the tensor universal property and surjectivity of the quotient map.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/tensor-differential-symbol](#m-5d-tensor-differential-symbol), [MotivicEtaleKTheory:M.5d/steinberg-vanishing](#m-5d-steinberg-vanishing), `mathlib:Submodule.liftQ`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.differentialSymbol_symbol** (simp): The value of {a₁,…,a_n} is dlog(a₁)∧…∧dlog(a_n).
- **TauCeti.DifferentialSymbol.differentialSymbol_quotient** (compatibility): Composing with the tensor quotient projection is tensorSymbol.
- **TauCeti.DifferentialSymbol.differentialSymbol_unique** (extensionality): An additive map from K_n^M(F) with these values on all symbols equals differentialSymbol.

**Discriminating tests.**

- **differentialSymbol_test_zero** (degenerate): The empty Milnor symbol maps to 1∈Ω_F^0=F.
- **differentialSymbol_test_one** (compatibility): Under Ω_F^1≃Ω_(F/Z), {a} maps to a⁻¹ da.
- **differentialSymbol_test_repeated** (non-example): The image of {a,a} is zero. This imposes no assertion that the integral Milnor symbol itself is zero.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-milnor-symbol-natural"></a>

### M.5d/milnor-symbol-natural — Naturality of the Milnor differential symbol

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/milnor-symbol-natural`. Implementation: unchecked.

For every field homomorphism f:F→E, dlog_E∘K_n^M(f)=Ω^n(f)∘dlog_F as additive homomorphisms; Ω^n(f) is semilinear over f.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. Check the formula on every symbol using logarithmic-one-form-natural and the imported DD.2 pullback on pure wedges.
2. Use the symbol generators in the imported T.2 presentation to extend equality to the entire additive group.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/milnor-differential-symbol](#m-5d-milnor-differential-symbol), [MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural](#m-5d-logarithmic-one-form-natural), `DerivedDeRhamCohomology:DD.2/forms-pullback`, `DerivedDeRhamCohomology:DD.2/pullback-differential`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- Identity and composite field maps agree with the imported functor laws.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-milnor-symbol-product"></a>

### M.5d/milnor-symbol-product — Products of differential symbols

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/milnor-symbol-product`. Implementation: unchecked.

For x∈K_i^M(F) and y∈K_j^M(F), dlog(xy)=dlog(x)∧dlog(y) in Ω_F^(i+j), with x placed before y.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.

**Construction or proof.**

1. On symbols the T.2 product concatenates the ordered lists.
2. The DD.2 exterior product concatenates the corresponding pure wedges.
3. Extend by additivity in each variable; the empty list agrees with the multiplicative identity.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/milnor-differential-symbol](#m-5d-milnor-differential-symbol), `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `DerivedDeRhamCohomology:DD.2/differential-graded-leibniz`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- Degree-zero multiplication is integer scalar multiplication on forms.
- In degree (1,1) the value is da/a∧db/b with that order.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-characteristic-annihilation"></a>

### M.5d/characteristic-annihilation — Characteristic annihilates absolute forms

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/characteristic-annihilation`. Implementation: unchecked.

For every n≥0 and every ω∈Ω_F^n in characteristic p, pω=0.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. The exterior power is an F-module.
2. Identify p-fold addition with multiplication by (p:F)=0. This is a scalar calculation and does not use BGK.

**Direct prerequisites.** `mathlib:exteriorPower.ιMulti`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- In degree zero this is p·a=0 in F.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 opening definition of k_q(F) and differential symbol, printed p.113 (PDF p.8). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-mod-p-differential-symbol"></a>

### M.5d/mod-p-differential-symbol — Differential symbol modulo p

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/mod-p-differential-symbol`. Implementation: unchecked.

Write k_n(F)=K_n^M(F)/pK_n^M(F), the additive quotient by the range of multiplication by p. Define modPSymbol:k_n(F)→Ω_F^n as the unique map whose composite with reduction is differentialSymbol.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. For x∈K_n^M(F), additivity gives dlog(px)=p dlog(x)=0 by characteristic-annihilation.
2. Apply the existing additive quotient lift.
3. Surjectivity of reduction gives uniqueness; the pure-symbol formula is inherited.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/milnor-differential-symbol](#m-5d-milnor-differential-symbol), [MotivicEtaleKTheory:M.5d/characteristic-annihilation](#m-5d-characteristic-annihilation), `mathlib:QuotientGroup.lift`, `mathlib:QuotientGroup.mk'`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.modPSymbol_reduce** (compatibility): modPSymbol([x])=differentialSymbol(x).
- **TauCeti.DifferentialSymbol.modPSymbol_unique** (universal-property): An additive map k_n(F)→Ω_F^n whose composite with reduction is dlog equals modPSymbol.
- **TauCeti.DifferentialSymbol.modPSymbol_symbol** (simp): The class of {a₁,…,a_n} maps to the wedge of the logarithmic differentials.

**Discriminating tests.**

- **modPSymbol_test_zero** (degenerate): The class of the empty symbol maps to 1, even in characteristic p.
- **modPSymbol_test_p_multiple** (computation): For any x the class of px maps to zero.
- **modPSymbol_test_one** (compatibility): The class of {a} maps to a⁻¹ da under the degree-one exterior equivalence.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 opening display, printed p.113 (PDF p.8). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-artin-schreier-differential"></a>

### M.5d/artin-schreier-differential — Artin–Schreier differential operator

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/artin-schreier-differential`. Implementation: unchecked.

Let B_F^0=0 and B_F^n=dΩ_F^(n−1) for n>0 as ADDITIVE subgroups. Import the ordinary de Rham differential and inverse Cartier C⁻¹:Ω_F^n→Ω_F^n/B_F^n. Define the additive homomorphism wp=C⁻¹−projection. Its logarithmic coefficient formula is the next lemma. In general wp is not F-linear.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Use the actual exterior-power carriers and DD.2 differential and additive quotient.
2. Use the DD.3 Frobenius-semilinear inverse Cartier, with its value on logarithmic wedges.
3. Subtract the additive quotient projection. The sign is opposite to BK’s 1−C⁻¹ and has exactly the same kernel.

**Direct prerequisites.** `DerivedDeRhamCohomology:DD.3`, [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form), `mathlib:QuotientGroup.lift`, `mathlib:QuotientGroup.mk'`, `DerivedDeRhamCohomology:DD.2/ordinary-differential`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.artinSchreier_apply** (data): wp(ω)=C⁻¹(ω)−[ω].
- **TauCeti.DifferentialSymbol.artinSchreier_logarithmic** (simp): For x∈F and units a_i, wp(x∧_i dlog(a_i))=[(x^p−x)∧_i dlog(a_i)].
- **TauCeti.DifferentialSymbol.artinSchreier_add** (structure): wp(ω+η)=wp(ω)+wp(η).

**Discriminating tests.**

- **artinSchreier_test_zero** (degenerate): In degree zero wp(0)=0.
- **artinSchreier_test_unit** (computation): In degree zero wp(1)=0.
- **artinSchreier_test_not_zero_map** (non-example): If x^p≠x in F then wp(x)≠0 in degree zero, since B_F^0=0.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition III.7.7.1, printed p.251 (PDF p.259). The coefficient formula defines the same kernel as BK; the ordinary differential and Cartier theory stay with DD.2/DD.3.

<a id="m-5d-artin-schreier-logarithmic-formula"></a>

### M.5d/artin-schreier-logarithmic-formula — Artin–Schreier operator on logarithmic wedges

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula`. Implementation: unchecked.

For p prime, F of characteristic p, n≥0, x∈F and units a₁,…,a_n, wp(x dlog(a₁)∧…∧dlog(a_n)) is the class of (x^p−x)dlog(a₁)∧…∧dlog(a_n) in Ω_F^n/B_F^n. For n=0 the wedge is 1 and B_F^0=0.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Apply the requested DD.3 inverse Cartier formula on logarithmic wedges, including its Frobenius action on the scalar.
2. Subtract the ordinary quotient projection and use additivity. This does not require exact forms to be an F-subspace: each form is scaled before taking its additive quotient class.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/artin-schreier-differential](#m-5d-artin-schreier-differential), `DerivedDeRhamCohomology:DD.3`, [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form)

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- For coefficient 1 the result is zero.
- Degree zero recovers x^p−x, so a non-Frobenius-fixed x detects the sign and nonzero operator.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition III.7.7.1, printed p.251 (PDF p.259). The coefficient formula defines the same kernel as BK; the ordinary differential and Cartier theory stay with DD.2/DD.3.

<a id="m-5d-logarithmic-differential-group"></a>

### M.5d/logarithmic-differential-group — Logarithmic differential forms

**Definition.** Identifier: `MotivicEtaleKTheory:M.5d/logarithmic-differential-group`. Implementation: unchecked.

Define ν_n(F)=ker(wp:Ω_F^n→Ω_F^n/B_F^n) as an additive subgroup of Ω_F^n. Its elements satisfy C⁻¹ω=[ω]. The field-map action is the restriction of DD.2 pullback; it preserves the kernel by naturality of inverse Cartier. No F-module structure on ν_n is asserted.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Take the existing AddMonoidHom kernel of artinSchreier.
2. Use DD.2 pullback on forms and DD.3 Cartier naturality to restrict pullback to this subgroup.
3. Prove equality in the subgroup by equality of underlying forms; pullback identity and composition follow from DD.2.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/artin-schreier-differential](#m-5d-artin-schreier-differential), `DerivedDeRhamCohomology:DD.3`, `mathlib:MonoidHom.ker`, `DerivedDeRhamCohomology:DD.2/ordinary-differential`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.logarithmicForms_mem** (characterisation): ω lies in ν_n(F) exactly when C⁻¹ω=[ω].
- **TauCeti.DifferentialSymbol.logarithmicFormsMap** (functoriality): For a field map f:F→E of characteristic p, restrict Ω^n(f) to an additive map ν_n(F)→ν_n(E).
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_coe** (coercion): The underlying form of the image is Ω^n(f)(ω).
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_id** (functoriality): The identity field map induces the identity on ν_n.
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_comp** (functoriality): The map on ν_n for g∘f is the composite of those for f and g.

**Discriminating tests.**

- **logarithmicForms_test_zero** (degenerate): The zero form belongs to ν_n(F) in every degree.
- **logarithmicForms_test_degree_zero** (characterisation): Under Ω_F^0=F, x∈ν_0(F) if and only if x^p=x.
- **logarithmicForms_test_not_F_submodule** (non-example): If x^p≠x, the scalar multiple x·1 does not belong to ν_0(F), though 1 does.

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 definition of ν, printed p.113 (PDF p.8). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-differential-symbol-fixed"></a>

### M.5d/differential-symbol-fixed — Differential symbols are Cartier fixed

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/differential-symbol-fixed`. Implementation: unchecked.

For every x∈K_n^M(F), differentialSymbol(x) belongs to ν_n(F).

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. For a symbol, apply the wp coefficient formula with coefficient 1: 1^p−1=0.
2. Extend over the additive symbol presentation; wp and dlog are additive.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/milnor-differential-symbol](#m-5d-milnor-differential-symbol), [MotivicEtaleKTheory:M.5d/artin-schreier-differential](#m-5d-artin-schreier-differential), [MotivicEtaleKTheory:M.5d/logarithmic-differential-group](#m-5d-logarithmic-differential-group), [MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula](#m-5d-artin-schreier-logarithmic-formula)

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- The empty symbol is Cartier fixed.
- This proves membership, not injectivity or surjectivity.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 symbol ψ with codomain ν, printed p.113 (PDF p.8). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-logarithmic-symbol"></a>

### M.5d/logarithmic-symbol — Logarithmic symbol modulo p

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/logarithmic-symbol`. Implementation: unchecked.

Define logarithmicSymbol:k_n(F)→ν_n(F) by corestricting modPSymbol to the Cartier kernel. Its underlying form is the wedge of logarithmic differentials on each symbol. This construction makes no assertion yet that it is an isomorphism.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Choose a lift of a class along reduction only for proving membership, not for defining a different output.
2. Use modPSymbol_reduce and differential-symbol-fixed to show that the already-defined modPSymbol lands in the subgroup.
3. Corestrict the additive map; injectivity of subgroup inclusion gives uniqueness.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/mod-p-differential-symbol](#m-5d-mod-p-differential-symbol), [MotivicEtaleKTheory:M.5d/differential-symbol-fixed](#m-5d-differential-symbol-fixed), [MotivicEtaleKTheory:M.5d/logarithmic-differential-group](#m-5d-logarithmic-differential-group)

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Planning API.**

- **TauCeti.DifferentialSymbol.logarithmicSymbol_coe** (coercion): The underlying differential form of logarithmicSymbol(x) is modPSymbol(x).
- **TauCeti.DifferentialSymbol.logarithmicSymbol_unique** (universal-property): Any additive map k_n(F)→ν_n(F) with this underlying form equals logarithmicSymbol.
- **TauCeti.DifferentialSymbol.logarithmicSymbol_symbol** (simp): The underlying form of the class of {a₁,…,a_n} is ∧_i dlog(a_i).

**Discriminating tests.**

- **logarithmicSymbol_test_zero** (degenerate): The class of the empty symbol maps to the element with underlying form 1∈F.
- **logarithmicSymbol_test_one** (compatibility): The class of {a} has underlying one-form a⁻¹ da.
- **logarithmicSymbol_test_repeated** (computation): The class of {a,a} has zero image in ν_2(F).

**Consumers.**

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

**Acceptance.**

- The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 definition of ψ preceding Theorem 2.1, printed p.113 (PDF p.8). The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

<a id="m-5d-weight-zero-comparison"></a>

### M.5d/weight-zero-comparison — Degree-zero differential comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/weight-zero-comparison`. Implementation: unchecked.

For every field F of characteristic p, logarithmicSymbol:k_0(F)→ν_0(F) is bijective; under k_0(F)=Z/p and ν_0(F)=F_p it is the identity on the prime field.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Use T.2 degree zero K_0^M(F)=Z and Int.range_nsmulAddMonoidHom to identify the reduction quotient with Z/p via Int.quotientZMultiplesNatEquivZMod.
2. Use exteriorPower.zeroEquiv and B_F^0=0 to identify the Cartier kernel with {x∈F:x^p=x}.
3. Use Subfield.mem_bot_iff_pow_eq_self to identify this set with the prime subfield; the empty-symbol formula sends 1 to 1. Its additive multiples exhaust that subfield.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/logarithmic-symbol](#m-5d-logarithmic-symbol), [MotivicEtaleKTheory:M.5d/artin-schreier-differential](#m-5d-artin-schreier-differential), `mathlib:exteriorPower.zeroEquiv`, `mathlib:Int.range_nsmulAddMonoidHom`, `mathlib:Int.quotientZMultiplesNatEquivZMod`, `mathlib:Subfield.mem_bot_iff_pow_eq_self`, [MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula](#m-5d-artin-schreier-logarithmic-formula), `mathlib:mem_bot_iff_intCast`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- For F=F_p the map is the identity Z/p→F_p.
- For F=F_p(t), the target is F_p, not all of F.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.7.2, n=0 specialization, printed p.251 (PDF p.259). An elementary base case of the theorem, proved here without invoking the general BGK theorem.

<a id="m-5d-perfect-field-differentials"></a>

### M.5d/perfect-field-differentials — Positive-degree forms over a perfect field

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/perfect-field-differentials`. Implementation: unchecked.

Assume the pth-power map on F is surjective. For every n>0, Ω_F^n=0.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. For each a∈F choose b with a=b^p. Derivation.leibniz_pow and characteristic p give da=0.
2. KaehlerDifferential.span_range_derivation shows Ω_(F/Z)=0.
3. Pure wedges span Ω_F^n; when n>0 every pure wedge has a zero slot, so all vanish.

**Direct prerequisites.** `mathlib:Derivation.leibniz_pow`, `mathlib:KaehlerDifferential.span_range_derivation`, `mathlib:exteriorPower.ιMulti_span`, [MotivicEtaleKTheory:M.5d/characteristic-annihilation](#m-5d-characteristic-annihilation), `mathlib:AlternatingMap.map_coord_zero`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- Applies to finite fields and algebraic closures of F_p.
- The hypothesis n>0 is necessary: Ω_F^0=F.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.2.1 base field, printed p.114 (PDF p.9). Elementary perfect-field base calculation used before the pure-transcendental induction.

<a id="m-5d-perfect-field-milnor-mod-p"></a>

### M.5d/perfect-field-milnor-mod-p — Milnor groups modulo p over a perfect field

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/perfect-field-milnor-mod-p`. Implementation: unchecked.

If the pth-power map on F is surjective, then k_n(F)=0 for every n>0, independently of BGK.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Every Milnor group is generated additively by symbols from T.2.
2. For a symbol in positive degree, choose a pth root b of its first unit entry; b is nonzero.
3. Multilinearity gives {b^p,a₂,…,a_n}=p{b,a₂,…,a_n}; reduction kills it.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `mathlib:QuotientGroup.mk'`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- For F=F_p and n=1 this says F_p×/(F_p×)^p=0.
- The conclusion excludes n=0, where k_0(F)=Z/p.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.2.1 base field, printed p.114 (PDF p.9). The elementary Milnor-side calculation needed for the perfect-field base case.

<a id="m-5d-weight-one-injectivity"></a>

### M.5d/weight-one-injectivity — Injectivity of the degree-one differential symbol

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/weight-one-injectivity`. Implementation: unchecked.

For every field F of characteristic p, logarithmicSymbol:k_1(F)→ν_1(F) is injective.

**Hypotheses and conventions.**

- F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z).
- All symbol entries are units; degree n is a nonnegative integer.
- p is prime and F has characteristic p.

**Construction or proof.**

1. Use the T.2 degree-one identification with F× to represent each class by a unit a.
2. If its image is zero, the logOne formula and invertibility of a give da=0.
3. Use the requested DD.3 degree-zero Cartier calculation ker(D:F→Ω_(F/Z))=F^p. Write a=b^p with b nonzero.
4. The unit class of b^p is p times that of b and is zero in k_1(F). This proves a trivial kernel, hence injectivity.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, [MotivicEtaleKTheory:M.5d/logarithmic-symbol](#m-5d-logarithmic-symbol), [MotivicEtaleKTheory:M.5d/logarithmic-one-form](#m-5d-logarithmic-one-form), `DerivedDeRhamCohomology:DD.3`, `mathlib:exteriorPower.oneEquiv`

**Proposed library location.** `TauCeti/Algebra/KTheory/DifferentialSymbol`, namespace `TauCeti.DifferentialSymbol`.

**Acceptance.**

- The exact kernel of a↦da/a is (F×)^p.
- For a perfect field both the source and positive-degree target vanish.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.7.2, degree-one injectivity specialization, printed p.251 (PDF p.259). The elementary injectivity step isolated from full BGK; the nontrivial Cartier input is an explicit supplier request.

<a id="m-5d-bloch-gabber-kato"></a>

### M.5d/bloch-gabber-kato — Bloch–Gabber–Kato theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/bloch-gabber-kato`. Implementation: unchecked.

For every field F of characteristic p>0 and q≥0, dlog:K^M_q(F)/p → ν_q(F)=ker(C⁻¹−1:Ω_F^q→Ω_F^q/dΩ_F^(q−1)) is an isomorphism of abelian groups, natural for field embeddings and compatible with products. The target is an additive group, not an F-vector space.

**Hypotheses and conventions.**

- p prime; F arbitrary, including imperfect fields; exact forms in degree zero are zero.

**Construction or proof.**

1. Injectivity: BK Lemma 2.2 gives the differential-residue injection; use the split Bass–Tate sequence over perfect rational fields, then realize a finitely generated F as the residue of a DVR with rational fraction field and the relative diagram (2.3.1).
2. Surjectivity: BK Proposition 2.4 uses the relative group k_q(R)=ker(all residues), its unit-symbol presentation/specialization, prime-to-p norm/trace descent, and an adapted p-basis. Lemma 2.5 and (2.6) perform finite lexicographic elimination. The Kato 1982 §1 input is recorded as an unread proof gap.
3. Pass to arbitrary fields by filtered colimits, using finite presentations of symbols/forms and finite étale descent of logarithmic sections. None of M.5a–M.5c is used.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/logarithmic-symbol](#m-5d-logarithmic-symbol), [MotivicEtaleKTheory:M.5d/weight-zero-comparison](#m-5d-weight-zero-comparison), [MotivicEtaleKTheory:M.5d/weight-one-injectivity](#m-5d-weight-one-injectivity), `K2SymbolsBrauer:T.3/higher-milnor-residues`, `K2SymbolsBrauer:T.4/bass-tate-sequence`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `DerivedDeRhamCohomology:DD.3`, [MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons](#m-5d-filtered-colimit-comparisons)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2, Theorem 2.1, Lemma 2.2, diagram (2.3.1), Proposition 2.4 and Lemma 2.5, printed pp.113–118. Characteristic-p field differential comparison, independent of motivic norm varieties.

<a id="m-5d-witt-logarithmic-symbol"></a>

### M.5d/witt-logarithmic-symbol — Witt logarithmic symbol

**Construction.** Identifier: `MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol`. Implementation: unchecked.

For r≥1 and q≥0 define h_r:K^M_q(F)/p^r→H⁰_et(Spec F,W_rΩ^q_log) by {a₁,…,a_q}↦dlog[a₁]∧…∧dlog[a_q], where [a] is the Teichmüller unit. Degree zero sends 1 to 1∈Z/p^r. The target is the genuine étale logarithmic Witt sheaf group supplied by CR.4, independently of the image of h_r.

**Hypotheses and conventions.**

- F characteristic p, p prime; W_r is p-typical; r≥1; additive Z-module target.

**Construction or proof.**

1. Import de Rham–Witt forms, Teichmüller lifts and the logarithmic sheaf. Multilinearity and Steinberg vanishing descend the symbol; p^r annihilation gives the quotient factor.
2. CR.4 supplies j:W₁Ω_log^q→W_rΩ_log^q with j(dlog₁ a)=p^(r−1)dlog_r a and restriction R:W_r→W_(r−1). Global sections are left/middle exact; surjectivity of R on global sections is proved only using BGK induction.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `CrystallineCohomology:CR.4`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.wittSymbol_symbol** (simp): h_r of a pure Milnor symbol is the displayed wedge of Teichmüller logarithms.
- **TauCeti.MotivicEtale.wittSymbol_restrict** (compatibility): For r≥2, R∘h_r=h_(r−1)∘ρ, with ρ coefficient reduction.
- **TauCeti.MotivicEtale.wittSymbol_insert** (compatibility): For r≥2, h_r∘i=j∘h₁, where i([a])=[p^(r−1)a].

**Discriminating tests.**

- **wittSymbol_test_zero** (computation): At q=0, h_r is the canonical Z/p^r identity.
- **wittSymbol_test_perfect** (degenerate): For perfect F and q>0 the source and logarithmic target vanish.
- **wittSymbol_test_teichmuller** (non-example): In W₂(F₃)=Z/9, [2]+[2]=7 whereas [1]=1; replacing Teichmüller lifts by an additive map is invalid.

**Consumers.**

- BK Corollary 2.8: Inducts logarithmic comparison from p to p^r.
- HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Supplies the residue-characteristic prime-power symbol.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8, printed pp.117–118. Characteristic-p field differential comparison, independent of motivic norm varieties.

[Illusie1979](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), I §5.7, pp.596–598, Corollary 5.7.5. Defines the étale logarithmic Witt sheaf and supplies its p-power quotient statement; passage to arbitrary fields requires the CR.4 colimit interface.

<a id="m-5d-milnor-coefficient-row"></a>

### M.5d/milnor-coefficient-row — Milnor coefficient row

**Lemma.** Identifier: `MotivicEtaleKTheory:M.5d/milnor-coefficient-row`. Implementation: unchecked.

For every abelian group A and r≥2, C_r=A/p^rA has the right-exact row C₁ --i→ C_r --ρ→ C_(r−1)→0, i([a])=[p^(r−1)a], ρ reduction. ker i=(A[p^(r−1)]+pA)/pA. The Tor map A[p^r]→A[p^(r−1)] induced by reduction is multiplication by p.

**Hypotheses and conventions.**

- A arbitrary abelian group; p prime; r≥2.

**Construction or proof.**

1. Use the two-term free resolutions of Z/p^r and Z/p^(r−1); reduction is identity in chain degree zero and multiplication by p in degree one.
2. Compute ker ρ= p^(r−1)A/p^rA and the displayed kernel of i. Do not assume i injective or replace i by multiplication by p at all r.

**Direct prerequisites.** `StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8 diagram and its induction, pp.117–118. Characteristic-p field differential comparison, independent of motivic norm varieties.

<a id="m-5d-prime-power-bgk"></a>

### M.5d/prime-power-bgk — Prime-power Bloch–Gabber–Kato theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/prime-power-bgk`. Implementation: unchecked.

For every characteristic-p field F, r≥1 and q≥0, h_r:K^M_q(F)/p^r≃H⁰_et(F,W_rΩ_log^q). In the diagram of the coefficient row and 0→B₁ --j→B_r --R→B_(r−1), both rows become short exact after the induction; all h_r commute with coefficient reduction.

**Hypotheses and conventions.**

- p prime; no perfectness assumption.

**Construction or proof.**

1. Start with h₁=BGK. Given h_(r−1), injectivity of j and h₁ implies injectivity of i. To prove R surjective, lift an element of B_(r−1) via h_(r−1) and the surjection ρ.
2. For injectivity of h_r, reduce to ker ρ=im i; then use the square h_r i=j h₁ and injectivity. For surjectivity, lift the restriction and correct the difference in im j.
3. This elementary diagram argument proves global R surjectivity; it is not assumed from surjectivity of sheaves.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/bloch-gabber-kato](#m-5d-bloch-gabber-kato), [MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol](#m-5d-witt-logarithmic-symbol), [MotivicEtaleKTheory:M.5d/milnor-coefficient-row](#m-5d-milnor-coefficient-row), `CrystallineCohomology:CR.4`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8, pp.117–118. Characteristic-p field differential comparison, independent of motivic norm varieties.

<a id="m-5d-milnor-torsion-divisible"></a>

### M.5d/milnor-torsion-divisible — Divisibility of residue-characteristic torsion

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/milnor-torsion-divisible`. Implementation: unchecked.

The p-primary torsion subgroup of K^M_q(F) is p-divisible for characteristic-p F. This does not assert that it is zero, nor that K^M_q(F) itself is p-divisible for imperfect F.

**Hypotheses and conventions.**

- q≥0; F characteristic p.

**Construction or proof.**

1. For x killed by p^m, its class in C₁ lies in ker i for r=m+1; injectivity of i implies x=py. Then y is killed by p^(m+1).
2. A Prüfer p-group is a nonzero divisible torsion group with all C_r zero, so torsion-freeness requires a separate theorem.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/prime-power-bgk](#m-5d-prime-power-bgk), [MotivicEtaleKTheory:M.5d/milnor-coefficient-row](#m-5d-milnor-coefficient-row)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8 proof, pp.117–118. Characteristic-p field differential comparison, independent of motivic norm varieties.

<a id="m-5d-mod-prime-motivic-comparison"></a>

### M.5d/mod-prime-motivic-comparison — Mod-prime motivic comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison`. Implementation: unchecked.

Let ℓ≠char F be prime and assume the mod-ℓ norm-residue theorem for all finitely generated extensions of F and all weights up to j, with its motivic transfers input. Then Z/ℓ(j)→Rα_*μ_ℓ^⊗j on smooth F-schemes is a quasi-isomorphism through degree j, equivalently Z/ℓ(j)≃τ≤jRα_*μ_ℓ^⊗j. This is the resolution-free Geisser–Levine form of the Suslin–Voevodsky implication.

**Hypotheses and conventions.**

- j≥0; α:étale→Zariski; use the genuine M.4 cycle complex and M.5a motivic comparison.

**Construction or proof.**

1. Apply the field diagonal Milnor identification, transfers and semilocal acyclicity to the cone of the cycle map; stalkwise vanishing through weight j gives the truncation equivalence.
2. SV2000 Theorem 7.4 alone assumes resolution of singularities; Geisser–Levine 2001 removes it. The latter original PDF was unavailable and its exact resolution-free proof input is an explicit gap, corroborated by Geisser 2004 §5.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5c/mod-l-norm-residue](#m-5c-mod-l-norm-residue), `MotivesAndAlgebraicCycles:MC.4/suslin-friedlander-into-cycle-complex`, `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[SV2000](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf), §7, Theorem 7.4, pp.52–53. The resolution-dependent original implication; its hypothesis is retained.

[GeisserDedekind](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §5 proof of Theorem 1.2, pp.787–789. Explicitly cites the resolution-free field implication [8,9]; not claimed to replace reading its proof.

<a id="m-5d-prime-power-norm-residue"></a>

### M.5d/prime-power-norm-residue — Prime-power norm-residue comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/prime-power-norm-residue`. Implementation: unchecked.

For ℓ≠char F prime, r≥1 and j≥0, the Galois symbol K^M_j(F)/ℓ^r→H^j(F,Z/ℓ^r(j)) is an isomorphism, natural for field maps and compatible with products and the coefficient Bocksteins. The coefficient object is T_ℓ^⊗j/ℓ^r, not a naive tensor of the inclusion μ_ℓ→μ_ℓ^r.

**Hypotheses and conventions.**

- M.5c supplies mod-ℓ norm residue for every field extension and all weights; M.4 supplies the diagonal motivic identification.

**Construction or proof.**

1. Use mod-prime motivic comparison, and the exact coefficient triangles Z/ℓ(j)→Z/ℓ^r(j)→Z/ℓ^(r−1)(j) with first map ℓ^(r−1), on both motivic and étale sides.
2. The comparison cones have no cohomology in degrees ≤j and are extension-stable, so induction proves the prime-power truncation comparison. On a field H^j(F,Z/ℓ^r(j))=K^M_j(F)/ℓ^r because H^(j+1)(F,Z(j))=0.
3. Retain full long exact rows: neither the Milnor row nor the degree-j Galois row is assumed left exact. In Q×, the class of −1 shows why the p-characteristic short-row argument cannot be copied at ℓ=2.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison](#m-5d-mod-prime-motivic-comparison), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §4, Beilinson–Lichtenbaum theorem 4.1, pp.480–481. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-5d-filtered-colimit-comparisons"></a>

### M.5d/filtered-colimit-comparisons — Filtered-colimit comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons`. Implementation: unchecked.

For a filtered union of fields F=colim F_i, the maps colim K^M_q(F_i)/m→K^M_q(F)/m and colim H^q(F_i,Z/m(j))→H^q(F,Z/m(j)) are isomorphisms when m is invertible; in characteristic p, colim ν_q(F_i)≃ν_q(F) and colim H⁰_et(F_i,W_rΩ_log^q)≃H⁰_et(F,W_rΩ_log^q). All symbol maps commute with these isomorphisms.

**Hypotheses and conventions.**

- q,j≥0, m≥1; filtered system of field embeddings; fixed finite r in the Witt assertion.

**Construction or proof.**

1. Milnor symbols and relations involve finitely many elements. Kähler forms/exterior powers and exact-form quotients commute with filtered colimits; filtered colimits of groups preserve kernels.
2. Descend finite étale covers, cocycles and logarithmic sections to a finite stage and apply finite-presentation limit descent. Never commute an infinite derived inverse limit with a colimit without an additional theorem.

**Direct prerequisites.** `K2SymbolsBrauer:T.2/milnor-k-theory`, `DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex`, `CrystallineCohomology:CR.4`, [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[BK1986](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 after Theorem 2.1, p.113. Characteristic-p field differential comparison, independent of motivic norm varieties.

[GeisserDedekind](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Lemma 2.1, pp.775–776. Noetherian étale-site limit argument; the exact field-colimit interface is requested.

<a id="m-5d-inseparable-and-characteristic-reductions"></a>

### M.5d/inseparable-and-characteristic-reductions — Permitted field reductions

**Theorem.** Identifier: `MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions`. Implementation: unchecked.

For a purely inseparable extension E/F in characteristic p and m coprime to p, restriction is an isomorphism K^M_q(F)/m≃K^M_q(E)/m and H^q(F,Z/m(j))≃H^q(E,Z/m(j)). General fields reduce to finitely generated prime-field extensions by the colimit theorem. These reductions do not identify a residue-characteristic symbol with a prime-to-characteristic one or specialize across characteristics without a henselian/smooth comparison theorem.

**Hypotheses and conventions.**

- q,j≥0; m prime to p; arbitrary purely inseparable extensions obtained by filtered union.

**Construction or proof.**

1. For finite exponent e, every symbol over E has p^(eq)-multiple from F; invert p modulo m for surjectivity. Restriction followed by norm is [E:F], a p-power, for injectivity.
2. Purely inseparable extensions give equivalent finite étale categories and identical absolute Galois groups. Apply filtered colimits for the infinite extension.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons](#m-5d-filtered-colimit-comparisons), `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `ArithmeticGaloisDuality:R02.2`, [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §4 Theorem 4.1 and its characteristic restrictions, p.480. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

### Remaining work for M.5d

- Refine BGK relative/p-basis/elimination engines after reading Kato 1982 §1; use the independent verdicts on all six inherited source issues without treating the appendix as a complete proof.
- Supply arbitrary-field Cartier/logarithmic de Rham–Witt imports and the exact field-colimit interface.
- Read resolution-free Geisser–Levine proof; refine semilocal coefficient-comparison chains.

<a id="m-6"></a>

## M.6 — Motivic spectral sequence and rational weights

The spectral sequence and eigenspace comparison assembled from M.6a–b. The displayed page does not define the filtered spectrum.

**Planets:** Motivic spectral sequence, Rational K-theory weights.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), [MotivicEtaleKTheory:M.6b/motivic-strong-convergence](#m-6b-motivic-strong-convergence), [MotivicEtaleKTheory:M.6b/rational-motivic-degeneration](#m-6b-rational-motivic-degeneration)

<a id="m-6-motivic-spectral-sequence"></a>

### M.6/motivic-spectral-sequence — Motivic spectral sequence

**Construction.** Identifier: `MotivicEtaleKTheory:M.6/motivic-spectral-sequence`. Implementation: unchecked.

Assemble the actual coniveau exact couple, cycle-layer comparison and strong convergence into E₂^(a,b)=H^(a−b)(X,Z(−b))⇒K_(−a−b)(X), b≤0, with d_r of bidegree (r,1−r). This is the same tower, not another definition of K or motivic cohomology.

**Hypotheses and conventions.**

- X smooth separated finite type over a perfect field, dim X finite; m=−a−b≥0; for the FS comparison require quasi-projectivity.

**Construction or proof.**

1. Transport the generic tower spectral object and use the proved layer and convergence theorems; verify the M.4 cycle shift.
2. For nonregular schemes the analogous construction abuts to G-theory, not vector-bundle K. Extension to arbitrary fields/regular arithmetic bases requires the precise source descent/limit theorem recorded as a gap.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer), [MotivicEtaleKTheory:M.6b/motivic-strong-convergence](#m-6b-motivic-strong-convergence), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.motivicSequence_pageTwo** (equivalence): The displayed E₂ page is motivic cohomology with its cycle-complex shift.
- **TauCeti.MotivicEtale.motivicSequence_abutment** (equivalence): The finite filtration abuts to the genuine K_m(X) in the stated range.
- **TauCeti.MotivicEtale.motivicSequence_pullback** (functoriality): Smooth-scheme pullbacks preserve the filtered sequence; identity/composition agree with the tower maps.

**Discriminating tests.**

- **motivicSequence_test_field_diagonal** (computation): For a field and a=0,b=−j the page term is K^M_j(F), using M.4.
- **motivicSequence_test_weight_zero** (degenerate): At a=b=0 the term is H⁰(X,Z(0)); the rank edge is the usual K₀ rank.
- **motivicSequence_test_finite_field** (compatibility): For F_q, the finite-field motivic input recovers K_(2j−1)(F_q)=Z/(q^j−1) and K_(2j)(F_q)=0 for j≥1.

**Consumers.**

- MotivicEtaleKTheory:M.7: Compares finite coefficient motivic terms with the étale sequence.
- Polylogarithms:P.3: Supplies the rational weight-three comparison.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.2, p.480; Addendum 4.2.1, p.481. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-6-rational-weight-comparison"></a>

### M.6/rational-weight-comparison — Rational K-theory weight comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6/rational-weight-comparison`. Implementation: unchecked.

For the stated smooth finite-dimensional perfect-field X, m,j≥0, K_m(X)_Q^(j)≃H^(2j−m)(X,Q(j)), natural for smooth-scheme maps and products. Both sides vanish for j>d+m. The isomorphism is the normalized higher motivic Chern character, with no factorial ambiguity.

**Hypotheses and conventions.**

- The eigenspace is simultaneous ψ^k=k^j, k≥2; normalization in positive K degree is ch_(j,m)=(-1)^(j−1)c_(j,m)/(j−1)! for j≥1, while degree-zero ch_j uses Newton polynomials/j!.

**Construction or proof.**

1. Apply rational degeneration and the canonical eigenprojectors to the layer equivalence.
2. Compare the cycle generator and the universal higher Chern class: the diagonal Milnor symbol has factor (-1)^(j−1)(j−1)!, so the normalized character is the identity on it.
3. Use products and Adams operations to identify this comparison with the γ-Chern character imported from S.7 followed by the cycle-layer isomorphism. For m=0 recover the S.7 geometric Chow Chern character.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6b/rational-motivic-degeneration](#m-6b-rational-motivic-degeneration), [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), `SchemeKTheoryOperations:S.7/gamma-chern-character`, `SchemeKTheoryOperations:S.7/chern-character`, `SchemeKTheoryOperations:S.7/chern-character-ring-homomorphism`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Example 4.9; V Lemma 11.3 and Theorem 11.11, pp.452–453,457,485–486. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

### Remaining work for M.6

- Resolve/refine the filtered global-model, arbitrary-field/arithmetic-base and multiplicative comparison gaps in M.6a/M.6b; compare normalized universal higher character with S.7.

<a id="m-6a"></a>

## M.6a — Coniveau/support filtration and layer comparison

Admissible supports and their K-spectra, moving/excision, well-connectedness, cycle layers and the still-open full filtered comparison of global models.

**Planets:** Admissible supports, Homotopy coniveau tower, Coniveau moving theorem, Coniveau cycle-layer comparison, Global motivic comparison.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles), [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma)

<a id="m-6a-admissible-k-supports"></a>

### M.6a/admissible-k-supports — Admissible K-theory supports

**Definition.** Identifier: `MotivicEtaleKTheory:M.6a/admissible-k-supports`. Implementation: unchecked.

For X smooth of finite type over a perfect field k and p,r≥0, S_X^(p)(r) is the filtered poset of closed W⊂X×Δ^r such that codim_(X×F)(W∩(X×F))≥p for every face F of Δ^r, including the whole simplex. Use Perf_W(X×Δ^r) and its support K-theory spectrum from S.3/S.4; pullbacks along simplex maps give the simplicial support diagram.

**Hypotheses and conventions.**

- X smooth, finite-dimensional, separated of finite type over perfect k; codimension interpreted componentwise; an empty intersection has infinite codimension.

**Construction or proof.**

1. Take the finite union poset of admissible closed supports. Proper face intersections ensure face/degeneracy pullbacks preserve the required support condition.
2. Import the actual perfect-complex support categories and pullback K-theory; no support category is defined from the expected spectral sequence.

**Direct prerequisites.** `SchemeKTheoryOperations:S.4/codimension-support-filtration`, `SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence`, [MotivicEtaleKTheory:M.4/algebraic-simplex](#m-4-algebraic-simplex), [MotivicEtaleKTheory:M.4/admissible-cycles](#m-4-admissible-cycles)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.admissibleSupports_iff** (characterisation): Membership is exactly the codimension inequality for every face.
- **TauCeti.MotivicEtale.admissibleSupports_union** (structure): Finite unions are admissible, giving a filtered indexing poset.
- **TauCeti.MotivicEtale.admissibleSupports_face** (functoriality): Face pullback induces the indicated support-poset map with the simplicial identities.

**Discriminating tests.**

- **admissibleSupports_test_empty** (degenerate): The empty support is admissible in every p,r.
- **admissibleSupports_test_zero** (computation): At p=0 every closed support is admissible.
- **admissibleSupports_test_face** (non-example): For X=Spec k, a vertex in Δ¹ has codimension 1 in Δ¹ but codimension 0 on that face, so it is excluded at p=1.

**Consumers.**

- Levine §1.3 and §4.1: Builds the simplicial tower and permits moving for arbitrary smooth pullback.
- MotivicEtaleKTheory:M.6b: Controls the connectivity bound before convergence.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), §2.1, admissible supports on every face and definition of the tower, pp.9–11. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

<a id="m-6a-homotopy-coniveau-tower"></a>

### M.6a/homotopy-coniveau-tower — Homotopy coniveau tower

**Construction.** Identifier: `MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower`. Implementation: unchecked.

Define K^(p)(X,r)=hocolim_(W∈S_X^(p)(r))K^W(X×Δ^r), and K^(p)(X)=|r↦K^(p)(X,r)|. Inclusion of supports defines K^(p+1)→K^(p); the layer is cofib(K^(p+1)→K^(p)), and K→K^(0) is the A¹ augmentation. Nisnevich regularization with supports adapted to each map gives a functorial tower on Sm/k.

**Hypotheses and conventions.**

- Same smooth perfect-field class as admissible supports; K is the genuine connective regular-scheme spectrum, with support fibres; finite k requires A3, verified by finite restriction/transfer after inverting the extension degree.

**Construction or proof.**

1. Build the hocolim and geometric realization using H.5, then apply K homotopy invariance and Nisnevich excision.
2. For arbitrary smooth morphisms restrict to supports whose inverse images remain admissible, apply moving, and regularize the entire tower via the Dwyer–Kan construction of Levine Theorem 4.1.1; do not infer pullback on arbitrary supports.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/admissible-k-supports](#m-6a-admissible-k-supports), `SchemeKTheoryOperations:S.5/homotopy-invariance-regular`, `SchemeKTheoryOperations:S.4/nisnevich-excision-square`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:spectra-comparison`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.coniveauTower_level** (data): The level is the displayed realization of the support hocolimit.
- **TauCeti.MotivicEtale.coniveauTower_transition** (projection): The transition is induced by S^(p+1)⊂S^(p), commuting with augmentation.
- **TauCeti.MotivicEtale.coniveauTower_pullback** (functoriality): Adapted-support moving induces pullback for smooth-scheme maps, with identity and composition in the homotopy category.

**Discriminating tests.**

- **coniveauTower_test_zero** (characterisation): K→K^(0) is an equivalence by A¹ invariance.
- **coniveauTower_test_dimension** (degenerate): K^(p)(X,r)=0 for p>dim X+r before realization.
- **coniveauTower_test_field_layer** (computation): For Spec k the weight-zero layer is HZ, so the constant zero tower is excluded.

**Consumers.**

- Levine Theorem 6.4.2: Provides actual K layers to compare with cycles.
- MotivicEtaleKTheory:M.6 and M.7: Produces the motivic filtered spectrum and finite coefficient comparison.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), §2.1, pp.9–11; Theorem 4.1.1 and proof, pp.20–22. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

<a id="m-6a-moving-and-excision"></a>

### M.6a/moving-and-excision — Moving and excision theorem

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6a/moving-and-excision`. Implementation: unchecked.

On the stated smooth perfect-field K-theory setting, the adapted-support inclusion for f:Y→X induces equivalences K^(p)(X)_f≃K^(p)(X), and the localized support sequence for a closed Z⊂X and U=X−Z is a fibre sequence. The induced layer maps are natural in the corresponding good-position supports.

**Hypotheses and conventions.**

- K satisfies A1 homotopy invariance, A2 Nisnevich excision and A3 finite-field degree descent; localization uses the base restrictions in Levine Theorem 3.2.1 (over a field its infinite-residue version, finite fields via A3).

**Construction or proof.**

1. Use generic projection to move supports into good position; homotopies compare projections and yield equivalences on stable homology/connective truncations.
2. Use A2 to remove the exceptional locus; extend from infinite to finite fields by transfer for two coprime extension degrees.
3. Apply the moving map to relative supports and then fibre/cofibre sequences; regularize the diagrams simultaneously, as in Theorem 4.1.1.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), `SchemeKTheoryOperations:S.4/nisnevich-excision-square`, `SchemeKTheoryOperations:S.6/support-product-pairings`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), Theorem 3.2.1 proof, pp.14–17; Theorem 4.1.1, pp.20–22. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

<a id="m-6a-k-theory-well-connected"></a>

### M.6a/k-theory-well-connected — Well-connected K-theory

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6a/k-theory-well-connected`. Implementation: unchecked.

K on smooth perfect-field schemes is well connected: support spectra used in the tower are connective, and the P¹-loop iterates have no nonzero homotopy in degrees other than zero on the indicated multirelative semilocal simplices. Their degree-zero cycle maps give the codimension-p cycle generators.

**Hypotheses and conventions.**

- Levine Definition 6.1.1 well-connectedness; semilocal Δ with all faces and their boundary; regular ambient schemes, not arbitrary singular K-theory.

**Construction or proof.**

1. K satisfies homotopy invariance and excision; K₀ regular ambient→K₀ open is surjective, so its support fibre is connective.
2. Identify Ω_TK≃K through the projective-bundle formula. For semilocal simplices with normal-crossing boundary, apply the Vorst K₁ input and K/KH comparison and Mayer–Vietoris requested from the scheme owner.
3. Apply Corollary 5.3.2 to the resulting connective layer and cycle generators. The generic KH/boundary input remains an explicit supplier gap.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/moving-and-excision](#m-6a-moving-and-excision), `SchemeKTheoryOperations:S.5/projective-bundle-theorem`, `SchemeKTheoryOperations:S.5/negative-k-vanishing-regular`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), §6.4 proof of Theorem 6.4.2, pp.35–37. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

<a id="m-6a-coniveau-cycle-layer"></a>

### M.6a/coniveau-cycle-layer — Coniveau cycle-layer comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6a/coniveau-cycle-layer`. Implementation: unchecked.

For p≥0 and X in the smooth perfect-field class, cofib(K^(p+1)(X)→K^(p)(X))≃H(z^p(X,•)), the Eilenberg–Mac Lane spectrum of Bloch’s homological cycle complex. Therefore π_m of this layer is CH^p(X,m)=H^(2p−m)(X,Z(p)). Face maps have the intersection multiplicities of the cycle complex.

**Hypotheses and conventions.**

- Bloch cycle complex and motivic identification imported from M.4; no resolution-of-singularities assumption in Levine 2008 Theorem 6.4.2.

**Construction or proof.**

1. Use well-connectedness and Corollary 5.3.2 to identify layers with degree-zero classes supported at good codimension-p points.
2. Dévissage maps a length-one generic coherent sheaf to its cycle. Moving ensures every cycle occurs; naturality of Tor intersection multiplicities identifies face and degeneracy maps.
3. Apply the source’s simplicial cycle-layer weak equivalence, then the M.4 shift convention.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/k-theory-well-connected](#m-6a-k-theory-well-connected), [MotivicEtaleKTheory:M.6a/moving-and-excision](#m-6a-moving-and-excision), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), Theorem 6.4.2, pp.35–37; Remark 11.3.4, p.64. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

<a id="m-6a-global-model-comparison"></a>

### M.6a/global-model-comparison — Global motivic model comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6a/global-model-comparison`. Implementation: unchecked.

For smooth quasi-projective X over a perfect field, the regularized homotopy-coniveau model and the Friedlander–Suslin global support model admit a natural filtered zigzag of equivalences compatible with K augmentation and the cycle maps. Hence their reindexed spectral sequences agree. This claim requires a filtered comparison, not merely agreement of E₂ pages.

**Hypotheses and conventions.**

- Common smooth quasi-projective perfect-field range; global Zariski/Nisnevich derived sections, actual tower maps and their homotopies.

**Construction or proof.**

1. Compare the adapted and quasi-finite support subcategories by the moving theorem, preserving the entire inclusion tower.
2. Use local cycle-layer comparisons and support descent to glue the levelwise comparison; verify compatibility with transitions and augmentation.
3. FS2002 gives the global exact couple (Theorem 13.13, Proposition 13.17); an explicit filtered zigzag matching the Levine model is not proved in the read passages and remains a precise comparison gap. Do not appeal to equal associated gradeds alone.
4. S.4/descent-coniveau-e2-comparison compares Brown–Gersten and Quillen E₂ pages and does not supply this filtered HC/FS zigzag; the latter remains the explicit owned comparison gap.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FS2002](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Introduction pp.1–2, §13 Theorem 13.13 and Proposition 13.17, pp.68–71. Constructs the genuine global tower and convergent exact couple; the comparison to the Levine tower is an explicit proof obligation.

[Levine2008](https://arxiv.org/pdf/math/0510334), §4.1 and §11.3, pp.20–22,64–65. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

### Remaining work for M.6a

- Construct the full filtered zigzag between homotopy-coniveau and FS global models, with augmentation/layer compatibility.
- Resolve support/dévissage and coherent stable-diagram supplier requests; extend the perfect-field scheme class only with the source theorem.
- Align suggested filtered comparison with actual transitions and augmentation; E₂ page comparison in S.4 is not the missing HC/FS filtered equivalence.

<a id="m-6b"></a>

## M.6b — Exact couples, convergence and operations

The derived differentials, connectivity and limits, filtered products and Adams actions, and rational degeneration after their compatibility has been proved.

**Planets:** Motivic exact couple, Motivic strong convergence, Filtered motivic product, Filtered Adams operations, Rational motivic degeneration.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer), [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), [MotivicEtaleKTheory:M.6a/k-theory-well-connected](#m-6a-k-theory-well-connected), [MotivicEtaleKTheory:M.6a/moving-and-excision](#m-6a-moving-and-excision)

<a id="m-6b-motivic-exact-couple"></a>

### M.6b/motivic-exact-couple — Motivic exact couple

**Construction.** Identifier: `MotivicEtaleKTheory:M.6b/motivic-exact-couple`. Implementation: unchecked.

Apply the generic tower exact-couple functor to K^(p+1)→K^(p)→L^p. With D₁^(p,m)=π_mK^(p), E₁^(p,m)=π_mL^p, take i:D₁^(p+1,m)→D₁^(p,m), j:D₁^(p,m)→E₁^(p,m), k:E₁^(p,m)→D₁^(p+1,m−1). Derivation gives d_s:E_s^(p,m)→E_s^(p+s,m−1), and after the conventional page renumbering E₂^(a,b)=H^(a−b)(X,Z(−b)).

**Hypotheses and conventions.**

- Actual support tower; H.6 exact-couple convention transported by s=−p, with the motivic E₂ page equal to the raw tower E₁; q=−b, m=−a−b.

**Construction or proof.**

1. Apply π to the layer triangles and import generic exact-couple derivation.
2. Transport the raw homological indexing into the motivic convention and verify d_r:E_r^(a,b)→E_r^(a+r,b−r+1); the raw d₁ becomes motivic d₂.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer), `StableHomotopyKTheory:H.6/exact-couple`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.motivicCouple_D** (data): D is the homotopy of the tower level in the stated raw indexing.
- **TauCeti.MotivicEtale.motivicCouple_E** (data): E is the homotopy of the actual cycle layer.
- **TauCeti.MotivicEtale.motivicCouple_differential** (projection): Differentials come from k, iterated lifts through i, then j; motivic bidegree is (r,1−r).

**Discriminating tests.**

- **motivicCouple_test_indices** (computation): a=−m+j,b=−j gives H^(2j−m)(X,Z(j)) and total K_m.
- **motivicCouple_test_boundary** (compatibility): At the raw first page the map is j∘k and squares to zero by triangle exactness.
- **motivicCouple_test_zero_weight** (degenerate): Weight j=0 has no incoming negative-weight layer; it is not a second independent K-spectrum.

**Consumers.**

- MotivicEtaleKTheory:M.6: Assembles the spectral sequence from actual maps.
- MotivicEtaleKTheory:M.7: Compares finite coefficient pages with étale descent.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), Proposition 2.1.3 and §11.3, pp.10–12,64–65. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

[FS2002](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Proposition 13.17, p.71. Pins the delooped global exact couple and page reindexing.

<a id="m-6b-motivic-strong-convergence"></a>

### M.6b/motivic-strong-convergence — Strong convergence of the motivic tower

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6b/motivic-strong-convergence`. Implementation: unchecked.

For X smooth of dimension d over a perfect field and each m≥0, π_mK^(p)(X)=0 for p>d+m. K^(0)(X)≃K(X), and holim_p K^(p)(X)=0, including its Milnor lim¹ obstruction. The induced filtration on K_m(X) is finite, exhaustive and separated; the motivic spectral sequence strongly converges to K_m(X).

**Hypotheses and conventions.**

- Finite d; connective support K spectra and geometric realization; no such claim for an arbitrary unbounded spectrum or an infinite-dimensional scheme.

**Construction or proof.**

1. At simplicial degree r<p−d there are no supports. Since the support spectra are connective, realization is at least (p−d)-connective; deduce vanishing in the stated range.
2. For each m, both π_m and π_(m+1) tower systems are eventually zero, hence lim and lim¹ vanish. The Milnor sequence proves holim is contractible.
3. Use the generic exact couple and finite filtration to obtain strong convergence. Compare the FS bound on RΓ(X,Ω⁻¹K^p) in Lemma 13.12, respecting the delooping shift.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/k-theory-well-connected](#m-6a-k-theory-well-connected), [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), `StableHomotopyKTheory:H.6/milnor-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Levine2008](https://arxiv.org/pdf/math/0510334), Proposition 2.1.3, pp.10–12. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

[FS2002](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Lemma 13.12 and Theorem 13.13, pp.67–68. Supplies finite dimension connectivity of the global model.

<a id="m-6b-filtered-motivic-products"></a>

### M.6b/filtered-motivic-products — Filtered motivic products

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6b/filtered-motivic-products`. Implementation: unchecked.

The support tensor product and moving of pairs give K^(p)(X)∧K^(q)(X)→K^(p+q)(X), compatible with the tower and layer cup products. Thus the motivic spectral sequence is multiplicative and d_r is a graded derivation; it acts as a module spectral sequence on finite coefficients. An intrinsic product on finite coefficients requires its actual chosen multiplication and coherence. The imported Moore-spectrum ring theorem supplies this for prime powers outside {2,3,4,8}; the module action of integral K on coefficients does not require such a coefficient-ring structure.

**Hypotheses and conventions.**

- Smooth perfect-field X; product supports must first be moved into proper intersection; finite coefficient coherence stated separately.
- No unital product is inferred on S/2; no associative/commutative product is inferred from the imported theorem at the exceptional levels 3,4,8. Any stronger K-specific product needs a separate supplier theorem.

**Construction or proof.**

1. Move the two support families simultaneously; derived tensor product has support in their intersection, with codimensions adding in good position.
2. Compare on cycle generators to the M.4 intersection product and apply the generic product exact-couple construction.
3. Retain the integral action at every m; do not deduce an associative mod-2 multiplication from the integral action.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/moving-and-excision](#m-6a-moving-and-excision), [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), `SchemeKTheoryOperations:S.6/support-product-pairings`, `StableHomotopyKTheory:H.6/moore-spectrum-multiplication`, [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/moving-lemma](#m-4-moving-lemma), [MotivicEtaleKTheory:M.4/cubical-cycle-complex](#m-4-cubical-cycle-complex)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Addendum 4.2.1, p.481. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

[LevineSchemes](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), §11 and Appendix D product construction; Theorem 12.12, pp.58–59. Read Theorem 12.12 and its proof; detailed product construction is a recorded source-read gap.

<a id="m-6b-filtered-adams-operations"></a>

### M.6b/filtered-adams-operations — Filtered Adams operations

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6b/filtered-adams-operations`. Implementation: unchecked.

For k≥2, the imported Adams operation ψ^k on K extends to the motivic support tower in the proven regular finite-dimensional smooth-field setting. It commutes with transition/boundary maps and acts by k^j on E₂^(a,−j)=H^(a+j)(X,Z(j)). The operation on the abutment is the actual scheme ψ^k.

**Hypotheses and conventions.**

- Same scheme class; support operations and Adams–Riemann–Roch normalizations imported from S.6/S.7.

**Construction or proof.**

1. Apply support λ-operations to the simplicial support diagrams and their Zariski descent; compatibility with localization gives an exact-couple endomorphism.
2. On the codimension-j generic cycle generator, Adams–Riemann–Roch gives the factor k^j; use the cycle-layer equivalence to identify the entire page.
3. Levine Theorem 12.12 printed page indices differ from the adopted E₂ indexing; weight is the positive codimension j.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6a/coniveau-cycle-layer](#m-6a-coniveau-cycle-layer), [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), `SchemeKTheoryOperations:S.6/scheme-adams-multiplicative`, `SchemeKTheoryOperations:S.7/gamma-chern-character`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[LevineSchemes](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), Theorem 12.12 and proof, pp.58–59. Filtered λ/Adams construction and the codimension weight calculation.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Example 4.9 and proof, pp.485–486. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-6b-rational-motivic-degeneration"></a>

### M.6b/rational-motivic-degeneration — Rational motivic degeneration

**Theorem.** Identifier: `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`. Implementation: unchecked.

After tensoring by Q all differentials d_r for r≥2 vanish. For fixed total degree m the finite filtration on K_m(X)_Q splits canonically into Adams eigenspaces of weights 0≤j≤d+m. The weight-j piece is its cycle-layer quotient.

**Hypotheses and conventions.**

- Smooth perfect-field X of dimension d; m≥0; rational coefficients, with ψ^k for k≥2.

**Construction or proof.**

1. d_r changes weight j to j+r−1. Commutativity with ψ^k gives (k^j−k^(j+r−1))d_r=0, whose nonzero scalar is invertible over Q.
2. Convergence gives a finite filtration. Polynomial projectors for the distinct eigenvalues k^0,…,k^(d+m) split it; identify simultaneous Adams weights and prove independence of k.
3. No integral degeneration is inferred; Levine Theorem 14.7 instead records bounded denominators and torsion differentials.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations), [MotivicEtaleKTheory:M.6b/motivic-strong-convergence](#m-6b-motivic-strong-convergence)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Example 4.9, pp.485–486. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

[LevineSchemes](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), Theorems 14.5 and 14.7, pp.71–73. Finite filtration and integral denominator control imply the stated rational splitting.

### Remaining work for M.6b

- Read and refine §11/Appendix D coherent simultaneous-moving product proof and filtered Adams comparison.
- Resolve supplier carriers while preserving the explicit p>d+m connectivity bound, finite filtration and lim¹ argument; no generic exact-couple duplication.
- Bind suggested differentials, page pullbacks and Adams operations to the exact-couple/filter data, with square-zero and naturality laws.

<a id="m-7"></a>

## M.7 — Étale K-theory and the comparison range

Étale descent and Quillen–Lichtenbaum, separate arithmetic/Dedekind/adic degree statements, complex and real comparisons, and the dyadic extension data.

**Planets:** Beilinson–Lichtenbaum theorem, Étale K-theory, Thomason étale descent, Quillen–Lichtenbaum theorem, Arithmetic ℓ-adic comparison, Suslin real comparison.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), [MotivicEtaleKTheory:M.2/positive-and-modified-cohomology](#m-2-positive-and-modified-cohomology), [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/dedekind-cycle-complex](#m-4-dedekind-cycle-complex), [MotivicEtaleKTheory:M.4/dedekind-gersten](#m-4-dedekind-gersten), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/purity-gysin-triangle](#m-4-purity-gysin-triangle), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one), [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison](#m-5d-mod-prime-motivic-comparison), [MotivicEtaleKTheory:M.5d/prime-power-norm-residue](#m-5d-prime-power-norm-residue), [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products)

<a id="m-7-beilinson-lichtenbaum"></a>

### M.7/beilinson-lichtenbaum — Beilinson–Lichtenbaum comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/beilinson-lichtenbaum`. Implementation: unchecked.

For X smooth over a field, m≥1 invertible in the field and j≥0, the motivic cycle map gives Z/m(j)≃τ≤jRα_*μ_m^⊗j. Consequently H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an isomorphism for a≤j and an injection for a=j+1. This is the explicit bridge from norm residue and cycle complexes to finite coefficient E₂ pages.

**Hypotheses and conventions.**

- Genuine M.4 motivic complex; α étale→Zariski; full prime-power norm residue and the resolution-free field implication.

**Construction or proof.**

1. Apply the mod-prime motivic comparison and coefficient-triangle induction for each prime divisor of m, then Chinese remainder decomposition.
2. Identify stalks using semilocal motivic complexes and the M.5a transfer/cycle comparison. Apply hypercohomology to the truncation equivalence; the cone bound gives the injection in the next degree.
3. Do not infer a low-degree complex comparison solely from the diagonal Milnor symbol theorem.

**Direct prerequisites.** [MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison](#m-5d-mod-prime-motivic-comparison), [MotivicEtaleKTheory:M.5d/prime-power-norm-residue](#m-5d-prime-power-norm-residue), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/vanishing-above-weight](#m-4-vanishing-above-weight), [MotivicEtaleKTheory:M.5a/suslin-complex-and-motivic-complexes](#m-5a-suslin-complex-and-motivic-complexes), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers), [MotivicEtaleKTheory:M.5a/etale-motivic-comparison](#m-5a-etale-motivic-comparison), `MotivesAndAlgebraicCycles:MC.4/suslin-friedlander-into-cycle-complex`, `MotivesAndAlgebraicCycles:MC.4/motivic-cohomology-higher-chow`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.1, p.480. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

[SV2000](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf), §7, Theorem 7.4, pp.52–53. Original motivic bridge with resolution; the resolution-free input remains identified as a gap.

<a id="m-7-dedekind-motivic-comparison"></a>

### M.7/dedekind-motivic-comparison — Dedekind motivic comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/dedekind-motivic-comparison`. Implementation: unchecked.

Let B be a Dedekind scheme, X equidimensional and essentially smooth over B, and m invertible on B. The cycle map Z/m(j)_et≃μ_m^⊗j is a quasi-isomorphism; H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an isomorphism for a≤j. In particular these assertions hold on Spec O_(F,S)[1/ℓ] for m=ℓ^r.

**Hypotheses and conventions.**

- j≥0; use the genuine mixed-base cycle complex and its localization/purity statements; Geisser 2004 Theorem 1.2 is conditional on norm residue, now supplied.

**Construction or proof.**

1. Compare the generic-fibre and closed-fibre localization triangles. Field Beilinson–Lichtenbaum, motivic purity and étale absolute purity identify the outside maps.
2. Geisser Theorem 1.2(2) gives the integral comparison through j+1; its coefficient long exact sequence yields the finite comparison through j. Theorem 1.2(4) identifies the étale cycle sheaf.
3. Neither an unqualified smooth-field theorem nor rational weights alone proves the S-integer comparison.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/beilinson-lichtenbaum](#m-7-beilinson-lichtenbaum), [MotivicEtaleKTheory:M.4/dedekind-cycle-complex](#m-4-dedekind-cycle-complex), [MotivicEtaleKTheory:M.4/dedekind-gersten](#m-4-dedekind-gersten), [MotivicEtaleKTheory:M.4/purity-gysin-triangle](#m-4-purity-gysin-triangle), [MotivicEtaleKTheory:M.4/zariski-descent](#m-4-zariski-descent), `ArithmeticGaloisDuality:R02.3`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[GeisserDedekind](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Theorem 1.2(1),(2),(4), pp.774–775; §5 proof, pp.787–789. Read the full localizing-triangle proof and retained its base and coefficient hypotheses.

<a id="m-7-finite-etale-k-theory"></a>

### M.7/finite-etale-k-theory — Finite étale K-theory

**Construction.** Identifier: `MotivicEtaleKTheory:M.7/finite-etale-k-theory`. Implementation: unchecked.

For the stated schemes and m invertible, define K^et(X;Z/m) as derived étale sections of the hypercomplete periodic finite-coefficient K-theory sheaf. The canonical map K(X)/m→K^et(X;Z/m) comes from sheafification and Bott periodicization. Its local homotopy sheaves are μ_m^⊗j in degree 2j, for all integer j, and zero in odd degrees. Coefficients/completion are those of H.6, not underived tensor products of K-groups.

**Hypotheses and conventions.**

- For descent/convergence here restrict to fields of finite ℓ-cd with the stated Thomason field hypothesis, or O_(F,S)[1/ℓ] at odd ℓ (and totally imaginary F at ℓ=2); m=ℓ^r. The carrier/construction of hypercomplete sheaves of spectra is requested from E5.

**Construction or proof.**

1. Import finite K spectra, étale hyperdescent and sheafification. Gabber rigidity and the separably closed computation identify homotopy sheaves; local Bott elements glue via Tate twists.
2. Map the genuine K spectrum through the hypercomplete periodic sheaf and take derived global sections. Include coefficient reduction and étale-site base change.

**Direct prerequisites.** `KTheoryFiniteLocalFields:L.2/gabber-rigidity`, `StableHomotopyKTheory:H.6/coefficient-spectrum`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:spectra-comparison`, `EnhancedDerivedSheaves:E2`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.etaleK_compare** (projection): The ordinary-to-étale comparison is induced by the sheafification and periodicization maps.
- **TauCeti.MotivicEtale.etaleK_hyperdescent** (characterisation): Derived sections send an étale hypercover to the corresponding homotopy limit.
- **TauCeti.MotivicEtale.etaleK_coefficients** (compatibility): Reduction maps commute with comparison and the coefficient Bockstein triangles.

**Discriminating tests.**

- **etaleK_test_separable_closed** (computation): On a separably closed field with ℓ invertible, π_(2j)=Z/ℓ^r(j), π_(2j+1)=0 for every integer j.
- **etaleK_test_rank** (compatibility): In degree zero over that field the comparison sends the unit class to 1.
- **etaleK_test_periodic** (non-example): Its π_(-2) is Z/ℓ^r(−1); a connective K spectrum with negative groups zero fails this test.

**Consumers.**

- MotivicEtaleKTheory:M.7: Constructs the target of Quillen–Lichtenbaum.
- Calmes et al. Lemma 3.2.4: Provides the descent target for the duality action.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.1 and Remark 2.8, pp.11–12. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

[Calmes2026](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 proof, pp.56–57 of arXiv v4. The étale sheaf computation and number-ring ℓ-adic descent used in the routed lemma.

<a id="m-7-bott-etale-descent"></a>

### M.7/bott-etale-descent — Bott-inverted étale descent

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/bott-etale-descent`. Implementation: unchecked.

For X=Spec F with finite ℓ-cohomological dimension and Thomason’s Tate–Tsen filtration hypothesis, or X=Spec O_(F,S)[1/ℓ] at odd ℓ, Bott-inverted K(X;Z/ℓ^r) agrees with the periodic étale target. The convergent descent sequence is E₂^(s,t)=H_et^s(X,Z/ℓ^r(t/2))⇒K^et_(t−s)(X;Z/ℓ^r), t even, s≥0, with d_r of bidegree (r,r−1).

**Hypotheses and conventions.**

- ℓ odd in the FGV Bott-telescope proof; for dyadic totally imaginary schemes use the separately requested Thomason version, not an odd-prime telescope without modification. Finite ℓ-cd is the convergence bound.

**Construction or proof.**

1. FGV Remark 2.8 constructs the intrinsic telescope of the Adams self-map on S/ℓ^r of degree 2ℓ^(r−1)(ℓ−1); if roots exist this agrees with inversion of the corresponding power of β.
2. Thomason’s étale descent identifies that telescope with the periodic hypercomplete sheaf. Postnikov hyperdescent gives the displayed pages, and finite cohomological dimension gives convergence.
3. The original general Thomason proof is not read; retain its field hypothesis and a precise source/proof gap rather than replacing “mild hypotheses” by all schemes.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/finite-etale-k-theory](#m-7-finite-etale-k-theory), `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`, `ArithmeticGaloisDuality:R02.3`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Remark 2.8 and §2.6.1, pp.11–12. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

<a id="m-7-quillen-lichtenbaum-field-range"></a>

### M.7/quillen-lichtenbaum-field-range — Quillen–Lichtenbaum field range

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range`. Implementation: unchecked.

For a field F with ℓ invertible, finite d=cd_ℓ(F) and the preceding Thomason field hypothesis, K_n(F;Z/ℓ^r)→K^et_n(F;Z/ℓ^r) is an isomorphism for n≥d−1 and an injection for n=d−2, in nonnegative degrees. The ℓ-adic spectrum comparison in this range is obtained by derived inverse limits with the boundary range checked one degree higher.

**Hypotheses and conventions.**

- ℓ odd for the read FGV proof; r≥1; d finite; extension to every admissible dyadic field needs the specified Thomason proof.

**Construction or proof.**

1. Compare the actual motivic sequence and the étale descent sequence using Beilinson–Lichtenbaum. With cohomological degree s and weight j, the first potentially missing étale term is (s,j)=(d,d−1), of total degree d−2.
2. Use finite convergent filtrations and the page comparison to obtain the stated isomorphism/injection. Induct r through coefficient triangles, retaining connecting maps.
3. To pass to holim_r, compare both π_n and π_(n+1) systems and their Milnor lim¹ terms. Never identify completion with tensoring until finite generation is invoked.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/beilinson-lichtenbaum](#m-7-beilinson-lichtenbaum), [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), [MotivicEtaleKTheory:M.7/bott-etale-descent](#m-7-bott-etale-descent), `StableHomotopyKTheory:H.6/milnor-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.2, proof of Proposition 2.9, pp.12–13. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

<a id="m-7-s-integer-comparison-range"></a>

### M.7/s-integer-comparison-range — S-integer comparison range

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/s-integer-comparison-range`. Implementation: unchecked.

For a number field F, finite S, and odd ℓ, set R=O_(F,S)[1/ℓ]. K_n(R;Z/ℓ^r)→K^et_n(R;Z/ℓ^r) is an isomorphism for n≥1 and an injection for n=0. The map K_n(O_(F,S))^∧_ℓ→K_n(R)^∧_ℓ is an isomorphism for n≥2; it is not asserted in degree one. At ℓ=2 the analogous finite-cd formulation requires F totally imaginary.

**Hypotheses and conventions.**

- r≥1; genuine derived ℓ-completion; finite residue-field K calculation and arithmetic cd=2 supplied by their owners.

**Construction or proof.**

1. Use the Dedekind motivic bridge and localization, comparing number fields of cd_ℓ=2 with finite residue fields of cd_ℓ=1.
2. Invert primes above ℓ using localization; their positive finite-coefficient K groups vanish in residue characteristic ℓ, leaving a degree-zero support contribution to K₁.
3. Pass to derived completion via the Milnor sequence. The totally imaginary dyadic branch is kept dependent on the unread Thomason version.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/dedekind-motivic-comparison](#m-7-dedekind-motivic-comparison), [MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range](#m-7-quillen-lichtenbaum-field-range), `KTheoryFiniteLocalFields:L.1/finite-field-mod-m-groups`, `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `ArithmeticGaloisDuality:R02.3`, [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Proposition 2.9, Lemma 2.10 and their proofs, pp.12–13. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 8.2, pp.513–514. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-7-arithmetic-adic-degrees"></a>

### M.7/arithmetic-adic-degrees — Arithmetic ℓ-adic comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/arithmetic-adic-degrees`. Implementation: unchecked.

For R=O_(F,S)[1/ℓ], ℓ odd (or ℓ=2 and F totally imaginary) and j≥2, π_(2j−1)(K(R)^∧_ℓ)≃H¹_cont(R,Z_ℓ(j)) and π_(2j−2)(K(R)^∧_ℓ)≃H²_cont(R,Z_ℓ(j)). Finite generation further identifies these completed homotopy groups with K_(2j−1)(R)⊗Z_ℓ and K_(2j−2)(R)⊗Z_ℓ. The same n≥2 outputs apply before inverting ℓ.

**Hypotheses and conventions.**

- Continuous cohomology uses derived inverse limit of μ_ℓ^r^⊗j; arithmetic H⁰ positive-twist invariants vanish; H^s=0 for s>2 in this coefficient regime.

**Construction or proof.**

1. Apply the comparison range and ℓ-adic descent. Only s=1,2 survive because H⁰(R,Z_ℓ(j))=0 for j>0 and cd=2; parity leaves exactly one term in each displayed degree.
2. Use finite generation of the two adjacent K groups to remove the completion Tor/Tate-module and lim¹ terms through H.6/completion-finite-type.
3. Retain j≥2: units, Picard and rank at K₀/K₁ require their separate low-degree calculations.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/s-integer-comparison-range](#m-7-s-integer-comparison-range), `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `StableHomotopyKTheory:H.6/completion-finite-type`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), `ArithmeticGaloisDuality:R02.3`, [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 8.2 proof, pp.513–514. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

[Calmes2026](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 proof, p.57. Explicitly identifies the two completed degrees and the vanishing of positive-twist H⁰.

<a id="m-7-etale-adams-weights"></a>

### M.7/etale-adams-weights — Étale Adams weights

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/etale-adams-weights`. Implementation: unchecked.

For a prime-to-ℓ integer a, ψ^a acts on the finite periodic étale homotopy sheaf Z/ℓ^r(j) by a^j and therefore on every descent term by the same scalar. Dualization ψ^(−1) acts by (−1)^j. The comparison map intertwines these operations.

**Hypotheses and conventions.**

- Same finite coefficient and descent range; a is a unit modulo ℓ; operations with a divisible by ℓ are not asserted to preserve Bott inversion.

**Construction or proof.**

1. Apply Adams operations to the actual Bott telescope; since a is invertible modulo ℓ, Bott powers remain invertible.
2. Compute on the Bott generator and identify the Tate homotopy sheaves by rigidity; natural hyperdescent transports the scalar to the sequence.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/bott-etale-descent](#m-7-bott-etale-descent), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.1 after equation (2.6), p.12. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

<a id="m-7-etale-k-transfer"></a>

### M.7/etale-k-transfer — Étale K-theory transfer comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/etale-k-transfer`. Implementation: unchecked.

For finite étale f:Y→X in the stated regular finite-cd setting, the genuine K-theory transfer and étale corestriction form a map of the Bott/étale descent sequences. Under the arithmetic single-term identifications, transfer on K_(2j−1)^∧_ℓ and K_(2j−2)^∧_ℓ is corestriction on H¹(Z_ℓ(j)) and H²(Z_ℓ(j)). A ramified Dedekind transfer requires the finite-perfect pushforward and supported purity comparison, and is not assumed to commute with duality without its different-line correction.

**Hypotheses and conventions.**

- Finite étale first; for number-field transfer localize every ramified prime in S. Projection formula and Tate twists use one arithmetic Frobenius convention.

**Construction or proof.**

1. Use the transfer map of the hypercomplete K sheaf and the finite étale trace on its homotopy sheaves; compare Postnikov towers before taking sections.
2. FGV’s transfer proof cites Blumberg–Mandell §10; the original coherent transfer descent proof is an explicit source gap.
3. For ramified ring extensions dualization changes by the relative dualizing/different line; FGV uses a principal different and a specified generator in its cyclotomic example.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/bott-etale-descent](#m-7-bott-etale-descent), [MotivicEtaleKTheory:M.7/arithmetic-adic-degrees](#m-7-arithmetic-adic-degrees), `SchemeKTheoryOperations:S.6/finite-etale-transfer-adams`, `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `ArithmeticGaloisDuality:R02.2`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[FGV2022](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Transfer compatibility proof immediately before §2.8, pp.16–17. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

<a id="m-7-number-ring-duality-sign"></a>

### M.7/number-ring-duality-sign — Number-ring duality sign

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/number-ring-duality-sign`. Implementation: unchecked.

For O a ring of S-integers in a number field and n≥2, the C₂-actions on K induced by the symmetric Poincaré structures Q^s and Q^s_− on perfect complexes both act as multiplication by (−1)^n on K_(2n−1)(O)[1/2] and K_(2n−2)(O)[1/2]. This plans only the routed Lemma 3.2.4, not general hermitian K-theory.

**Hypotheses and conventions.**

- O as stated; inversion of 2; underlying dualizing equivalences for the two Poincaré structures coincide.

**Construction or proof.**

1. Both structures have the same underlying duality; reduce to Q^s. Arithmetic finite generation detects equality on all odd-prime completions.
2. Localize at ℓ, apply the arithmetic ℓ-adic degree comparison and ψ^(−1) equivariance. cd_ℓ=2 and positive-twist H⁰=0 leave H¹/H² of twist n, on which duality is (−1)^n.
3. Descend the detected equality to the finitely generated Z[1/2]-module; do not confuse the displayed completion with the integral group.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/arithmetic-adic-degrees](#m-7-arithmetic-adic-degrees), [MotivicEtaleKTheory:M.7/etale-adams-weights](#m-7-etale-adams-weights), `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `GeneralAlgebraicKTheory:K.2`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Calmes2026](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 and proof, pp.56–57 arXiv:2009.07225v4. Exact routed assertion and proof; original source’s completed notation is restored in the sketch.

<a id="m-7-suslin-real-comparison"></a>

### M.7/suslin-real-comparison — Suslin real comparison

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/suslin-real-comparison`. Implementation: unchecked.

For every m≥1 and n≥1, the comparison from algebraic to topological real K-theory gives K_n(R;Z/m)≃π_n(BO;Z/m). This statement precedes all dyadic real-place calculations and uses the real BO/KO Bott-periodic carrier supplied by RefinedTraceMethods.

**Hypotheses and conventions.**

- R is the real numbers; finite coefficients are Moore homotopy coefficients, not π_n(BO)⊗Z/m; degree zero handled separately by rank.

**Construction or proof.**

1. Use Gabber rigidity on the universal henselized cosimplicial GL coordinate ring to prove the finite-homology vanishing of sufficiently small Lie-group neighbourhoods (K-book Lemmas 3.5–3.6).
2. Apply homological stability and the Milnor Lie-group comparison to show GL(R)^δ→GL(R)^top is a mod-m homology equivalence after stabilization (Lemmas 3.7–3.8).
3. Pass through the simply connected plus models BSL⁺ and BSO to finite homotopy; degrees 1 and 2 are the explicit classical calculation. The original neighbourhood/stability input is recorded as a proof gap.

**Direct prerequisites.** `KTheoryFiniteLocalFields:L.2/gabber-rigidity`, `GeneralAlgebraicKTheory:K.2`, `RefinedTraceMethods:RT.4`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 3.1(c) and proof, pp.475–479. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-7-real-mod-two-sequence"></a>

### M.7/real-mod-two-sequence — Real mod-2 motivic sequence

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/real-mod-two-sequence`. Implementation: unchecked.

For R, the mod-2 motivic sequence has E₂^(a,b)=F₂ in b≤a≤0. Its d₂ maps with nonzero source in columns a≡1,2 mod 4 are isomorphisms, and it degenerates at E₃. For n≥1, K_n(R;Z/2) has period-eight orders 2,4,2,2,1,1,1,2 for n≡1,2,3,4,5,6,7,0 respectively; K_(8k+2)(R;Z/2)=Z/4 is the nontrivial extension.

**Hypotheses and conventions.**

- M.4 supplies the real motivic page, H.6 supplies finite coefficient homotopy, and RT.4 supplies real Bott periodicity. Use integral spectral-sequence module action, not a nonexistent natural mod-2 K-ring product.

**Construction or proof.**

1. Suslin plus real Bott periodicity determines the abutment. Write page generators η^sβ_j. The forced nonzero d₂(β₂)=η³ and d₂(β₃)=η³β₁ propagate by the integral η action and periodicity.
2. Eliminate the displayed columns; use the real KO finite-coefficient calculation to determine the nonsplit Z/4 extension. Associated graded F₂⊕F₂ alone would be insufficient.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/suslin-real-comparison](#m-7-suslin-real-comparison), [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one), [MotivicEtaleKTheory:M.4/products](#m-4-products), `RefinedTraceMethods:RT.4`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 9.1, Table 9.1.1 and proof, pp.517–518. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-7-real-place-correction"></a>

### M.7/real-place-correction — Real-place correction sequence

**Construction.** Identifier: `MotivicEtaleKTheory:M.7/real-place-correction`. Implementation: unchecked.

For R=O_(F,S) with 1/2∈R and r₁ real embeddings, form the map of motivic K coefficient towers K(R;Z/2^∞)→⊕_σK(R;Z/2^∞). On cohomology write α_s(j):H^s(R,Q₂/Z₂(j))→⊕_σH^s(R,Q₂/Z₂(j)) and H̃¹=ker α₁. Its fibre long exact sequence is the corrected real-place comparison; retain the connecting maps and the induced filtration extensions.

**Hypotheses and conventions.**

- Arithmetic real-place Tate/Poitou–Tate comparison from M.2/D7; ordinary real Galois cohomology has infinite cd₂, so it is not the finite-cd odd-prime argument. Finite direct sum of real spectra.

**Construction or proof.**

1. Apply all real embeddings to actual spectra and take their fibre; generic homotopy exactness gives the correction sequence.
2. On the motivic E₂ page the map is α_(a−b)(−b). Arithmetic duality identifies α_s for s≥3 and the special s=2 range.
3. Compare differentials with the real calculation and leave the H⁰/H¹ diagonals and connecting maps visible.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/real-mod-two-sequence](#m-7-real-mod-two-sequence), [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), [MotivicEtaleKTheory:M.2/positive-and-modified-cohomology](#m-2-positive-and-modified-cohomology), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), `ArithmeticGaloisDuality:D7`, `StableHomotopyKTheory:H.6/qp-zp-coefficients`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.realCorrection_triangle** (structure): The correction spectrum sits in the defining fibre triangle and its long exact homotopy sequence.
- **TauCeti.MotivicEtale.realCorrection_pageMap** (compatibility): The page map is α_(a−b)(−b), with the stated ordinary/Tate real-place conventions.
- **TauCeti.MotivicEtale.realCorrection_kernel** (characterisation): The critical cohomology term H̃¹ is precisely ker α₁, without a chosen complement.

**Discriminating tests.**

- **realCorrection_test_imaginary** (degenerate): If r₁=0 the real target is zero and the correction fibre is K(R;Z/2∞).
- **realCorrection_test_real_higher** (computation): For s≥3, α_s is an isomorphism in the Tate/Poitou–Tate range used by the source.
- **realCorrection_test_extension** (non-example): At n≡5 mod 8 a quotient and kernel do not specify a direct-sum decomposition; the extension class must be retained.

**Consumers.**

- ArithmeticKTheory:N.5: Supplies corrected dyadic sequences and extension data.
- MotivicEtaleKTheory:M.7: Replaces the finite-cd comparison at real places.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI formulas (9.2), Lemma 9.3 and Theorem 9.4 proof, pp.518–519. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-7-dyadic-s-integer-extensions"></a>

### M.7/dyadic-s-integer-extensions — Dyadic S-integer extensions

**Theorem.** Identifier: `MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions`. Implementation: unchecked.

For F with r₁>0 real places and R=O_(F,S) containing 1/2, K_n(R;Q₂/Z₂) has the following mod-eight description: n=8k: Z/w_(4k)(F){2}; 8k+1: H¹(R,Q₂/Z₂(4k+1)); 8k+2: Z/2; 8k+3: H¹(R,Q₂/Z₂(4k+2)); 8k+4: Z/(2w_(4k+2)(F){2})⊕(Z/2)^(r₁−1); 8k+5: an extension 0→(Z/2)^(r₁−1)→K_n→H¹(R,Q₂/Z₂(4k+3))→0; 8k+6:0; 8k+7:H̃¹(R,Q₂/Z₂(4k+4)). In the n=0 slot H⁰(R,Q₂/Z₂(0))=Q₂/Z₂ replaces the finite positive-weight notation. No splitting is asserted in the 8k+5 case.

**Hypotheses and conventions.**

- n≥0; k≥0; w_j(F){2}=|H⁰(F,Q₂/Z₂(j))| for j>0; modified real and coefficient conventions as in the correction construction.

**Construction or proof.**

1. Use the map to the r₁ real sequences. Tate–Poitou duality identifies the higher diagonal maps, so the forced real differentials determine E₃=E∞ except the critical low diagonals.
2. At 8k+4 the extension is nontrivial by comparison with R, producing the factor 2 in the cyclic summand. At 8k+5 retain the abelian-group extension.
3. Strong approximation makes α₁(4k+4) surjective after enlarging S; finite even K groups and localization make the relevant K coefficient group independent of S, proving the 8k+6 zero case.

**Direct prerequisites.** [MotivicEtaleKTheory:M.7/real-place-correction](#m-7-real-place-correction), [MotivicEtaleKTheory:M.7/real-mod-two-sequence](#m-7-real-mod-two-sequence), `ArithmeticGaloisDuality:R02.4`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map), [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism), [MotivicEtaleKTheory:M.2/adic-s-integer-cohomology](#m-2-adic-s-integer-cohomology)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 9.4 and its proof, pp.519–520. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

### Remaining work for M.7

- Read/refine original Thomason and Suslin/Lie-neighbourhood inputs and coherent transfer descent.
- Resolve the arithmetic filtered-sequence extension and the real BO/KO Part II request; refine the low-degree and dyadic connecting/extension maps.

<a id="m-8"></a>

## M.8 — Regulators and integral structures

Early Chern/Deligne exports, supported classes, integral images and lattices, actual Tate/elliptic realizations, norm families and conditional Selmer/determinant applications.

**Planets:** Finite étale Chern maps, Motivic Chern character, Deligne regulator, Integral motivic structures, Norm-compatible regulator families, Arithmetic fundamental line.

**Other-layer prerequisites:** [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/projective-bundle-formula](#m-4-projective-bundle-formula), [MotivicEtaleKTheory:M.4/purity-gysin-triangle](#m-4-purity-gysin-triangle), [MotivicEtaleKTheory:M.6/rational-weight-comparison](#m-6-rational-weight-comparison), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.7/etale-adams-weights](#m-7-etale-adams-weights), [MotivicEtaleKTheory:M.7/etale-k-transfer](#m-7-etale-k-transfer)

<a id="m-8-finite-etale-chern"></a>

### M.8/finite-etale-chern — Finite étale Chern maps

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/finite-etale-chern`. Implementation: unchecked.

For a regular scheme X with m invertible, i≥1 and n≥1, construct the additive higher Chern map c_(i,n):K_n(X;Z/m)→H_et^(2i−n)(X,μ_m^⊗i). It is defined from universal equivariant Chern classes, independently of p-adic Hodge theory and Borel regulators. The n=0 ordinary Chern classes obey Whitney sum rather than additivity. On the Milnor diagonal c_(i,i) sends a pure symbol to (−1)^(i−1)(i−1)! times the cup of its Kummer classes.

**Hypotheses and conventions.**

- Use schemes admitted by the universal projective-bundle and twisted-duality constructions; m≥2 is invertible on X; no division by a factorial in Z/m. Finite-coefficient products are only used for m odd or 8 dividing m, as in the source.

**Construction or proof.**

1. Construct the universal Chern classes on B•GL from projective-bundle classes and the Whitney formula. Use the primitive homology class and plus-construction suspension of V §§11.5–11.8 to obtain additive positive-degree maps with Moore coefficients.
2. For finite coefficient classes retain the source’s Bockstein construction and universal product rule. In particular c_(1,2)(β)=ζ and c_(1,2) kills the image K₂(X)/m.
3. The ordinary higher Chern maps themselves are not ring maps; the diagonal factorial and sign are retained. This is the early export requested by HB.1/HB.2/D2 and the verified routing RT-AREA-ktheory-2/18.

**Direct prerequisites.** `GeneralAlgebraicKTheory:K.2`, `SchemeKTheoryOperations:S.7/gamma-chern-character`, [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/projective-bundle-formula](#m-4-projective-bundle-formula), `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.finiteChern_natural** (compatibility): Pullback commutes with c_(i,n) whenever the K/cohomology pullbacks are defined.
- **TauCeti.MotivicEtale.finiteChern_bockstein** (compatibility): For i=1,n=2, c_(1,2) is the coefficient boundary applied to determinant, as in the displayed Bockstein diagram.
- **TauCeti.MotivicEtale.finiteChern_milnor** (simp): On a degree-i Milnor symbol, c_(i,i)=(−1)^(i−1)(i−1)! times the cup-Kummer symbol.

**Discriminating tests.**

- **finiteChern_test_unit** (computation): c_(1,1)(u) is the Kummer class of det(u).
- **finiteChern_test_bott** (compatibility): For a primitive m-th root ζ and its Bott lift β, c_(1,2)(β)=ζ, while c_(1,2)(image K₂/m)=0.
- **finiteChern_test_factorial** (non-example): c_(2,2) on a two-unit symbol is minus the cup-Kummer symbol; treating every c_(i,n) as a multiplicative character fails this sign test.

**Consumers.**

- HabiroNumberFields:HB.1 and HB.2: Provides early finite étale Chern inputs, without waiting for Hermitian/Borel comparisons.
- PadicHodgeRegulators:D.2: Consumes the finite-coefficient maps and the tower-compatible realization, not an analytic regulator.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V §§11.5–11.8 and Example 11.10, Lemma 11.10.1, pp.452–457. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-8-motivic-chern-character"></a>

### M.8/motivic-chern-character — Motivic Chern character

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/motivic-chern-character`. Implementation: unchecked.

For smooth quasi-projective X over a field, construct integral c_(i,n):K_n(X)→H_M^(2i−n)(X,Z(i)) for n≥1 and the rational additive character ch_(i,n):K_n(X)⊗Q→H_M^(2i−n)(X,Q(i)). Its positive-degree normalization is ch_(i,n)=(−1)^(i−1)c_(i,n)/(i−1)!; at n=0 it is the Newton polynomial in ordinary Chern classes divided by i!. The total character respects products and rational Adams weights and identifies the rational weight-j summand from M.6.

**Hypotheses and conventions.**

- i≥1 for positive-degree displayed normalization; weight zero at K₀ is rank; smooth quasi-projective scheme class from the cited theorem.

**Construction or proof.**

1. Construct integral universal classes by the projective-bundle relation of Theorem 11.11, with Whitney and splitting-principle proof. Import the existing γ-graded character for K₀ from S.7 rather than redefine γ operations.
2. Rationalize the universal primitive classes with the displayed normalization. Compare the resulting rational operation with the layer equivalence and Adams eigenspaces in M.6; product compatibility uses the actual filtered product.
3. The motivic class is integral but the normalized character generally is rational. No inverse factorial is asserted integrally or at a prime dividing that factorial.

**Direct prerequisites.** [MotivicEtaleKTheory:M.6/rational-weight-comparison](#m-6-rational-weight-comparison), [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/projective-bundle-formula](#m-4-projective-bundle-formula), `SchemeKTheoryOperations:S.7/gamma-chern-character`, `SchemeKTheoryOperations:S.7/grothendieck-riemann-roch`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.motivicChern_positive** (simp): For n>0, (i−1)! ch_(i,n)=(−1)^(i−1)c_(i,n) after rationalization.
- **TauCeti.MotivicEtale.motivicChern_product** (compatibility): ch_i(xy)=Σ_(a+b=i) ch_a(x)∪ch_b(y), with degrees 2a−m and 2b−n adding to 2i−m−n.
- **TauCeti.MotivicEtale.motivicChern_weight** (characterisation): On K_m(X)_Q^(j), ch_j is the M.6 weight-j comparison and ch_i=0 for i≠j.

**Discriminating tests.**

- **motivicChern_test_rank** (degenerate): At m=i=0, ch₀ is rank.
- **motivicChern_test_line** (computation): For a line bundle L, ch_i([L])=c₁(L)^i/i!.
- **motivicChern_test_milnor** (compatibility): The normalized degree-i character sends a Milnor symbol to itself in H_M^i(F,Q(i)); the integral Chern class retains (−1)^(i−1)(i−1)!.

**Consumers.**

- MotivicEtaleKTheory:M.8: Supplies the regulator source and the rational weight projection.
- PeriodsAndSpecialValues:PS.0: Provides rational motivic classes with explicit normalization.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Theorem 11.11, Examples 11.12, Lemma 11.13 and its proof, pp.457–459. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-8-supported-cycle-character"></a>

### M.8/supported-cycle-character — Supported cycle Chern character

**Theorem.** Identifier: `MotivicEtaleKTheory:M.8/supported-cycle-character`. Implementation: unchecked.

Let 𝒳 be regular, proper and flat over O_K with smooth generic fibre, and let ℓ be invertible in its residue characteristic. The supported Gillet cycle-character map cl gives F^dK₀^Z(𝒳)→H_Z^(2d)(𝒳,Q_ℓ(d)); on the generic fibre X the map agrees with the refined étale cycle class of a codimension-d cycle, by Lemma B.6. The lemma is not asserted for arbitrary vertical cycles on 𝒳. Supported products land in Z₁∩Z₂ and weight d₁+d₂, with the refined intersection/Gysin compatibility. This is the exact Appendix-B input of Li–Liu, not an unnormalized ordinary c_d.

**Hypotheses and conventions.**

- Admit the support intersections and refined Gysin morphisms of the source; rational coefficients for γ-filtration multiplication; no universal singular-scheme Riemann–Roch.

**Construction or proof.**

1. Import the support K₀ filtration and finite-perfect operations from S.3/S.7. Construct the supported character using Gillet’s twisted duality theory and Li–Liu’s S_Z pairings.
2. Use Li–Liu Lemma B.6 on the generic fibre to identify cycle realization; footnote 22 proves the support intersection product via S_(Z₁∩Z₂)=S_Z₁∧S_Z₂ and ΩBQP multiplication.
3. Gillet Definition 2.34(ii), Theorem 3.1 and §2.35 and Gillet–Soulé Proposition 5.5 remain precise unread-source proof gaps, not inferred from the Li–Liu application.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/motivic-chern-character](#m-8-motivic-chern-character), `SchemeKTheoryOperations:S.3`, `SchemeKTheoryOperations:S.7/scheme-gamma-filtration`, `SchemeAndStackFoundations:SF.5`, [MotivicEtaleKTheory:M.4/purity-gysin-triangle](#m-4-purity-gysin-triangle), [MotivicEtaleKTheory:M.4/localization-sequence](#m-4-localization-sequence), [MotivicEtaleKTheory:M.4/products](#m-4-products)

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[LiLiu2021](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Appendix B, pp.57–62, Lemma B.6 and footnote 22. Routed supported character and refined cycle-class application, including the supported product explanation.

<a id="m-8-deligne-regulator"></a>

### M.8/deligne-regulator — Deligne regulator

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/deligne-regulator`. Implementation: unchecked.

For smooth projective X/C, use the genuine Deligne complex Z(j)_D=[Z(j)→O_X→Ω_X¹→⋯→Ω_X^(j−1)] with Z(j)=(2πi)^j Z in degree zero. Realization of the motivic class defines c_D:K_m(X)→H_D^(2j−m)(X,Z(j)); composing the normalized rational character gives r_D:K_m(X)⊗Q→H_D^(2j−m)(X,Q(j)), and its real version. For nonproper X use the logarithmic mixed-Hodge Deligne–Beilinson complex supplied by the Hodge owner, not ordinary analytic Deligne cohomology.

**Hypotheses and conventions.**

- j≥1; m≥0; the displayed simple complex applies to proper smooth X; open varieties require a good compactification and the logarithmic/mixed-Hodge comparison.

**Construction or proof.**

1. Import Deligne/mixed-Hodge complexes and their product/real structures; construct the multiplicative motivic realization before taking cohomology.
2. Compose the integral or rational motivic classes with this realization, keeping the 2πi lattice and the distinction between integral c_D and rational r_D.
3. For a good compactification j:X→X̄ with normal-crossings boundary D, use cone(Rj_*Λ(j)⊕F^jΩ_X̄(log D)→j_*Ω_X)[−1], map (r,f)↦r−f. Independence of compactification and the general motivic realization require the Hodge/MC.2 supplier and unread Huber proof. Burgos §10.1 supplies the cone and point calculation.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/motivic-chern-character](#m-8-motivic-chern-character), `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`, `MotivesAndAlgebraicCycles:MC.2`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.deligneRegulator_natural** (compatibility): Pullback of admitted smooth varieties commutes with r_D.
- **TauCeti.MotivicEtale.deligneRegulator_product** (compatibility): The total rational r_D carries K products to Deligne cup products with the same weight/degree sum as ch.
- **TauCeti.MotivicEtale.deligneRegulator_real** (compatibility): For X over R, descent is through conjugation on the Tate lattice and forms; conjugation acts on R(j) by (−1)^j.

**Discriminating tests.**

- **deligneRegulator_test_point** (computation): For Spec C and j≥1, H_D¹(C,R(j))=C/(2πi)^jR.
- **deligneRegulator_test_integral_point** (non-example): H_D¹(C,Z(j))=C/(2πi)^jZ; replacing this by the real quotient destroys the integral lattice.
- **deligneRegulator_test_line** (compatibility): For a line bundle on a smooth projective curve, c_D maps under Betti realization to the ordinary integral first Chern class.

**Consumers.**

- BorelRegulators:R.7: Receives the independent early universal Deligne character.
- PeriodsAndSpecialValues:PS.0: Receives normalized real/rational regulator maps before analytic comparisons.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Example 11.12(3), p.458. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

[Burgos2002](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §10.1, Definition 10.1, equations (10.2)–(10.5), Definitions 10.3 and Examples 10.4–10.5, pp.89–92. Gives the actual logarithmic Deligne–Beilinson cone and its real descent; not just an ordinary analytic complex for open X.

<a id="m-8-number-field-deligne-normalization"></a>

### M.8/number-field-deligne-normalization — Number-field Deligne normalization

**Theorem.** Identifier: `MotivicEtaleKTheory:M.8/number-field-deligne-normalization`. Implementation: unchecked.

For a number field F and j≥2, identify H_D¹(F⊗R,R(j)) with (∏_(σ:F→C)R(j−1))^conjugation using C/R(j)≃R(j−1) and the conjugate pairing. The universal rational K_(2j−1) character is the normalized suspension of the universal topological Chern character, ch_j=(2πi)^j pr_j/j! before suspension. The simplicial first-infinitesimal-diagonal realization, Adams weight, products and embeddings commute with this map. This export has no R.7 or D2 prerequisite.

**Hypotheses and conventions.**

- pr_j is the primitive Newton class with the stated topological normalization; after positive-degree suspension the relation is the (j−1)! normalization of the preceding node. j≥2; no Borel analytic normalization assumed.

**Construction or proof.**

1. Use Burgos (10.2) and Examples 10.4–10.5 to identify point Deligne cohomology and take conjugation invariants across all embeddings.
2. The universal class is the unique Deligne lift of ch_j under (10.10). Apply simplicial evaluation ev to B•GL(C)^δ and the plus-space Hurewicz pairing of Definition 10.7, then the embedding product of Definition 10.8. Remark 4.25 fixes suspension and the (j−1)! factor.
3. For the infinitesimal-diagonal interface, use the squared identity ideal J in §10.4, normalize its cosimplicial structure, and import the general differential/Weil algebra identifications from §§8.1–8.3. The original general Weil-algebra comparison proof remains with its supplier; the displayed real/complex diagram pins the map. This construction precedes the Borel factor-two theorem.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/deligne-regulator](#m-8-deligne-regulator), [MotivicEtaleKTheory:M.8/motivic-chern-character](#m-8-motivic-chern-character), `GeneralAlgebraicKTheory:K.2`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Burgos2002](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §4.4, Remark 4.25; §10.1 Examples 10.4–10.5; §§10.2–10.4 through the diagram on p.97. Direct early definition from the universal Deligne class, point quotient, simplicial evaluation and Hurewicz map; no Borel comparison used.

<a id="m-8-chern-functoriality"></a>

### M.8/chern-functoriality — Chern realization functoriality

**Theorem.** Identifier: `MotivicEtaleKTheory:M.8/chern-functoriality`. Implementation: unchecked.

The motivic and Deligne rational total Chern characters commute with admitted pullbacks and are multiplicative. Finite integral étale Chern classes commute with pullbacks and satisfy the universal Chern product identities; an individual finite Chern class is not a multiplicative character, and factorial denominators cannot be inverted in arbitrary finite coefficients. For a smooth codimension-c immersion the supported realization maps intertwine localization residues with the boundary H^a(U,B(j))→H^(a−2c+1)(Z,B(j−c)). Finite étale transfers use cohomological traces; the integral universal Chern formulas retain their normalization. For K₀ on the smooth projective schemes admitted by S.7, rational proper pushforward uses its GRR formula with Todd correction. No general higher proper regulator RR theorem is supplied by that K₀ result. Rational Adams ψ^a acts on weight j by a^j.

**Hypotheses and conventions.**

- Use only existing support/purity and coherent realization morphisms; finite coefficients retain the product regime m odd or 8|m; Deligne uses the admitted scheme class.
- Finite higher Chern classes have positive K-degree and positive weight; rational character multiplicativity is a statement about the total character. Proper GRR is restricted to the source-scoped K₀ smooth projective setting.

**Construction or proof.**

1. Construct the maps at the support-spectrum/cohomology-complex level before passing to groups, so naturality and localization boundaries are visible.
2. Apply the universal Chern product polynomial to finite integral classes. After rational normalization apply the total-character product formula. Use supported characters and S.7 K₀ GRR only in its smooth projective range, retaining its Todd correction; do not infer higher proper RR. Check the localization shift and twist separately.
3. The full coherent boundary comparison is requested from M.4/MC.2/SF.5; it is not inferred merely from naturality on group homomorphisms.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/finite-etale-chern](#m-8-finite-etale-chern), [MotivicEtaleKTheory:M.8/motivic-chern-character](#m-8-motivic-chern-character), [MotivicEtaleKTheory:M.8/deligne-regulator](#m-8-deligne-regulator), [MotivicEtaleKTheory:M.8/supported-cycle-character](#m-8-supported-cycle-character), [MotivicEtaleKTheory:M.7/etale-k-transfer](#m-7-etale-k-transfer), `SchemeKTheoryOperations:S.7/grothendieck-riemann-roch`, [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/products](#m-4-products), [MotivicEtaleKTheory:M.4/projective-bundle-formula](#m-4-projective-bundle-formula), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Theorem 11.11 proof, pp.458–459. The rational total character and its proof justify rational multiplicativity; they do not make the unnormalized finite Chern classes multiplicative.

[LiLiu2021](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Appendix B, footnote 22. Supported pairings supply the exact product support; general proper comparison remains with the GRR owner.

<a id="m-8-integral-motivic-structures"></a>

### M.8/integral-motivic-structures — Integral motivic structures

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/integral-motivic-structures`. Implementation: unchecked.

For a specified regular arithmetic model 𝒳 with generic fibre X, retain H_Z=H_M^a(𝒳,Z(j)), the subgroup I=im(H_Z→H_M^a(X,Z(j))), its torsion-free quotient L=I/I_tors, and the rational integral part I_Q=im(H_Z⊗Q→H_M^a(X,Q(j))). A regulator lattice is the image of L in a real or ℓ-adic realization after proving finite generation and injectivity in the specified case. No integral part is defined as the entire rational space by default.

**Hypotheses and conventions.**

- Model 𝒳 and the restriction/realization map are part of the data; lattice claims require finite generation and torsion-kernel/injectivity facts. Number-field positive-weight cases import arithmetic finiteness and Borel rank; arbitrary motives do not.

**Construction or proof.**

1. Use the existing motivic groups, restriction, torsion subgroup and rationalization to form image, quotient and scalar-extension image.
2. Separate the integral group, torsion-free abelian group and rational vector-space image. Apply the case-specific finiteness/rank theorem only when constructing a lattice.
3. Regulators kill torsion in characteristic-zero vector spaces; this does not identify two integral groups that differ by torsion. Model dependence is preserved until localization proves independence.

**Direct prerequisites.** [MotivicEtaleKTheory:M.4/cycle-complex](#m-4-cycle-complex), [MotivicEtaleKTheory:M.4/nesterenko-suslin-totaro](#m-4-nesterenko-suslin-totaro), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality), `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `BorelRegulators:R.4/regulator-lattice`, `mathlib:CommGroup.torsion`, `mathlib:QuotientGroup.mk'`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.integralStructures_image** (characterisation): I is the image of model restriction and I_Q is its scalar-extension image in rational generic-fibre cohomology.
- **TauCeti.MotivicEtale.integralStructures_torsion** (characterisation): The map I→L has kernel exactly I_tors; a characteristic-zero regulator factors through L.
- **TauCeti.MotivicEtale.integralStructures_lattice** (compatibility): In the stated finite-generation and injectivity case, L is a free finite-rank Z-lattice in its rational span.

**Discriminating tests.**

- **integralStructures_test_torsion** (degenerate): If I=Z/m, then L=0 and I_Q=0 although I is nonzero for m>1.
- **integralStructures_test_free** (computation): For I=Z^r embedded in Q^r, L=Z^r and I_Q=Q^r.
- **integralStructures_test_index** (non-example): The images Z and 2Z in Q have the same rational integral part and different integral lattices; rational equality does not determine covolume.

**Consumers.**

- BorelRegulators:R.4: Provides the integral/torsion/rational dictionary for regulator lattices.
- PeriodsAndSpecialValues:PS.4: Provides the actual integral line entering determinant and period comparisons.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

[Kbook2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §8 Theorems 8.2–8.3, pp.513–514. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

<a id="m-8-tate-elliptic-realization-dictionary"></a>

### M.8/tate-elliptic-realization-dictionary — Tate and elliptic realization dictionary

**Application.** Identifier: `MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary`. Implementation: unchecked.

Use the motive and realization exports for Q(j) and h¹(E)(j) of an elliptic curve E over a number field F, with cohomological variance. At an unramified good place v, q=Nv, geometric Frobenius on Q_ℓ(j) has Euler polynomial 1−q^(−j)T, and on H¹_et(Ē,Q_ℓ)(j) it has 1−a_v q^(−j)T+q^(1−2j)T², where a_v=q+1−|E(k_v)|. Integral Tate lattices and elliptic ℓ-adic lattices, Betti/de Rham realizations and their comparison maps are imported; dual homological T_ℓE has the corresponding dual Frobenius convention.

**Hypotheses and conventions.**

- ℓ≠residue characteristic, good reduction for E; specify geometric Frobenius throughout this node; j integer. Bad-place factors require the existing inertia/local-comparison owner and are not replaced by the good-place polynomial.

**Construction or proof.**

1. Import Tate and pointed-curve projectors/realizations from MC.1–MC.2; specialize them, rather than reconstruct motives or elliptic curves.
2. Use finite-field point counts and smooth proper base change to compute geometric Frobenius on H¹; twist multiplies eigenvalues by q^(−j).
3. Export this realization dictionary to the Euler-system and determinant nodes. Never infer a Chow equality or a numerical-motive realization from equality of ℓ-adic characteristic polynomials.

**Direct prerequisites.** `MotivesAndAlgebraicCycles:MC.1`, `MotivesAndAlgebraicCycles:MC.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, [MotivicEtaleKTheory:M.1/finite-tate-twist](#m-1-finite-tate-twist), [MotivicEtaleKTheory:M.1/adic-tate-twist](#m-1-adic-tate-twist), `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `EtaleDualityAndPerverseSheaves:EDC.2:pairings`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §2.1, example following (2.1.5), pp.167–168. Supplies motive/realization conventions only. The good-place Euler polynomials require the elliptic Frobenius, Tate-twist and scheme base-change exports named in the prerequisites; Kato does not prove those polynomials here.

<a id="m-8-norm-compatible-regulator-families"></a>

### M.8/norm-compatible-regulator-families — Norm-compatible regulator families

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/norm-compatible-regulator-families`. Implementation: unchecked.

Given a directed tower of admitted finite extensions F_n/F and finite coefficient levels with actual compatible K-theory norm maps, form the subgroup of ∏_n K_m(O_(F_n,S_n);Z/p^n) of families x_n satisfying coefficient reduction followed by norm equals x_n. The levelwise étale Chern/regulator maps induce a map to the corresponding continuous-cohomology inverse limit, with corestriction on the cohomology side. For cyclotomic units u_n and compatible roots ζ_n, Soulé’s x_n=N_n(u_n β_n^(i−1)) gives the explicit K_(2i−1) family for i≥1.

**Hypotheses and conventions.**

- For the explicit Soulé product family p is odd, all ramified primes are included in S_n, and finite-coefficient products have the actual coherence supplied by H.6. Use the cofinal levels p^n outside {2,3,4,8}; for p=3 start at n≥2 and obtain level one by reduction. The norm/coefficient square is supplied by the generic K-transfer owner. Retain derived completion/lim¹ when interpreting a homotopy group of the inverse-limit spectrum.

**Construction or proof.**

1. Use the supplier inverse-limit/coefficient and transfer APIs; define the equalizer of the norm/reduction transition maps on the product of actual K groups.
2. Apply the finite Chern maps and the norm/corestriction square levelwise. Their compatibility produces the continuous-cohomology family.
3. For Soulé’s construction, the projection formula and β_(n+1) reducing to β_n reduce the norm identity to norm coherence of u_n. This is a specific family construction, not a theorem of existence of every desired Euler system. Construct powers on the cofinal admissible coefficient levels and use reduction to define the remaining levels, rather than assuming a coherent unital Moore product at every n.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/finite-etale-chern](#m-8-finite-etale-chern), [MotivicEtaleKTheory:M.7/etale-k-transfer](#m-7-etale-k-transfer), `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `EulerSystemsCyclotomicMainConjecture:L0`, `StableHomotopyKTheory:H.6/moore-spectrum-multiplication`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.normFamilies_projection** (constructor): The level-n projection of a compatible family is x_n and satisfies norm(reduce x_(n+1))=x_n.
- **TauCeti.MotivicEtale.normFamilies_regulator** (compatibility): At every level the regulator of the family is the regulator of its level component, and transitions are corestrictions.
- **TauCeti.MotivicEtale.normFamilies_soule** (simp): The Soulé family in degree 2i−1 is N_n(u_n β_n^(i−1)), with c_(i,2i−1) retaining its higher-Chern normalization.
- **TauCeti.MotivicEtale.souleFamily** (constructor): Given the specified levelwise norm of unit/Bott powers and their projection-formula transition compatibility, construct that particular norm-compatible family; it is not an arbitrary element of the equalizer.

**Discriminating tests.**

- **normFamilies_test_constant** (degenerate): For the constant identity-transition tower A_n=A, compatible families identify with A.
- **normFamilies_test_degree** (computation): For i=1 the Soulé construction is the norm-compatible unit family in K₁; for i=2 its degree is K₃.
- **normFamilies_test_transfer** (compatibility): For an unramified finite extension the regulator transition square is the actual K norm versus cohomological corestriction; using restriction on both sides fails it.

**Consumers.**

- MotivicEtaleKTheory:M.8: Provides regulator images of concrete K-theory norm families.
- SelmerIwasawaCohomology:L4: Receives the cohomological family together with its norm relations.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Soule1987](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), §4.1–§4.4, printed pp.238–240. Explicit compatible-unit and Bott construction; its normalization and projection formula determine the K-degree.

<a id="m-8-euler-factor-regulator-compatibility"></a>

### M.8/euler-factor-regulator-compatibility — Euler-factor regulator compatibility

**Theorem.** Identifier: `MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility`. Implementation: unchecked.

If a K-theory family satisfies N_(Mv/M)(x_(Mv))=P_v(Fr_v^(−1))x_M for its actual coefficient/Adams Galois action and the declared local Euler polynomial, its étale regulator image satisfies the identical corestriction relation. The Tate and elliptic polynomials are those of the realization dictionary; a plain norm-compatible family is only the case P_v=1 and does not automatically become an Euler system.

**Hypotheses and conventions.**

- The Euler relation is supplied as a hypothesis from the existing Euler-system owner. Geometric/arithmetic Frobenius and dualization conventions must be reconciled explicitly; the inverse in the relation is not silently changed.

**Construction or proof.**

1. Use the finite-level norm/regulator square and the Galois/Adams equivariance of the realization maps; pass the polynomial through the map term by term.
2. Pass to inverse limits only using the specified transition system. Package the exported relation for the L4 Euler-system construction, without redefining its generic notion.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/norm-compatible-regulator-families](#m-8-norm-compatible-regulator-families), [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality), [MotivicEtaleKTheory:M.7/etale-adams-weights](#m-7-etale-adams-weights), `SelmerIwasawaCohomology:L4`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §2.1, after (2.1.5), p.167. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

[Soule1987](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), §4.1–§4.4, pp.238–240. The explicit unit/Bott norm family supplies the concrete compatibility test, not arbitrary elliptic Euler-system existence.

<a id="m-8-selmer-regulator-factorization"></a>

### M.8/selmer-regulator-factorization — Selmer regulator factorization

**Comparison.** Identifier: `MotivicEtaleKTheory:M.8/selmer-regulator-factorization`. Implementation: unchecked.

For a chosen Tate or elliptic realization V with integral lattice T, a global regulator class in H¹(G_(F,S),V) factors through the existing Selmer group exactly after proving its localizations satisfy the selected local conditions. At v∤p use the unramified condition when the class extends over O_v; at v|p the Bloch–Kato finite/geometric condition is imposed in the p-adic Hodge regime admitted by D2–D5. Give the induced map of the existing Selmer mapping-fibre complexes before using determinant functoriality.

**Hypotheses and conventions.**

- The local comparison theorem and local conditions are supplied, not inferred merely from being a motivic class. Integral and rational local conditions are distinguished, and real places use the chosen ordinary/modified convention.

**Construction or proof.**

1. Import the genuine L2 Selmer complex and L4 local/Euler-system APIs. At every place use supported localization and the selected realization comparison to prove membership.
2. Assemble the local homotopies into a map of mapping-fibre complexes; taking H¹ gives the factorization. Its determinant is reserved for the following conditional comparison.
3. The full local p-adic proof is a supplier request/gap. No generic Selmer complex or Bloch–Kato condition is redefined here.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality), `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L4`, `PadicHodgeRegulators:D.2`, `PadicHodgeRegulators:D.3`, `PadicHodgeRegulators:D.5`, `PadicHodgeRegulators:L1`, `SelmerIwasawaCohomology:L2/unramified-condition`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Supplies conditional period and p-adic realization conventions only, not a proof that regulator classes meet every local Selmer condition. Those local proofs are requested from D.2/D.3/D.5/L1.

<a id="m-8-arithmetic-fundamental-line"></a>

### M.8/arithmetic-fundamental-line — Arithmetic fundamental line

**Construction.** Identifier: `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`. Implementation: unchecked.

For the supplied perfect compactly supported arithmetic cohomology complex C_c(T) over Z_p (or the supplied coefficient order), set Δ_p(T)=det^(−1) C_c(T) using the determinant functor from PadicMeasuresIwasawaAlgebras:L5. Retain its integral invertible module, rationalization and base-change/triangle isomorphisms. For a Tate or elliptic motive, the rational fundamental line and its Betti/de Rham/K-theory factors are the exact chosen period-line construction of PS.4; comparison maps/trivializations are separate data. The Tamagawa-number statement asks for a rational zeta element whose p-adic image is a basis of Δ_p(T) and whose real-period image is the specified leading L-value, with all finiteness and realization assumptions explicit.

**Hypotheses and conventions.**

- Perfectness, boundedness and coefficient-ring hypotheses supplied by determinant/cohomology owners; no unconditional existence of zeta elements or solution of the Tamagawa conjecture. The rational/real comparison can itself require conjectural motivic finiteness or regulators.

**Construction or proof.**

1. Import compact cohomology and determinant lines, then apply det^(−1) with the source’s sign convention. Base change and localization use the existing determinant functor, not a dimension count.
2. Import the rational fundamental line together with the selected realization isomorphisms; retain an actual proposed element and ask whether it is an integral basis and has the predicted real image.
3. State the conjecture as an arithmetic condition in the reader; the suggested file prototypes the line and actual elements/maps and omits the currently unavailable analytic L-value condition.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), [MotivicEtaleKTheory:M.8/integral-motivic-structures](#m-8-integral-motivic-structures), `PadicMeasuresIwasawaAlgebras:L5`, `PeriodsAndSpecialValues:PS.4`, `SelmerIwasawaCohomology:L2`, `ArithmeticGaloisDuality:D7`, `mathlib:PadicInt`, `mathlib:PadicInt.isUnit_iff`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Planning API.**

- **TauCeti.MotivicEtale.fundamentalLine_baseChange** (compatibility): Derived coefficient base change induces the supplied determinant-line isomorphism on Δ_p.
- **TauCeti.MotivicEtale.fundamentalLine_triangle** (structure): A distinguished triangle gives the supplied tensor-product determinant isomorphism with the inverse-determinant convention.
- **TauCeti.MotivicEtale.fundamentalLine_basis** (characterisation): An element z is an integral basis precisely when the multiplication map Z_p→Δ_p(T), a↦a z, is an isomorphism; rational nonzero is weaker.

**Discriminating tests.**

- **fundamentalLine_test_zero** (degenerate): For the zero perfect complex the determinant and inverse determinant are the coefficient ring.
- **fundamentalLine_test_shift** (compatibility): Shifting a perfect complex by one dualizes its determinant line.
- **fundamentalLine_test_nonunit** (non-example): In the line Z_p, the nonzero element p becomes a rational basis but is not an integral basis.

**Consumers.**

- PeriodsAndSpecialValues:PS.4: Receives the specialized integral and rational comparison lines.
- SelmerIwasawaCohomology:L4: Relates Euler/zeta elements to the specialized determinant line, conditionally.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §1.2 and §2.1 equations (2.1.1)–(2.1.5), pp.165–168. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

<a id="m-8-regulator-determinant-comparison"></a>

### M.8/regulator-determinant-comparison — Regulator determinant comparison

**Comparison.** Identifier: `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`. Implementation: unchecked.

For the admitted number-field Tate cases, compare the early Deligne regulator with the existing Borel regulator using R.7’s explicit factor-two normalization, and transport the actual integral lattice/determinant comparison from R.4. For Tate and elliptic realizations with the required Selmer, p-adic Hodge, motivic-finiteness and period comparison inputs, the induced determinant maps identify the specialized rational fundamental line with the real period line and Δ_p(T)⊗Q_p. This is a conditional infrastructure comparison, not the Tamagawa-number conjecture.

**Hypotheses and conventions.**

- All required comparison isomorphisms, perfectness and finiteness hypotheses listed; R.7 is used only here, downstream of the early Deligne export. Integral basis statements also require the integral local/Tamagawa factors.

**Construction or proof.**

1. Use the named R.7 comparison rather than identify Borel and Deligne normalizations by fiat. Keep rational span, torsion-free lattice and covolume data separate.
2. Apply the determinant functor to the supplied regulator map of Selmer/realization complexes and the PS.4 period comparison; check localization triangles, twists and duals.
3. An isomorphism of rational one-dimensional spaces does not prove an integral-basis claim. Record the Tamagawa leading-value/basis condition separately in the arithmetic fundamental-line node.

**Direct prerequisites.** [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](#m-8-number-field-deligne-normalization), [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line), [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), `BorelRegulators:R.7/regulator-factor-two`, `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.4/regulator-transfer`, `BorelRegulators:R.4/regulator-determinant`, `PeriodsAndSpecialValues:PS.4`, `PadicMeasuresIwasawaAlgebras:L5`

**Proposed library location.** `TauCeti/Algebra/KTheory/MotivicEtale`, namespace `TauCeti.MotivicEtale`.

**Acceptance.**

- Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

**Sources.**

[Kato2003](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

### Remaining work for M.8

- Read/refine Gillet/Gillet–Soulé supported character and Huber general motivic Deligne realization; supply logarithmic compactification independence.
- Resolve actual Tate/elliptic realization, local Selmer and D.2/D.5 regulator comparisons with precise regime/finiteness hypotheses.
- Supply L5 determinants and PS.4 fundamental lines/period maps; refine the conditional integral comparison and the Tamagawa statement without asserting existence of a zeta element.
- Repair remaining eigenspace and norm-family tests/signatures; synchronize the reader with finite Chern product versus rational character conventions; resolve the PS.4/PS.3 dependency prefix.

## Gaps and unresolved supplier contracts

There are 21 gap records and 52 unresolved request records. A precise import identifies a planned supplier, not an implemented theorem. The resolution-free step occurs in both parts of the norm-residue proof; it is one shared proof obligation with two consuming records. The M.5d review findings also remain open where the companion file lists omitted signatures.

### Gaps from part M.1

#### General n-fold Pfister forms: hyperbolicity of isotropic Pfister forms and the Elman–Lam symbol criterion

For a field k of characteristic ≠ 2 and every n ≥ 1, M.5b/pfister-norm-variety uses: (a) n-fold Pfister forms are round, so an isotropic n-fold Pfister form ⟨⟨a_1, …, a_n⟩⟩ is hyperbolic; (b) ⟨⟨a_1, …, a_n⟩⟩ is hyperbolic if and only if the symbol {a_1, …, a_n} vanishes in K^M_n(k)/2 (one direction is Elman–Lam's theorem that isometric n-fold Pfister forms have equal symbols in K^M_n(k)/2, J. Algebra 23 (1972); the other uses Milnor's homomorphism K^M_n(k)/2 → I^n/I^{n+1} and the Arason–Pfister Hauptsatz); (c) the Pfister neighbour ⟨⟨a_1, …, a_{n−1}⟩⟩ ⊥ ⟨−a_n⟩ is isotropic over an extension field exactly when ⟨⟨a_1, …, a_n⟩⟩ is. QuadraticFormInvariants Layer 4 proves (a) only for n ≤ 2 and explicitly excludes the general theory; neither library has Pfister forms, and no atlas roadmap owns these statements. It needs a 'QuadraticFormInvariants, Part II: Pfister forms' roadmap or an owner in an existing one.

**Consumers:** [MotivicEtaleKTheory:M.5b/pfister-norm-variety](#m-5b-pfister-norm-variety)

#### Tate's global theorems for global function fields

Tate proves (5.1), (5.4), (6.1)-(6.3), (6.5) for every global field with ℓ ≠ char F. The function-field case needs global class field theory for function fields (Brauer–Hasse–Noether, reciprocity and Kummer duality for Lemma (5.2)), the tame-kernel sequence (5.3) for S-integers of a function field, and the Bass–Tate finiteness of Ker d^S (order prime to p). ClassFieldTheory excludes global function fields, K2SymbolsBrauer T.5 and ArithmeticKTheory N.3:ranks are stated for number fields; ArithmeticKTheory N.3:finite-generation/function-field-steinberg-finiteness may supply the finiteness. The M.3 nodes are stated for number fields. FunctionFieldArithmetic FA.4 plans local and global class field theory for function fields; its Brauer–Hasse–Noether sequence is the class-field input to request when the function-field nodes are planned.

**Consumers:** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/tate-torsion-symbols](#m-3-tate-torsion-symbols), [MotivicEtaleKTheory:M.3/tate-picard-sequence](#m-3-tate-picard-sequence), [MotivicEtaleKTheory:M.3/tate-gamma-kernel](#m-3-tate-gamma-kernel)

#### Homotopy invariance of the Picard group of a regular scheme

Bloch's computation of z^1(X, •) needs Pic(X × 𝔸^n) = Pic(X) for X regular (for example smooth over a field), equivalently Cl(X × 𝔸^1) = Cl(X) for X noetherian, integral, separated and locally factorial (Hartshorne II.6.6 with II.6.16). Neither library has it and no planned node states it; Tau Ceti has line-bundle classes (TauCeti.AlgebraicGeometry.LineBundleClass) and Weil divisors on schemes, and SchemeAndStackFoundations SF.5 (Chow groups) is the natural owner. The units part O^×(X × 𝔸^n) = O^×(X) for reduced X is Mathlib's description of units of a polynomial ring.

**Consumers:** [MotivicEtaleKTheory:M.4/weight-zero-and-one](#m-4-weight-zero-and-one)

#### The unstable pointed A¹-homotopy category, motivic Eilenberg–MacLane spaces and their motives

RPO constructs the total power operation in the pointed A¹-homotopy category H_•(k) of simplicial Nisnevich sheaves on Sm/k (Morel–Voevodsky), with H̃^{p,q}(F_•, A) = Hom_{H_•(k)}(F_•, K(p, q, A)), the A¹-equivalences K_{n,R} → K(2n, n, R) of RPO Theorem 2.1 and the geometric classifying spaces BG = colim Ṽ_n/G of RPO §6. No node of M.5a or of any other packet plans these (M.5a plans DM^{eff,−}, which is stable and additive, so it cannot carry the non-additive l-th power). The natural owner is MotivicEtaleKTheory M.5a, whose stage text includes A¹-localisation and motivic homotopy prerequisites. Voevodsky 2011 Theorem 2.1 (uniqueness of the operation φ_{l−1}) uses [11, Theorem 3.74]: over a field of characteristic 0 the motive of the motivic Eilenberg–MacLane space K(ℤ/l(m), 2m) is a direct sum of Tate motives (giving the Künneth isomorphism of Lemma 2.3), and §3 extends operations to simplicial sheaves using [10]. Neither is planned in any roadmap or in the libraries. Read Voevodsky, 'Motivic Eilenberg–MacLane spaces', Publ. Math. IHÉS 112 (2010) §3, and 'Simplicial radditive functors', J. K-Theory 5 (2010), and plan them as M.5b or M.5c nodes.

**Consumers:** [MotivicEtaleKTheory:M.5b/motivic-steenrod-operations](#m-5b-motivic-steenrod-operations), [MotivicEtaleKTheory:M.5c/symmetric-power-operation](#m-5c-symmetric-power-operation), [MotivicEtaleKTheory:M.5c/rost-motive](#m-5c-rost-motive)

#### Algebraic cobordism and the Levine–Morel degree formulas

Rost's DN theorem (Haesemeyer–Weibel Theorem A.1) uses Levine–Morel's algebraic cobordism Ω_*(k) over a field of characteristic 0 with Ω_*(k) ≅ 𝕃_* (the Lazard ring), the generalised degree formula (Levine–Morel Theorem 4.4.15) and the higher degree formula (Theorem 4.4.24), Quillen's theorem MU_{2*} ≅ 𝕃_*, and the localisation theorem for fixed points in complex cobordism (Haesemeyer–Weibel A.10). No roadmap of the atlas plans algebraic or complex cobordism.

**Consumers:** [MotivicEtaleKTheory:M.5b/dn-degree-theorem](#m-5b-dn-degree-theorem)

#### Voevodsky's degree map for smooth projective varieties and the lemmas on motives over embedded simplicial schemes

Voevodsky 2011 §4 uses the stable normal bundle V and the morphism τ : T^N → Th_X(V) defining the degree map, from Voevodsky, 'Motivic cohomology with ℤ/2-coefficients' (Publ. Math. IHÉS 98, 2003), motivic duality for smooth projective varieties in characteristic 0, and Lemmas 6.9 and 6.11 of Voevodsky, 'Motives over simplicial schemes' (M(𝒳̃) ⊗ M(X) = 0 and the factorisation π_𝒳). The embedded simplicial schemes themselves are M.5b/cech-simplicial-scheme; the remaining inputs have no node.

**Consumers:** [MotivicEtaleKTheory:M.5b/degree-theorem](#m-5b-degree-theorem)

#### Resolution-free step and homotopy purity in MCZ2 §6

The proof of MCZ2 Theorem 6.6 passes from fields to smooth schemes by 'the analog of [8, Theorem 1.1] for ℚ/ℤ_(l)-coefficients' (Geisser–Levine, The Bloch–Kato conjecture and a theorem of Suslin–Voevodsky, J. reine angew. Math. 530 (2001)); this is the same input as the sibling packet's gap 'Resolution-free Beilinson–Lichtenbaum input', and it is needed upstream, inside the M.5c induction. Lemma 6.13 uses the Morel–Voevodsky homotopy purity theorem; MotivesAndAlgebraicCycles MC.4/gysin-triangle supplies it only over fields with resolution of singularities (enough for the characteristic-0 induction, not for positive characteristic).

**Consumers:** [MotivicEtaleKTheory:M.5c/hilbert-ninety-implies-beilinson-lichtenbaum](#m-5c-hilbert-ninety-implies-beilinson-lichtenbaum)

### Supplier requests from part M.1

#### M.1 request 1 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

ProfiniteCohomology Layer 9 for a field F and m with IsUnit (m : F) and NeZero m: the Kummer isomorphism kummerIso : F^×/(F^×)^m ≅ H¹(G_F, μ_m) (its surjectivity is profinite Hilbert 90; the injective kummerMap and ker_kummerMap are at the pin), the canonical form kummerMapCanonical with explicitIso_kummerMap, h2KummerToUnits (H²(G_F, μ_m) injects into H²(G_F, (F^s)^×) with image its m-torsion), and, for a finite separable E/F with a chosen F-embedding E → F^s, the squares kummerIso_res (restriction against F^×/m → E^×/m) and kummerIso_norm (corestriction against the norm N_{E/F}) with galoisSubgroup and galoisSubgroup_index = [E : F]. M.1/etale-kummer-sequences uses kummerIso and h2KummerToUnits for X = Spec F; M.3/cohomological-steinberg uses kummerIso_res, kummerIso_norm and galoisSubgroup in the norm argument, and M.3/galois-symbol, symbol-norm-compatibility, tate-adic-comparison and tate-injectivity-criterion use kummerIso_res and kummerIso_norm; M.5c/galois-symbol-all-degrees and M.5/norm-residue-theorem take the degree-one case from kummerIso.

**Consumers:** [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.3/cohomological-steinberg](#m-3-cohomological-steinberg), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees), [MotivicEtaleKTheory:M.5/norm-residue-theorem](#m-5-norm-residue-theorem), [MotivicEtaleKTheory:M.3/galois-symbol](#m-3-galois-symbol), [MotivicEtaleKTheory:M.3/symbol-norm-compatibility](#m-3-symbol-norm-compatibility), [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison), [MotivicEtaleKTheory:M.3/tate-injectivity-criterion](#m-3-tate-injectivity-criterion)

#### M.1 request 2 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

ProfiniteCohomology Layer 10's canonical H^n(G, M) = continuousCohomology n (ofDiscreteModule ℤ G M) for G profinite and M discrete, in every degree, applied to G_F, to G_{F,S} and to the decomposition groups G_ℝ ⊂ G_{F,S} with the discrete twist modules μ_m^{⊗j} and ℚ_ℓ/ℤ_ℓ(j): restriction along continuous homomorphisms, inflation and coefficient maps with their composition laws; corestriction for open subgroups with corestriction_comp_res (cor ∘ res = index) and corestriction_trans; the long exact sequence of a DiscreteShortExact sequence (delta, longExact_exact, delta_naturality); the all-degree finite-quotient colimit (continuousFiniteQuotientColimit); and continuousCohomology_preservesFilteredColimits, which gives H^n(F, ℚ_ℓ/ℤ_ℓ(j)) = colim_ν H^n(F, μ_{ℓ^ν}^{⊗j}). Layer 10 is stated for discrete coefficients only: the compact modules ℤ_ℓ(j) and ℚ_ℓ(j) are outside its scope, and their continuous cohomology and long exact sequences come from ArithmeticGaloisDuality R02.1 (carrier-comparison, continuous-section-long-exact, tate-inverse-limit, rationalization).

**Consumers:** [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.1/continuous-limit-comparison](#m-1-continuous-limit-comparison), [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.2/real-restriction-map](#m-2-real-restriction-map)

#### M.1 request 3 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

ProfiniteCohomology Layer 12: the cup product cup : H^a(G, X) × H^b(G, Y) → H^{a+b}(G, Z) for a TopPairing X × Y → Z (built from the twist pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)} by ofDiscreteModulePairing), biadditive, with unit (cup_one_left/right), associativity (cup_assoc), graded commutativity (cup_gradedComm), compatibility with restriction and coefficient maps (cup_res, cup_coeffMap), the projection formula cup_projection in all bidegrees, and agreement with Tau Ceti's explicitCup11 in bidegree (1,1) (explicitIso_cup).

**Consumers:** [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring), [MotivicEtaleKTheory:M.5c/galois-symbol-all-degrees](#m-5c-galois-symbol-all-degrees)

#### M.1 request 4 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-3-the-comparison-isomorphisms

ProfiniteCohomology Layer 3: for profinite G and discrete M, the comparison isomorphisms in TopModuleCat ℤ between Tau Ceti's explicit H⁰, H¹, H² and continuousCohomology i (ofDiscreteModule ℤ G M) for i ≤ 2 (degree 0 is at the pin as explicitH0IsoContinuousCohomology; degrees 1 and 2 are the open milestones), with the transport lemmas explicitIso_map, explicitIso_res and explicitIso_coeffMap. The transports of the (1,1) cup product and of corestriction are Layer 12's explicitIso_cup and Layer 10's explicitIso_cor and explicitIso_cor2, requested from those layers.

**Consumers:** [MotivicEtaleKTheory:M.1/twisted-cohomology-ring](#m-1-twisted-cohomology-ring)

#### M.1 request 5 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-11-cohomological-dimension

cd_ℓ of a profinite group and its bounding predicate, to state cd_ℓ(G_{F,S}) ≤ 2.

**Consumers:** [MotivicEtaleKTheory:M.2/high-degree-real-isomorphism](#m-2-high-degree-real-isomorphism)

#### M.1 request 6 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

ClassFieldTheory Layer 5 for a nonarchimedean local field F: the Brauer group Br F = H²(G_F, (F^s)^×) on the continuous carrier with its invariant map invMap (normalised by arithmetic Frobenius, an isomorphism onto ℚ/ℤ), brRes and brCor, and the cohomological local symbol localSymbol (Kummer cup product followed by the invariant, for a chosen primitive root of unity), with h2MuEquivZMod_mixed : H²(F, μ_n) ≅ ℤ/n for F/ℚ_p finite. Tate's local theorem uses them for nonarchimedean F containing μ_ℓ. Layer 5 constructs no cyclic algebras, so the identification of h_{F,ℓ}{a, b} with a Brauer class is to be read through localSymbol; the archimedean invariants (Br ℝ ≅ ½ℤ/ℤ, Br ℂ = 0) are Layer 10's and are requested there. Also, for a place v of a number field F: inv_{w} ∘ res = [F_w : F_v]·inv_v for a finite extension, and, for v unramified, the identification of the classes of Br(F_v)[ℓ] split by an unramified extension with H¹(k(v), ℚ/ℤ)[ℓ] ≅ (1/ℓ)ℤ/ℤ through the residue map; M.2/s-integer-brauer-sequence uses them for the Brauer sequence of O_S, and M.3/tate-global and M.3/tate-picard-sequence for the local components of h_{F,ℓ}.

**Consumers:** [MotivicEtaleKTheory:M.3/tate-local](#m-3-tate-local), [MotivicEtaleKTheory:M.2/s-integer-brauer-sequence](#m-2-s-integer-brauer-sequence), [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/tate-picard-sequence](#m-3-tate-picard-sequence)

#### M.1 request 7 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

ClassFieldTheory Layer 10, for a number field F: the Albert–Brauer–Hasse–Noether sequence 0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0 in invariant coordinates (finiteInvAt, infiniteInvAt, sumLocalInv, eq_zero_of_localInv_eq_zero, sumLocalInv_eq_zero, exists_br_of_sum_eq_zero), and the archimedean invariants infiniteInvMap with Br(ℂ) = 0 and Br(ℝ) ≅ ½ℤ/ℤ (infiniteInvMap_eq_zero_of_isComplex, range_infiniteInvMap_of_isReal), the latter also for Tate's local theorem at F = ℝ. Layer 10 is for number fields only, as are the global nodes of M.3; the function-field case is a recorded gap. M.1/s-integer-galois-comparison uses the sequence to show that H²(O_{F_S,S}, G_m) vanishes in the colimit.

**Consumers:** [MotivicEtaleKTheory:M.2/s-integer-brauer-sequence](#m-2-s-integer-brauer-sequence), [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global), [MotivicEtaleKTheory:M.3/tate-picard-sequence](#m-3-tate-picard-sequence), [MotivicEtaleKTheory:M.3/tate-local](#m-3-tate-local), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison)

#### M.1 request 8 — tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal

QuadraticFormInvariants Layer 4: pfisterForm ⟨⟨a_1, …, a_n⟩⟩ in every degree as the n-fold tensor product of the forms ⟨1, −a_i⟩, its Witt class (wittClass), the additive generation of I^n by n-fold Pfister forms (fundamentalIdeal_pow_eq_addClosure), and, for n ≤ 2, roundness and 'isotropic iff hyperbolic'. Layer 4 excludes roundness and the hyperbolicity criterion for n ≥ 3, so only these are requested: they define the Pfister neighbour q_a of M.5b/pfister-norm-variety and give its n = 2 tests (⟨⟨a, b⟩⟩ hyperbolic ⇔ the quaternion algebra (a, b) splits); the general-n facts are a recorded gap.

**Consumers:** [MotivicEtaleKTheory:M.5b/pfister-norm-variety](#m-5b-pfister-norm-variety)

#### M.1 request 9 — SchemeAndStackFoundations:SF.2

SchemeAndStackFoundations SF.2 (sites and scheme cohomology), for a scheme X: the étale sheaf of units G_m : U ↦ Γ(U, O_U)^× on the small étale site of X (a sheaf by fpqc descent of O) and Grothendieck's Hilbert 90 H¹_et(X, G_m) ≅ Pic(X), compatible with Mathlib's CommRing.Pic for affine X; the pullback maps H^i_et(X, 𝓕) → H^i_et(X', f^*𝓕) along morphisms f : X' → X with their identity and composition laws (Mathlib's Sheaf.H has no change of site); and the cohomological Brauer group of SF.2/cohomological-brauer. That node defines Br'(X) as the torsion subgroup of H²_et(X, G_m); the Kummer sequences only use its n-torsion, which is H²_et(X, G_m)[n]. M.1/etale-twist-sheaf uses G_m and pullback; M.1/etale-kummer-sequences uses G_m, Hilbert 90 and Br'.

**Consumers:** [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf)

#### M.1 request 10 — SchemeAndStackFoundations:SF.2

From ConstructibleEtale (PR196), integrated by SF.2: (i) Stacks 03QQ: étale sheaves of abelian groups on Spec F are equivalent to discrete G_F-modules, and H^i_et(Spec F, 𝓕) ≅ H^i(G_F, 𝓕(F^s)) as δ-functors (the import AnabelianGeometryAndNonabelianChabauty NC.0/field also cites); (ii) for a pro-finite-étale Galois cover X̃ = lim X_α → X of a quasi-compact quasi-separated scheme with profinite group G, Galois descent of the locally constant sheaves split by X̃ and the Cartan–Leray spectral sequence H^r(G, H^s(X̃, 𝓕)) ⇒ H^{r+s}(X, 𝓕); (iii) H^i_et(lim X_α, 𝓕) = colim_α H^i_et(X_α, 𝓕_α) for cofiltered systems of qcqs schemes with affine transition maps; (iv) exactness of the Kummer sequence 1 → μ_n → G_m → G_m → 1 on X_et for n invertible (as in EDC.0's request).

**Consumers:** [MotivicEtaleKTheory:M.1/field-etale-galois-comparison](#m-1-field-etale-galois-comparison), [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison), [MotivicEtaleKTheory:M.1/localization-gysin-sequence](#m-1-localization-gysin-sequence), [MotivicEtaleKTheory:M.1/etale-kummer-sequences](#m-1-etale-kummer-sequences), [MotivicEtaleKTheory:M.1/etale-twist-sheaf](#m-1-etale-twist-sheaf)

#### M.1 request 11 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

The principal ideal theorem: every ideal of O_L becomes principal in the Hilbert class field of L (so Pic(O_{L,S}) dies in the maximal extension unramified outside S).

**Consumers:** [MotivicEtaleKTheory:M.1/s-integer-galois-comparison](#m-1-s-integer-galois-comparison)

#### M.1 request 12 — SchemeAndStackFoundations:SF.2

For a Dedekind scheme U (for example Spec O_{F,S}) with generic point g : Spec K → U and perfect residue fields: the exact sequence 0 → G_m → g_*G_m → ⊕_{x∈U⁰} i_{x*}ℤ → 0 of étale sheaves, R^s g_*G_m = 0 for s ≥ 1, and H^r(U, i_{x*}ℤ) ≅ H^r(k(x), ℤ) (so H¹ = 0 and H² ≅ H¹(k(x), ℚ/ℤ)): the inputs of Milne ADT II.2.1.

**Consumers:** [MotivicEtaleKTheory:M.2/s-integer-brauer-sequence](#m-2-s-integer-brauer-sequence)

#### M.1 request 13 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

For a number field F with μ_ℓ ⊂ F: the pairing Σ_v inv_v(ξ_v ∪ η_v) on the ideles J/J^ℓ (Kummer cup product at each place) vanishes on F^×/F^{×ℓ} × F^×/F^{×ℓ} (global reciprocity in Kummer form).

**Consumers:** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global)

#### M.1 request 14 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence

For a number field F with μ_ℓ ⊂ F: F^×/F^{×ℓ} is its own exact orthogonal in J/J^ℓ under that pairing; equivalently an element of F^× that is an ℓ-th power in every completion is an ℓ-th power.

**Consumers:** [MotivicEtaleKTheory:M.3/tate-global](#m-3-tate-global)

#### M.1 request 15 — tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers

For a finite cyclic extension L/F with character χ: the periodicity isomorphism F^×/N_{L/F}L^× = Ĥ⁰(Gal(L/F), L^×) ≅ H²(Gal(L/F), L^×), b ↦ δχ ∪ b, and its compatibility with inflation into Br(F) and with χ ∪ κ(b).

**Consumers:** [MotivicEtaleKTheory:M.3/tate-injectivity-criterion](#m-3-tate-injectivity-criterion)

#### M.1 request 16 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups

The Mackey double-coset formula res ∘ cor = Σ cor ∘ conj ∘ res for open subgroups of G_F, with coefficients μ_m^{⊗j}.

**Consumers:** [MotivicEtaleKTheory:M.3/symbol-norm-compatibility](#m-3-symbol-norm-compatibility)

#### M.1 request 17 — K2SymbolsBrauer:T.4

For a finite Galois extension E/F with group G: res_{E/F} ∘ N_{E/F} = Σ_{s∈G} s on K_2(E) (Milnor, Introduction to algebraic K-theory, §14), alongside T.4/restriction-transfer-degree.

**Consumers:** [MotivicEtaleKTheory:M.3/tate-adic-comparison](#m-3-tate-adic-comparison)

#### M.1 request 18 — SchemeKTheoryOperations:S.4

The Gillet–Levine relative presentation lemma in geometric form (Gillet–Levine, J. Pure Appl. Algebra 46 (1987), §2 Lemma 1, as used in Geisser 2004 Theorem 4.2): for a discrete valuation ring Λ, X = Spec S with S smooth of finite type and of relative dimension d over Λ, a point x ∈ X and a nonzerodivisor t ∈ S with S/tS flat over Λ, after replacing X by an affine neighbourhood of x there is a morphism π : X → 𝔸^{d−1}_Λ, smooth of relative dimension one at x, whose restriction to V(t) is quasi-finite. S.4/gillet-levine-smooth-over-dvr uses the same lemma for K-theory but does not state it.

**Consumers:** [MotivicEtaleKTheory:M.4/dedekind-gersten](#m-4-dedekind-gersten)

#### M.1 request 19 — SchemeAndStackFoundations:SF.5

Intersection products with Serre/Fulton multiplicities of properly intersecting cycles on smooth schemes (at the level of cycles, not only Chow groups), the projection formula, and pushforward of cycles finite over the base (MVW 1.4–1.7, Appendix 17A).

**Consumers:** [MotivicEtaleKTheory:M.5a/finite-correspondence](#m-5a-finite-correspondence), [MotivicEtaleKTheory:M.5a/cycle-complex-transfers](#m-5a-cycle-complex-transfers)

#### M.1 request 20 — SchemeAndStackFoundations:SF.2

Proper base change for étale cohomology (with compact supports) of a smooth curve over a henselian local scheme with coefficients μ_n, n invertible (MVW 7.19, Milne VI.3.2), and homotopy invariance H^i_et(X × 𝔸^1, F) ≅ H^i_et(X, F) for locally constant F of torsion prime to the characteristic (SGA 4 XV 2.2; MVW 9.23); étale cohomological dimension cd_m(X) ≤ cd_m(k) + 2 dim X (MVW 9.26).

**Consumers:** [MotivicEtaleKTheory:M.5a/suslin-rigidity](#m-5a-suslin-rigidity), [MotivicEtaleKTheory:M.5a/etale-a1-local-complexes](#m-5a-etale-a1-local-complexes)

#### M.1 request 21 — SchemeAndStackFoundations:SF.5

Chow groups with rational equivalence, flat pullback and proper pushforward (M.4's degree-zero higher Chow groups are these groups, RS-08 link SF.5 → M.4), intersection products on smooth schemes, and the degree map deg : CH_0(X) → ℤ for X proper over a field; Chern classes c_i of vector bundles with the Whitney formula and the splitting principle; the projective bundle formula CH^*(ℙ(E)) = CH^*(X)[y]/(Σ c_i(E)y^{r−i}); compatibility of Chern classes and degree with extension of the base field. Used for the characteristic numbers s_d(X) = deg N_d(c_1, …, c_d)(T_X).

**Consumers:** [MotivicEtaleKTheory:M.5b/nu-variety](#m-5b-nu-variety), [MotivicEtaleKTheory:M.5b/chain-lemma-and-norm-principle](#m-5b-chain-lemma-and-norm-principle), [MotivicEtaleKTheory:M.5b/dn-degree-theorem](#m-5b-dn-degree-theorem), [MotivicEtaleKTheory:M.4/functoriality](#m-4-functoriality), [MotivicEtaleKTheory:M.4/chow-degree-zero](#m-4-chow-degree-zero)

### Gaps from part M.5d

#### BGK elimination and relative proof engines

Acquire/read Kato 1982, Galois cohomology of complete discrete valuation fields, LNM 967 §1, pp.215–238. Refine BK Proposition 2.4 into adapted-p-basis, relative diagram and lexicographic-elimination nodes; independent review confirmed E1/E3/E501/E502/E504 and rejected E2 as a demonstrated misprint. BK §2 was read, but its cited Kato proof input is not replaced by the defective supplementary sketch.

**Consumers:** [MotivicEtaleKTheory:M.5d/bloch-gabber-kato](#m-5d-bloch-gabber-kato)

#### Resolution-free Beilinson–Lichtenbaum input

Geisser–Levine 2001, Invent. Math. 143, pp.55–113: original author PDF BlochKato.pdf returned 404. Read its resolution-free cone/truncation proof and extract the exact semilocal transfer hypotheses. SV2000 Theorem 7.4 was read with resolution of singularities and does not supply the unconditional version by itself; Geisser Dedekind §5 supplies only the cited application. Assembly: MC.4/suslin-friedlander-into-cycle-complex and MC.4/motivic-cohomology-higher-chow supply the packaged comparison only under their stated perfect-field hypotheses, and M.5a/cycle-complex-transfers supplies the transfer action. Those exact imports do not prove the unrestricted resolution-free passage; that obligation remains here and in M.5c/hilbert-ninety-implies-beilinson-lichtenbaum.

**Consumers:** [MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison](#m-5d-mod-prime-motivic-comparison), [MotivicEtaleKTheory:M.7/beilinson-lichtenbaum](#m-7-beilinson-lichtenbaum), [MotivicEtaleKTheory:M.5d/prime-power-norm-residue](#m-5d-prime-power-norm-residue)

#### Global filtered-model comparison

Read the complete comparison between Levine homotopy coniveau and the Friedlander–Suslin global multi-relative K tower, and construct a filtered zigzag with augmentation/layer compatibility. Levine Theorem 6.4.1 and FS Theorem 13.13 each give their own layers; equality of E₂ pages is not the missing global equivalence.

**Consumers:** [MotivicEtaleKTheory:M.6a/global-model-comparison](#m-6a-global-model-comparison)

#### Filtered multiplicative comparison proof

Read Levine, K-theory and motivic cohomology of schemes, §11 and Appendix D in full and extract the simultaneous-moving pair product and its coherent cycle comparison. The source statements, support diagram and degree conventions were read; a general multiplicative filtered diagram is not established just by a binary product on K groups.

**Consumers:** [MotivicEtaleKTheory:M.6b/filtered-motivic-products](#m-6b-filtered-motivic-products), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations)

#### Admitted base-field and arithmetic tower extension

The constructed tower and elementary convergence bound are for smooth finite-dimensional schemes over a perfect field. Read/resolve the continuity and arithmetic-base filtered construction needed for arbitrary fields and the Dedekind arithmetic motivic sequence; Geisser Theorem 1.2 gives the arithmetic low-degree complexes, not the entire filtered K tower.

**Consumers:** [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), [MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range](#m-7-quillen-lichtenbaum-field-range), [MotivicEtaleKTheory:M.7/s-integer-comparison-range](#m-7-s-integer-comparison-range), [MotivicEtaleKTheory:M.7/dedekind-motivic-comparison](#m-7-dedekind-motivic-comparison)

#### Thomason general descent proof

Read Thomason 1985/1988 original Bott-inverted étale descent theorem and its Tate–Tsen filtration assumptions. FGV §§2.6–2.8 was read and the number-ring odd-prime case is explicit; do not promote its “mild hypothesis” to all fields or regular schemes. The totally imaginary dyadic extension requires the exact original coefficient/descent theorem.

**Consumers:** [MotivicEtaleKTheory:M.7/bott-etale-descent](#m-7-bott-etale-descent), [MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range](#m-7-quillen-lichtenbaum-field-range), [MotivicEtaleKTheory:M.7/s-integer-comparison-range](#m-7-s-integer-comparison-range)

#### Coherent étale transfer source

Read Blumberg–Mandell 2015 §10, cited by FGV transfer proof, for the map of étale descent towers. Refine ramified finite-perfect transfers with the relative dualizing/different-line correction; FGV’s principal-different cyclotomic example is not a proof for every ramified ring extension.

**Consumers:** [MotivicEtaleKTheory:M.7/etale-k-transfer](#m-7-etale-k-transfer), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality), [MotivicEtaleKTheory:M.8/norm-compatible-regulator-families](#m-8-norm-compatible-regulator-families)

#### Suslin neighbourhood and stability inputs

The complete K-book VI §3 sketch and its reductions were read. Acquire the original Suslin/Lie-group small-neighbourhood homology and stabilization proof inputs cited in Lemmas 3.5–3.8, then refine them in the appropriate topology/rigidity owner. Do not use the real mod-2 table as a proof of the initial real comparison.

**Consumers:** [MotivicEtaleKTheory:M.7/suslin-real-comparison](#m-7-suslin-real-comparison)

#### Supported universal character original

Acquire/read Gillet 1981 Definition 2.34(ii), Theorem 3.1 and §2.35, and Gillet–Soulé 1987 Proposition 5.5. Li–Liu Appendix B and its supported pairings were read but do not replace the universal supported Chern/γ-filtration proof.

**Consumers:** [MotivicEtaleKTheory:M.8/supported-cycle-character](#m-8-supported-cycle-character), [MotivicEtaleKTheory:M.8/finite-etale-chern](#m-8-finite-etale-chern), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality)

#### General motivic Deligne realization

Read Huber’s mixed realization construction cited by K-book V Example 11.12 and its multiplicative realization of the cycle complex. Burgos §§10.1–10.4 supplies the actual logarithmic cone and early number-field map; generic compactification independence and the comparison with the integral motivic class still require the Hodge/MC.2 supplier.

**Consumers:** [MotivicEtaleKTheory:M.8/deligne-regulator](#m-8-deligne-regulator), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](#m-8-number-field-deligne-normalization), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality)

#### Local regulator and determinant case hypotheses

Refine the selected Tate/elliptic local comparison proof and PS.4 fundamental-line factors with precise motivic finiteness, perfectness and period/regulator assumptions. Kato §2.1 states these as part of conjectural infrastructure; no unconditional elliptic Tamagawa leading-value or integral-basis theorem is planned as proved.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

#### Suggested filtered and weight signatures do not yet express their target maps

Review requires a filtered HC/FS comparison with transitions/augmentation rather than only levelwise isomorphisms; actual exact-couple differentials and their square-zero law rather than existence of an additive map (always satisfied by zero); page pullbacks commuting with differential and E₂ identification rather than another Nonempty homomorphism; supplied compatible Adams actions and an eigenspace restriction on motivicChern_weight. Several named tests also use arbitrary groups/maps without the field/model bindings required by the packet. PROTOCOL §13 permits unavailable geometric conditions omitted, but not these fully expressible algebraic omissions or tests that only restate unbound assertions.

**Consumers:** [MotivicEtaleKTheory:M.6a/global-model-comparison](#m-6a-global-model-comparison), [MotivicEtaleKTheory:M.6b/motivic-exact-couple](#m-6b-motivic-exact-couple), [MotivicEtaleKTheory:M.6b/filtered-adams-operations](#m-6b-filtered-adams-operations), [MotivicEtaleKTheory:M.6b/rational-motivic-degeneration](#m-6b-rational-motivic-degeneration), [MotivicEtaleKTheory:M.6/motivic-spectral-sequence](#m-6-motivic-spectral-sequence), [MotivicEtaleKTheory:M.8/motivic-chern-character](#m-8-motivic-chern-character)

#### Norm-family tests need the actual cyclotomic and transfer construction

The generic regulator compatibility is corrected to require its typed transfer square. The Soulé API is corrected to evaluate a specifically constructed compatible family rather than an arbitrary element. Its degree-only arithmetic test and unrestricted transfer-square test still do not exercise the unit/Bott construction or distinguish norm from restriction. Bind them to the actual supplier normalization and give a computation/non-example as the packet specifies.

**Consumers:** [MotivicEtaleKTheory:M.8/norm-compatible-regulator-families](#m-8-norm-compatible-regulator-families)

#### Independent period-line prefix before PS.4 assembly

PS.4 currently consumes PS.3; PS.3 consumes M.8 and the late Borel R.7 regulator comparison. A whole PS.4 import into the M.8 fundamental-line construction therefore gives a circular supplier chain. Resolve at declaration granularity: import early realization/period spaces from MC.2/PS.0 and the independent determinant functor from L5, then place late regulator/leading-term assembly downstream. Request a precise independent PS.4 prefix if one is genuinely needed; do not silently use the complete downstream theorem as its own prerequisite.

**Consumers:** [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

### Supplier requests from part M.5d

#### M.5d request 1 — DerivedDeRhamCohomology:DD.3

Inverse Cartier for absolute forms of every characteristic-p field, including imperfect fields; additive naturality, pure logarithmic wedge formula and the exact-form quotient. Current DD.3 covers a polynomial relative case, not this field statement.

**Consumers:** [MotivicEtaleKTheory:M.5d/bloch-gabber-kato](#m-5d-bloch-gabber-kato), [MotivicEtaleKTheory:M.5d/artin-schreier-differential](#m-5d-artin-schreier-differential)

#### M.5d request 2 — CrystallineCohomology:CR.4

Actual p-typical de Rham–Witt logarithmic étale sheaves over arbitrary characteristic-p fields via smooth perfect-base approximation: Teichmüller logarithms, Steinberg/product rules, p^r annihilation, restriction and injection 0→W₁Ω_log^q --p^(r−1)→W_rΩ_log^q→W_(r−1)Ω_log^q, with initial sheaf exactness and field-colimit interface. This is not the abstract CR.0 Witt quotient.

**Consumers:** [MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol](#m-5d-witt-logarithmic-symbol), [MotivicEtaleKTheory:M.5d/prime-power-bgk](#m-5d-prime-power-bgk), [MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons](#m-5d-filtered-colimit-comparisons)

#### M.5d request 3 — K2SymbolsBrauer:T.4

Norm/trace differential compatibility and the relative unit-symbol/specialization presentation for k_q(R)=ker(K^M_q(Frac R)/p→K^M_(q−1)(κ)/p) at the BK discrete valuation rings; use the existing Bass–Tate/norm nodes and do not assume coefficient left exactness.

**Consumers:** [MotivicEtaleKTheory:M.5d/bloch-gabber-kato](#m-5d-bloch-gabber-kato), [MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions](#m-5d-inseparable-and-characteristic-reductions)

#### M.5d request 4 — SchemeKTheoryOperations:S.3

Support perfect-complex K spectra, maps for support inclusion and proper face pullback, and regular-scheme dévissage to connective G(W), used to prove the degreewise connectivity bound rather than assume every support fibre is connective.

**Consumers:** [MotivicEtaleKTheory:M.6a/admissible-k-supports](#m-6a-admissible-k-supports), [MotivicEtaleKTheory:M.6b/motivic-strong-convergence](#m-6b-motivic-strong-convergence), [MotivicEtaleKTheory:M.8/supported-cycle-character](#m-8-supported-cycle-character)

#### M.5d request 5 — EnhancedDerivedSheaves:E3

Coherent diagrams, geometric realization and pointwise Kan/colimit constructions on the concrete spectrum category supplied by H.5, preserving the whole filtered K-support diagram. No construction of spectra is requested here.

**Consumers:** [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), [MotivicEtaleKTheory:M.7/finite-etale-k-theory](#m-7-finite-etale-k-theory)

#### M.5d request 6 — EnhancedDerivedSheaves:E5:spectra-comparison

Comparison of the concrete H.5 spectrum objects with the EDS stable enhancement, including the Eilenberg–Mac Lane and spectral-sheaf realization interfaces. Abstract monoidal stability alone is insufficient.

**Consumers:** [MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower](#m-6a-homotopy-coniveau-tower), [MotivicEtaleKTheory:M.7/finite-etale-k-theory](#m-7-finite-etale-k-theory)

#### M.5d request 7 — EnhancedDerivedSheaves:E2

Hypercover and Postnikov/hypercompletion descent for the actual finite-coefficient étale K spectrum sheaf, with bounded/finite-cd hypotheses where required; extend the sheaf-complex formulation to its concrete spectral realization without assuming left completeness on arbitrary sites.

**Consumers:** [MotivicEtaleKTheory:M.7/finite-etale-k-theory](#m-7-finite-etale-k-theory)

#### M.5d request 8 — RefinedTraceMethods:RT.4

Real topological BO/KO finite-coefficient comparison carrier and Bott period eight, including the nonsplit π_(8k+2)(BO;Z/2)=Z/4 calculation. Current RT.4 plans complex ku/KU; request its Part II in the same topological K direction, not a local BO definition in M.7.

**Consumers:** [MotivicEtaleKTheory:M.7/suslin-real-comparison](#m-7-suslin-real-comparison), [MotivicEtaleKTheory:M.7/real-mod-two-sequence](#m-7-real-mod-two-sequence), [MotivicEtaleKTheory:M.7/real-place-correction](#m-7-real-place-correction)

#### M.5d request 9 — MotivesAndAlgebraicCycles:MC.1

Tate objects and the pointed-elliptic-curve h¹ projector with cohomological variance, supplied as actual motives; do not treat a representation alone as a constructed motive.

**Consumers:** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 10 — MotivesAndAlgebraicCycles:MC.2

Motivic-to-Deligne/logarithmic and étale realizations preserving products, supports, trace, twists and universal Chern classes; specialize the Tate and elliptic objects and reconcile cohomological H¹ with the dual homological Tate module. The elliptic good-reduction characteristic polynomial is imported from Tau Ceti EllipticCurves Layers 2–4. Export the scheme smooth proper base-change adapter at good elliptic places, using the existing constructible étale owner; analytic adic H3 is not that adapter.

**Consumers:** [MotivicEtaleKTheory:M.8/deligne-regulator](#m-8-deligne-regulator), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](#m-8-number-field-deligne-normalization), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality), [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 11 — tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne

Part II export for the actual logarithmic Deligne–Beilinson complex, compactification independence, products and real conjugation, with the simplicial first-infinitesimal-diagonal realization. Generic Weil/normalized cosimplicial identifications are imported in the owning differential/Hodge direction, not re-planned by the regulator application.

**Consumers:** [MotivicEtaleKTheory:M.8/deligne-regulator](#m-8-deligne-regulator), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](#m-8-number-field-deligne-normalization)

#### M.5d request 12 — SelmerIwasawaCohomology:L2

The actual generic Selmer mapping-fibre complex with local-condition maps and H⁰ correction; the current L2 node unramified-condition supplies the H¹ away-p predicate only, not the derived mapping-fibre carrier.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line)

#### M.5d request 13 — SelmerIwasawaCohomology:L4

Propagation of the imported finite local condition on V (from PadicHodgeRegulators:L1) to T and V/T, and the Euler-system relation interface. Specify integral versus rational local maps for the Tate/elliptic regulator application.

**Consumers:** [MotivicEtaleKTheory:M.8/norm-compatible-regulator-families](#m-8-norm-compatible-regulator-families), [MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility](#m-8-euler-factor-regulator-compatibility), [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization)

#### M.5d request 14 — PadicHodgeRegulators:D.2

Local syntomic-to-étale regulator comparison and proof that the admitted motivic classes satisfy the finite local condition, with exact weights, residue characteristic and crystalline/semistable hypotheses. This is used after the early finite étale Chern construction.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

#### M.5d request 15 — PadicHodgeRegulators:D.5

The Tate/elliptic higher-weight local realization and regulator comparisons in the stated reduction regimes, giving the local maps/homotopies needed for the Selmer complex and period comparison.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

#### M.5d request 16 — PadicMeasuresIwasawaAlgebras:L5

Determinant functor on perfect arithmetic complexes, inverse line, distinguished-triangle multiplicativity, derived coefficient base change, and actual integral-basis versus rational-trivialization criteria. The present L1–L3 packet has no L5 determinant construction.

**Consumers:** [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

#### M.5d request 17 — PeriodsAndSpecialValues:PS.4

The exact rational fundamental line for the chosen Tate/elliptic realization, with its Betti/de Rham and motivic K factors, integral lattice choices, and conditional real and p-adic comparison maps. Include every finiteness/period hypothesis; no assertion of a general zeta element. This request is unresolved at declaration granularity: PS.4 consumes PS.3, whose current inputs include M.8. Separate an independent period/determinant prefix from the later regulator assembly before treating it as a supplier to M.8; PS.0 and MC.2 own the early realization spaces.

**Consumers:** [MotivicEtaleKTheory:M.8/integral-motivic-structures](#m-8-integral-motivic-structures), [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line), [MotivicEtaleKTheory:M.8/regulator-determinant-comparison](#m-8-regulator-determinant-comparison)

#### M.5d request 18 — GeneralAlgebraicKTheory:K.2

Actual plus-space K carrier, stabilization, Hurewicz and universal characteristic-class evaluation used by the Suslin and early Chern/Deligne constructions. Existing checkpoints do not yet give the full coherent universal class construction.

**Consumers:** [MotivicEtaleKTheory:M.7/suslin-real-comparison](#m-7-suslin-real-comparison), [MotivicEtaleKTheory:M.8/finite-etale-chern](#m-8-finite-etale-chern), [MotivicEtaleKTheory:M.8/number-field-deligne-normalization](#m-8-number-field-deligne-normalization), [MotivicEtaleKTheory:M.7/number-ring-duality-sign](#m-7-number-ring-duality-sign)

#### M.5d request 19 — ArithmeticGaloisDuality:R02.2

The precise restriction/corestriction and compact-coefficient projection formula, with pure-inseparable field-category invariance imported from the field/Galois interface.

**Consumers:** [MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions](#m-5d-inseparable-and-characteristic-reductions), [MotivicEtaleKTheory:M.7/etale-k-transfer](#m-7-etale-k-transfer)

#### M.5d request 20 — ArithmeticGaloisDuality:R02.3

Restricted-ramification finite-cd and finiteness for odd primes, or totally imaginary dyadic fields; positive-twist H⁰ vanishing, and the real-place exclusions for the étale comparison.

**Consumers:** [MotivicEtaleKTheory:M.7/dedekind-motivic-comparison](#m-7-dedekind-motivic-comparison), [MotivicEtaleKTheory:M.7/bott-etale-descent](#m-7-bott-etale-descent), [MotivicEtaleKTheory:M.7/s-integer-comparison-range](#m-7-s-integer-comparison-range), [MotivicEtaleKTheory:M.7/arithmetic-adic-degrees](#m-7-arithmetic-adic-degrees)

#### M.5d request 21 — ArithmeticGaloisDuality:R02.4

The real-place Tate/Poitou–Tate page identities and surjectivity after enlarging S in the exact K-book VI §9 argument, with its specified low-degree exceptions.

**Consumers:** [MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions](#m-7-dyadic-s-integer-extensions)

#### M.5d request 22 — ArithmeticGaloisDuality:D7

Actual compact-support arithmetic fibre complex, modified real-place complexes and perfection in the selected lattice regimes, imported without reconstructing generic duality.

**Consumers:** [MotivicEtaleKTheory:M.7/real-place-correction](#m-7-real-place-correction), [MotivicEtaleKTheory:M.8/arithmetic-fundamental-line](#m-8-arithmetic-fundamental-line)

#### M.5d request 23 — PadicHodgeRegulators:D.3

Only the stated unramified p>3 local regulator theorem is consumed in that regime; no ramified or dyadic extension is inferred from it.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization)

#### M.5d request 24 — PadicHodgeRegulators:L1

The Bloch–Kato finite condition on the rational representation and its period-ring local map, in the selected crystalline/semistable hypotheses; L4 propagates it to lattices.

**Consumers:** [MotivicEtaleKTheory:M.8/selmer-regulator-factorization](#m-8-selmer-regulator-factorization)

#### M.5d request 25 — EulerSystemsCyclotomicMainConjecture:L0

The existing Euler-system normalization interface and cyclotomic norm-compatible units/roots needed for Soulé’s specific K-theory family; preserve its Frobenius conventions.

**Consumers:** [MotivicEtaleKTheory:M.8/norm-compatible-regulator-families](#m-8-norm-compatible-regulator-families)

#### M.5d request 26 — EtaleDualityAndPerverseSheaves:EDC.2:pairings

The scheme smooth proper curve pairing, Kummer/Jacobian inputs and Galois-equivariant normalization identifying elliptic cohomological H¹ with the dual Tate module; combine with MC.2 scheme smooth proper base change. Classical H3 instead supplies analytic adic curve duality and imports this scheme theorem.

**Consumers:** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 27 — tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Use the existing all-degree discrete cohomology and finite-quotient colimit interface; the field-system finite-presentation descent application stays in the present colimit node, not a second cochain definition.

**Consumers:** [MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons](#m-5d-filtered-colimit-comparisons)

#### M.5d request 28 — tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

Use the existing elliptic Tate module, Weil pairing and its dual cohomological realization; no elliptic curve or Tate module is replanned.

**Consumers:** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 29 — tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

Use the existing Frobenius polynomial 1−a_vT+qT² on H¹ of good finite-field reduction, a_v=q+1−pointCount.

**Consumers:** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 30 — tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Use the existing good-reduction and unramified local realization to carry the finite-field Frobenius polynomial to the number-field place; bad-place cases retain their own inertia hypotheses.

**Consumers:** [MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary](#m-8-tate-elliptic-realization-dictionary)

#### M.5d request 31 — SchemeAndStackFoundations:SF.5

Existing refined intersection, supported cycle classes, purity/Gysin maps and geometric GRR in the admitted regular smooth/projective scheme setting, with Todd normalization; this imports geometric support/intersection maps and K₀ GRR only, not a general higher proper regulator RR theorem.

**Consumers:** [MotivicEtaleKTheory:M.8/supported-cycle-character](#m-8-supported-cycle-character), [MotivicEtaleKTheory:M.8/chern-functoriality](#m-8-chern-functoriality)

## Baseline declaration interfaces

The following interfaces are the existing starting points. Planned declarations above build on them or import an owner that does; the missing target is never inferred from the presence of its carrier.

### Baseline for part M.1

**tauceti:TauCeti.KummerCoeff** (abbrev; `TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`). KummerCoeff K n := Additive (rootsOfUnity n (SeparableClosure K)), with the discrete topology: the coefficient module μ_n of Kummer theory.

**tauceti:TauCeti.kummerMap** (def; `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`). kummerMap K n hn : Kˣ →* Multiplicative (H1 (AbsoluteGaloisGroup K) (KummerCoeff K n)) for IsUnit (n : K): the Kummer map into Tau Ceti's explicit H¹.

**tauceti:TauCeti.ker_kummerMap** (theorem; `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`). (kummerMap K n hn).ker = powerSubgroup Kˣ n: the kernel of the Kummer map is the n-th powers.

**tauceti:TauCeti.ContCohomology.explicitCup11** (def; `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`). explicitCup11 : H1 G M →+ H1 G N →+ H2 G P, the (1,1) cup product for an equivariant continuous pairing μ : M × N → P.

**tauceti:TauCeti.ContCohomology.explicitCup_projection11** (theorem; `TauCeti/RepresentationTheory/Homological/ContCohomology/ProjectionFormula.lean`). explicitCor2 (explicitCup11 (explicitRes1 a) b) = explicitCup11 a (explicitCor1 b): the (1,1) projection formula cor(res a ∪ b) = a ∪ cor b.

**tauceti:TauCeti.ContCohomology.explicitCor2_comp_res2** (theorem; `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean`). explicitCor2 G M U hU (explicitRes2 G M U x) = U.index • x: corestriction after restriction is multiplication by the index on H².

**tauceti:TauCeti.AlgebraicGeometry.LineBundleClass** (def; `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`). LineBundleClass X := Skeleton (InvertibleSheaf X): the type of isomorphism classes of line bundles (invertible sheaves) on a scheme X, with LineBundleClass.mk, mk_eq_mk_iff (equal classes iff the underlying sheaves are isomorphic), the product induced by the tensor product and 1 the class of the trivial bundle. At the pin it carries only a commutative monoid structure: inverses (duals) are deliberately not provided, so it is not yet a group, and its identification with H¹(X, O_X^×) is not in the library. Tau Ceti's SchemeWeilDivisor.classGroupToLineBundleClass (injective) compares it with the Weil divisor class group on noetherian integral schemes of dimension at most one.

**mathlib:continuousCohomology** (abbrev; `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`). continuousCohomology n A : TopModuleCat k for A : TopRep k G (k a topological ring, G a topological group): the homology of the homogeneous cochains built from the iterated coinduction C(G, C(G, …, A)), defined for every topological representation, so for discrete and for compact coefficients. Only the carrier and its functoriality in A are at the pin: long exact sequences, restriction, corestriction and the comparison with inhomogeneous cochains are left to Tau Ceti ProfiniteCohomology Layers 3, 10 and 12 (discrete coefficients) and ArithmeticGaloisDuality R02.1 (compact coefficients).

**mathlib:TopRep** (structure; `Mathlib/RepresentationTheory/Continuous/TopRep.lean`). Topological representations of a topological group, the coefficient objects of continuousCohomology.

**mathlib:cyclotomicCharacter** (def; `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`). cyclotomicCharacter L p : (L ≃+* L) →* ℤ_[p]ˣ for a commutative domain L and [Fact p.Prime], with cyclotomicCharacter.spec (g ζ = ζ^(χ(g) mod p^n) on p^n-th roots of unity) and cyclotomicCharacter.toZModPow (its reduction mod p^n is modularCyclotomicCharacter). By definition it is the trivial character when L lacks primitive p^i-th roots of unity for some i; for L = F^s and p ≠ char F all of them exist. cyclotomicCharacter.continuous gives continuity on Gal(L/K).

**mathlib:modularCyclotomicCharacter** (def; `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`). modularCyclotomicCharacter L hn : (L ≃+* L) →* (ZMod n)ˣ for a commutative domain L, [NeZero n] and hn : Nat.card (rootsOfUnity n L) = n, characterised by g ζ = ζ^(χ(g)).val for every n-th root of unity ζ (modularCyclotomicCharacter.spec, .unique). For L = F^s with n invertible in F the hypothesis hn holds; on G_F it is applied through the coercion of F-algebra automorphisms to ring automorphisms.

**mathlib:rootsOfUnity** (def; `Mathlib/RingTheory/RootsOfUnity/Basic.lean`). The subgroup of units of a commutative monoid whose n-th power is 1.

**mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology** (def; `Mathlib/AlgebraicGeometry/Sites/Etale.lean`). smallEtaleTopology X : GrothendieckTopology X.Etale, the small étale site of one scheme X (objects the étale X-schemes). It is not a topology on the category Sm/k of smooth k-schemes; for that use Scheme.smallGrothendieckTopology with Q the smooth morphisms.

**mathlib:CategoryTheory.Sheaf.H** (abbrev; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`). Sheaf.H F n := Ext^n((constantSheaf J AddCommGrpCat).obj (ULift ℤ), F) for an abelian sheaf F : Sheaf J AddCommGrpCat.{w}, under the instances HasSheafify J AddCommGrpCat.{w} and HasExt.{w'} (Sheaf J AddCommGrpCat.{w}); it is the cohomology of the whole site (H.equiv₀ identifies H⁰ with sections over a terminal object), the cohomology over an object U being Sheaf.H'. On the small étale site of X : Scheme.{u} both instances exist at the pin (HasSheafify from Mathlib's AffineEtale.lean, HasExt from isGrothendieckAbelian_sheaf_smallEtaleTopology through IsGrothendieckAbelian.hasExt), so H^n_et(X, F) is defined, with functoriality H.map in F and the long exact sequences of Ext. Functoriality in X (pullback along X' → X) is not in the library.

**mathlib:AlgebraicGeometry.AlgebraicCycle** (abbrev; `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`). AlgebraicCycle X R := Function.locallyFinsupp X R, algebraic cycles as locally finite R-valued functions on the points of X.

**tauceti:TauCeti.AbsoluteGaloisGroup** (abbrev; `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean`). AbsoluteGaloisGroup K := Gal(SeparableClosure K/K), the absolute Galois group taken at the separable closure, with the Krull topology (a profinite group); absoluteGaloisGroupRestrictEquiv compares it with Mathlib's Field.absoluteGaloisGroup. It is the group G_F acting on KummerCoeff and on every twist.

**tauceti:TauCeti.ofDiscreteModule** (def; `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean`). ofDiscreteModule R G M : TopRep R G for a discrete R-module M with a G-action commuting with R: the coefficient dictionary that turns a discrete G-module into a topological representation, with ofDiscreteModule_V (underlying module M) and ofDiscreteModuleMap for equivariant maps; continuousCohomology n (ofDiscreteModule ℤ G M) is the canonical H^n(G, M) of ProfiniteCohomology Layer 10.

**mathlib:HenselianLocalRing** (class; `Mathlib/RingTheory/Henselian.lean`). HenselianLocalRing R: a local ring in which every monic polynomial with a simple root modulo the maximal ideal has a root lifting it.

**mathlib:CommRing.Pic** (def; `Mathlib/RingTheory/PicardGroup.lean`). CommRing.Pic R: the Picard group of a commutative ring, the isomorphism classes of invertible R-modules under ⊗, a commutative group (CommGroup instance), functorial along ring maps (Pic.mapRingHom).

**mathlib:ClassGroup.equivPic** (def; `Mathlib/RingTheory/PicardGroup.lean`). ClassGroup.equivPic R : ClassGroup R ≃* CommRing.Pic R for a domain R: for a Dedekind domain such as O_{F,S}, the ideal class group is the Picard group.

**mathlib:NumberField.InfinitePlace** (def; `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`). NumberField.InfinitePlace K: the archimedean places of a number field, with InfinitePlace.IsReal / IsComplex and the counts nrRealPlaces = r_1 and nrComplexPlaces = r_2.

**mathlib:AlgebraicGeometry.AffineSpace** (def; `Mathlib/AlgebraicGeometry/AffineSpace.lean`). AffineSpace n S = 𝔸(n; S), the affine space over a scheme S indexed by a type n, with its coordinates, base change and AffineSpace.SpecIso for affine S.

**mathlib:AlgebraicGeometry.AlgebraicCycle.map** (def; `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`). AlgebraicCycle.map f wx wy : AlgebraicCycle X R → AlgebraicCycle Y R for a quasi-compact morphism f : X → Y and weight functions wx, wy (dimension or codimension): pushforward of cycles, the coefficient at f(x) multiplied by the residue degree of x over f(x) when the weights agree and 0 otherwise; only map_id is proved at the pin (no composition law).

**mathlib:CategoryTheory.ObjectProperty.trW** (def; `Mathlib/CategoryTheory/Triangulated/Subcategory.lean`). P.trW for P : ObjectProperty C of a pretriangulated category: the morphisms whose cone satisfies P. For a triangulated subcategory P of a triangulated C it is multiplicative, compatible with the shift and the triangulation, and has left and right calculi of fractions, so its localisation is Verdier's quotient C/P.

**mathlib:CategoryTheory.Triangulated.Localization.pretriangulated** (def; `Mathlib/CategoryTheory/Localization/Triangulated.lean`). The pretriangulated structure on a localisation D of a pretriangulated category C at a class W compatible with the triangulation (distinguished triangles: the essential image of those of C); Triangulated.Localization.isTriangulated makes D triangulated when C is, so the Verdier quotient by ObjectProperty.trW is triangulated.

**mathlib:CategoryTheory.Localization.Monoidal.toMonoidalCategory** (def; `Mathlib/CategoryTheory/Localization/Monoidal/Basic.lean`). For a monoidal category C and a class W with W.IsMonoidal (multiplicative and stable under whiskering), the localisation functor to LocalizedMonoidal L W ε, a monoidal category in which the localisation functor is monoidal (braided and symmetric versions in Localization/Monoidal/Braided).

**mathlib:DerivedCategory** (def; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`). DerivedCategory C: the derived category of an abelian category C (complexes indexed by ℤ localised at quasi-isomorphisms, under HasDerivedCategory), triangulated, with Ext groups; bounded-above complexes form a triangulated subcategory.

**mathlib:AlgebraicGeometry.Scheme.smallGrothendieckTopology** (abbrev; `Mathlib/AlgebraicGeometry/Sites/Small.lean`). Scheme.smallGrothendieckTopology on Q.Over ⊤ S: the topology on S-schemes whose structure morphism has property Q, generated by P-coverings. With S = Spec k, Q the smooth morphisms and P the étale morphisms it is the étale topology on smooth k-schemes.

**mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven** (def; `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`). For a finite cyclic group G generated by g and a representation A, groupCohomologyIsoEven: H^i(G, A) ≅ ker(ρ(g) − 1)/im(N) for even i > 0, from the 2-periodic resolution (N the norm).

**mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd** (def; `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`). For a finite cyclic group G generated by g and a representation A, groupCohomologyIsoOdd: H^i(G, A) ≅ ker(N)/im(ρ(g) − 1) for odd i, from the 2-periodic resolution.

**mathlib:NumberField.Units.finrank_eq** (theorem; `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`). finrank ℤ (Additive (𝓞 K)ˣ) = rank K = #(infinite places) − 1: Dirichlet's unit theorem, the rank of the units of O_K.

**mathlib:NumberField.RingOfIntegers.instFintypeClassGroup** (instance; `Mathlib/NumberTheory/NumberField/ClassNumber.lean`). Fintype (ClassGroup (𝓞 K)): finiteness of the class group of a number field.

**tauceti:NumberField.NarrowClassGroup** (def; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean`). The narrow class group Cl⁺(K): invertible fractional ideals of 𝓞 K modulo principal ideals with a totally positive generator (of O_K, not of O_{K,S}).

**mathlib:CategoryTheory.IsGrothendieckAbelian** (class; `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean`). IsGrothendieckAbelian C for an abelian category: locally small, filtered colimits, AB5 and a separator.

**mathlib:CategoryTheory.IsGrothendieckAbelian.enoughInjectives** (instance; `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean`). A Grothendieck abelian category has enough injectives.

**mathlib:DerivedCategory.Minus** (abbrev; `Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean`). The bounded above derived category D^−(C) of an abelian category, the full subcategory of DerivedCategory C given by the canonical t-structure.

**mathlib:CategoryTheory.Triangulated.Localization.isTriangulated** (lemma; `Mathlib/CategoryTheory/Localization/Triangulated.lean`). The localisation of a triangulated category at a class of morphisms with a left calculus of fractions compatible with the triangulation is triangulated (with the pretriangulated structure Triangulated.Localization.pretriangulated).

**mathlib:CategoryTheory.LocalizedMonoidal** (def; `Mathlib/CategoryTheory/Localization/Monoidal/Basic.lean`). The monoidal category structure on a localisation L : C ⥤ D at a monoidal class of morphisms W, making L monoidal.

**mathlib:CategoryTheory.MorphismProperty.IsMonoidal** (class; `Mathlib/CategoryTheory/Localization/Monoidal/Basic.lean`). W.IsMonoidal: W is multiplicative and stable under left and right whiskering, the condition for LocalizedMonoidal.

**mathlib:WittVector.isDiscreteValuationRing** (instance; `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean`). For a perfect field k of characteristic p, the Witt vectors W(k) form a discrete valuation ring (uniformiser p).

**mathlib:WittVector.isAdicCompleteIdealSpanP** (instance; `Mathlib/RingTheory/WittVector/Complete.lean`). For a perfect ring k of characteristic p, W(k) is p-adically complete.

**mathlib:WittVector.quotientPEquiv** (def; `Mathlib/RingTheory/WittVector/Complete.lean`). For a perfect ring k of characteristic p, W(k)/(p) ≅ k as rings.

### Baseline for part M.5d

**tauceti:KaehlerDifferential.mapSemilinear** (def; `TauCeti/RingTheory/Kaehler/MapSemilinear.lean`). For an R-algebra homomorphism f, the map of Kaehler modules is f-semilinear.

**tauceti:KaehlerDifferential.mapSemilinear_D** (theorem; `TauCeti/RingTheory/Kaehler/MapSemilinear.lean`). The semilinear map sends Da to D(fa).

**tauceti:KaehlerDifferential.mapSemilinear_smul** (theorem; `TauCeti/RingTheory/Kaehler/MapSemilinear.lean`). It sends a omega to f(a) times the image of omega.

**mathlib:Int.range_nsmulAddMonoidHom** (lemma; `Mathlib/Algebra/Group/Subgroup/ZPowers/Lemmas.lean`). On the integers, the range of multiplication by n is the subgroup of multiples of n.

**mathlib:Int.quotientZMultiplesNatEquivZMod** (def; `Mathlib/Data/ZMod/QuotientGroup.lean`). The additive equivalence Z/(nZ) ≃ ZMod n.

**mathlib:Subfield.mem_bot_iff_pow_eq_self** (theorem; `Mathlib/FieldTheory/Finite/Basic.lean`). In a field of prime characteristic p, the prime subfield consists exactly of the roots x^p=x.

**mathlib:AlternatingMap.map_eq_zero_of_eq** (theorem; `Mathlib/LinearAlgebra/Alternating/Basic.lean`). An alternating map vanishes when two distinct positions carry equal entries, without a characteristic restriction.

**mathlib:exteriorPower.ιMulti** (def; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`). Alternating universal map from n-tuples to the existing nth exterior power.

**mathlib:exteriorPower.ιMulti_span** (lemma; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`). Pure wedges span the exterior power as a module.

**mathlib:exteriorPower.zeroEquiv** (def; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`). Degree-zero exterior power is the scalar ring, with empty wedge sent to one.

**mathlib:exteriorPower.oneEquiv** (def; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`). Degree-one exterior power is the original module.

**mathlib:PiTensorProduct.lift** (def; `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean`). Universal equivalence between multilinear maps and linear maps out of the indexed tensor product.

**mathlib:Submodule.liftQ** (def; `Mathlib/LinearAlgebra/Quotient/Basic.lean`). Descends a semilinear map killing a submodule to its quotient.

**mathlib:Derivation.leibniz** (theorem; `Mathlib/RingTheory/Derivation/Basic.lean`). D(ab)=a Db+b Da.

**mathlib:Derivation.map_one_eq_zero** (theorem; `Mathlib/RingTheory/Derivation/Basic.lean`). A derivation sends one to zero.

**mathlib:Derivation.leibniz_pow** (theorem; `Mathlib/RingTheory/Derivation/Basic.lean`). D(a^m)=m a^(m−1) Da, including positive characteristic.

**mathlib:KaehlerDifferential.D** (def; `Mathlib/RingTheory/Kaehler/Basic.lean`). Absolute universal derivation with base Z, existing Kaehler module, additive and Leibniz laws.

**mathlib:KaehlerDifferential.span_range_derivation** (theorem; `Mathlib/RingTheory/Kaehler/Basic.lean`). The field-linear span of the universal differentials is the entire Kaehler module.

**mathlib:MonoidHom.ker** (def; `Mathlib/Algebra/Group/Subgroup/Ker.lean`). The read to_additive annotation exports AddMonoidHom.ker as the subgroup of elements mapping to zero.

**mathlib:QuotientGroup.mk'** (def; `Mathlib/GroupTheory/QuotientGroup/Defs.lean`). The read to_additive annotation exports the canonical additive quotient homomorphism QuotientAddGroup.mk'.

**mathlib:QuotientGroup.lift** (def; `Mathlib/GroupTheory/QuotientGroup/Defs.lean`). The read to_additive annotation exports QuotientAddGroup.lift: an additive homomorphism killing a subgroup descends uniquely to the quotient.

**mathlib:mem_bot_iff_intCast** (theorem; `Mathlib/FieldTheory/Finite/Basic.lean`). In prime characteristic the prime subfield consists of integer casts.

**mathlib:AlternatingMap.map_coord_zero** (theorem; `Mathlib/LinearAlgebra/Alternating/Basic.lean`). An alternating map with a zero coordinate is zero.

**mathlib:CommGroup.torsion** (def; `Mathlib/GroupTheory/Torsion.lean`). The torsion additive subgroup of an additive abelian group, reused in the genuine quotient I/I_tors.

**mathlib:PadicInt** (def; `Mathlib/NumberTheory/Padics/PadicIntegers.lean`). The existing p-adic integers as the norm-at-most-one subtype of the p-adic field, with prime Fact hypothesis and its native ring structure.

**mathlib:PadicInt.isUnit_iff** (theorem; `Mathlib/NumberTheory/Padics/PadicIntegers.lean`). An element of Z_p is a unit exactly when its norm is one; supplies the integral-basis counterexample in the fundamental line.

## Source issues and review dispositions

The two packets use some overlapping local issue identifiers. The part prefix below distinguishes those records; none is silently merged. Dispositions are inherited from the independent reviews and are not new errata verdicts by this assembly.

### M.1 / MotivicEtaleKTheory/E1

**Source and locator:** Kbook2013, VI.8.1 Classical Data, display (8.1.1), printed p. 513 (PDF p. 521), K-book version of August 29, 2013.

**Independent disposition:** confirmed. Checked on F = ℚ(i), S = ∅ against Milne ADT II.2.1, where the cokernel is H³(Spec ℤ[i], G_m) ≅ ℚ/ℤ.

**Proposed correction or interpretation:** The final map is onto only when S contains a finite place. In general 0 → Br(O_S) → (ℤ/2)^{r_1} ⊕ ⊕_{v∈S finite} ℚ/ℤ → ℚ/ℤ → H³_et(O_S, G_m) → 0 (Milne ADT II.2.1).

**Reason:** In VI.8 O_S is the ring of S-integers for a set S of finite places, which may be empty (Theorem 8.4: 'for some set S of finite places'). For F = ℚ(i) and S = ∅ the display reads 0 → Br(ℤ[i]) → 0 → ℚ/ℤ → 0, which is impossible; for F = ℚ and S = ∅ the image of add is ½ℤ/ℤ. Every use in VI.8–9 (Examples 8.3.1–8.3.2, (9.6), Lemma 9.6.3) has S nonempty.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E2

**Source and locator:** Kbook2013, VI.9, sentence after (9.2), printed p. 518 (PDF p. 526), K-book version of August 29, 2013.

**Independent disposition:** confirmed. Read Milne ADT I.4.10 and I.4.20 (printed pp. 57, 65–66): the hypotheses of I.4.20 are not met for finite S.

**Proposed correction or interpretation:** Cite [128, I(4.10)(c)] (Milne ADT Theorem I.4.10(c), finite modules, S finite), passing to the colimit over ν for ℤ/2^∞(i).

**Reason:** Milne ADT Theorem I.4.20 (numbering unchanged from the 1986 edition, per the preface of the 2nd edition) concerns finitely generated modules and assumes that S omits only finitely many primes; here S is finite and ℤ/2^∞(i) is not finitely generated. Theorem I.4.10(c) states that H^r(G_S, M) → ∏_{v real} H^r(K_v, M) is bijective for r ≥ 3 and finite M of order a unit in R_{K,S}; with filtered colimits it gives the claim. VI.8 cites [128, 4.10] correctly for the same circle of results.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E3

**Source and locator:** Kbook2013, VI.8.6 (Birch–Tate Conjecture), printed p. 515 (PDF p. 523), K-book version of August 29, 2013.

**Independent disposition:** confirmed. The statement is true, but the cited sources do not contain it; the kernel computation above shows the field result does not imply it formally.

**Proposed correction or interpretation:** The cited places give the field statement (Tate [198] (5.4), (6.6); III.6.10.4) and, for μ_ℓ ⊂ F, Tate's (6.2) description 0 → μ_ℓ ⊗ Pic O_S → K_2O_S/ℓ → (∐_{v∈S−S_c} μ_ℓ)_0 → 0; they do not construct a map K_2(O_S)/m → H²_et(O_S, μ_m^{⊗2}). The ring isomorphism is the K-book's Corollary VI.8.3 (ℓ odd, via the motivic spectral sequence) or follows from an étale Chern class c_{2,2}.

**Reason:** Tate 1976 works only with Galois cohomology of the field (pp. 268–273, page images read). A map on K_2(O_S)/m cannot be read off from the field symbol, because H²_et(O_S, μ_m^{⊗2}) → H²(F, μ_m^{⊗2}) has kernel (Pic(O_S)/m) ⊗ μ_m when μ_m ⊂ F, nonzero for F = ℚ(μ_37), m = 37.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E4

**Source and locator:** Tate1976, Proof of (6.2) Theorem, p. 270 (Invent. Math. 36 (1976), published version, GDZ scan).

**Independent disposition:** confirmed. Read at the page image p. 270 and compared with the proof of (6.3), p. 271.

**Proposed correction or interpretation:** The surjectivity of γ onto (K_2F)_l is Theorem (6.1); the reference should read (Theorem (6.1)), as in the proof of (6.3) on p. 271 ('γ^S is surjective because γ is (Theorem (6.1))').

**Reason:** Theorem (5.1) states that h_1 is bijective; the statement that the image of γ is (K_2F)_l is Theorem (6.1) (p. 270), deduced from (5.4). The argument is correct once the reference is corrected.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E5

**Source and locator:** Totaro1992, §3, printed p. 183 (PDF p. 7), the published K-Theory 6 (1992) text supplied as Totaro1992.

**Independent disposition:** confirmed. Checked at the locator in the supplied scan; the counterexample is a standard regular non-smooth curve; the corrected proof uses K2SymbolsBrauer T.4/weil-reciprocity, which is stated for the regular proper model.

**Proposed correction or interpretation:** D is a regular curve and P(D) is the regular proper model of the function field F(C); over an imperfect field F neither need be smooth over F, and residue fields of closed points may be inseparable over F. The argument goes through verbatim with 'regular', because Suslin's reciprocity law (with Kato's norms) is a statement about all places of the function field of one variable, i.e. the closed points of the regular proper model.

**Reason:** Over F = 𝔽_p(s), p odd, the curve y² = x^p − s is regular at the point (y, x^p − s) (its maximal ideal is generated by y, since x^p − s = y²) but not smooth there (both partial derivatives 2y and p x^{p−1} vanish). Normalisations of curves in the cube can therefore be regular without being smooth.

**Effect:** the proof. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E6

**Source and locator:** MVW2006, Theorem 10.2 and Theorem 10.3 with its proof, printed pp. 75–76 (PDF pp. 90–91); Lemma 9.31, printed p. 73 (PDF p. 88), under the running assumption stated before Lemma 9.26, printed p. 72; CMI PDF of the published monograph.

**Independent disposition:** confirmed. Checked at the locators in the CMI PDF: 10.2 has no cohomological-dimension hypothesis, 10.3's proof cites 9.31, and 9.31 assumes cd_m(k) < ∞; cd_2(ℝ) = ∞. The reduction to finitely generated fields with √−1 adjoined repairs the proof.

**Proposed correction or interpretation:** The statement of 10.2/10.3 is correct for every field with n invertible, but the proof as written covers only fields with cd_n(k) < ∞. The missing step: check the quasi-isomorphism on stalks at strict henselisations of smooth k-schemes, write each stalk as a filtered colimit of stalks over finitely generated subfields (Exercise 1.13, Lemma 3.9), and replace such a subfield by its finite separable extension adjoining √−1 when n is even (Proposition 3.8); finitely generated fields of this kind have finite cd_n, where 9.31 applies.

**Reason:** For k = ℝ (or ℚ) and n = 2, cd_2(k) = ∞, so Lemma 9.31, and with it Lemma 9.29's convergence of the hyperext spectral sequence (which rests on 9.27), is not available, yet Theorem 10.2 is stated for such k and its proof cites 9.31.

**Effect:** the proof. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E7

**Source and locator:** MVW2006, Corollary 4.8, printed p. 27 (PDF p. 42).

**Independent disposition:** confirmed. The statement as printed lacks 1/l ∈ k; etale-motivic-comparison uses it with n invertible.

**Proposed correction or interpretation:** The hypothesis 1/l ∈ k must be added (the Kummer sequence 1 → μ_l → O^× → O^× → 1 is étale-exact only when l is invertible).

**Reason:** In characteristic p with l = p, μ_p is the trivial étale sheaf on Sm/k while O^×/p ≠ 0 étale-locally, so Z/p(1)_ét ≃ O^× ⊗^L Z/p[−1] is not μ_p.

**Effect:** a stated result. **Prior-status record:** The authors' list of corrections (archived 2021-11-23): 'p.27 Corollary 4.8: The hypothesis 1/l ∈ k should be added'..

### M.1 / MotivicEtaleKTheory/E8

**Source and locator:** MVW2006, Lemma 1.7, printed p. 5 (PDF p. 20).

**Independent disposition:** confirmed. Lemma 1.6 requires a normal base; finite-correspondence composes only through smooth Y.

**Proposed correction or interpretation:** Y must be normal, so that Lemma 1.6 applies; for the composition in Cor_k, Y is smooth, hence normal.

**Reason:** The proof applies Lemma 1.6, whose hypothesis is a normal base, to W̃ → Y.

**Effect:** nothing. **Prior-status record:** The authors' list of corrections (archived 2021-11-23): 'p.5, Lemma 1.7: Y must be normal, in order to cite 1.6.'.

### M.1 / MotivicEtaleKTheory/E9

**Source and locator:** Voevodsky2003RPO, Proposition 9.6, p. 36, arXiv v1 (Proposition 9.7, p. 34, Publ. Math. IHÉS 98, identical text).

**Independent disposition:** confirmed. Degree count and Lemma 9.1 of the same paper; checked on the page images of both versions.

**Proposed correction or interpretation:** The second summand is Sq^{2r}(u) ∧ Sq^{2i−2r+1}(v).

**Reason:** As printed the term has total Sq-degree 2i − 1, not 2i + 1; for i = 0 it would give Sq^1(uv) = Sq^1(u)v, contradicting the Leibniz rule (8.1). Translating Lemma 9.1 (C_{i+1}(u∧v) = Σ C_{r+1}(u)D_{i−r}(v) + D_r(u)C_{i−r+1}(v) + ρC_{r+1}(u)C_{i−r+1}(v)) through P^j = D_{d−j}, B^j = C_{d−j} gives Sq^{2r}(u)Sq^{2i−2r+1}(v).

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E10

**Source and locator:** Voevodsky2003RPO, Theorem 10.2, case a + b odd, p. 39, arXiv v1 (p. 36 of the published version, same up to writing ((j+1) mod 2)ρ for ρ^{(j+1) mod 2}).

**Independent disposition:** confirmed. Bidegree count and the case a = 1, b = 2 against Lemma 9.5; the a odd, b even correction recomputed from the even-even relation. The a even, b odd correction is fixed only to the extent forced by bidegrees.

**Proposed correction or interpretation:** The correction terms must be ρ·Sq^xSq^y with x, y odd and x + y = a + b − 1, summed over j. For a odd and b even, the proof's route (apply β to the even-even relation, using β(τ) = ρ) gives Sq^aSq^b = Σ_j C(b−1−j, a−2j) Sq^{a+b−j}Sq^j + ρ Σ_{j odd} C(b−1−j, a−1−2j) Sq^{a+b−j−1}Sq^j; for a even and b odd the printed Sq^{a+b+j}Sq^{j−1} must read Sq^{a+b−j}Sq^{j−1} (j even).

**Reason:** The printed correction leaves j unbound and is not bidegree-homogeneous: for a = 1, b = 2 it gives Sq^1Sq^2 = Sq^3 + ρSq^2, but ρSq^2 has bidegree (3, 2) while Sq^1Sq^2 has (3, 1), and Lemma 9.5 gives Sq^1Sq^2 = Sq^3 exactly. Weight counting forces x, y odd. For a = 3, b = 2, applying β to Sq^2Sq^2 = τSq^3Sq^1 gives Sq^3Sq^2 = ρSq^3Sq^1, matching the corrected formula (j = 1).

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E11

**Source and locator:** Voevodsky2011, Lemma 5.13, (5.9), p. 31, arXiv 0805.4430v2.

**Independent disposition:** confirmed. The n = 1 case computed directly in the topological Steenrod algebra; the use in Proposition 5.12 only needs Q_n(μ) = ±βP^b(μ) up to a unit.

**Proposed correction or interpretation:** With Milnor's operations Q_i (Q_1 = P^1β − βP^1), which the proof uses through Milnor's Theorem 4a: Q_0P^b = Σ_{i=0}^{n} (−1)^i P^{b−(l^i−1)/(l−1)} Q_i. The printed identity holds for the operations (−1)^iQ_i.

**Reason:** n = 1, b = 1: Q_0P^1 = βP^1, while P^1Q_0 + P^0Q_1 = P^1β + P^1β − βP^1 = 2P^1β − βP^1 ≠ βP^1 for l odd (P^1β, βP^1 are distinct admissible monomials). Milnor's relation P^RQ_k − Q_kP^R = Σ_j Q_{k+j}P^{R−l^k e_j} gives the alternating signs.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E12

**Source and locator:** Voevodsky2011, Theorem 6.3, p. 34, arXiv 0805.4430v2.

**Independent disposition:** confirmed. Compared the statement with Haesemeyer–Weibel's account of its proof.

**Proposed correction or interpretation:** The cited proof (Suslin–Joukhovitski) assumes the Bloch–Kato conjecture in degree n − 1, a nonzero symbol and μ_l ⊂ k (Haesemeyer–Weibel, introduction to Theorem 0.7); the theorem should carry these hypotheses.

**Reason:** Haesemeyer–Weibel: 'It assumes that the Bloch-Kato conjecture holds for n − 1'. Voevodsky applies Theorem 6.3 only in Lemmas 6.7 and 6.15, inside the induction where that hypothesis holds, so the proof of Theorem 6.1 is unaffected.

**Effect:** nothing. **Prior-status record:** Haesemeyer–Weibel, Norm varieties and the chain lemma (after Markus Rost), introduction (2009).

### M.1 / MotivicEtaleKTheory/E13

**Source and locator:** HW2009Chain, §9, p. 24 (author's copy dated 2 January 2009).

**Independent disposition:** confirmed. Read on the page image; inconsistent with p. 1.

**Proposed correction or interpretation:** dimension p^{n−1} − 1, as in the definition in the introduction (p. 1).

**Reason:** The introduction defines norm varieties for symbols of length n with dimension p^{n−1} − 1, and Theorem 0.7(2) makes them ν_{n−1}-varieties; p^n − 1 is the dimension of ℙ(A) (Theorem 8.1).

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E14

**Source and locator:** Voevodsky2003RPO, Lemmas 6.13, 6.15 and proof of Theorem 6.14, pp. 25-27, arXiv v1.

**Independent disposition:** confirmed. Bidegree count; compared with the published text.

**Proposed correction or interpretation:** u and v are interchanged relative to Theorem 6.10 (u ∈ H^{1,1}, v ∈ H^{2,1}): p∗ζ(d) = −v^{l−1}, x = uv^{l−2}, y = v^{l−1}, p∗ζ(c) = −uv^{l−2}.

**Reason:** d has bidegree (2l − 2, l − 1), u^{l−1} has (l − 1, l − 1); the published version prints the corrected formulas.

**Effect:** nothing. **Prior-status record:** Publ. Math. IHÉS 98 (2003), Lemmas 6.13, 6.15 and (6.14).

### M.1 / MotivicEtaleKTheory/E15

**Source and locator:** Voevodsky2003RPO, Theorem 10.3, second relation, p. 42, arXiv v1 (p. 37 of the published version).

**Independent disposition:** confirmed. Read on the page images of both versions; compared with the admissibility condition s_i ≥ l s_{i+1} + ε_i of RPO §11.

**Proposed correction or interpretation:** The relation for P^aB^b = P^aβP^b holds for 0 < a ≤ lb, as in topology (Steenrod–Epstein, Theorem VIII.1.6, which the proof invokes).

**Reason:** With b > 0 the printed v1 range 0 ≥ a ≥ lb is empty; the published range a ≥ lb includes a ≥ lb + 1, where P^aβP^b is an admissible monomial and no Adem relation applies. The proof says the relations are exactly the topological ones, whose range is a ≤ lb.

**Effect:** nothing. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E16

**Source and locator:** Voevodsky2011, §6, sentence before Theorem 6.16, PDF p. 41 (arXiv:0805.4430v2; the Annals version was not read).

**Independent disposition:** confirmed. The cited paper was read; the deduction it is credited with is absent for odd l in positive characteristic. The stated theorem is true (the node mod-l-norm-residue plans the specialisation step).

**Proposed correction or interpretation:** [6] (Motivic cohomology with Z/2-coefficients, Publ. IHÉS 98, 2003) contains the general implication from Hilbert 90 to the Bloch–Kato and Beilinson–Lichtenbaum statements over every field of characteristic ≠ l (Theorem 6.6, Corollaries 6.9-6.10), and proves the case l = 2 directly over every field of characteristic ≠ 2, but it contains no passage from fields of characteristic 0 to fields of characteristic p ≠ l. For odd l and char k = p > 0, Theorem 6.16 needs an additional step, for example specialisation from the fraction field of W(k^perf) using rigidity of K^M_*/l and the split residue sequence of Galois cohomology of a complete discretely valued field.

**Reason:** MCZ2 read in its published version (§§1, 5-7, Appendix B): every hypothesis is char k ≠ l or char k ≠ 2, Theorem 7.4 is proved directly in each characteristic ≠ 2 with Pfister quadrics, and no specialisation, Witt-vector or henselian lifting argument occurs. The extensions K_a that [6, pp. 96-97] needs come, for odd l, from norm varieties and the Rost motive, which Voevodsky 2011 constructs only in characteristic 0 (§5: 'we work over fields of characteristic zero'), so [6] does not supply them in characteristic p.

**Effect:** the proof. **Prior-status record:** new.

### M.1 / MotivicEtaleKTheory/E17

**Source and locator:** Voevodsky2011, §6, after Theorem 6.1, PDF p. 33 (arXiv:0805.4430v2).

**Independent disposition:** confirmed. Checked against the table of contents and §6.

**Proposed correction or interpretation:** 'Further on in this section' (Theorem 6.16): §6 is the last section of the paper.

**Reason:** The table of contents and the text end with §6; the extension is Theorem 6.16 on p. 41 of the same section.

**Effect:** nothing. **Prior-status record:** new.

### M.5d / MotivicEtaleKTheory/E1

**Source and locator:** KF2000, A2.2, printed p.40 (PDF p.10), definition of k_n(O).

**Independent disposition:** confirmed. Confirmed visually in the publisher PDF and repeated in arXiv v1/author volume. BK (2.3) has the tame-residue target of degree n−1; specialization from the kernel is a separate degree-n map.

**Proposed correction or interpretation:** The defining map is the tame residue k_n(E)→k_(n−1)(k). The subsequent specialization from its kernel to k_n(k) is a separate map.

**Reason:** The residue decreases degree. Bloch–Kato (2.3), printed p.114, displays the degree-(q−1) target explicitly; confusing it with specialization destroys the diagram.

**Effect:** the proof. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

### M.5d / MotivicEtaleKTheory/E2

**Source and locator:** KF2000, A2.2, printed p.40 (PDF p.10), definition of ν_n(O).

**Independent disposition:** rejected. Rejected as a demonstrated misprint: the arrow on p.40 is unlabeled, not labeled as quotient projection. A2 already defines the Artin–Schreier/Cartier operator on pp.35–36, so that context supplies the intended arrow. Labeling it would clarify the exposition; the counterexample to projection does not establish that projection was asserted. Retain the Cartier operator in the blueprint.

**Proposed correction or interpretation:** Label the arrow 1−C⁻¹ (or its negative), rather than leaving a quotient projection as the only evident map.

**Reason:** BK (2.3), printed p.114, specifies 1−C⁻¹. The kernel of projection in degree zero is zero, whereas the logarithmic kernel contains 1. The intended arithmetic target would be lost.

**Effect:** the proof. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

### M.5d / MotivicEtaleKTheory/E3

**Source and locator:** KF2000, A2.1 Definitions–Properties (1), printed p.36, followed by the ordering of S in the proof on p.37 (PDF pp.6–7).

**Independent disposition:** confirmed. Confirmed visually, with the same text in both other versions. Under the stated componentwise order (1,4) and (2,3) are incomparable, so the asserted strict enumeration of all increasing tuples fails. BK Proposition 2.4 uses lexicographic order; replacing the order alone does not certify the complete sketch.

**Proposed correction or interpretation:** Use the lexicographic order of BK Proposition 2.4, printed p.115, and recheck every lower-term assertion against that order. This identifies the failed enumeration, not a certification of the whole supplementary proof.

**Reason:** The printed componentwise strict partial order does not totally order increasing tuples: (1,4) and (2,3) are incomparable. Consequently all increasing 2-tuples from four indices cannot be enumerated as the asserted strict chain.

**Effect:** the proof. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

### M.5d / MotivicEtaleKTheory/E501

**Source and locator:** KF2000, A1.1, generators-and-relations description of differentials, printed p.31 / PDF p.1.

**Independent disposition:** confirmed. Confirmed visually and in both other versions. The valuation example over Q(t) satisfies the two displayed relations and fails additivity, so the generators-and-relations presentation needs the additive relation. The preceding derivation universal property supplies the correct object.

**Proposed correction or interpretation:** Include the additive relation d(x+y)=dx+dy for all x,y∈B. The preceding derivation universal property is the correct specification, and the roadmap should use the existing Kähler differential module with additive derivation.

**Reason:** Leibniz and annihilation of base scalars do not imply additivity. Take A=ℚ, B=ℚ(t), M=B and define δ(f)=f·ord_t(f) for f≠0, δ(0)=0. Valuation additivity gives δ(fg)=fδ(g)+gδ(f), and δ annihilates ℚ, but δ(t+1)=0 whereas δ(t)+δ(1)=t. Thus the displayed relations alone admit a nonadditive map and do not present Kähler differentials.

**Effect:** a stated result. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

### M.5d / MotivicEtaleKTheory/E502

**Source and locator:** KF2000, A1.1, second symbol relation, printed p.33 / PDF p.3.

**Independent disposition:** confirmed. Confirmed visually and in both other versions. The free a₂ in the second relation must be the same a as on the left; the dlog product rule and the supplied Q(t) example both verify this.

**Proposed correction or interpretation:** The final term is [a,b₂}; the same coefficient a occurs in both terms.

**Reason:** The relation comes from a·dlog(b₁b₂)=a·dlog(b₁)+a·dlog(b₂). The printed a₂ is free and unrelated to a. For example over ℚ(t), a=0, a₂=1, b₁=1, b₂=t gives zero on the left and dt/t on the right if the printed relation is imposed.

**Effect:** nothing. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

### M.5d / MotivicEtaleKTheory/E504

**Source and locator:** KF2000, A2.1 proof of Proposition, definition of r on p.38 and top-degree forms on p.39 / PDF pp.8–9.

**Independent disposition:** confirmed. Confirmed visually and in both other versions. The full p-basis interval has degree [k₂:k₀], whereas [k₂:k₁] omits one element. The p=2,n=2 example gives r−n=−1 with the printed exponent. The correction restores the top-degree dimension, without certifying other elimination steps.

**Proposed correction or interpretation:** Define pʳ=[k₂:k₀], using the p-basis indices in the full interval from s(1) through s(n), rather than [k₂:k₁]. Then r is the degree of the top differential form and r−n is the number of complementary indices.

**Reason:** The displayed definitions give [k₁:k₀]=p. Thus the printed r omits one p-basis element. Already for p=2, k=𝔽₂(b₁,b₂), n=2 and s=(1,2), the printed r is 1 although the interval has two elements: it asks for m(r−n)=m(−1), and Ω¹(k₂/k₀)/d(k₂) has dimension five over k₀, not one (Ω¹ has dimension eight and d(k₂) has dimension three). With r=2 the empty complement and the top-degree one-dimensional cohomology have the intended sizes.

**Effect:** the proof. **Prior-status record:** No published correction located in the recorded searches; novelty is unestablished..

## Structural proposals and upstream notes

The [handoff](../handoff/ASM-MotivicEtaleKTheory.md) collects the four restructuring proposals and every supplier request. Graph changes are proposals for the orchestrator; this assembly edits no atlas graph or upstream roadmap. The MC.4 higher-Chow supplier is now cited by exact node in M.5d and M.7, while the independent PS.4 prefix is still unresolved.

**rescope:** MotivicEtaleKTheory, SchemeKTheoryOperations, GeneralAlgebraicKTheory, KTheoryLowDegrees, EnhancedDerivedSheaves, K2SymbolsBrauer. Stage edges that this packet's prerequisites need and that neither data/atlas.json nor an accepted restructuring records, even through a path, and edges into M.4 and M.5a that no node uses. M.4 uses no λ- or Adams operations, so SchemeKTheoryOperations:S.6 → M.4 carries nothing (RT-AREA-ktheory-2/41); the accepted RS-18 already added S.6 → M.6b, and its edges GeneralAlgebraicKTheory:K.7 → M.4 and KTheoryLowDegrees:Z.3 → M.4, added 'to preserve the prerequisite formerly exposed through S.6', are used by no M.4 node either. M.5a takes the Verdier localisation and its monoidal structure from Mathlib, so EnhancedDerivedSheaves:E5:abstract → M.5a carries nothing. Once those edges are dropped, the K2SymbolsBrauer stages reach M.4–M.5c only through direct edges: M.4's Nesterenko–Suslin–Totaro node imports T.2 (Milnor K-theory), T.3 (residues) and T.4 (Kato's norm, Suslin reciprocity) (RT-AREA-ktheory-1/12); M.5a's motivic complexes and M.5b's norm varieties use Milnor K-theory and its norms; M.5c imports ProfiniteCohomology Layers 9 and 12, M.1, M.3 and K2SymbolsBrauer T.2–T.4 (RT-AREA-ktheory-1/14). M.4's Dedekind Gersten node uses the Gillet–Levine presentation lemma and Zariski descent formalism of SchemeKTheoryOperations S.4, and M.5a takes the Nisnevich site from S.4/nisnevich-site; these two edges put S.1–S.4 among the ancestors of M.4 and M.5a for a real use, unlike S.6.

**Proposal:** Drop SchemeKTheoryOperations:S.6 → MotivicEtaleKTheory:M.4 (RT-AREA-ktheory-2/41; S.6 → M.6b is already in the atlas through RS-18), GeneralAlgebraicKTheory:K.7 → M.4 and KTheoryLowDegrees:Z.3 → M.4 (RS-18), and EnhancedDerivedSheaves:E5:abstract → M.5a. Add: inside the roadmap M.1 → M.2, M.1 → M.5a, M.1 → M.5c and M.3 → M.5c; K2SymbolsBrauer T.2:symbols → M.4, M.5a, M.5b and M.5c; T.3:symbols → M.2, M.3, M.4 and M.5c; T.3:localization-comparison → M.3; T.4 → M.3, M.4, M.5a and M.5c; T.5 → M.2 and M.3; ArithmeticKTheory N.2 → M.2 and M.3, and N.3:ranks → M.3; tauceti:TauCetiRoadmap/ProfiniteCohomology Layer 9 → M.1, M.3, M.5 and M.5c, and Layer 12 → M.5c; tauceti:TauCetiRoadmap/ClassFieldTheory Layer 0 → M.3, Layer 11 → M.3, Layer 12 → M.3 and Layer 13 → M.1; tauceti:TauCetiRoadmap/QuadraticFormInvariants Layer 4 → M.5b; SchemeAndStackFoundations SF.2 → M.1 and M.2; SchemeKTheoryOperations S.4 → M.4 and M.5a; MotivesAndAlgebraicCycles MC.4 → M.5b and M.5c; EtaleDualityAndPerverseSheaves EDC.0 → M.1; ClassicalAdicEtaleCohomology H1:henselian → M.1; AnabelianGeometryAndNonabelianChabauty NC.0 → M.1. Together with the drops, these edges were checked acyclic by script against the stageEdges and stage requires of data/atlas.json and the links and suppliedBy entries of every accepted RS-*.result.json, and the node graph of all packets in research/blueprint/packets has no cycle through this packet.

**rescope:** MotivicEtaleKTheory, MotivesAndAlgebraicCycles. The sibling packet MotivicEtaleKTheory--M.5d requests from M.5a a transfer-compatible comparison between the cycle complex and the Nisnevich motivic complexes. RS-08 makes MotivesAndAlgebraicCycles:MC.4 the owner of the higher-Chow/motivic-cohomology comparison (MC.4/motivic-cohomology-higher-chow). This packet supplies the transfer structure and the comparison input (M.5a/cycle-complex-transfers) and leaves the packaged comparison with MC.4.

**Proposal:** Add the edge MotivesAndAlgebraicCycles:MC.4 → MotivicEtaleKTheory:M.5d (acyclic: MC.4's ancestors in this roadmap are M.4 and M.5a only), so that M.5d/mod-prime-motivic-comparison and M.7/beilinson-lichtenbaum cite MC.4/motivic-cohomology-higher-chow together with M.5a/cycle-complex-transfers.

**Upstream note (tauceti:TauCetiRoadmap/ProfiniteCohomology):** Layer 9's Kummer interface is consumed by MotivicEtaleKTheory M.1, M.3 and M.5c in all degrees through the twist pairings; the twists μ_m^{⊗j} for j ≠ 1 are planned in MotivicEtaleKTheory M.1/finite-tate-twist, on top of Tau Ceti's KummerCoeff, rather than in the upstream roadmap.

**Upstream note (tauceti:TauCetiRoadmap/QuadraticFormInvariants):** Layer 4 proves roundness of Pfister forms and 'isotropic iff hyperbolic' only for n ≤ 2 and excludes the general n-fold theory. MotivicEtaleKTheory M.5b/pfister-norm-variety (the l = 2 norm quadrics of the Milnor conjecture) needs both in every degree, together with the Elman–Lam criterion that an n-fold Pfister form is hyperbolic iff its symbol vanishes in K^M_n/2; the packet records this as a gap with no owner.

**rescope:** MotivicEtaleKTheory, RefinedTraceMethods. M.7 requires real BO/KO and its finite-coefficient period-eight extension calculation. The current RT.4 provides complex ku/KU, so the real carrier is an additional supplier obligation, not a second topological K construction here.

**Proposal:** Refined trace methods, Part II: Real topological K-theory. First prerequisite RefinedTraceMethods:RT.4; add real BO/KO, real Bott periodicity and finite-coefficient boundary/extension calculations; export to M.7/suslin-real-comparison and real-mod-two-sequence. Keep M.7 responsible only for the algebraic-real comparison and arithmetic application.

**rescope:** MotivicEtaleKTheory, tauceti:TauCetiRoadmap/HodgeStructures. The upstream mixed-Hodge layer is imported as existing work. The logarithmic Deligne–Beilinson cone, compactification independence and multiplicative motivic realization required by M.8 are additional exports; no upstream layer is replanned or changed.

**Proposal:** Hodge structures, Part II: Deligne–Beilinson realization. First prerequisite tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne; supply the actual logarithmic cone, compactification-independent realization, products and real conjugation. Extend the existing Hodge-direction Part II owner rather than creating a competing generic realization library. M.8 owns only K-theory regulator applications and the early number-field normalization.

**Upstream note:** The current layer-level R.7→M.8 and D.2→M.8 links must be interpreted at declaration granularity: finite-etale-chern and number-field-deligne-normalization export before these late comparisons. R.7 consumes the early M.8 Deligne class; regulator-determinant-comparison alone consumes R.7. A whole-stage reverse edge would form a cycle. The existing atlas is not edited by this part.

**Upstream note:** RS-28 keeps the prime-power/reduction interface in M.5d but left the independent BGK differential theorem requested. The verified RT-AREA-ktheory-1/13 routing places its proof in the present BGK node; HL.2 can import that node independently of M.5a–M.5c. Maintainer applies the corresponding link refinement.

**Upstream note:** Verified RT-AREA-ktheory-2/18 needs HabiroNumberFields:HB.1/HB.2 and PadicHodgeRegulators:D.2 to consume finite-etale-chern directly. The early map has no D.2/R.7 prerequisites. Kummer and Bott/factorial tests retain the actual normalization.

**Upstream note:** RS-33 assigns generic filtered-spectrum/exact-couple/Milnor machinery to H.6 and stable diagram infrastructure to EnhancedDerivedSheaves; present nodes only instantiate it for the support tower. Existing supplier packets remain unchecked/partly open, not treated as library implementations.

**Upstream note:** The general Selmer mapping-fibre carrier belongs to SelmerIwasawaCohomology:L2, finite-condition propagation to L4 (the condition on V comes from PadicHodgeRegulators:L1), and determinant/base-change to PadicMeasuresIwasawaAlgebras:L5. M.8 specializes their supplied maps and cases only.

**Upstream note:** REV-MotivicEtaleKTheory--M.5d: PS.4→PS.3→M.8 is a further early/late dependency tension. The request for a rational fundamental line needs an independent MC.2/PS.0/determinant prefix, before the PS.3/PS.4 leading-term regulator assembly. No supplier roadmap is edited here.
