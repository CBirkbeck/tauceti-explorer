# H.8 — Real Noether–Lefschetz variation interfaces

This stage specifies the common Hodge-theoretic interfaces used by the real surface period-index programme. Its principal output is a cone of flat classes which acquire type `(1,1)` on nearby real fibres. It also includes the complex Voisin theorem in a pushforward kernel, and the ordinary integral topological statements that the programme needs before using that theorem. The packet has target-level granularity: each target and each required definition or key theorem has a node; the internal steps of the large Voisin argument remain in its proof outline.

The variation, local system, flat bundle, filtration and Gauss–Manin connection are imported from `ShimuraData:D3/variation`, `HodgeStructuresPartII:H.2/geometric-pure`, `HodgeStructuresPartII:H.2/gauss-manin` and the H.3 period-symbol nodes. H.8 adds the compatible real action and its applications. It does not introduce a second variation carrier. Integral divisor algebraicity belongs to `MotivesAndAlgebraicCycles:MC.7/tate-and-hodge-known-cases`; the real refinement belongs to an extension of that same cycle supplier. `RealSurfacePeriodIndex` consumes these interfaces and owns double-cover families, their vanishing and codimension calculations, equivariant relative transport and the period-index argument.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed audit identifies built fibre Hodge theory, an absent general variation implementation, and incomplete comparison infrastructure. A fresh statement audit supplies the sixteen baseline references in the packet. Every implementation status is unchecked. H.8 is planned, with the five precise supplier gaps below; no stage is closed.

The [Mathlib discussion of complexification and Hodge theory](https://leanprover-community.github.io/archive/stream/287929-mathlib4/topic/Proposal.3A.20Complexifications.20with.20a.20view.20towards.20Hodge.20theory.html) supports using native tensor products, base-change data and opposed filtrations. The pinned Tau Ceti carrier already follows that direction. The open [Mathlib complex-structure proposal](https://github.com/leanprover-community/mathlib4/pull/40975) concerns a real-linear endomorphism squaring to minus identity; it does not replace the geometric variation or real-action interfaces specified here. These design leads are distinct from the declarations present at the pinned baseline.

## Conventions and the real-action extension

Write $c:B(\mathbb C)\to B(\mathbb C)$ for the antiholomorphic base involution. A geometric action on a rational local system is a family

$$
\sigma_b:H_{\mathbb Q,b}\longrightarrow H_{\mathbb Q,c(b)},
\qquad \sigma_{c(b)}\sigma_b=1,
$$

compatible with parallel transport. At a nonreal basepoint this is a map between two fibres. On a stable flat chart centred at a real point it is represented by an involution on one fixed real space $V$. Its complex-linear extension is denoted $\sigma_{\mathbb C}$. Coefficient conjugation $\kappa$ on $\mathbb C\otimes_{\mathbb R}V$ is the native `complexificationConjugation`: it conjugates the scalar and fixes the real vector.

For weight two the compatible real action has

$$
\sigma_{\mathbb C,b} H_b^{p,2-p}=H_{c(b)}^{2-p,p}.
$$

Coefficient conjugation exchanges those same indices in one fibre. Thus $\tau_b=\sigma_{\mathbb C,b}\kappa_b$ is conjugate-linear and preserves Hodge type between $b$ and $c(b)$. These are three distinct maps. For example, geometric action sends $i\otimes v$ to $i\otimes\sigma v$, whereas the combined action sends it to $-i\otimes\sigma v$. Confusing the complex-linear geometric map with the combined map gives the wrong type and coefficient behaviour.

`real-action` specifies this extension on the common variation. The suggested `RealActionOnChart` attaches an actual real-linear involution to supplied native fibre Hodge structures and a supplied base involution. The field requiring geometric Hodge-piece exchange is a concrete equation of native submodules. It carries no placeholder for a missing holomorphic or global structure. `combined-type` is the promoted API theorem: apply native `HodgeStructureOn.conj_piece`, then geometric exchange, to return to index $p$; the involution gives equality rather than only inclusion.

The Tate convention is $\mathbb Z(1)=2\pi i\mathbb Z$, with the nontrivial element of $G=\operatorname{Gal}(\mathbb C/\mathbb R)$ acting by $-1$. Identifying $V(1)$ with $V$ through this generator identifies its fixed space with

$$
V(1)^G=\{v\in V:\sigma v=-v\}=\ker(\sigma+1).
$$

`twisted-invariants` is this native kernel submodule, and `twist-sign` promotes its membership equation for use by the real cone theorem. The underlying weight-two Hodge pieces are used to test the class; the Tate-twisted Hodge structure has weight zero. No notation changes that weight. If $\sigma=1$ on a real line, the fixed space after twisting is zero; if $\sigma=-1$, it is the whole line. These tests distinguish the required sign from untwisted invariance.

`geometric-real-variation` supplies the geometric instance: for a smooth projective morphism of smooth real varieties with surface fibres, $R^2\pi_*\mathbb Q$, the H.2 connection and filtration form an effective weight-two rational variation. Its lattice is $H^2(-,\mathbb Z)/\mathrm{torsion}$. Relative coherent Hodge comparison identifies $H^1(\Omega^1)$ with $H^{1,1}$ and $H^2(\mathcal O)$ with $H^{0,2}$. Geometric pullback exchanges form degrees, and combining it with coefficient conjugation preserves them. The torsion quotient here is specific to the VHS lattice: the integral topological theorems below retain all torsion. The relative comparison is requested from `ComplexComparisonPartII:C1`, together with the existing Betti/de Rham repair node in C5.

These conventions and the geometric instance support Benoist's real criterion [B18, §1.1, Proposition 1.1, pp.1050–1051] and its surface-family formulation [B18, §2.1, pp.1053–1054; B19, §6.2, Proposition 6.6, pp.93–95]. The native pure Hodge carrier and coefficient conjugation are imported rather than specified again.

## Flat classes and the derivative sign

Fix a flat chart $\Delta$ and identify its real local system with $V$. For $\lambda\in V$, define the transported Hodge locus by

$$
\mathrm{NL}_H(\lambda)=\{b\in\Delta:1\otimes\lambda\in H_b^{1,1}\}.
$$

This is `transported-hodge-locus`. Since $1\otimes\lambda$ is fixed by coefficient conjugation, type `(1,1)` is equivalent to membership in $F_b^1$. A real vector in $F^1$ also belongs to its conjugate, so lies in their native intersection `piece 1`. This characterisation uses the actual native filtration and opposedness, not an independently chosen decomposition.

`transported-locus-gluing` compares overlapping flat markings. If their constant transition equivalence is $e:V\simeq V'$, transport both the Hodge subspaces and the class: $\mathrm{NL}_H(\lambda)=\mathrm{NL}_{H'}(e\lambda)$ on the overlap. The local-system cocycle gives compatibility on triple overlaps. A loop with nontrivial monodromy changes the class by that monodromy; the specification makes no global single-valuedness assertion for an unmarked class.

