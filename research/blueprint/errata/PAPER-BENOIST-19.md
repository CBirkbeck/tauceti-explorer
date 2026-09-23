# Reviewed findings: Benoist, The period-index problem for real surfaces

Original errata job: ERRATA-PAPER-BENOIST-19, Claude Code, `cc-442dc5`.
Independent review: REV-ERRATA-PAPER-BENOIST-19, Codex, `codex-hjdg0j`,
23 September 2026. The [JSON](PAPER-BENOIST-19.json) contains the individual
verdicts. **Seventeen findings are confirmed after correction; E16 and E19
are rejected.** The [review](../reviews/REV-ERRATA-PAPER-BENOIST-19.md) records
source provenance, version concordance and validation.

The primary source is the [published article](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf),
Publ. Math. IHÉS 130 (2019), 63–110. The current author copy and arXiv v2 retain
the passages discussed below. No matching correction was found in the bounded
search recorded in the review. Rejected findings are retained for audit, not
presented as new mistakes.

## Geometry and compatible lifts

**E1 — confirmed, error / stated result; §3.1, p.76.** The incidence surface
`rv²=sw²` in the projective bundle has a whole P¹ fibre wherever r=s=0.
Consequently its projection is proper and generically of degree two, but is not
finite in general. It is finite flat over S⁰ as used in §3.2. The separate finite
flat model has algebra `O_S ⊕ L⁻¹(−R)` with multiplication given by rs; locally
its equation is z²=rs. The same finiteness wording recurs on p.86. That page
already refers to the **strict transform** of C, so the inherited report's
criticism of a supposed assertion about the full inverse image is withdrawn.
This finding concerns the auxiliary model's description, not a counterexample
to a period-index theorem.

**E2 — confirmed, gap / proof; Lemma 1.4, p.70.** Choose β before the lemma
so that β mod n=p*α̃. Lemma 1.3 kills the integral Bockstein of p*α̃, hence
allows this choice. Merely being a lift of the same Brauer class permits a
Picard difference. With the compatible choice, p_*β mod n=dnα̃=0 and the
surjectivity argument in the rest of the lemma applies. The later application
needs the existence of such a pair β,γ, not an arbitrary β.

## The two cohomological proof gaps

**E3 — confirmed, gap / proof; Proposition 4.4, p.84.** Put
`a=[α̃]₀|Ψ`. Formula (4.8) gives `[ζ]₁=a[e]₁`, since its degree-one component
is `b+a[e]₁` and the hypothesis sets b to zero. The printed Picard adjustment
therefore leaves `(1+a)[e]₁`, not necessarily zero. The inherited assertion that
it fails for every nonconstant a is too strong: the residual may vanish, for
example if [e]₁ vanishes on the components where a=0.

If a is the constant t∈F₂, replace the line-bundle contribution cl(φ) in the
adjustment preceding (4.6) by t cl(φ). Both contributions to the final first
component are then t[e]₁ and cancel. This checks the local repair to the
printed computation, conditional on the preceding homological comparison
(4.5) and the other cited inputs; it does not independently reprove Jannsen's
comparison lemma used there.

**E4 — confirmed, gap / proof; Proposition 4.5, pp.84–85.** The expression
β|=p*α̃+2ε+cl(ϕ) adds an F₂ class to integral Z(1) classes. The proof neither
supplies nor may assume an integral lift of α̃ downstairs. A typed repair of
the uniform-evaluation case follows directly from §7, with the sign corrected
as in E6:

1. Over U=S∖R the constructed double cover is finite flat. Let
   `Q=coker(Z→p_*Z)`. The coefficient sequence (7.2) and the diagram in the
   proof of Lemma 7.2 give `α̃=η mod 2−φ(ζ)` for integral classes η and ζ
   with respective coefficients Z(1) and Q(1). The needed obstruction is the
   Bockstein of p*α̃. It vanishes because the pulled-back Brauer class has
   an integral representative β. Full vanishing of that Brauer class is
   unnecessary here.
2. Set `b=p*η−ψ(ζ)`. Then b mod 2=p*α̃ and p_*b=2η, by ψ mod 2=p*φ
   and Tr ψ=0. All terms are integral. Equation (2.17) gives
   `β|=b+2γ₀+cl(ϕ₀)`. Also write `p_*β=2δ+cl(θ₁)`. Taking traces gives
   `2(δ|−η−p_*γ₀)=cl(p_*ϕ₀−θ₁|)`.
