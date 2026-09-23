# He21: source-error audit

**Job:** ERRATA-PAPER-HE-21 · issue #1864  
**Worker:** ChatGPT Pro — cgp-20260923-h7q4  
**Checked:** 23 September 2026  
**Status:** audit submitted for independent review; not an author-approved erratum and not a proof-closure certificate.

The JSON records fourteen findings: thirteen retained from the extraction, with corrected reasons and more carefully qualified reach, and the additional E17. Stable identifiers are preserved. E7 and E12 remain excluded; E8 is not retained as an established source error for the reason below. The two known GHN corrections are errors in a cited paper, not discoveries about the truth of He21's main theorem. No `review` verdict has been supplied by this worker.

## Sources, versions and search limits

The input result has Git blob `169cbe264457c7b754f423f70710a36f73b56159`; its report has blob `b5b6e1d37d5443fb03a1a382055b57029c043290`. The source-issue list was checked against the associated item statements, notes, gaps and report, including the two previously withdrawn allegations. Neither input was edited. The RootSystems and LieHighestWeight upstream roadmaps were consulted for the distinction between root-system, coweight-lattice and representation-theoretic interfaces; this errata job makes no new pinned-library coverage claim.

References used below:

- **H21:** X. He, *Cordial elements and dimensions of affine Deligne–Lusztig varieties*, Forum of Mathematics, Pi 9 (2021), e9, [published article and mathematical HTML](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/cordial-elements-and-dimensions-of-affine-delignelusztig-varieties/5A27DBF48CAEF6DA56A313061848574C). [Preprint](https://arxiv.org/abs/2001.03325), v1, 10 January 2020; relevant page images checked. Journal HTML is the reference for published statements; preprint pages are not silently treated as journal pages.
- **H15:** X. He, *Hecke algebras and p-adic groups*, [arXiv:1511.01386v3](https://arxiv.org/pdf/1511.01386), Theorem 2.27, p.37. The survey's shrunken hypothesis was checked in the page image. A complete audit of this survey is not claimed.
- **H14:** X. He, *Geometric and homological properties of affine Deligne–Lusztig varieties*, Ann. of Math. 179 (2014), 367–404, [journal PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf). Proposition 11.6 was checked in the published images of pp.399–400. The [arXiv history](https://arxiv.org/abs/1201.4901) lists v1 and v2; checking that history is not a claim to have compared every preprint PDF.
- **GHN:** U. Görtz, X. He and S. Nie, *P-alcoves and nonemptiness of affine Deligne–Lusztig varieties*, Ann. Sci. ÉNS 48 (2015), 647–665, [published PDF](https://www.numdam.org/item/10.24033/asens.2254.pdf); [authors' erratum](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf), all three pages checked. The erratum supplies positive evidence for E13 and E14. No publication date is inferred from the undated PDF.
- **HZZ:** X. He, R. Zhou and Y. Zhu, *Stabilizers of irreducible components of affine Deligne–Lusztig varieties*, [arXiv:2109.02594v1](https://arxiv.org/pdf/2109.02594), Proposition 3.4.2, pp.22–23. Both pages were inspected. This is a later geometric reformulation, not an official correction to H14.
- **HY:** X. He and Z. Yang, *Elements with finite Coxeter part in an affine Weyl group*, [arXiv:1203.4680v1](https://arxiv.org/pdf/1203.4680), §§1.2 and 4.2; the §1.2 definition was checked in the p.2 image.
- **BS:** B. Bhatt and P. Scholze, *Projectivity of the Witt vector affine Grassmannian*, [arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490), introduction and Theorem 1.1, used to reassess E8.

Correction searches covered the H21 article and its [volume-9 listing](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/volume/A0F34FDF4105CBC68BD961812700E85E), the H14 [article page](https://annals.math.princeton.edu/2014/179-1/p06) and [volume-179 listing](https://annals.math.princeton.edu/articles/category/2014/179), the relevant arXiv histories, the author's [selected-publications page](https://hkumath.hku.hk/~xuhuahe/selected.html), and title searches with “erratum” and “corrigendum”. No formal H21 or H14 correction notice was located in these checks. This is the limited meaning of `known: new`; it is not an exhaustive novelty claim. Failed Crossref requests provide no evidence and the extraction's claimed negative Crossref results are not inherited. No author was contacted.

The journal PDF's screenshot endpoint could not be retrieved in this run. Consequently, glyph-sensitive H21 comparisons use the journal's mathematical HTML together with explicitly identified preprint images, not a claimed fresh rendering of the journal PDF. Public-source bytes were not downloaded successfully, so no new PDF SHA-256 values are claimed. The earlier extraction's source hashes remain its provenance, not this worker's independently measured hashes.

**Important version correction.** H21's published Theorem 5.5 assumes a shrunken input and asserts support containment. The v1 statement on p.10 instead assumes full support and asserts full support for its output. Its proof is also shorter and differently organized. Moreover, v1 p.8 already cites Vi14 and displays the closure bars. Thus the extraction's assertion that the versions agree apart from the BS17 sentence and an added Vi14 citation must not be reused. The findings below are tied to the versions actually specified, not to that blanket comparison. [H21]

## E1 — basic nonemptiness is quoted outside the cited hypothesis

H21 §6.3 invokes H15 Theorem 2.27 for the newly constructed `a t^γ`. H15's theorem requires that element's alcove to be shrunken. This is not a consequence of the published construction. The following is an exact witness, not an argument from singularity alone. [H21, §§5.4, 6.3; H15, Theorem 2.27]

Use split adjoint type A2, with coordinates given by the two simple-root pairings. The negative base alcove is

\[
 A=\{(u,v):u<0,\ v<0,\ u+v>-1\}.
\]

The reflection matrices are

\[
 s_1=\begin{pmatrix}-1&0\\1&1\end{pmatrix},\qquad
 s_2=\begin{pmatrix}1&1\\0&-1\end{pmatrix}.
\]

With H21's translation convention, take `λ=ω₂∨=(0,1)`, `x=s₂s₁`, `y=1`. The §5.4 data are `J=∅`, `J′={s₁}`, `x′=s₂`, `z=s₁`, `γ=λ`, `y′=1`, and `a=s₁*s₂=s₁s₂`. The affine actions are

\[
 w(u,v)=(v-1,1-u-v),\qquad
 at^\gamma(u,v)=(1-u-v,u).
\]

For the three positive roots, the ranges on `wA` are respectively `(-2,-1)`, `(1,2)` and `(0,1)`, avoiding the critical strips. The seed's second coordinate, however, is in `(-1,0)`. Both relevant finite parts have full support. Also `λ=(α₁∨+2α₂∨)/3` is strictly positive in the simple-coroot cone, and `λbb=λ`, so the example is compatible with the basic Newton bounds in the main argument.

The extraction's broader assertion “nonregular γ always gives a non-shrunken seed” is **false** with these conventions: `w₀t⁰` sends all three positive-root coordinates into `(0,1)`, despite `γ=0`. Keep the explicit witness, not the incorrect general reason.

This is a gap in the cited justification, not a disproof of nonemptiness or of the final dimension formula. A replacement through GHN Theorem A still needs its no-Levi-obstruction condition checked. The extraction's H14 route uses Proposition 11.6 with `J=S`, followed by the finite-Coxeter/class-polynomial nonemptiness argument; it avoids the shrunken premise for nonzero γ in its stated source scope. The zero branch and transport to the full characteristic/ramification scope remain separate obligations. Neither a citation swap nor the later HZZ formulation alone is declared a complete repair here.

## E2 — use the left normal-form factor as conjugator

In §6.2 the displayed conjugator is inconsistent with the definition in §6.1 and the chamber factor in GHN Lemma 3.6.3. For `w=x t^λ y`, use

\[
 x^{-1}w\sigma(x)=t^\lambda y\sigma(x)
 =t^\lambda\sigma(\eta_\sigma(w)).
\]

Its finite part lies in `W_J`. A concrete failure of the printed choice occurs in split A2 with `x=s₂`, `y=s₁s₂`, `λ=3ρ∨`: then `η=yx=s₁` and `J={s₁}`, but the printed conjugator has finite part `y⁻¹xy²=s₂`, outside `W_J`. [H21, §§6.1–6.2; GHN, Lemma 3.6.3]

There is an important limit to the correction: the element actually printed inside the Levi Kottwitz map is `σ⁻¹(y)wy⁻¹=ηt^λ`. Although not the defining conjugate, it has the same Levi Kottwitz image as the corrected one, since the finite `W_J` factors map to zero. The obstruction conclusion survives. The wording “for some y” in §6.5 can rename a conjugator, so it is not counted as a separate false assertion tied to the earlier normal-form y.

## E3 and E4 — coroots and nonnegative coefficients

The cone computations in Proposition 5.1 and Corollary 5.3 concern coweight differences in the integral **coroot** order. Restore `α∨` in those sums. Do not change a root used as the argument of a pairing. This is a type/notation correction, not a change to the order. [H21, §5.1]

The full-Δ cone in Proposition 5.1 must also allow zero coefficients. Taking all four input coweights in the relevant comparison to be zero immediately contradicts strict positivity at every simple coroot. The selected supports of the positive and negative parts can still have strictly positive coefficients; only the sums indexed by the whole base are corrected. The componentwise minimum argument then has its intended meaning.

## E5 — the routine existence argument, with the correct direction

Lower-directedness alone does not prove existence of a minimal feasible coweight. Complete the argument as follows. Let

\[
 2\rho^\vee=\sum_{\beta>0}\beta^\vee,
 \qquad \mu_0=\lambda-\lambda'+N\,2\rho^\vee.
\]

Every simple-root pairing with `2ρ∨` equals two; hence sufficiently large integral `N` makes `μ₀` dominant. Its feasibility is immediate. For a dominant `μ≤_Zμ₀`, write `μ₀−μ=Σnᵢαᵢ∨`. Then

\[
 \sum_i n_i=\langle\rho,\mu_0-\mu\rangle
 \leq\langle\rho,\mu_0\rangle.
\]

Only finitely many coefficient tuples occur, so a minimal feasible element below `μ₀` exists. Given any other feasible element, a common lower bound and minimality force that bound to equal the chosen minimum; it is therefore globally least. This proves the claimed existence and uniqueness after the printed lower-directedness calculation. [H21, Proposition 5.1]

The correction to the extraction matters: the sum of **simple** coroots is not a universally dominant direction. In D4, with node 2 trivalent, its simple-root pairings are `(1,-1,1,1)`. The full positive-coroot sum has simple-coroot coefficients `(6,10,6,6)` and pairings `(2,2,2,2)`. Item /53 in the extraction already has the valid direction; E5's inherited prose does not. This is a small omitted argument, not a substantive failure of Proposition 5.1.

## E6 — an auxiliary coweight need not be a cocharacter of G

The simple/quasi-split standing reduction does not by itself supply all fundamental coweights as group cocharacters. For split SL3,

\[
 \omega_1^\vee=(2\alpha_1^\vee+\alpha_2^\vee)/3
 \notin X_*(T).
\]

Thus a factor `t^{ρ_J∨}` with `J={s₁}` cannot be constructed in that group's Iwahori–Weyl group. It is not enough to note that the product of two auxiliary factors might return to the original lattice. [H21, §§2.2, 5.2–5.4]

In the unramified simply connected twisted A2 datum, let σ interchange the two nodes and take `λ=(3,3)`, `x=1`, `y=s₁`. The construction gives `x′=s₂` and

\[
 \gamma=\lambda-\omega_1^\vee+s_2\omega_2^\vee=(3,2).
\]

The coroot coordinates are `(8/3,7/3)`, although λ has coroot coordinates `(3,3)`. Even the resulting γ need not lift. Work explicitly in a full-coweight/adjoint datum and prove the appropriate componentwise transfer of the final geometry and invariants. The equal-characteristic restriction of the cited comparison and the GHN erratum must remain visible; this audit does not silently extend the comparison to every ramified or mixed-characteristic setting. The finding concerns well-definedness and the written reduction, not a claimed counterexample to Theorem 6.1.

## E9–E11 and E17 — four slips in the cited H14 induction

**E9, p.399, statement.** The support condition must concern the Weyl factor x, not the Hecke parameter v. The subsequent induction and HZZ's later formulation make the intended variable unambiguous.

**E10, p.399, descent choice.** The representative `x₁` is minimal on the left for `W_{δ⁻¹(J₁)}` and therefore has no left descent in that subset. If `x₁≠1`, choose a descent in `J\δ⁻¹(J₁)`. The following minimality assertion about `t^μ y s_{δ(i)}` also requires this choice outside the subset.

**E11, p.399, claim (a).** Keep δ-saturated support in the conclusion about x′. In A2 with the diagram interchange, a single `s₁` has full saturated support and proper ordinary support. The proof's preceding equalities establish the former, which is exactly the induction hypothesis needed.

**E17, p.400, second support branch.** The induction display loses δ on its last reflection. The endpoint from the preceding twisted-conjugation step is `s_i x′ t^μ y s_{δ(i)}`, not the expression ending in `y s_i`. The page image confirms that the omission is printed. This additional slip disappears when δ fixes i, which explains why a split-only check would miss it.

These locations were inspected in the published images, not inferred from text extraction. HZZ Proposition 3.4.2 gives a later geometric induction with x-support, the outside-parabolic descent, saturated support and the endpoint `yσ(s)`. That is useful positive comparison evidence, but it is neither an official H14 erratum nor an automatic proof of every transport needed for H21. [H14, Proposition 11.6; HZZ, Proposition 3.4.2]

## E13 and E14 — already corrected by the GHN authors

**E13.** Import the componentwise adjoint flag comparison from erratum Proposition 0.0.1, not an unconditional global immersion or an automatically injective map on components. Retain its equal-characteristic coprimality hypothesis. The erratum's further kernel description is for semisimple G; the extraction's unqualified wording must not turn it into a claim for arbitrary reductive G. [GHN, Proposition 2.2.1; erratum, pp.1–2]

**E14.** The uniqueness of a Levi σ-class in the intersection with a G-class requires the latter to be basic. In GL2, the permutation matrix conjugates `diag(ε,1)` to `diag(1,ε)`, whereas diagonal σ-conjugation preserves the ordered pair of valuations. These are two different classes for the diagonal Levi. Erratum Proposition 0.0.2 supplies the basic hypothesis. Do **not** propagate that restriction to the one-way Levi obstruction in He21 Theorem 6.3: its footnote explicitly distinguishes that statement. [GHN, Proposition 3.5.1; erratum, p.2; H21, Theorem 6.3 and footnote]

## E15 and E16 — editorial notation only

E15 aligns the §6.1 heading with the immediately following `(J,x,σ)` definition. The old letters in a heading do not falsify a theorem; this is classified as affecting nothing.

E16 replaces the unintroduced local-field symbol in `N(L)` with the paper's `N(F̆)`. The separately defined L-action is not that field. Neither correction changes the argument. [H21, §§2.1, 6.1]

## Allegations not retained

**E7 remains excluded.** The generic point of an irreducible scheme lies outside every proper closed subset, so any union of such subsets still misses it. An arbitrary number of components is no counterexample to that argument. Proving the relevant morphism and dimension theorem in the actual bounded/perfect carrier remains formalization work, but it does not establish the alleged topological error. [H21, §5.4]

**E12 remains excluded.** HY §1.2 explicitly defines support of an element in a twisted coset to be the saturation under the twisting automorphism. Its §4.2 is using that convention, not confusing ordinary and saturated support. The p.2 image resolves the issue. [HY, §§1.2, 4.2]

**E8 is not established as a source error.** The equal-characteristic scheme statement in H21 is not false. BS is primarily about Witt-vector/mixed-characteristic geometry, but its introduction also discusses the ordinary equal-characteristic Grassmannian; the inherited assertion that it says nothing about equal characteristic is false. A more precise reference and a separate mixed-characteristic/perfect-scheme sentence would improve H21's exposition, but the focus of the cited paper does not alone prove that “equal” is a misprint for “mixed”. No explicit intended replacement or false mathematical assertion was established in this check. Accordingly E8 is documented here rather than promoted into the machine-readable error register. A reviewer can reassess the citation against this narrower question. [H21, §2.2; BS, introduction]

## Validation and review boundary

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-HE-21.json` reports `ok`. The checker and its helper were fetched from the repository into a scratch mirror and their exact Git blob hashes verified: `d92d3b6177a6c0e13e35248597c5c41fe63648d6` and `da67776033cefc24d185ffd47b2c74d3e9167099`, respectively. This was not a full repository checkout or an execution of every repository check. JSON identifiers, uniqueness and absence of a self-review object were checked separately.

The exact arithmetic regression script below also passes. It tests the witnesses and the repaired direction, not the general source theorems. No Lean file was written or compiled; this is an errata job. The independent reviewer should particularly assess the E1 hypothesis failure, the modest classification of E5, the carrier/scope in E6, the exclusion of E8, and the newly found E17. Nothing here asserts complete proof closure, formalisation, or author acceptance.

### Reproducible exact checks

Run with Python and SymPy; all comparisons use exact integers or rational numbers.

```python
"""Exact small-rank checks for ERRATA-PAPER-HE-21. Not a Lean proof."""
from fractions import Fraction
import sympy as s
u,v=s.symbols('u v')
S1=s.Matrix([[-1,0],[1,1]])
S2=s.Matrix([[1,1],[0,-1]])
z=s.Matrix([u,v]); lam=s.Matrix([0,1])
w=s.simplify(S2*S1*(z-lam)); seed=s.simplify(S1*S2*(z-lam))
assert w == s.Matrix([v-1,1-u-v])
assert seed == s.Matrix([1-u-v,u])
assert s.simplify(sum(w)) == -u
# Range of each affine functional over the open triangle (-1,0),(0,-1),(0,0).
verts=[{u:-1,v:0},{u:0,v:-1},{u:0,v:0}]
def ranges(M):
 return [(min(s.expand(f).subs(t) for t in verts),max(s.expand(f).subs(t) for t in verts)) for f in [M[0],M[1],sum(M)]]
assert ranges(w)==[(-2,-1),(1,2),(0,1)]
assert ranges(seed)==[(1,2),(-1,0),(1,2)]
# Nonregular does not imply nonshrunken: gamma=0 and finite longest element.
w0=S1*S2*S1
assert ranges(w0*z)==[(0,1),(0,1),(0,1)]
# Erroneous conjugator in E2: x=s2,y=s1s2, eta=yx=s1, J={s1}.
x=S2; y=S1*S2
assert y*x==S1
wrong=y.inv()*x*y*y
assert wrong==S2 and wrong not in (s.eye(2),S1)
assert x.inv()*x*y*x==S1
# Full coweight versus cocharacter lattice of simply connected A2.
C=s.Matrix([[2,-1],[-1,2]])
om1=s.Matrix([1,0]);om2=s.Matrix([0,1])
assert C.inv()*om1==s.Matrix([s.Rational(2,3),s.Rational(1,3)])
lam=s.Matrix([3,3]);gamma=lam-om1+S2*om2
assert gamma==s.Matrix([3,2])
assert C.inv()*lam==s.Matrix([3,3])
assert C.inv()*gamma==s.Matrix([s.Rational(8,3),s.Rational(7,3)])
# Sum of simple coroots is not a dominant direction in D4.
D4=s.Matrix([[2,-1,0,0],[-1,2,-1,-1],[0,-1,2,0],[0,-1,0,2]])
assert D4*s.ones(4,1)==s.Matrix([1,-1,1,1])
two_rho=D4.inv()*s.ones(4,1)*2
assert two_rho==s.Matrix([6,10,6,6])
assert D4*two_rho==2*s.ones(4,1)
# Strict-positivity misprint at zero; saturated support can enlarge ordinary support.
assert not all(n>0 for n in (0,0)) and all(n>=0 for n in (0,0))
ordinary={1};sigma=lambda n:3-n
saturated=ordinary|{sigma(n) for n in ordinary}
assert ordinary!={1,2} and saturated=={1,2}
print('PASS: E1 A2 ranges and nonregular countercheck; E2 wrong conjugator; E4 zero case; E5 D4 direction; E6 A2 integral lattice; E11 saturation.')
print('w positive-root ranges:',ranges(w))
print('seed positive-root ranges:',ranges(seed))
print('D4 2rho coefficients:',list(two_rho))
```