There are two derivatives to distinguish. The H.3 symbol differentiates the moving filtration using the Gauss–Manin connection and maps

$$
\theta_b(v):H_b^{1,1}\longrightarrow H_b^{0,2}.
$$

The obstruction to a fixed flat class lying in $F^1$ is its image in the moving quotient $H_{\mathbb C}/F^1$. At a zero its derivative is **minus** $\theta_b(v)(\lambda)$. To see the sign, write the nearby $F^1$ as the graph of $A(x):F_b^1\to H_{\mathbb C}/F_b^1$, with $A(b)=0$. In this quotient frame a fixed $\lambda\in F_b^1$ has obstruction $-A(x)\lambda$. Its derivative is $-DA_b(v)\lambda$. Changing the moving quotient frame contributes no term at a zero. `nl-obstruction-derivative` records this distinction, with the explicit local prototype `flatClassObstruction_derivative`.

For a constant family the symbol and obstruction derivative are zero; the transported locus is the whole chart for a Hodge class and empty for a non-Hodge class. These are acceptance cases as well as definition tests. The global obstruction statement imports `HodgeStructuresPartII:H.3/period-symbol` and `HodgeStructuresPartII:H.3/derivative-connection`; its quotient-bundle identification remains part of G1.

## Kodaira–Spencer contraction and normal boundaries

For a smooth projective complex surface family, the geometric Kodaira–Spencer map and coherent contraction are

$$
\operatorname{KS}_b:T_bB\longrightarrow H^1(X_b,T_{X_b}),
\qquad
H^1(T_{X_b})\otimes H^1(\Omega^1_{X_b})\longrightarrow H^2(\mathcal O_{X_b}).
$$

Cup order is deformation class first, Hodge class second. For $\lambda\in H^1(\Omega^1)$, `kodaira-spencer-contraction` defines $\phi_\lambda(v)=\operatorname{KS}_b(v)\cup\lambda$. Its local prototype `contractedKS` composes the supplied actual KS and bilinear cup maps. The generic composition and its API can be stated against native `LinearMap`; identifying the input maps with geometric KS and coherent contraction requires SF.2/SF.4 and the relative comparison. An arbitrary linear map is not certified as a geometric KS map by this construction.

`griffiths-derivative` states, under those identifications,

$$
\theta_b(v)(\lambda)=\phi_\lambda(v)\quad\text{in }H_b^{0,2}\simeq H^2(\mathcal O_{X_b}).
$$

This has the positive symbol sign fixed by H.3. In local family coordinates, derivatives of the transition functions form the KS cocycle. Differentiation of a `(1,1)` representative produces its contraction with that cocycle as the component lowering holomorphic degree. The components retained by $F^1$ vanish in the quotient. This is the geometric argument of Griffiths [G68, II.1$a$, Proposition (1.20), Theorem (1.23), pp.810–815], whose full local proof supports the comparison. It is separate from the negative flat-class obstruction.

For the second interface let $C\subset T\subset X$ be smooth projective complex varieties of dimensions (1,2,3), with both inclusions Cartier, and let $\lambda=c_1(\mathcal O_T(C))$. The exact sequences are

$$
0\to N_{C/T}\to N_{C/X}\to N_{T/X}|_C\to0,
\qquad
0\to\mathcal O_T\to\mathcal O_T(C)\to i_*N_{C/T}\to0.
$$

`normal-boundary-factorization` states the equality of **the actual geometric maps**

$$
\phi_\lambda=
H^0(T,N_{T/X})\xrightarrow{\mathrm{restriction}}H^0(C,N_{T/X}|_C)
\xrightarrow{\delta_{\rm norm}}H^1(C,N_{C/T})
\xrightarrow{\delta_{\rm div}}H^2(T,\mathcal O_T).
$$

Its proof compares the extension cocycles obtained from differences of local splittings. The divisor extension, pulled back through the tangent-to-normal map along $C$, represents the Chern class. Naturality relates this to the normal extension and to contraction. In the Atiyah description dualisation changes the extension sign; it must be included with the declared cup ordering. This is Benoist [B18, §2.1, Proposition 2.1, pp.1053–1054], also used in [B19, §5.2, Proposition 5.4, equation (5.7), p.88]. The latter printed intermediate degree is corrected below.

`normal-vanishing-surjectivity` assumes

$$
H^1(T,N_{T/X}(-C))=0,\qquad H^1(C,N_{C/X})=0,
\qquad H^2(T,\mathcal O_T(C))=0.
$$

The restriction, normal boundary and divisor boundary are then onto in that order, by their three long exact sequences. Their composite is onto $H^2(T,\mathcal O_T)$ [B18, Corollary 2.2, p.1054]. For a parameter family embedded in $X$, precompose with its characteristic map $k:T_bB\to H^0(T,N_{T/X})$. Surjectivity on $T_bB$ additionally requires $k$ onto, or the weaker sufficient condition that restriction composed with $k$ be onto $H^0(C,N_{T/X}|_C)$. The three sheaf vanishings alone do not make an arbitrary smaller family transverse.

The suggested `normalComposite_surjective` proves only the elementary linear composition implication. G2 retains the coherent boundary identifications and the geometric equality; these are not replaced by assumed theorem-valued fields. SF.2 owns the cohomology sequences and cup products, SF.4 owns deformation/Atiyah comparisons, and SF.5 owns Cartier normal and divisor identifications. Application-specific verification of the three vanishings belongs to the consumer family.

## Green evaluation, real cones and componentwise genericity

