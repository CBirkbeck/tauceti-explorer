# Geometric invariants for real quadratic fields — extraction checkpoint

Current continuation: Codex — `codex-c83e7a`, 23 September 2026, issue #1170. **Partial:188 items,22 library imports,6 existing-plan imports,160 missing contracts;56 definitions/constructions with168 APIs and168 proposed tests.** The Biró continuation at the end supplies the current operator-order and source-gate status. The intervening sections preserve the earlier report and its explicitly historical counts/read scopes.


Codex, continuation session `codex-a71f92` (building on `codex-c83e7a` and `cc-fb70e5`); issue #1170; 22 September 2026. **Partial.** The publisher’s entire 42-page paper was read. The inventory has 169 items: 19 pinned-library imports, four imports from existing plans and 146 missing contracts, each assigned once. The 52 definitions/constructions have 156 proposed API statements, recorded uses and 156 proposed tests. Recursive proof closure remains open at the eight source gates below. No Lean code is submitted or claimed to compile.

The source is Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*, Annals of Mathematics 184 (2016), 949–990, [publisher page](https://annals.math.princeton.edu/2016/184-3/p08) and [final PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). All of §§1–10, Appendix A and the references were read, rather than only theorem statements. The PDF SHA-256 is `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`. Source archives, actual read scopes, pinned declaration statements and inspected input hashes are in the JSON. Page numbers below are printed page numbers.

## The geometric and arithmetic endpoint

Write Γ=PSL₂(Z), with curvature −1 on H and measure dμ=dx dy/y²; the modular fundamental domain has area π/3. Let D>0 be fundamental and K=Q(√D), excluding the trivial discriminant 1 from the field construction. Let ε_D>1 be the least totally positive unit of norm one in the **full** ring of integers. Write Cl⁺ for the narrow ideal class group and J for the class of (√D). An ideal with a positive-norm generator has a totally positive generator after a possible sign change. A negative-norm generator has narrow class J. The map Cl⁺→Cl has kernel {1,J}; a norm −1 unit makes J=1.

A reduced quadratic irrational satisfies 0<w^σ<1<w. Its primitive minus continued fraction has digits n_j≥2, not all 2. The least period has length ℓ and digit sum m. Cyclic rotations identify the same class, while repetitions must be removed before computing ℓ. This distinction affects the surface area. Ordinary Pell theory over Z[√d] alone does not supply the full-order unit for D≡1 modulo 4; items 6 and 13 record the necessary adapter.

For the cycle of a narrow class A, set N_k=n₁+⋯+n_k, T(z)=z+1 and S(z)=−1/z. The involutions S_k=T^{N_k}ST^{−N_k}, together with T^m, generate Γ_A. Here “generated subgroup” is algebraic generation, not topological closure. Its Nielsen region is the interior of the convex hull of its limit set. Retaining the boundary of this region and quotienting by Γ_A produces the arithmetic core F_A.

Theorem 1 is split among items 27–40. Its outputs are the second-kind group, its core and modular projection, signature

\[
(0;\underbrace{2,\ldots,2}_{\ell_A};\ 1\text{ cusp};\ 1\text{ geodesic boundary}),
\]

the free product Z*(C₂)^ℓ_A, a simple geodesic boundary upstairs of length 2 log ε_D, and area πℓ_A. The boundary projects to the parametrized closed geodesic C_A. Its modular image can retrace itself or overlap other projected pieces. The construction and class/conformal-invariant statements therefore require more than a list of signature numbers.

The correct measure on the modular orbifold is

\[
\nu_A(B)=\mu_{F_A}(p_A^{-1}B),\qquad
\int f\,d\nu_A=\int_{F_A}(f\circ p_A)\,d\mu.
\]

It counts each preimage. Replacing F_A with its set-theoretic image in Γ\H loses this multiplicity. Item 48 makes the pushforward an explicit construction before it is used in any limiting theorem.

Theorem 2, items 51 and 153–154, says that for a genus G_D and an open disc Ω contained strictly inside the standard fundamental domain,

\[
\frac{\sum_{A\in G_D}\nu_A(\Omega)}
 {\sum_{A\in G_D}\operatorname{area}(F_A)}
\longrightarrow \frac{3}{\pi}\mu(\Omega)
\]

as positive fundamental D tends to infinity. The smooth-test-function version precedes the disc approximation; the null boundary and positivity argument are separate obligations. The genus is a coset of Cl⁺². The quotient Cl⁺/Cl⁺² is not the subgroup Cl⁺[2]. Equal genus sizes enter the lower bound for total core area.

The worked D=28 cycles are (3,6) and (3,3,2,2,2), with ε=8+3√7 and areas 2π and 5π. The D=12 cycles (4) and (2,3) have ε=2+√3. These tests simultaneously distinguish primitive period, cusp width, boundary length and area. The paper’s observations involving an infinite class-number-one subsequence are conditional; the extraction does not assert its infinitude. The separate Hirzebruch–Zagier length identity is retained as item 55.

## Spectral identities and their conventions

The three cases are surfaces for two negative genus factors, closed geodesics for two positive factors, and CM points for opposite signs. Items 69, 119, 127–130 and 140–142 keep these cases separate. For a factorization D=dd′, retain all fundamental-discriminant and coprimality hypotheses where the theorem requires them; Proposition 6 allows a more general discriminant d′. The trivial character factor d=1 is permissible in L-function statements even though it is not a quadratic field discriminant.

The weight-zero Hecke–Maass form is normalized by

\[
\phi(z)=2\sqrt y\sum_{n\ne0}a(n)K_{ir}(2\pi|n|y)e(nx),
\quad a(1)=1,\quad \lambda=\tfrac14+r^2.
\]

It is not generally an L²-unit vector. The half-weight form F is L²-unit, has spectral parameter r/2, and uses the W-Whittaker coefficients b(n). In the three geometric cases, Theorem 4 equates the appropriate trace of ||φ||⁻²φ to

\[
12\sqrt\pi\,|D|^{3/4}b(d')\overline{b(d)}.
\]

The surface trace includes λ/2. The CM trace includes 2√π/ω_D, where the projective elliptic stabilizer order is 3 at D=−3, 2 at D=−4 and 1 otherwise. Counting SL₂ stabilizers would introduce an erroneous factor two. The Eisenstein coefficient product in (5.15) is bilinear, without the conjugation in Theorem 4.

The Hecke and Shimura coefficient relation is an explicit item, not implicit in the term “Shimura lift.” The lift first belongs to the half-weight **eigenline**. The all-prime convention needs a p=2 check: simultaneous diagonalization only for T_{p²}, p>2, does not by itself specify the missing Euler factor. Formal Fourier coefficients with the desired Hecke relations also do not prove modular automorphy; the Biró argument is an open supplier gate.

For the substitution w=s/2+1/4 and a simple pole at s₀=1/2+ir, the residue of (2s−1)H(w) is four times the corresponding residue of (2w−1)H(w). One factor two is the coordinate Jacobian and the other is the ratio of the linear factors. This argument excludes r=0. The no-exceptional-spectrum assertion has its own item 157 and still needs a source-qualified proof; a numerical first eigenvalue is not such a proof.

## Corrections and proof qualifications

These are local mathematical checks against the printed PDF. They are not an assertion that an author has issued an erratum.

1. **Laplacian, p961.** The printed −y⁻² conflicts with the eigenfunction convention and (7.10). Use Δ=−y²(∂²_x+∂²_y), which gives Δ(y^s)=s(1−s)y^s. With positive planar orientation, d(i∂_zu dz)=(Δu)/(2y²) dx∧dy.
2. **Eigenvalue, pp966 and 981–982.** The printed 1/2+r² is inconsistent with (5.6), the Whittaker parameters and the numerical pair. Use 1/4+r². The numerical example is a normalization check only.
3. **Area, p968 (6.2).** The total area is πΣℓ_A, not Σℓ_A. The factor does not change a Vinogradov exponent, but it matters to the limiting probability measure.
4. **Euler product, p970.** The Hecke Euler factor is (1−χ(𝔭)N𝔭⁻ˢ)⁻¹. Omitting χ(𝔭) changes the function to the untwisted one. The finer integrated AN.4 comparison includes the character.
5. **Uniqueness in Theorem 4, p965.** Its displayed product contains a complex conjugate, as confirmed on the page image. If F satisfies the trace identities and Hecke relation, then uF does too for every |u|=1. Its norm is unchanged and b(d′)conj(b(d)) is unchanged. Taking u=−1 gives a distinct nonzero vector. Literal vector uniqueness is false under the displayed conditions. A unique eigenline, or a vector with a specified nonzero fundamental coefficient positive real, repairs it. This observation does not refute existence or the trace identities. Proposition 6 can select the unique vector in a previously chosen orthonormal basis.
6. **Discriminant power, p981.** The extension to negative D requires |D|^{3/4}. A real D^{3/4} without absolute value cannot cover the negative branch.
7. **Appendix A, p984.** The displayed sine-power integral is missing 2^{ν−1} in its denominator. The correct formula is
   \[
   \int_0^\pi e^{i\beta\theta}\sin^{\nu-1}\theta\,d\theta
   =\frac{\pi e^{i\pi\beta/2}\Gamma(\nu)}
   {2^{\nu-1}\Gamma((\nu+\beta+1)/2)\Gamma((\nu-\beta+1)/2)},
   \quad\Re\nu>0.
   \]
   At ν=3, β=0, the integral is π/2; the displayed uncorrected expression gives 2π.
8. **Appendix A, p985.** The series for √t J_{s−1/2}(t) is missing √2:
   \[
   \sqrt tJ_{s-1/2}(t)=\sqrt2\sum_{r\ge0}
   \frac{(-1)^r(t/2)^{s+2r}}{r!\Gamma(s+1/2+r)}.
   \]
   The final constants in (A.2)–(A.3) agree after correcting these intermediate formulas. The checks do not invalidate Lemma 7.

The endpoint order in (3.5), p958, was checked on the image and is **not** another typo. It reads N_{k−1}<w_k^σ<N_{k−1}+1≤N_k−1<w_k<N_k. The subscript k−1 must not be confused with subtracting one from N_k. The nonstrict middle inequality allows the digit 2.

For the Appendix proof, use a Frobenius expansion f=t^sΣc_nt^n rather than an ordinary Taylor series for nonintegral s. The differential equation f″+(1−s(s−1)/t²)f=0 gives c₁=0 and

\[
c_n=-\frac{c_{n-2}}{n(n+2s-1)}\quad(n\ge2).
\]

For Re(s)>0 all these denominators are nonzero. This treats s=1/2 as well. The leading coefficient from the corrected sine integral and Whittaker expansion is

\[
c_0=\frac{2\pi e^{\pm i\pi\mu/2}\Gamma(s)}
 {\Gamma((s+1+\mu)/2)\Gamma((s+1-\mu)/2)}.
\]

The continuation below now supplies those analytic steps for Lemma 7 through an entire desingularization. The residual S8 suppliers (including W and infinity asymptotics) remain open.

The Stokes conversion also needs the right convergence order. For E(z,1/2+it), the constant terms have size O(y^{1/2}) and their first derivatives O(y^{-1/2}), with a limiting argument at t=0. Thus the core cusp integral is integrable against y⁻²dx dy and the horizontal boundary term tends to zero. The raw core integral generally diverges in Re(s)>1. Continue the **compact geodesic Hecke period** to the critical line first, then apply truncated Stokes there. Item 140 deliberately does not claim a common initial convergence region for the unregularized surface integral and the defining Eisenstein series.

## The spectral norm gate

The paper’s polynomial-only spectral bound in (6.6) requires an additional normalization argument. This checkpoint records the missing argument rather than suppressing it.

[Duke 1988](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf), Theorem 5 on pp85–86, was read directly, including its page image. For a unit half-weight form at parameter t, its bound contains

\[
|b(n)|\ll_\epsilon (1+|t|)^C\cosh(\pi t/2)|n|^{-2/7+\epsilon}.
\]

Here t=r/2. Theorem 4 therefore directly gives

\[
|W(\|\phi\|^{-2}\phi,\chi)|
\ll (1+r)^C\cosh^2(\pi r/4)|D|^{13/28+\epsilon}.
\]

The exponent is 3/4−2/7=13/28. This cited argument alone does not establish a polynomial-only bound for the displayed normalization. It can be used for unit-normalized spectral summation once one proves

\[
\|\phi\|_2\cosh^2(\pi r/4)\ll(1+r)^C.
\]

Item 151 routes that exact norm comparison to AL.3. Its expected proof uses a Rankin–Selberg norm identity in the **2√y, a(1)=1** convention and a polynomial adjoint-L bound.

**Continuation (Claude Code, cc-fb70e5, 22 September 2026): the exact constant.** In the paper's own normalizations, the norm identity is

\[
\langle\phi,\phi\rangle=\int_F|\phi|^2\,\frac{dx\,dy}{y^2}=\frac{2\,L(1,\mathrm{sym}^2\phi)}{\cosh(\pi r)}.
\]

The normalizations are E(z,s)=Σ Im(γz)^s from (5.2), φ=2√yΣa(n)K_ir(2π|n|y)e(nx) with a(1)=1 from (5.7), the Ramanujan-normalized Euler product (5.8), and dμ=y^{−2}dxdy from p.961.

*Derivation.* Unfolding ⟨|φ|²,E(·,s)⟩ gives

\[
8(2\pi)^{-s}\sum_{n\ge1}a(n)^2n^{-s}\int_0^\infty K_{ir}(u)^2u^{s-1}\,du .
\]

At s=1, three facts combine:

- the Mellin integral equals 2^{s−3}Γ(s/2)²Γ(s/2+ir)Γ(s/2−ir)/Γ(s), which is π²/(4cosh πr) at s=1;
- Σa(n)²n^{−s}=ζ(s)L(s,sym²φ)/ζ(2s) has residue 6L(1,sym²φ)/π²;
- Res E=3/π.

Comparing residues gives the identity. Since √2cosh²(x/4)/√(cosh x)≤√2 for x≥0,

\[
\|\phi\|_2\cosh^2(\pi r/4)\le\sqrt2\,L(1,\mathrm{sym}^2\phi)^{1/2},
\]

and the exponential factors in the displayed Weyl bound cancel exactly for u_φ.

*Checks.* The Mellin formula was verified by 40-digit quadrature at r=0.5, 2 and 5. The paper's example on p.966, with r=13.77975135 and ⟨φ,φ⟩=7.26300636×10^{−19}, gives L(1,sym²φ)=⟨φ,φ⟩cosh(πr)/2≈1.1477, which is the expected order of size.

*S4b closed (second continuation, cc-fb70e5).* The polynomial bound needs no GL₃ theory. It follows from three elementary estimates:

- a contour shift in K_{ir}(u)=½∫e^{−u cosh t+irt}dt to Im t=π/2−1/r, which gives |K_{ir}(u)|≤e^{1−πr/2}K₀(2u/(πr)), checked numerically;
- the uniform Hecke bound |a(n)|≪n^{1/2+ε}, from ‖T_p‖≤p^{1/2}+p^{−1/2} and the Hecke recursion;
- Parseval over y≥√3/2.

Together they give ⟨φ,φ⟩≪r^{2+ε}e^{−πr}. Hence L(1,sym²φ)≪r^{2+ε} and ‖φ‖cosh²(πr/4)≪r^{1+ε}. Only the norm-comparison subgate has a written proof; items 151–153 and 68 no longer carry that local gate. The noncompact resolvent, Sobolev and no-exceptional-spectrum components of S4 remain open. The continuation below repairs the prime-power Hecke estimate used here.

Set u_φ=φ/||φ||. If c_φ=⟨f,φ⟩, then

\[
c_\phi\|\phi\|^{-2}\phi=\langle f,u_\phi\rangle u_\phi.
\]

For compactly supported smooth f, integration by parts gives |⟨f,u_φ⟩|≤||Δ^Nf||₂ λ_φ⁻ᴺ. Combine this with the unit-normalized Weyl bound and eigenvalue counting before exchanging the spectral sum with the core integral. The continuous spectrum needs its own dominated estimates. Items 68, 148, 151–154 retain these distinctions.

The Eisenstein exponent is 1/4+3/16=7/16. The genus area lower bound is D^{1/2−ε}, up to ineffective constants. Thus the power savings before absorbing losses are 1/16 and 1/28. Siegel’s ineffective lower bound does not produce an effective rate. The genus factor 2^{ω(D)} and logarithms are absorbed only through a stated D^ε estimate.

## What the atlas already supplies

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The JSON records each cited declaration’s module, line, statement and file hash. Reading the actual statements, including their namespaces, matters here:

- Tau Ceti already supplies the narrow class quotient, principal classes and the norm −1 criterion. The negative-norm principal-class lemma lives in `NumberField`, whereas the injectivity criterion lives in `NumberField.NarrowClassGroup`.
- All four reviewed Multiquadratic layers are built. The elementary-two quotient, quadratic rank formula, genus character homomorphism, prime-discriminant factorization and principal genus theorem are imports, not new tasks.
- Existing PSL subgroup/action carriers and finite cyclic stabilizers support the geometric construction. The modular domain is a measurable fundamental domain with finite volume and null boundary. These statements alone do not compute π/3 or construct the Nielsen core.
- Mathlib supplies the hyperbolic distance and measure convention, fundamental discriminants, scalar Jacobi theta series, the real-axis Dedekind zeta residue, and completed primitive Dirichlet functional equations. The paper’s θ is y^{1/4}jacobiTheta(2z). Its completion differs from Mathlib’s by N^{s/2}π^{α/2}. These adapters must be proved.

The four existing-plan imports are the upstream polygon theorem (31), automorphic spectral decomposition (66), the finer integrated `AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison` (134), and the lower spectral supplier scope (156). The finer Hecke item was read in full, including its ideal-character and ramified-place conventions. Source routes can supply further evidence for those planned items; the upstream polygon plan is not routed for replacement.

The ownership screen included all 211 cached roadmap extracts, fourteen relevant extracts, available new roadmap/packet inputs, integrated decompositions, reserved identifiers and the reviewed library audit. The FuchsianOrbifolds and Multiquadratic upstream documents were read in full. Other long documents were read to the relevant supplier scope; no full-read claim is made for every neighboring document. Pre-publication input hashes are rechecked separately.

## Routes and design boundaries

| Route | Items/scope | Reason and imported boundaries |
|---|---|---|
| **FuchsianOrbifoldsPartII**, Part II of `tauceti:TauCetiRoadmap/FuchsianOrbifolds` | Exact area, limit sets, arithmetic core, signature/presentation/rigidity, pushforward multiplicity and Stokes | Extends existing Fuchsian/orbifold infrastructure. Imports quadratic cycle arithmetic from GN.3 and analysis from AS. The full design brief in JSON states the Theorem 1 endpoints and tests. |
| **MultiquadraticPartII**, Part II of `tauceti:TauCetiRoadmap/Multiquadratic` | J-kernel/signs, genus coset sizes and the possibly imprimitive form-character adapter | Extends the built genus theory; imports the form carrier from GN.3. Does not duplicate narrow groups or the principal genus theorem. |
| **GeometryOfNumbersAndQuadraticArithmetic:GN.3–4** | Reduction, oriented forms/geodesics, class invariant dictionary and equidistribution | Existing reduction and Duke-distribution layers own the arithmetic and limiting endpoint. Import the core measure and trace identities. |
| **AutomorphicSpectralTheory:AS.0,1,2,4** | Laplacian, special functions, Eisenstein/Poincaré families, noncompact resolvents, spectrum and summation | Generic analytic suppliers stay here; MP imports them for its multiplier adaptation. |
| **MetaplecticAutomorphicForms:MP.5,7** | Theta norms, half-weight multiplier and plus space, modified Kloosterman sums, Shimura eigenlines, coefficient traces | Existing half-integral-weight scope; no new genus-two MP.8 direction. Waldspurger’s central-value identity is imported from GZ.5. |
| **AutomorphicFormsOnReductiveGroups:AF.2–3** | Maass carrier, parity and normalized Hecke operators | Existing automorphic-space and cuspidality ownership. |
| **AutomorphicLFunctionsAndLocalFactors:AL.2–3** | Standard/twisted Maass L-functions and the norm comparison | Exact constants must be supplied before spectral summation. |
| **AnalyticNumberTheory:AN.3–4** | Siegel bound, partial zeta functions, Hecke integrals and genus factorization | Reuses the finer reviewed Euler-product node; imports built class algebra and residue. |
| **GrossZagierAndArithmeticHeights:GZ.5** | Waldspurger central value formula | The existing period-identity owner imports MP’s normalization. |
| **ExponentialSumsAndCircleMethod:ES.0** | Generic finite Kloosterman sums and Burgess input | Half-weight multiplier-specific sums stay in MP.7. |

No standalone roadmap named after this paper is proposed. Each of the 146 missing inventory items occurs in exactly one route. The two Part II briefs contain target statements, required constructions, named imports and discriminating tests; they are reviewable proposals, not accepted atlas changes.

## Source gates and continuation

The main paper has been read completely, but that is not recursive source closure. The JSON gives precise `neededBy` item IDs for each gate.

- **S1, arithmetic:** source the full minus-reduction theorem, ideal/cycle equivalence and full-order unit proof in Zagier. Split the classification and orientation interfaces further.
- **S2, geometry:** read Maskit’s polygon theorem with free-side hypotheses and close the limit-set/core equality, conformal rigidity, complementary-tile multiplicities and Stokes boundary proof. Import the upstream polygon plan.
- **S3, Hecke/genus/Dirichlet:** source the exact narrow signs, ramified Euler factors, Hecke periods, Siegel and hybrid Burgess estimates. The original books and Burgess proof have not been read in full.
- **S4, spectral:** acquire Fay’s actual paper and the required noncompact analytic statements. The norm comparison in item 151 now has a written proof; still source no-exceptional level-one spectrum and Sobolev trace/integration conditions.
- **S5, half weight:** compare the operator order in DIT16’s `(2/3)WU+1/3` with DIT11’s `(2/3)(U₄∘W₄)+1/3` after conjugating by y^{1/4}. This changes the U scalar to √2; the order still requires an explicit comparison. DIT16 footnote 7 corrects DIT11 (2.19) to P_d⁺=(3/2)pr⁺P_d, so the projected seed has factor 2/3. Read the original Kohnen finite-sum identity and Chiera norm proof.
- **S6, correspondence:** acquire Biró and Baruch–Mao for the automorphy, linear-independence, all-prime Hecke and normalized central-value arguments. Both requested PDFs returned HTTP 403. An author-page bot rejection and a metadata page do not count as proof reads.
- **S7, coefficient bounds:** all eighteen pages of Duke88 were read. Its Proskurin/Kuznetsov and Iwaniec input sources remain unclosed. Preserve the spectral cosh factor while decomposing them.
- **S8, residual Appendix suppliers:** the continuation below completes the written all-parameter integral proof. Still close the W definition, infinity asymptotics, comparison and differentiated-seed suppliers in items 110–114 and 116. Finite diagnostics are not the proof.

DIT11’s publisher PDF was read selectively at printed pp956–960 and 964–977, including the unfolding and Bessel calculations; the remaining pages were not claimed read. Its SHA-256 is `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`. Duke88’s PDF SHA-256 is `3c468d0c0d79ec2ab29f96dcdda6094a4ceb6603a4caaae947c0bef443f9005f`. Fay HTML was obtained, but no Fay paper text was read.

## Earlier-checkpoint validation (historical)

The scratch checks use exact integers, rational numbers and pairs a+b√D. They test 121 cycles, including the published D=12 and D=28 examples and all non-all-2 words of lengths one through four on digits {2,3,4}. They check determinant/discriminant, attracting fixed point, strict digit endpoints, the unit multiplier, product of rotated reduced irrationals, projective involutions and the boundary word. Repeated cycles in this finite family test the matrix identities; they are not accepted as primitive representatives for the area theorem.

Additional exact checks cover the signature-area coefficient, phase invariance and a missing-conjugation counterexample, four exponent computations, the residue substitution and normalization factors. The Appendix test checks 275 exact series coefficients for integer s=1,…,5 and the specified integral μ range, using rational Gamma recurrences with powers of π factored out. Three numerical quadratures at s=1, μ=0 are separate diagnostics for the integral identity; they are not exact or formal proofs.

The repository’s `check_paper.py` passed; `intake.py check-files` reported three files and zero problems. The local checks passed for the acyclic 158-node dependency graph, exactly one route per missing item, API coverage and valid roles. There were 1814 exact mathematical assertions and three numerical quadratures. Inspected roadmap/audit/packet input hashes were unchanged on current main before publication. The validator accepts parent stages in `planned`; item 134 therefore records AN.4 there and preserves its finer reviewed supplier in `plannedNodes`. No compiled Lean test suite is asserted. The handoff preserves the stable item IDs and identifies where the next worker should resume.

## Continuation: Appendix A written proof (codex-a71f92)

The 22 September 2026 continuation preserves items 1–158 and adds 159–169. Items 159–161 import pinned regularized hypergeometric convergence, beta/gamma identities and dominated complex differentiation. Items 162–167 supply a complete written proof of the integral in Lemma 7 for every stated parameter. They are mathematical proof obligations for a future formalization, not compiled Lean. Residual S8 still includes the W function, infinity asymptotics, the differentiated seed and the separate positive-cycle comparison.

### Series, branches and endpoint bounds

Put \(\sigma=\Re s>0\) and
\[
 S(x)=\Gamma(2s)\,
 \operatorname{regularizedHGFun}(\{s-\mu\},\{2s\},x).
\]
Mathlib's \(\#a\leq\#b\) infinite-radius theorem applies, including terminating numerator parameters. Since \(\Re(2s)>0\), the gamma/Pochhammer identity gives
\[
 S(x)=\sum_{n\geq0}\frac{(s-\mu)_n}{(2s)_n n!}x^n,\qquad
 M_{\mu,s-1/2}(x)=x^se^{-x/2}S(x)\quad(x>0).
\]
All positive-base powers use the real logarithm. In particular, no quotient by \(\Gamma(s-\mu)\) is used when the numerator parameter is a nonpositive integer. The Bessel adapter is
\[
 J_\nu(x)=(x/2)^\nu
 \operatorname{regularizedHGFun}(\varnothing,\{\nu+1\},-x^2/4);
\]
changing the last sign gives \(I_\nu\). These are adapters for existing series, not evidence that named Bessel/Whittaker APIs already exist.

If \(S=\sum a_nx^n\), then
\[
 (n+1)(n+2s)a_{n+1}=(n+s-\mu)a_n.
\]
Termwise differentiation therefore gives \(xS''+(2s-x)S'-(s-\mu)S=0\), and substitution proves the M differential equation in item 163. With \(q=e^{-x/2}S\), the identities \(M=x^sq\) and \(M'=x^{s-1}(sq+xq')\) imply, uniformly for \(t\) in a compact subinterval of \((0,\infty)\),
\[
 M(2t\sin\theta)=O(\sin^\sigma\theta),\qquad
 \partial_\theta M(2t\sin\theta)=O(\sin^{\sigma-1}\theta).
\]
All fixed-order \(t\)-derivatives of M retain the first bound: write
\(M(2t\sin\theta)=(2\sin\theta)^st^sq(2t\sin\theta)\).
The boundedness of every derivative of the entire function \(q\) on the relevant compact disk proves the claimed uniformity.

### Remove the singular power before differentiating

For \(\epsilon\in\{-1,1\}\), define on the whole complex plane
\[
 H_\epsilon(t)=2^s\int_0^\pi
 \sin^{s-1}\theta\,
 e^{\epsilon i(t\cos\theta+\mu\theta)-t\sin\theta}
 S(2t\sin\theta)\,d\theta.
\]
For every compact complex \(t\)-disk and every derivative order \(j\), the differentiated integrand has a common bound \(C_j\sin^{\sigma-1}\theta\). The exponential factors and derivatives of \(S\) are uniformly bounded there; \(|e^{\epsilon i\mu\theta}|\leq e^{\pi|\Im\mu|}\). Near either endpoint the remaining bound is comparable to distance-to-endpoint raised to \(\sigma-1>-1\), hence integrable. Measurability follows from continuity off the null endpoints. The pinned dominated-differentiation theorem now applies at every complex \(t\), repeatedly. Thus \(H_\epsilon\) is entire, while for \(t>0\) the original integral is \(f_\epsilon(t)=t^sH_\epsilon(t)\). The latter is not asserted to be entire at zero.

Let \(L_t=\partial_t^2+1-s(s-1)/t^2\). Direct substitution of the M equation gives
\[
 L_t\!\left(e^{\epsilon it\cos\theta}M(2t\sin\theta)\right)
 =\left(2\sin^2\theta-\frac{2\mu\sin\theta}{t}\right)
 e^{\epsilon it\cos\theta}M
 +4\epsilon i\cos\theta\sin\theta\,e^{\epsilon it\cos\theta}M'.
\]
After multiplying by \(e^{\epsilon i\mu\theta}/\sin\theta\), the last term integrates to
\[
 \frac{2\epsilon i}{t}\int_0^\pi
 e^{\epsilon i(t\cos\theta+\mu\theta)}\partial_\theta M\,d\theta.
\]
Perform integration by parts first on \([\delta,\pi-\delta]\).
Its endpoint terms are \(O(\delta^\sigma)\); the differentiated terms are integrable by the bounds just proved. Passing to the limit gives
\[
 \int_0^\pi(-2\sin\theta+2\mu/t)
 e^{\epsilon i(t\cos\theta+\mu\theta)}M\,d\theta,
\]
which cancels the other terms. This proves \(L_tf_\epsilon=0\) for both signs without assuming that complex-parameter M is real.

### The sine integral from a beta contour

For \(\Re\nu>0\), first put \(\gamma=(\beta-\nu+1)/2\) and assume \(0<\Re\gamma<1\). Substitute \(z=e^{2i\theta}\). Along the circle use
\(\arg z=2\theta\in(0,2\pi)\) and
\(\arg(z-1)=\theta+\pi/2\in(\pi/2,3\pi/2)\). Then
\[
 \int_0^\pi e^{i\beta\theta}\sin^{\nu-1}\theta\,d\theta
 =(2i)^{-\nu}\oint z^{\gamma-1}(z-1)^{\nu-1}\,dz.
\]
Deform the positively oriented circle to a contour along both sides of \([0,1]\). On the disk slit along that interval, the chosen branches are holomorphic. Remove radius-\(\delta\) neighborhoods of both endpoints before applying Cauchy's theorem. The small arcs contribute respectively \(O(\delta^{\Re\gamma})\) and \(O(\delta^{\Re\nu})\), which vanish. The upper segment goes from 1 to 0, the lower from 0 to 1. The lower value of \(z^{\gamma-1}\) differs by \(e^{2\pi i\gamma}\); on both sides the other factor is \(e^{i\pi(\nu-1)}(1-z)^{\nu-1}\). Thus the contour is
\[
 (e^{2\pi i\gamma}-1)e^{i\pi(\nu-1)}B(\gamma,\nu).
\]
Multiplying by \((2i)^{-\nu}\) simplifies this to
\(2^{1-\nu}e^{i\pi\beta/2}\sin(\pi\gamma)B(\gamma,\nu)\).
The pinned beta and reflection formulas yield item 115 with denominator factors
\(\Gamma(1-\gamma)\Gamma(\gamma+\nu)\).

For each fixed \(\nu\), both sides are entire in \(\beta\). For the integral, every derivative contributes a bounded power of \(\theta\), with an integrable majorant \(C\sin^{\Re\nu-1}\theta\) on compact parameter sets. For the expression, use the entire reciprocal gamma theorem. The identity theorem therefore removes the strip restriction and includes zeros of either reciprocal gamma factor. This proves the corrected formula independently of an unread table proof. [DLMF 5.12.6](https://dlmf.nist.gov/5.12#E6) supplies a separate convention check; its cited Nielsen proof was not read.

### Frobenius uniqueness, globally and at the repeated root

Substituting \(f=t^sH\) gives \(tH''+2sH'+tH=0\) on positive reals. The left side is entire, so it vanishes on all of \(\mathbb C\). Its Taylor coefficients satisfy
\[
 2sc_1=0,\qquad n(n+2s-1)c_n=-c_{n-2}\quad(n\geq2).
\]
All denominators are nonzero for \(\Re s>0\), including \(n^2\) at \(s=1/2\). Consequently
\[
 H(t)=c_0\sum_{k\geq0}\frac{(-1)^kt^{2k}}{4^kk!(s+1/2)_k}.
\]
No division by \(c_0\) occurs: if it vanishes, so does H. Since H is entire, its Taylor series is global; no extra ODE continuation across zero is needed.

The sine integral gives
\[
 c_0=\frac{2\pi e^{\epsilon i\pi\mu/2}\Gamma(s)}
 {\Gamma((s+1+\mu)/2)\Gamma((s+1-\mu)/2)}.
\]
The corrected J series and the pinned duplication formula give exactly the same leading coefficient and recurrence after multiplication by the printed \(G(s,\mu)\). This proves item 118 for every \(t>0,\mu\in\mathbb C,\Re s>0\), including exceptional numerator parameters and a zero leading coefficient. It closes the written integral proof, not all of S8 or the paper's recursive dependencies.

### Other continuation corrections and boundaries

Item 168 proves \(CU_4C^{-1}=U\), \(CW_4C^{-1}=W\) for \(C f=y^{1/4}f\). The imaginary parts are \(y/4\) and \(y/(4|z|^2)\); the latter also gives the stated principal-square-root phase. Conjugation preserves order, so \(C(U_4\circ W_4)C^{-1}=U\circ W\). It does **not** turn this into \(W\circ U\). S5 must still resolve the action convention or the equality on the precise automorphic subspace.

Item 169 repairs an intermediate step in the earlier norm sketch. From real \(|a(p)|\leq\sqrt p+1/\sqrt p\), the roots \(\alpha,\beta\) of \(X^2-a(p)X+1\) both have modulus at most \(\sqrt p\): either they are unit conjugates, or the larger modulus R satisfies \(R+R^{-1}\leq\sqrt p+1/\sqrt p\). The recurrence solution is
\(\sum_{j=0}^k\alpha^j\beta^{k-j}\), including repeated roots, so
\(|a(p^k)|\leq(k+1)p^{k/2}\).
Multiplicativity gives \(d(n)\sqrt n\), hence the required \(n^{1/2+\varepsilon}\). The earlier factor \(\prod(1+1/p)^k\) cannot simply be absorbed into \(n^\varepsilon\) for all epsilon. The statement of item 151 is preserved; only this proof step is repaired. Its Hecke-operator norm remains an input of the existing Hecke contract.

The required structured `sourceIssues` list now includes the canonical E1–E10 IDs from the separate errata job, without renumbering or adding review verdicts. Historical source-read claims in those records remain attributed to that job. E5 concerns the unused upper-bound remark on p968: [Humphries–Nordentoft, Remark 3.22](https://arxiv.org/html/2211.05890v2#S3) explicitly distinguishes arithmetic and geometric codes. This continuation read that remark but did not independently close the errata job's infinite squarefree counterexample-family proof. E11 records the singular-point/Frobenius proof qualification above, and E12 records DIT16's already published correction of DIT11 (2.19). The operator-order discrepancy is not promoted to a confirmed error.

Fresh novelty checks covered the Annals article page, Duke's publication list and linked preprint passages, the arXiv title search and exact-title correction searches. No additional published Appendix correction was found. The errata file is outside this issue's write scope and is unchanged; mirrored IDs let a reviewer reconcile the two records. Nothing was sent to authors.

### Continuation validation and read scope

This session freshly read all 42 publisher pages, checked images at pp961,965,983–985, reread DIT11's p959 definitions in pp958–960 context, and read the complete pinned regularized-hypergeometric file plus every newly cited declaration. The AS.0 reviewed audit and QM.2 Bessel near-miss were checked directly, as were the AS layer descriptions. Generic differentiation and hypergeometric convergence are imports; only the specific adapters and bounds are routed. No new standalone roadmap is proposed.

The scratch diagnostics and repository validation below distinguish exact assertions, numerical comparisons and written proofs. Earlier workers' 1814 exact assertions and three quadratures remain historical results, not freshly rerun claims.

Fresh scratch checks passed: 1466 exact rational assertions (632 nonzero denominators, 328 even and 320 odd Frobenius coefficients, 186 Satake recurrence identities); 31 numerical comparisons at 75-digit working precision (6 sine integrals, 16 Whittaker integrals and 9 conjugation checks), with maximum normalized discrepancy `5.1248381e-76` against a `1e-45` threshold. The integral cases include Re(s)=1/8, s=1/2, complex s and μ, both signs, terminating numerator parameters and zero reciprocal-gamma factors. These are diagnostics, not rigorous interval certificates.

On publication base `153e5fbe48ffcf6c4f82ca14a6e2d291e9089e02`, `check_paper.py` passed and `research/blueprint/intake.py check-files` reported three files and zero problems. The 169-node graph is acyclic; every one of the 146 missing items has exactly one route. All 158 original IDs, kinds, statuses and statements are unchanged. The 52 definition/construction contracts have 156 API statements and 156 proposed tests. All 39 inherited inspected-input hashes and 23 pinned-module hashes matched; WORKERS/PROTOCOL/UPSTREAM/expansion rules were unchanged. No Lean compilation was run or claimed.


## Biró continuation: operator order and automorphy (codex-c83e7a)

This 23 September 2026 continuation preserves all 169 inherited item statements, kinds and statuses, including the norm comparison and Appendix integral proofs. Items170–188 add three library imports, two existing-plan imports and fourteen specific missing contracts. The current total is **188 items:22 library,6 planned,160 missing**, with every missing item assigned once to the same ten routes. All56 definitions/constructions have three proposed API statements, three tests and recorded consumers. The extraction remains partial.

### The source obtained, and what remains unread

Biró's *Cycle integrals of Maass forms of weight0 and Fourier coefficients of Maass forms of weight1/2*, Acta Arithmetica94(2000),103–152, is available from his [author copy](https://users.renyi.hu/~biroand/pdfs/Cycle.pdf). The50-page file has SHA256 `d1a49be2d88fb60164b11783d444256fdcb0e1e8678476a325c077322a4572a4`. This continuation read printed pp103–111,126–131,139–143,151–152, not the whole paper. Images of104,128,129,142 fix the multiplier conjugation, convergence statement, Fourier bars and cusp indices. DIT11 pp947–951 and959 were freshly read, supplementing the inherited selected-page scope. The main DIT16 full read and Duke88 full read remain attributed to earlier continuations.

Baruch–Mao's2010 paper remains unread: the Wiley endpoint returned403, the Rutgers author URL timed out, and its alternate host returned403. Original Kohnen1982/1985 and Chiera proofs are also unclosed; EuDML returned403 for Kohnen1982. Biró's reference [Ko3] is the1982 Crelle paper, not the different1996 paper with the same title. No successful acquisition is claimed for these sources.

### The four-coset formula fixes the order

Biró uses

\[
(F|g)(z)=\operatorname{phase}(j_g(z))^{-1/2}F(gz),\qquad
\nu(\gamma)=\overline{\varepsilon_d}\left(\frac cd\right),
\]

with principal arguments. The bar over ε is visible in the page104 image and is easily lost in extracted text. At level4 his operator is

\[
L F=\frac1{2(1+i)}\sum_{w=0}^3 F|M_w,
\quad M_w=\begin{pmatrix}1+w&1/4\\4w&1\end{pmatrix}.
\]

Set ν=3−w and

\[
N_\nu=\begin{pmatrix}\nu&-1/4\\4&0\end{pmatrix},\qquad
\gamma=\begin{pmatrix}-1&1\\-4&3\end{pmatrix}.
\]

Then M_w=γN_ν, γ∈Γ₀(4), and ν(γ)=i. For θ=arg z and h=4wz+1, one has0≤arg h<θ<π and arg(h/(4z))=arg h−θ. Automorphy therefore gives

\[
\operatorname{phase}(h)^{-1/2}F(M_wz)
=i e^{-i\theta/2}F(N_\nu z).
\]

Since i/[2(1+i)]=(√2/4)e^(iπ/4), summing proves **L=W∘U** for the actual automorphic functions and the DIT16 operators. This uses no unproved global slash-action rule for arbitrary choices of square roots. It also leaves the inherited conjugation168 intact: C(U₄∘W₄)C⁻¹=U∘W. Conjugation cannot reverse composition.

The two orders really differ on an automorphic domain. Take θ(z)=Σ_nq^(n²) and f(z)=θ(z)j(4z), weakly holomorphic of weight1/2 forΓ₀(4). For γ=[[a,b],[c,d]], the integer matrix[[a,4b],[c/4,d]] proves j(4γz)=j(4z), so f has precisely the theta multiplier. Its Fourier support is0,1 modulo4. Theta inversion and the finite Fourier sieve give

\[
U_4f=\theta j,\quad W_4f=\theta j,\quad W_4U_4f=f.
\]

But [q²]U₄W₄f=[q⁸](θj)=490845366512384. Consequently the opposite-order expression(2U₄W₄+I)/3 has forbidden q² coefficient981690733024768/3. Even the principal q^(−4) coefficient distinguishes the orders. This is an example inside the weakly holomorphic automorphic space; it is **not** an L² cusp eigenform with r>0. It disproves the unrestricted plus-support interpretation of the printed order, without claiming that this example alone refutes every restricted Poincaré or cusp-space assertion. E14 records the discrepancy with that scope; the separate3/2 correction remains E12.

The generic j inputs are imported from upstream ModularForms Layer0, whose reviewed audit says j itself is not built at the pins. The theta seed and inversion are already in Mathlib. Neither supplier is re-planned here.

### Fourier support is distinct from orthogonal projection

Biró uses σ_q=[[1,1/2],[2,2]] at q=1/2 and σ_s=[[2,1/2],[6,2]] at s=1/3, equivalent to0. Their cusp parameters areχ_q=3/4 andχ_s=0. Thus rescaling by4 gives frequencies4n−3 and4n, respectively. Lemma A.3 gives, for n≠0,

\[
b_{LF}(n)=\begin{cases}
\tfrac12b_\infty(n)+\dfrac{b_s(n/4)}{2(1+i)}&n\equiv0\pmod4,\\
\tfrac12b_\infty(n)+\dfrac{b_q((n+3)/4)}{2(1+i)}&n\equiv1\pmod4,\\
-\tfrac12b_\infty(n)&n\equiv2,3\pmod4.
\end{cases}
\]

The shifted index at the nonsingular cusp is essential, including for negative n. For P=(2L+I)/3 the forbidden coefficients cancel and the good coefficients become2b∞/3+b_other/[3(1+i)]. This closes the explicit Fourier-support adapter178.

If L is bounded self-adjoint and satisfies(L−I)(L+I/2)=0, then P²=P=P* and range P=ker(L−I). That elementary algebra is179. Biró A.2 cites the holomorphic Kohnen argument and asserts the Maass modifications; this selected read has not supplied the operator-domain and self-adjointness proofs. Those remain S5. The extension to non-L² Poincaré families and their principal terms is another obligation. In particular the2/3 main coefficient and the3/2 comparison cannot be inferred by discarding the other-cusp terms without justification.

### Finite coefficient separation proves the automorphy step

Biró takes a finite-dimensional fixed-eigenvalue space W and splits W=W₀⊕W₁, where W₀ is the common kernel of all positive admissible Fourier coefficients and W₁=W₀⊥. On W₁ these coefficient forms separate points. The exact pinned theorem `FiniteDimensional.mem_span_of_iInf_ker_le_ker` imports the linear-algebra principle; no general dual-separation theorem is proposed anew.

For an orthonormal basis f₁,…,f_m of W₁, choose m positive admissible indices n_i so the coefficient matrix is invertible. The trace uses conjugated coefficients. Conjugating a putative relationΣ_jα_j conj(b_j(n))=0 gives the vectorΣ_jconj(α_j)f_j in W₀∩W₁, so all coefficients vanish. This makes the basis-phase convention explicit.

At N=1, Biró equation(14) says that

\[
12\sqrt\pi(Dn)^{3/4}\sum_j\overline{b_j(n)}\operatorname{Sh}_D f_j
\]

is a finite linear combination of level-one cusp eigenforms. Here D is positive fundamental, n is positive admissible, and the half-weight parameter is r/2 when the weight-zero parameter is r. The scalar is8p_N with p_N=3/2. Divide by the nonzero scalar for the selected indices and invert the finite matrix. Each individual lift is a cusp form. On W₀ the lift is identically zero because it uses only the positive indices DQ².

This argument **does not require W₀=0**, nor any fundamental-coefficient nonvanishing. It proves automorphy conditional on the analytic trace identity and convergent reconstruction. It supplies no injectivity, surjectivity or eigenline bijection. The full Lemma10 analytic input remains183/S6; negative-D and mixed-sign parts of DIT16 need their wider trace identity separately.

### Normalization, prime2 and the supplier boundary

Biró writes W_(1/2+ir)(nz)=2√(|n|y)K_ir(2π|n|y)e(nx), while DIT uses2√y a(n). Multiplying Biró's coefficient by√|n| therefore gives

\[
A_D(n)=n\sum_{P\mid n}\chi_D(P)P^{-3/2}
b_f(Dn^2/P^2),\qquad n>0.
\]

This is even in n. Since A_D(1)=b_f(D), division by b_f(D) is allowed only when it is nonzero. In particular

\[
a_D(2)=\frac{2b_f(4D)}{b_f(D)}+\frac{\chi_D(2)}{\sqrt2}.
\]

At N=1 the definition includes the divisor2; Biró's intertwining statement on p130 is only for odd primes. For a nonzero automorphic lift, GL₂ global and strong multiplicity one, together with the classical/adelic and spherical/K-type comparisons, make the common odd-Hecke eigenspace a line. H₂ commutes with the odd operators and acts by the scalar read from the displayed coefficient. This provides a conditional route to the all-prime normalization. It does not prove existence of a positive fundamental D with b_f(D)≠0.

The precise generic owner is **GL2AutomorphicRepresentationsAndTransfer:R16.4**. AF.2's finite multiplicity and the built holomorphic newform theorem do not suffice. Item174 imports R16.4, and186 records the remaining Maass comparison explicitly. There is no additional GL₂ roadmap or duplicate theorem planned in this extraction.

### Repairing the convergence citation without losing the boundary gate

On p128 Biró states a bounded-holomorphic convergence principle using convergence at one point. It is false: on the unit disk f_k(z)=(−1)^kz/2 converges at0 but oscillates at1/2. However, his preceding calculation proves convergence for every sufficiently large positive real A, and he states uniform bounds on compact subsets of Ω={Re A>−1/2} minus a finite pole set. This Ω is connected, and a large real interval supplies an accumulation set. Tau Ceti's existing `vitali`/`vitali_of_tendsto`, followed by the identity theorem, repairs the interior step. For the real parameter limit m, apply this to each approaching sequence. E13 records the source misstatement and the repair, without attributing it to the unread Pólya–Szegő source.

This does not justify the next boundary limit. The functions

\[
g_k(A)=\frac{e^{-k(A+1/2)}}{A+1/2}
\]

converge locally uniformly to0 on Re A>−1/2, yet all have residue1 at the boundary point−1/2. Biró's independent boundary estimates, including the different r=0 behavior, must still be checked. Item188 makes that distinction testable.

### Validation and remaining work

The exact diagnostics passed **2842 rational/integer assertions**: four-coset matrices, shifted cusp indices, projection polynomial, j coefficients and order regression, invertible Fourier certificates with a nontrivial invisible kernel, normalization scalars and the one-point counterexample. Separately,140 floating-point principal-phase comparisons had maximum error1.088×10⁻¹³. The finite calculations are diagnostics; the all-parameter arguments and conditional boundaries are written above and in the JSON. Historical checks were not relabeled as newly rerun.

S5 still needs the Maass Hilbert-domain proof and Poincaré extension; S6 needs full trace and boundary suppliers, nonvanishing, all sign cases, the Maass multiplicity comparison and Baruch–Mao. S1/S2/S3/S4/S7 and residual S8 remain as previously recorded. The norm and Appendix work must be preserved. No Lean file is authorized for this paper issue and no compilation or formalization is claimed.