3. The torsion-free cokernel of the Picard cycle map supplies μ∈Pic(S)
   with `δ|−η−p_*γ₀=cl(μ|)`; a line bundle on U extends to smooth S.
   This uses [BW, Proposition 2.9](https://arxiv.org/pdf/1801.00872v2), p.34.
4. On Ψ there are no real preimages. The rank-one system Q has conjugation
   action −1, so Q(1) has action +1. Its ordinary sign monodromy is [e]₁.
   Formula (2.12), equivalently BW (1.33), gives
   `φ(ζ)₁=β_Q(1)(φ(ζ)₀)=t[e]₁` when a=t is constant. An integral
   Z(1) class of degree two has component zero equal to zero; hence
   φ(ζ)₀=t and α̃₁=0 implies η₁=t[e]₁. Lemma 2.1 supplies λ∈Pic(S)
   with cl_R(λ)|Ψ=[e]₁. The real component of p_*γ₀ vanishes on Ψ,
   since the cover has no real preimages there.
5. Thus `d=δ−cl(μ+tλ)` has d₁|Ψ=0. Apply the curve correction in E5
   to obtain `p_*γ=d−cl(ν)`. Then
   `θ=θ₁+2μ+2tλ+2ν` satisfies `p_*(β−2γ)=cl(θ)`.

This verifies a replacement for the ill-typed step under constant evaluation;
it does not assert that such a replacement is impossible in other cases.

**E5 — confirmed, gap / proof; Proposition 4.5, p.85.** Assumption 4.1(ii)
generates the restriction kernel using both pushforwards and classes of curves
whose real loci avoid Ψ. Subtract the Picard class ν of the required combination
of curves before invoking Proposition 3.3. Restore 2ν in θ at the end. The
analogous use of the assumption on p.82 already includes a curve correction.

**Reach of E3–E5.** These are proof findings. No false statement of
Propositions 4.4, 4.5 or 6.6 has been demonstrated. Their unrestricted proofs
need further work. The inherited report incorrectly defined Θ by *zero*
evaluation. The paper defines it by **nonzero** evaluation (pp.79,93,95).
In Proposition 6.7, Ψ is Θ for the original period-n class, and the period-two
class being split is (n/2)α. Its evaluation on Ψ is the constant
`t=(n/2) mod 2`: t=1 if n≡2 mod 4, and t=0 if 4 divides n. Thus both
uniform repairs are relevant to the induction. This is a check of these
specific steps, not a certification of every input to the main theorems.

## Trace, period and local parameters

**E6 — confirmed, misprint / nothing; Lemma 7.3, p.98, and (7.13), p.103.**
The convention (1,−φ) requires `p*η−ψ(ζ)`. On four sheets, (1,0,0,0)
gives ψ=(−3,1,1,1), whose mod-4 reduction is +1 on each sheet; the minus
sign is necessary to match −φ. Since Tr ψ=0, (7.14) and the later trace
argument remain unchanged.

**E7 — confirmed, misprint / nothing; Lemma 7.3 proof, p.99.** Use the
monomorphism on the target `p_*(Z/n)→j_*j*p_*(Z/n)` to detect equality
after restriction. A locally constant section upstairs that vanishes on the
dense open p⁻¹(S*) vanishes everywhere, proving precisely the required
monomorphism. The printed source monomorphism is the wrong justification;
the intended target statement is immediate in this setting.

**E8 — confirmed, misprint / nothing; Proposition 6.7, p.95.** Restrict the
half-period lift hypothesis to even n and state the odd case separately, as
its proof already does. The separate inherited objection to the exact
restricted period is withdrawn: writing m for that period, restriction gives
m|n/2, while corestriction shows that m annihilates 2α, of order n/2.
Hence m=n/2 without waiting for the final index computation.

**E9 — confirmed, gap / proof; Theorem 0.12 proof, pp.95–96.** Enlarge
K₀ by a transcendence basis of K/R before taking the directed union of its
finite extensions inside K. The enlargement is still finitely generated and
retains the descended Brauer class. It ensures K/K₀ is algebraic and that
each finite extension is the function field of a surface. Descent of the
Brauer coefficients alone does not ensure this.

**E10 — confirmed, gap / proof; Theorem 0.12 lower bound, p.96.** The
inherited locator to Theorem 0.13 is incorrect. Let a=[w²+1]∈m/m² and
c=2(1+i)∈C*. The construction gives [y_j]=a+c[z_j]. If a≠0, choose a
basis (a,e₂) and take [z₁]=e₂, [z₂]=−2a/c−e₂. These parameters satisfy
both individual nonproportionality conditions, but [y₁] and [y₂] are opposite.

There is a direct repair. At a smooth closed point with residue C, replace w
by `w′=(w²−1)/(2w)`. It still has residue i, and

`(w′)²+1=(w²+1)²/(4w²) ∈ m²`.

For any regular parameter pair, set `y_j=(1+z_j)²+(w′+z_j)²`. Now
[y_j]=c[z_j], so the y_j are regular parameters. They are nonzero sums
of two squares and therefore positive at every ordering. The completion and
quadratic-form argument can proceed with these parameters.

## Remaining notation and specialization

**E11 — confirmed, misprint / nothing; (2.1), p.72.** Replace M(−k)
by M(d′−d). The relative orientation depends on the dimensions, not the
cohomological degree. This agrees with BW v2 (1.22), p.13; an identity map
must preserve coefficients in every degree.

**E12 — confirmed, misprint / nothing; (5.7), p.88.** The middle group is
H¹(C,N_C/T). The boundary of (5.8) raises degree from zero to one, and the
boundary of (5.9) then lands in H²(T,O_T). No external reference is needed
to determine this correction.

**E13 — confirmed, gap / proof; Proposition 0.7 proof, p.108.** The actual
printed point is [0:−1:1:0], not the inherited [0:−1:1:1]. On the smooth
quadric Q, use general points of the real arcs of D={u=0} with v/w<0 and
v/w>0. Write f₀=u^m h, g₀=u^n k, and avoid the finitely many zeros and
poles on D of the unit parts h,k. Near the negative-v arc both functions
are negative off D, forcing m,n even. Near a general positive-v point their
signs then agree on the two sides of D, contradicting the prescribed quadrant
condition. Signs are considered off D; the functions themselves can vanish
or have poles on D.

For specialization, first clear the separate t-valuations of f,g by integer
powers of the positive Puiseux parameter. On a dense open subset away from
zeros, poles and uv=0, the special fibre is smooth and real points lift over
the power-series parameter. Units retain their residue signs. This supplies
the simultaneous sign comparison needed above; no assertion about signs at
the fixed point or at a zero is necessary.

**E14 — confirmed, misprint / nothing; p.107.** Use Br(K(S)): the surface
and the rational functions in Proposition 0.7 are over the real Puiseux field K.

**E15 — confirmed, misprint / nothing; p.107.** Retain “nonzero” in the
uniqueness assertion for δ, as in the preceding paragraph on p.106. Zero
also has zero component zero.

**E16 — rejected; p.103.** The source already says **cokernel** after
(7.14). This was checked visually in the published PDF and against the
current author copy and arXiv v2 p.33. The inherited quotation of “kernel”
is inaccurate. BW v2 Proposition 2.9 is indeed the cokernel theorem used.

**E17 — confirmed, misprint / nothing; p.71.** The undefined l in the
degree substitution should be replaced by the Brauer period n. To avoid
collision with the external paper's degree variable, denote that variable
by m and write m=dn, consistently with the family |dnH| on p.69.

**E18 — confirmed, misprint / nothing; p.77.** The fixed singular points
above Sing R have w=0 and v≠0. Here r=0 and s is a unit, so the equation
forces w=0. The printed v=0 would leave no projective point.

**E19 — rejected; (5.5), p.87.** The involution splits p_*O into two
eigensummands but does not specify a scalar identification of the
anti-invariant summand with L⁻¹(−R). Using z=rv/w gives the coefficient
√a₁rg on the chosen graph. Equally, z′=rv/(√a₁w) gives rg, exactly as
printed. The source never fixes the former normalization. This scalar
choice changes neither g nor the later injectivity argument, so it is not
an established source mistake.