For an effective finite-rank real weight-two variation, let $J\to\Delta$ be the smooth real bundle whose fibre is $H_{\mathbb R,b}^{1,1}$. Evaluation by flat marking gives $E:J\to H_{\mathbb R,b_0}$. `green-evaluation-submersion` asserts that if $\theta_\lambda:T_bB\to H_b^{0,2}$ is onto as a complex-linear map, $E$ is a submersion at $(b,\lambda)$.

The vertical derivative supplies $J_b$. Modulo that space the horizontal derivative is the real form of the symbol together with its conjugate. The underlying real tangent of the complex base permits an arbitrary `(1,0)` component, so complex surjectivity onto `(0,2)` gives real surjectivity of the evaluation derivative. This applies to a subvariation with its own `(0,2)` piece, using the subvariation's actual local system and filtration.

Mathlib already contains the Banach implicit-function input: `HasStrictFDerivAt.implicitToOpenPartialHomeomorphOfComplemented` straightens a strictly differentiable map with full-range derivative and closed complemented kernel. Its target is open and contains the base value paired with zero. The explicit local consequence `image_contains_ball_of_surjective_derivative` records an image neighbourhood for every domain neighbourhood of the point. In finite-dimensional charts all the required completeness and complemented-kernel conditions are supplied. H.8 plans the geometric derivative computation and fixed-locus restriction, rather than another implicit-function theory.

`fixed-linear-surjectivity` is the restriction lemma. If $L:E\to F$ is onto and equivariant for real-linear involutions $s,t$, a preimage (x) of a fixed (y) can be replaced by $(x+s(x))/2$. This is fixed and still maps to (y). The argument also applies when both actions are multiplied by the Tate sign. Turning this into a statement about fixed manifolds requires the general theorem identifying their tangent spaces with the fixed tangent subspaces; that precise G3 supplier is recorded rather than presumed.

A `PositiveOpenCone` in a normed real space is an open nonempty set $\Omega$ such that $a\Omega\subseteq\Omega$ for every $a>0$. Its openness is measured in its declared ambient space. Convexity and exclusion of zero are not conditions. Applying closure under $a^{-1}$ gives (av\in\Omega\) if and only if (v\in\Omega\). A zero-dimensional target must be supported: its whole space is a cone containing zero.

`real-green-open-cone` assumes a compatible rational variation, a real basepoint $b$, and $\lambda\in H_{\mathbb R,b}^{1,1}(1)^G$ with onto complex symbol. For every sufficiently small stable connected flat chart $\Delta$ at $b$, with contractible connected real locus, there is a positive open cone

$$
\Omega\subset H_{\mathbb R,b}(1)^G
$$

such that each $\nu\in\Omega$ becomes `(1,1)` after transport to some $b'\in\Delta(\mathbb R)$. This is relative openness in the twisted invariant space. Apply the complex evaluation theorem to the Tate-twisted equivariant bundle, restrict its derivative using averaging and fixed tangents, and use the implicit-function theorem on the real fixed locus. The entire evaluation image is stable under positive scaling because each fibre evaluation is linear. The positive saturation of a local image neighbourhood is the desired open cone. Shrinking an admissible chart still permits the same argument. This is the abstract real criterion of [B18, Proposition 1.1, pp.1050–1051]. The local `openCone_of_submersion` isolates these analytic and scaling hypotheses without asserting a geometric conclusion for arbitrary maps.

`good-real-locus` records the rank condition. For actual marked twisted-real Hodge subspaces $J_b\subset V$ and the class-to-symbol linear map $A_b:V\to\operatorname{Hom}_{\mathbb C}(T,Q)$, put

$$
\operatorname{Good}_{\mathbb R}(H)=
\{b\in B(\mathbb R):\exists\lambda\in J_b,\ A_b(\lambda)\text{ is onto}\}.
$$

The local definition adds no regularity assertion; the common variation supplier must provide the actual $J$ and (A). When $Q=0$, zero witnesses goodness everywhere; when $Q\ne0$ and $A=0$, no point is good. In the scalar fixture $A(\lambda)(v)=\lambda v$, the class (1\) makes a one-point base good, while restricting the class space to zero makes it bad.

`real-good-locus-density` states that for a compatible variation over a smooth real algebraic base, goodness is open and is either empty or open dense on each connected component of $B(\mathbb R)$. One good point implies density in its component. It does not imply nonemptiness on every real component from complex genericity. For geometric surface families `griffiths-derivative` identifies this with the KS-contraction condition [B18, Proposition 1.3 and Remark 1.5, pp.1051–1052].

The proof uses real-analytic frames, with locally constant dimensions. Expand each full-rank minor as a polynomial in the coordinates of $\lambda$. Badness means that every coefficient of every such polynomial vanishes. There are finitely many coefficients, all real analytic in the base coordinates. The several-variable analytic identity principle propagates their vanishing from a nonempty open subset along a connected component. Thus the closed bad set either fills the component or has empty interior. Mathlib's `AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero` is the appropriate input; the one-variable isolated-zero theorem is insufficient. The prototype `analyticCoefficientLocus_dense` states the explicit finite-coefficient analytic implication. The argument does not assume that an arbitrary intersection of analytic sets is itself analytic.

## Constant summands, vanishing cohomology and integral cosets

`orthogonal-constant-splitting` starts with a finite-rank rational weight-two variation $H$, a flat rational bilinear pairing $Q$, and a constant Hodge sub-local-system $C$ whose Hodge filtration is fixed. Require $Q|_C$ nondegenerate and require Hodge compatibility

$$
Q_{\mathbb C}(H^{p,q},H^{r,s})=0
\quad\text{unless }p+r=q+s=2.
$$

Then $K=C^\perp$ is a flat Hodge subvariation and $H=C\oplus K$, with a flat Hodge projector onto $C$. A real action preserving (C,Q) preserves $K$. Nondegeneracy on $C$ gives the fibre splitting, flatness propagates the orthogonals under transport, and Hodge compatibility splits each piece. The native `RationalHodgeSubstructure.isCompl_WQ_orthogonal_WQ` supplies the polarized fibre case; the stated general type-compatible pairing case uses the same elementary linear algebra. The flat-subvariation result is new. In a surface-cover application $Q$ is the full intersection pairing. The specification does not call that pairing a polarization on all of $H^2$ without the Lefschetz sign correction.

