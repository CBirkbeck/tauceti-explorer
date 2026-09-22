# Geometric invariants for real quadratic fields — extraction checkpoint

Codex, session `codex-c83e7a`; issue #1170; 22 September 2026. **Partial.** The publisher’s entire 42-page paper was read. The inventory has 158 items: 16 pinned-library imports, four imports from existing plans and 138 missing contracts, each assigned once. The 51 definitions/constructions have 153 proposed API statements, recorded uses and 153 proposed tests. Recursive proof closure remains open at the eight source gates below. No Lean code is submitted or claimed to compile.

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

A full proof still needs endpoint bounds for integration by parts, differentiated majorants on compact t-intervals, branch conventions and global continuation by ODE uniqueness. Those analytic steps are explicit in S8.

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

*Remaining gate, S4b.* What is left is a polynomial bound L(1,sym²φ)≪(1+r)^A. It follows from convexity for the entire GL₃ L-function of sym²φ (Gelbart–Jacquet), with absolute convergence for Re s>2 (Jacquet–Shalika) and archimedean conductor ≍(1+r)². Those primary sources are listed as prerequisites and were not re-read here.

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

No standalone roadmap named after this paper is proposed. Each of the 138 missing inventory items occurs in exactly one route. The two Part II briefs contain target statements, required constructions, named imports and discriminating tests; they are reviewable proposals, not accepted atlas changes.

## Source gates and continuation

The main paper has been read completely, but that is not recursive source closure. The JSON gives precise `neededBy` item IDs for each gate.

- **S1, arithmetic:** source the full minus-reduction theorem, ideal/cycle equivalence and full-order unit proof in Zagier. Split the classification and orientation interfaces further.
- **S2, geometry:** read Maskit’s polygon theorem with free-side hypotheses and close the limit-set/core equality, conformal rigidity, complementary-tile multiplicities and Stokes boundary proof. Import the upstream polygon plan.
- **S3, Hecke/genus/Dirichlet:** source the exact narrow signs, ramified Euler factors, Hecke periods, Siegel and hybrid Burgess estimates. The original books and Burgess proof have not been read in full.
- **S4, spectral:** acquire Fay’s actual paper and the required noncompact analytic statements. First resolve item 151’s exact norm comparison; also source no-exceptional level-one spectrum and Sobolev trace/integration conditions.
- **S5, half weight:** compare the operator order in DIT16’s `(2/3)WU+1/3` with DIT11’s `(2/3)(U₄∘W₄)+1/3` after conjugating by y^{1/4}. This changes the U scalar to √2; the order still requires an explicit comparison. DIT16 footnote 7 corrects DIT11 (2.19) to P_d⁺=(3/2)pr⁺P_d, so the projected seed has factor 2/3. Read the original Kohnen finite-sum identity and Chiera norm proof.
- **S6, correspondence:** acquire Biró and Baruch–Mao for the automorphy, linear-independence, all-prime Hecke and normalized central-value arguments. Both requested PDFs returned HTTP 403. An author-page bot rejection and a metadata page do not count as proof reads.
- **S7, coefficient bounds:** all eighteen pages of Duke88 were read. Its Proskurin/Kuznetsov and Iwaniec input sources remain unclosed. Preserve the spectral cosh factor while decomposing them.
- **S8, Appendix:** finish the all-complex-parameter analytic proof of the corrected integral using endpoint bounds and Frobenius uniqueness. Finite specializations are not enough.

DIT11’s publisher PDF was read selectively at printed pp956–960 and 964–977, including the unfolding and Bessel calculations; the remaining pages were not claimed read. Its SHA-256 is `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`. Duke88’s PDF SHA-256 is `3c468d0c0d79ec2ab29f96dcdda6094a4ceb6603a4caaae947c0bef443f9005f`. Fay HTML was obtained, but no Fay paper text was read.

## Validation

The scratch checks use exact integers, rational numbers and pairs a+b√D. They test 121 cycles, including the published D=12 and D=28 examples and all non-all-2 words of lengths one through four on digits {2,3,4}. They check determinant/discriminant, attracting fixed point, strict digit endpoints, the unit multiplier, product of rotated reduced irrationals, projective involutions and the boundary word. Repeated cycles in this finite family test the matrix identities; they are not accepted as primitive representatives for the area theorem.

Additional exact checks cover the signature-area coefficient, phase invariance and a missing-conjugation counterexample, four exponent computations, the residue substitution and normalization factors. The Appendix test checks 275 exact series coefficients for integer s=1,…,5 and the specified integral μ range, using rational Gamma recurrences with powers of π factored out. Three numerical quadratures at s=1, μ=0 are separate diagnostics for the integral identity; they are not exact or formal proofs.

The repository’s `check_paper.py` passed; `intake.py check-files` reported three files and zero problems. The local checks passed for the acyclic 158-node dependency graph, exactly one route per missing item, API coverage and valid roles. There were 1814 exact mathematical assertions and three numerical quadratures. Inspected roadmap/audit/packet input hashes were unchanged on current main before publication. The validator accepts parent stages in `planned`; item 134 therefore records AN.4 there and preserves its finer reviewed supplier in `plannedNodes`. No compiled Lean test suite is asserted. The handoff preserves the stable item IDs and identifies where the next worker should resume.