`constant-symbol-zero` follows by applying the Gauss–Manin symbol to the flat Hodge projector. A parallel section of $C$ remains in its fixed filtration, so its symbol vanishes; the symbol of every class has zero $C^{0,2}$ projection. Thus a contraction into ambient $H^{0,2}=C^{0,2}\oplus K^{0,2}$ actually has image in $K^{0,2}$.

`vanishing-rank-criterion` is the finite-dimensional consequence: if $f:T\to C^{0,2}\oplus K^{0,2}$ has zero first component and ambient cokernel dimension at most $\dim C^{0,2}$, its second component is onto. Indeed its ambient codimension is $\dim C^{0,2}+\dim K^{0,2}-\dim\operatorname{im}f$. The inequality and image containment force equality with $\dim C^{0,2}$. There is no claim of surjectivity onto the full ambient space when $C^{0,2}\ne0$.

`vanishing-real-green` assumes in addition that the chosen real twisted Hodge class $\lambda$ itself belongs to $K$. Compare its contraction with the symbol, apply the rank criterion, and then apply the real Green theorem to the subvariation $K$. The resulting cone is open in $K_{\mathbb R}(1)^G$. The extra condition on $\lambda$ is essential to applying the criterion to that subvariation. This is the interface used in [B19, Proposition 6.6 and proof, pp.93–95]. Its double-cover codimension estimate and the vanishing summand's particular geometric description remain with `RealSurfacePeriodIndex`.

`full-lattice-coset-cone` supplies the integral arithmetic step. Let $b_1,\ldots,b_r$ be a real basis of a finite-dimensional normed space $V$, let $\Lambda=\sum\mathbb Zb_i$, let $n>0$ be an integer, $a\in V$, and let $\Omega$ be a positive open cone. Then $(a+n\Lambda)\cap\Omega\ne\varnothing$. It applies to full-rank finite-index lattice images in their real span, but not to a lower-rank lattice viewed inside a larger space.

Choose $v\in\Omega$ and a ball $B(v,\epsilon)\subset\Omega$. For large $t>0$, native `ZSpan.floor` rounds $(tv-a)/n$ to a lattice vector (z\). Native `ZSpan.norm_fract_le` bounds $\|a+nz-tv\|$ by $n\sum_i\|b_i\|$, independently of (t). Dividing by (t) puts $(a+nz)/t$ in the ball; positive scaling then puts (a+nz\) in the cone. Dimension zero is included. In rank one every congruence class has a positive representative. The scope of this result is the cone/coset argument in [B19, §1, Proposition 1.2 proof, p.71; §6.2, pp.94–95]. Establishing that a particular equivariant integral image is a full lattice is a consumer/topology input, not a consequence of rounding.

## The required Voisin kernel cone

The complex kernel theorem is a mandatory separate output. Let $X$ be a smooth projective complex threefold, let $p:X\to S$ be a morphism to a smooth projective surface with smooth rational generic fibre, and choose an ample $H$ with $H^2\cdot K_X<0$. Positive powers ensure the very-ampleness and positive-twist cohomology hypotheses used in the proof. For all sufficiently large $m$ and a general smooth $T\in|mH|$, `voisin-infinitesimal-kernel` gives

$$
\lambda\in\ker\bigl[p_*:H^1(T,\Omega_T^1)\to H^1(S,\Omega_S^1)\bigr]
$$

for which $\phi_\lambda:H^0(T,N_{T/X})\to\ker[p_*:H^2(T,\mathcal O_T)\to H^2(S,\mathcal O_S)]$ is onto. These are kernels on the surface $T$ mapping to the surface (S), so the displayed cohomological degree is preserved. Surjectivity is required in this kernel target. The source is Voisin [V06, author preprint §3, Proposition 9, pp.20–21].

The proof route retains the supporting argument rather than treating Proposition 9 as an unexplained supplier. Serre duality turns the cup map into a bilinear pairing. Voisin's Lemma 6 converts generic surjectivity into bounds on components of its projective base locus. A degeneration to symmetric determinantal nodal surfaces makes the limiting pairing detect products of values at the nodes (Lemma 7). Barth's node count, $\binom{m+1}{3}H^3$, combines with the incidence calculation on $\operatorname{Grass}(2,m)$ and uniform position to control the dimensions of the relevant projections by $O(m^2)$.

The incidence calculation uses a rank (2m-1) bundle, its Koszul resolution, and the Bott vanishings in Proposition 3 and Appendix Lemmas 8 and 13 [V06, author PDF pp.9–12, 22–23]. Uniform position yields the node-subspace bounds in Lemma 9 and the projection estimates of Corollary 4 [pp.12–14]. Proposition 5 bounds the dimension of low-rank loci independently of $m$, through projection to projective three-space and the Fermat Jacobian-ring count [pp.14–16]. Green's Macaulay-type multiplication estimate, Proposition 7, enters Proposition 6 to exclude a nonzero vector of bounded rank [pp.16–18]. All asymptotic bounds retain the sufficiently large degree quantifier.

For Proposition 9, natural pushforward identifies $H^3(X,\Omega_X^1)$ with $H^2(S,\mathcal O_S)$ in this rational-generic-fibre setting. The kernel of surface pushforward is therefore the kernel of Gysin into $H^3(X,\Omega_X^1)$. The residue image is that kernel on $H^2(\mathcal O_T)$. Its Serre-dual annihilator is $p^*H^0(S,K_S)$; the pull-push degree identity separates this ambient image from the kernel. This is the modification that makes the preceding rank argument work in the required kernel [V06, pp.20–21]. The natural pushforward identification and exact reusable nodal, Grassmannian/Bott, uniform-position, linear-series and residue statements are the explicit G4 closure boundary. SF/moduli/comparison suppliers are requested for their parts; no exact atlas supplier has been found for all the combinatorial and nodal inputs. The mandatory theorem is fully specified even though those proof endpoints are not closed.

`voisin-kernel-cone` concludes that for all sufficiently large $m$, there is a nonempty Zariski open $V\subset|mH|$ of smooth members such that **every** $b\in V(\mathbb C)$ and every connected contractible neighbourhood $\Delta$ of $b$ in $V(\mathbb C)$ admit a positive open cone in

$$
\ker[p_*:H^2(T_b,\mathbb R)\to H^2(S,\mathbb R)]
$$

whose classes become `(1,1)` on fibres over $\Delta$. Flat pushforward and its induced Hodge filtration give a kernel subvariation of the common carrier. The condition that some $\lambda$ give full rank is algebraically open: in bundle frames the full-rank minors are polynomials in the class coordinates, and existence means not all their coefficients vanish. The infinitesimal theorem makes this open locus nonempty.

One additional transition is required for Green's real-vector evaluation on the complex base: Voisin produces a complex `(1,1)` class. The rank condition is a nonempty polynomial open subset of the complex kernel `(1,1)` space. Its coefficient-conjugation fixed real form is Zariski dense, so that open subset contains a real class with the same rank. Apply the evaluation submersion to the kernel variation and saturate its image by positive scaling. For any specified contractible neighbourhood choose a smaller flat chart inside it; its cone also works in the given neighbourhood. This is [V06, Proposition 8 and its proof, author PDF p.19], combined with Proposition 9 and the formulation of [B19, Theorem 1.5, pp.70–71]. Real coefficients here do not imply that the realizing basepoints are real. This theorem deforms over the complex base; the real Green theorem has separate fixed-locus hypotheses.

`voisin-product-surface` is the consumer-facing specialization. For a smooth projective surface (S) and a very ample (A) with $A^2>K_S\cdot A$, take $X=\mathbb P^1\times S$, $p=\mathrm{pr}_S$, and $H=\mathcal O_{\mathbb P^1}(1)\boxtimes A$. The product intersection calculation is

$$
H^2\cdot K_X=2(K_S\cdot A-A^2)<0.
$$

The generic fibre is $\mathbb P^1$, so the preceding theorem gives the required open set and cones for all sufficiently large degrees. The inequality is strict; equality does not meet it. This is precisely the product instance of [B19, Theorem 1.5, p.70]. The degree threshold is geometric and is not identified with a Brauer period in H.8.

## Ordinary integral topology and divisor export

`affine-cw-bound` states that a smooth complex affine variety of complex dimension $d$ has the homotopy type of a CW complex of real dimension at most $d$. In particular a smooth affine complex surface has a CW model of dimension at most two. Embed the variety as a closed complex submanifold of $\mathbb C^N$. A generic squared-distance function is a proper Morse exhaustion. Its quadratic holomorphic contribution to the real Hessian has eigenvalues in opposite pairs; the positive distance term implies that a critical point has Morse index at most $d$. The general Morse handle theorem supplies a CW model with cells of those indices [M63, §7, Theorem 7.2 and proof, pp.39–41]. The special complex index calculation belongs here; the general Morse and handle infrastructure belongs to the requested Geometric topology Part II extension.

`affine-integral-vanishing` deduces $H^i(U(\mathbb C),\mathbb Z)=0$ for $i\ge3$ on a smooth affine surface: the integral cellular cochain complex has no terms above degree two. A smooth finite étale cover is again affine of the same dimension, and the theorem applies to it independently. This does not automatically prove sign local-system or equivariant cohomology vanishing. The exact sequences supplying such further conclusions belong to their coefficient/topology supplier [B19, §3.2, Proposition 3.2 proof, pp.78–79].

For a smooth ample Cartier surface $i:T\hookrightarrow X$ in a smooth projective complex threefold, the two weak Lefschetz outputs are

$$
\begin{array}{ll}
\texttt{ordinaryIntegralWeakLefschetzH3}:&i_*:H^3(T,\mathbb Z)\simeq H^5(X,\mathbb Z),\\
\texttt{ordinaryIntegralWeakLefschetzH2}:&i_*:H^2(T,\mathbb Z)\twoheadrightarrow H^4(X,\mathbb Z).
\end{array}
$$

These are ordinary integral Gysin maps and include torsion. The complement $U=X\setminus T$ is affine, using a very ample multiple of the ample divisor with the same support. Its CW dimension is at most three. Relative integral duality identifies $H_j(X,T;\mathbb Z)$ with $H^{6-j}(U;\mathbb Z)$, so the former vanish for $j\le2$. The pair sequence gives $H_1(T)\simeq H_1(X)$ and $H_2(T)\twoheadrightarrow H_2(X)$. Integral Poincaré duality with complex orientations identifies inclusion with the two displayed Gysin maps [M63, §7, Corollary 7.3, p.41; B19, Lemmas 1.3–1.4, p.70]. This proof never rationalizes the groups. An equivariant or étale weak Lefschetz statement is not a replacement. The degree-two map is not generally injective: a quartic K3 in $\mathbb P^3$ has source rank 22 and target rank one.

The cellular and duality inputs are imported from the existing upstream AlgebraicTopology stages 4 and 6. Their exact singular-cohomology, relative-duality and algebraic-analytification/Gysin adapters are requests. The current GeometricTopology manifold layer does not state the needed general Morse theory or fixed-involution tangent theorem; the packet proposes a Part II extension in that direction, without modifying or re-planning the upstream roadmap.

`transported-divisor-export` joins the Hodge interface to the existing cycle supplier. In a complex surface family, an integral class whose realification lies in a cone becomes `(1,1)` on a nearby fibre. MC.7's integral Lefschetz `(1,1)` theorem supplies a line bundle with that first Chern class, including the integral torsion case. The marking-gluing theorem compares the geometric transport with the marked cone statement.

For a real family the Green cone instead gives a nearby **real** point and a twisted invariant real Hodge class. A real line bundle conclusion additionally requires an actual integral equivariant lift in $H^2_G(T(\mathbb C),\mathbb Z(1))$, transported by the consumer, and the real Lefschetz `(1,1)` refinement of MC.7. Invariant ordinary integral cohomology alone is not this hypothesis. The exact refinement, cited by Benoist through Benoist–Wittenberg Proposition 2.8/Krasnov, is G5 because its proof source and a precise existing supplier node have not been established. H.8 supplies the Hodge-theoretic conversion interface [B19, Proposition 1.2 proof, p.71; Proposition 6.6 proof, pp.94–95; B18, Remark 1.4, p.1052]. The consumer owns finite-index integral images, relative-pair/Kummer transport and the ensuing period-index conclusion.

## Dependency and acceptance catalogue

Each suffix in the following table has the prefix `HodgeStructuresPartII:H.8/`. The packet supplies exact hypotheses, proof steps and prerequisite edges. The declarations are proposed within `TauCeti.Hodge.RealNL`; a ledger in the suggested file names the global signatures whose geometric input types do not yet exist.

| Node suffix | Proposed declaration | Principal acceptance condition |
| --- | --- | --- |
| real-action | RealActionOnChart | Geometric and combined actions differ on $i\otimes v$. |
| combined-type | RealActionOnChart.combined_mem_piece | The combined action preserves the index $p$. |
| twisted-invariants | twistedInvariants | Native kernel is the anti-invariant real subspace. |
| twist-sign | mem_twistedInvariants | Tate fixed vectors satisfy $\sigma v=-v$. |
| geometric-real-variation | geometricRealVariation | Geometric Hodge/coherent comparison uses actual family cohomology. |
| transported-hodge-locus | transportedHodgeLocus | A fixed real class is tested in native piece 1. |
| transported-locus-gluing | transportedHodgeLocus_changeMarking | Change both marking and class, including monodromy. |
| nl-obstruction-derivative | flatClassObstruction_derivative | The quotient obstruction has negative symbol sign. |
| kodaira-spencer-contraction | contractedKS | Evaluation is cup of the actual KS class and $\lambda$. |
| griffiths-derivative | griffithsDerivative | Moving-filtration derivative has positive contraction sign. |
| normal-boundary-factorization | normalBoundaryFactorization | The middle group is $H^1(C,N_{C/T})$. |
| normal-vanishing-surjectivity | normalVanishingSurjectivity | A smaller family supplies its characteristic-map hypothesis. |
| positive-open-cone | PositiveOpenCone | Positive scaling and relative openness include dimension zero. |
| green-evaluation-submersion | greenEvaluationSubmersion | Use the `(0,2)` target of the chosen subvariation. |
| fixed-linear-surjectivity | fixedLinearSurjective | Averaging preserves the prescribed fixed target vector. |
| real-green-open-cone | realGreenOpenCone | Real basepoints and Tate fixed space are retained. |
| good-real-locus | goodRealLocus | The zero target is good everywhere; a nonzero zero-symbol target is bad. |
| real-good-locus-density | realGoodLocusDensity | Density holds within a component containing a good point. |
| orthogonal-constant-splitting | constantVanishingSplitting | Nondegeneracy and Hodge pairing, without false full-intersection positivity. |
| constant-symbol-zero | constantSymbolZero | A flat constant-filtration summand contributes zero symbol. |
| vanishing-rank-criterion | vanishingRankCriterion | Ambient codimension bound proves onto only the vanishing target. |
| vanishing-real-green | vanishingRealGreen | The class lies in the vanishing subspace. |
| full-lattice-coset-cone | fullLatticeCosetMeetsCone | Every full-lattice coset meets the cone in the same real span. |
| voisin-infinitesimal-kernel | voisinInfinitesimalKernel | Both class and target have the required pushforward kernel. |
| voisin-kernel-cone | voisinKernelCone | Every specified contractible neighbourhood works over the complex base. |
| voisin-product-surface | voisinProductSurface | Retain $A^2>K_SA$ and sufficiently large degree. |
| affine-cw-bound | affineCWBound | Real CW dimension is at most complex dimension $d$. |
| affine-integral-vanishing | affineIntegralVanishing | Ordinary integral cohomology vanishes above dimension two. |
| ordinary-integral-lefschetz-h3 | ordinaryIntegralWeakLefschetzH3 | Integral Gysin is an isomorphism including torsion. |
| ordinary-integral-lefschetz-h2 | ordinaryIntegralWeakLefschetzH2 | Integral Gysin is onto, with its middle-degree kernel retained. |
| transported-divisor-export | transportedDivisorExport | Real divisor conversion includes an equivariant integral lift. |

The six planets are **Real structures on variations**, **Kodaira–Spencer contraction**, **Griffiths derivative formula**, **Normal-boundary factorization**, **Real Green criterion**, and **Voisin kernel cone**. The chain from common variation to the geometric symbol and contraction feeds both cone theorems. The ordinary integral topology chain is independent of an equivariant weak Lefschetz theory. The divisor export imports the cones, marking compatibility, lattice cosets and MC.7; it has no prerequisite edge back to `RealSurfacePeriodIndex`.

## Definition APIs and tests

Each of the six definitions has an API derived from its cone, gluing, rank or transport uses. These are mathematical specifications; the suggested file contains their local signatures and named test examples. The catalogue has 28 API items and 24 definition tests. The extra analytic and composition prototypes isolate explicit local implications and do not close the global supplier gaps.

### RealActionOnChart

Used by B18 Proposition1.1, pp.1050–1051: Equivariance of the Hodge evaluation map allows passage to fixed real points.; B19 Proposition6.6, p.94; RealSurfacePeriodIndex consumer: The class and vanishing summand carry geometric conjugation and the Tate sign.

- **RealActionOnChart.geometric** (data): The complexification of σ is a complex-linear map on the native tensor product; on z tensor v it is z tensor σ$v$.
- **RealActionOnChart.combined** (data): The semilinear combined map sends z tensor v to conjugate(z) tensor σ$v$.
- **RealActionOnChart.combined_involutive** (structure): Applying the combined map twice is the identity.
- **RealActionOnChart.combined_mem_piece** (compatibility): For x∈H_b^(p,2-p), τ(x)∈H_c$b$^(p,2-p); this is promoted as combined-type.
- **RealActionOnChart.ext** (extensionality): On the same supplied chart, equality of the real-linear geometric action determines equality of the compatible real-action structures.

Acceptance tests:

- **real_action_geometric_tensor** (computation): On a pure tensor, geometric action changes v and leaves the complex scalar z fixed.
- **real_action_combined_tensor** (compatibility): On a pure tensor, combined action changes v and conjugates z; on i tensor v it differs from geometric action by a minus sign.
- **real_action_zero** (degenerate): On the zero real vector space both geometric and combined action fix every vector.
- **real_action_combined_square** (characterisation): For every compatible chart action and vector x, τ(τ(x))=x.

### twistedInvariants

Used by B18 Proposition1.1, p.1050: The initial Hodge class and target open cone lie in this twisted fixed space.; B19 Proposition6.6, p.94: A real algebraic curve class is anti-invariant before Tate twisting.

- **mem_twistedInvariants** (characterisation): v belongs to twistedInvariants σ iff σ$v$=-v; promoted as twist-sign.
- **twistedInvariants_id** (simp): For σ=id over R the twisted invariant submodule is zero.
- **twistedInvariants_neg_id** (simp): For σ=-id the twisted invariant submodule is all of V.
- **twistedInvariants_map** (functoriality): A real-linear map f with fσ=σ′f maps the twisted invariant submodule into the target twisted invariant submodule.
- **twistedInvariants_swap** (example): For the coordinate-swap involution on R² the twisted invariant vectors are exactly (a,-a).

Acceptance tests:

- **twisted_identity_line** (non-example): For V=R and σ=id, 1 is not twisted invariant.
- **twisted_negative_line** (computation): For V=R and σ=-id every vector is twisted invariant.
- **twisted_swap_plane** (characterisation): For swap(x,y)=(y,x), (x,y) is twisted invariant iff y=-x.
- **twisted_zero_space** (degenerate): On the zero real vector space twistedInvariants is top (and therefore also bottom).

### transportedHodgeLocus

Used by B19 Theorem1.5, p.70 and Proposition6.6, p.94: Transports a fixed cohomology class before asking whether a nearby fibre is of type(1,1).

- **mem_transportedHodgeLocus** (characterisation): b∈NL(λ) iff 1 tensor λ∈$H_b$.piece1.
- **transportedHodgeLocus_zero** (simp): NL(0)=Δ.
- **transportedHodgeLocus_constant** (example): For a constant Hodge family, NL(λ) is Δ when λ is of type(1,1) and is empty otherwise.
- **transportedHodgeLocus_changeMarking** (functoriality): A constant real-linear change of marking e transports Hodge subspaces and λ together, giving the same locus; promoted as transported-locus-gluing.
- **transportedHodgeLocus_F_one** (compatibility): For a real λ, membership in NL(λ) is equivalent to membership of its complexification in F¹.

Acceptance tests:

- **transported_zero** (degenerate): NL(0) is the whole supplied chart.
- **transported_constant_inside** (computation): A constant family and a class with 1 tensor λ∈H.piece1 give the whole chart.
- **transported_constant_outside** (non-example): For a constant family and a class outside H.piece1 the transported locus is empty.
- **transported_F_one** (compatibility): For an arbitrary weight-two native Hodge fibre, the real embedded vector has the same membership in piece1 and F¹.

### contractedKS

Used by B18 Proposition2.1 pp.1053–1054: The contraction is computed by normal/divisor connecting maps.; B19 Proposition6.6 p.94: Its rank supplies the infinitesimal Green hypothesis on the vanishing summand.

- **contractedKS_apply** (simp): φ_λ$v$=cup(KS(v),λ).
- **contractedKS_zero_class** (simp): φ_0=0.
- **contractedKS_add_class** (structure): φ_(λ+μ)=φ_λ+φ_μ.
- **contractedKS_smul_class** (structure): φ_(aλ)=aφ_λ for a∈C.
- **contractedKS_precomp** (functoriality): Replacing KS by KS∘f replaces φ_λ by φ_λ∘f.

Acceptance tests:

- **contractedKS_scalar_fixture** (computation): For T=D=H11=H02=C, KS=id and cup(a,λ)=aλ, φ_3(2)=6.
- **contractedKS_zero_fixture** (degenerate): With KS=0 every φ_λ is zero.
- **contractedKS_precomp_fixture** (compatibility): Precomposing the scalar KS by multiplication by2 gives φ_3$1$=6.
- **contractedKS_zero_class_fixture** (non-example): For the scalar fixture φ_0 is not surjective onto the nonzero target C.

### PositiveOpenCone

Used by B19 Proposition1.2 proof p.71 and Proposition6.6 p.94: A lattice-coset approximation is made in precisely the real subspace in which the cone is open.

- **PositiveOpenCone.smul_iff** (characterisation): For a>0, a•v∈Ω iff v∈Ω.
- **PositiveOpenCone.transport** (functoriality): A continuous real-linear equivalence transports a positive open cone to a positive open cone.
- **PositiveOpenCone.positiveRay** (example): The positive half-line (0,∞) is a positive open cone in R.
- **PositiveOpenCone.whole** (constructor): The whole real vector space is a positive open cone, including in dimension zero.

Acceptance tests:

- **cone_positive_ray** (computation): The positiveRay constructor supplies the cone conditions; its carrier contains 1 and excludes 0.
- **cone_zero_dimension** (degenerate): The entire zero-dimensional real vector space is a cone and contains zero.
- **cone_annulus_failure** (non-example): The nonempty open interval (1,2) is not a positive cone: positive scaling does not preserve it.
- **cone_scaling_inverse** (characterisation): For every positive a, membership of a•v in Ω is equivalent to membership of v.

### goodRealLocus

Used by B18 Propositions1.2–1.3 p.1052: Provides the locus shown to be empty or dense in each real connected component.

- **mem_goodRealLocus** (characterisation): b is good iff some λ∈J_b gives a surjective symbol.
- **goodRealLocus_zero_target** (simp): When the target complex vector space is zero, every basepoint is good.
- **goodRealLocus_zero_symbol** (characterisation): For an identically zero class-to-symbol map, goodness is equivalent to the target being the zero space.
- **goodRealLocus_baseChange** (functoriality): Pointwise transport by source, target and class-space linear equivalences preserves goodness.

Acceptance tests:

- **good_scalar_symbol** (computation): For J=T=Q=C viewed with J as a real module and symbol(λ)$v$=λv, the one-point base is good, witnessed by 1.
- **good_zero_target** (degenerate): For Q=0 the zero class witnesses goodness at every point, even if J=0.
- **good_zero_class_space** (non-example): For J=0 and Q=C, the one-point base is bad.
- **good_constant_zero_symbol** (characterisation): For every nonzero Q the identically zero symbol gives the empty good locus.

## Supplier closure and the global signature ledger

All thirty-one targets are planned at target level. The following are specific endpoints preventing closure, rather than weaker replacements for a target. Each request names its consumers in the packet.

| Gap | Required supplier work |
| --- | --- |
| G1 | D3 and H.2/H.3 common-carrier global typing: flat marked charts, holomorphic Hodge bundles, actual geometric cohomology, natural evaluation, relative comparison, and kernels/orthogonal summands as subvariations. |
| G2 | SF.2/SF.4/SF.5 coherent KS, cup/contraction, normal and divisor connecting maps, and the natural extension/Chern-class equality with the stated signs. |
| G3 | General fixed-involution manifolds with tangent identifications and real-analytic charts, proper Morse exhaustion/handle-to-CW theory, and the ordinary integral cellular/relative-duality/Gysin adapters. |
| G4 | Exact high-degree Voisin proof suppliers: symmetric determinantal nodes, Grassmannian Koszul/Bott vanishing, uniform position, Macaulay multiplication, and Jacobian/residue kernel identifications. |
| G5 | The real equivariant integral Lefschetz `(1,1)` refinement of MC.7, together with its independently read proof source; a consumer must supply an actual equivariant integral lift. |

The ten supplier requests go to `ShimuraData:D3`, `ComplexComparisonPartII:C1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `MotivesAndAlgebraicCycles:MC.7`, and three upstream stages. Their full upstream ids are:

- `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group`, extended by the proposed Geometric topology Part II fixed-locus and Morse interfaces;
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`;
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Exact existing nodes are imported where they suffice. In particular MC.7's complex integral `(1,1)` known case is an existing supplier, while the real refinement is an extension request. The current GeometricTopology layer's general manifold scope alone does not assert the fixed-tangent or Morse-handle theorem: the Part II proposal and G3 retain that difference. G4 also records the precise general inputs for which no exact supplier node has been identified, rather than claiming that a broad moduli stage already contains them.

The suggested file contains the six local definitions, all twenty-eight API items, all twenty-four definition tests, and explicitly typed linear and analytic ingredients. The global geometric theorem names are retained in its G1–G5 omission ledger until the common geometric types and natural maps exist. For example, composition of three arbitrary onto linear maps does not assert the normal-boundary factorization; an onto derivative of an arbitrary map does not assert the geometric Green criterion. The packet and this document state those full targets with their actual hypotheses. No proposition placeholder is used to conceal a missing hypothesis.

## Source provenance and corrections

The packet records the five public source versions, SHA-256 hashes, access date 8 October 2026 and precise reading extents. Locators throughout this document refer to the versions below. The mathematical development above is organized by the interfaces and dependencies, and states results in its own words.

- **B19:** Olivier Benoist, *The period-index problem for real surfaces*, Publications Mathématiques de l’IHÉS 130 (2019), 63–110, [published PDF](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf). The complete relevant arguments are §1, pp.69–72, including Lemmas 1.3–1.4 and Theorem 1.5; §3.2, Proposition 3.2, pp.78–79; the generic map/normal-factorization passage of §5.1–5.2, pp.84–90; and §6.2, Proposition 6.6 and proof, pp.93–95. The application-specific surface construction and period-index theorem are not reconstructed here.
- **B18:** Olivier Benoist, *Sums of three squares and Noether–Lefschetz loci*, Compositio Mathematica 154 (2018), 1048–1065, [author-hosted typeset copy](https://www.math.ens.psl.eu/~benoist/articles/NLsquares.pdf). The complete abstract real-variation proofs are §1.1–1.2, Propositions 1.1–1.3 and Remarks 1.4–1.5, pp.1050–1052; the generic normal-boundary proof is §2.1, Proposition 2.1 and Corollary 2.2, pp.1053–1054.
- **V06:** Claire Voisin, *On integral Hodge classes on uniruled or Calabi–Yau threefolds*, [author preprint](https://webusers.imj-prg.fr/~claire.voisin/Articlesweb/inthodge.pdf), corresponding to Advanced Studies in Pure Mathematics 45 (2006), 43–73, DOI 10.2969/aspm/04510043. The author PDF's own pagination is used: §1, pp.3–5; all of the required uniruled/rank argument in §2, pp.7–18; §3, Propositions 8–9, pp.19–21; and the appendix vanishing arguments, pp.22–23. These supporting arguments were read in full. The published chapter was not obtained, so no preprint locator or correction is attributed to the version of record. The Calabi–Yau result is outside H.8.
- **G68:** Phillip A. Griffiths, *Periods of integrals on algebraic manifolds, II: Local study of the period mapping*, American Journal of Mathematics 90 (1968), 805–865, [IAS-hosted scan](https://publications.ias.edu/sites/default/files/periodsofintegralII68.pdf). The local KS and derivative argument in II.1$a$, pp.809–815, including Proposition (1.20) and Theorem (1.23), was read with its supporting proof.
- **M63:** John Milnor, *Morse Theory*, Annals of Mathematics Studies 51 (1963), [public university-hosted scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf). The complete §7 arguments for Theorem 7.2, Corollary 7.3 and Theorem 7.4, pp.39–42, support the affine bound and integral weak Lefschetz route. The original Andreotti–Frankel article was not obtained; this document cites the proof actually read in Milnor and its use in Benoist. General Morse handle and integral-duality foundations remain imported suppliers.

Two source issues are recorded with locators and reasons, without source excerpts. The degree in B19, Proposition 5.4 proof, equation (5.7), p.88, is $H^1(C,N_{C/T})$, as forced by the normal connecting map, whereas the printed group is labelled in degree zero. This is the already confirmed `PAPER-BENOIST-19/E12` correction; the factorization here uses the correct degree. In V06, author preprint §2, Corollary 4(ii), p.13, the second projection bound should refer to $\mathrm{pr}_2$. The page image, the two component bounds, the proof's final sentence and Corollary 5(ii) distinguish it from the first projection bound. This finding is scoped to the author preprint: the publication endpoint did not provide the chapter, and no claim is made about its printed version.

The precise real integral `(1,1)` proof source cited through Benoist–Wittenberg/Krasnov was not obtained, and its supplier is G5. The cited general Barth, Harris, Bott, Green/Macaulay and Jacobian/residue foundations were not independently proved or read in their original publications; their exact uses in the complete Voisin proof are stated and retained as G4 supplier work. This source boundary does not remove the Voisin target or substitute a weaker whole-cohomology theorem.
