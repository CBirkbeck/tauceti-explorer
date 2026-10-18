# High-degree Abel–Jacobi descent

This is the GC.4 part of **Global function fields, reciprocity and automorphic
foundations, Part II**. Its output is the rank-one Picard local system used by
GC.5 to construct character sheaves in all degrees. It specifies the high-degree
evaluation charts, their weighted projective quotients and effective descent,
including full faithfulness and normalized uniqueness.

The companion [packet](../packets/FunctionFieldArithmeticPartII--GC.4.json)
records the dependency graph. The [suggested file](../suggested/FunctionFieldArithmeticPartII--GC.4.lean)
gives the compact native coordinate interface. This document is definitive.
Every target has implementation status **unchecked**. GC.4 is **planned**,
with the precise generic sheaf and geometric-signature leaves listed below;
elaboration of the coordinate subset does not close them.

## Conventions and the end statement

Let \(k=\mathbf F_q\) have characteristic \(p\ne2\). Let \(X/k\) be smooth,
projective and geometrically connected of genus \(g\), and let \(R\) be a
reduced finite effective divisor, possibly empty. Put

\[
 \rho=\deg_k R,\qquad
 d\ge B:=\rho+\max\{2g-1,1\},\qquad
 n=d-g+1,\qquad a=n-\rho\ge1.
\]

The degree of \(R\) includes residue-field degrees. A single degree-two
closed point contributes two geometric root coordinates. The stated bound is
sufficient; no optimality claim is made for every curve or every genus.

Write \(P_d=\operatorname{Pic}^{\sqrt R,d}_X\) for the **root Picard stack**.
Its object over \(T\) is a line bundle \(L\) on \(X_T\), a line bundle
\(K_R\) on \(R_T\), and \(\iota:K_R^{\otimes2}\simeq L|_{R_T}\),
with degree \(d\) on each geometric curve fibre. This is an Artin stack:
the scalar automorphisms are retained. It is not replaced by its Picard
scheme, by a set of isomorphism classes, or by a Jacobian with a chosen
rational point.

Let \(S_d=X_d^{\sqrt R}\) be the effective section stack. Its objects add
sections \(s\) of \(L\) and \(\alpha\) of \(K_R\), satisfying
\(s|_R=\iota(\alpha^2)\), with \(s\) nonzero on **each geometric curve
fibre**. The map \(f=AJ_d:S_d\to P_d\) forgets both sections; it is the
unrefined map in [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
§A.1.5, p. 517. The refined map retaining \(\alpha\) has a different target
and is not substituted for \(f\).

Fix \(\ell\ne p\). Use finite rank-one \(\mathcal O_E/\varpi^m\)-local
systems first, then the local adic category, inversion of \(\ell\) and finite
coefficient extensions to obtain lisse \(\overline{\mathbf Q}_\ell\)-sheaves.
Arithmetic comparisons use geometric Frobenius. The input \(L_d\) from
GC.3 is an **unshifted rank-one lisse sheaf**. Its perverse normalization on
\(S_d\) is \(L_d[d]\); that shifted complex is not the rank-one object in
the descent statement. General rank-one monodromy takes values in the
coefficient-field units; only branch inertia is restricted to order dividing
two by GC.3.

**End theorem.** For \(d\ge B\), \(f^*\) is fully faithful on rank-one
lisse sheaves, and every rank-one lisse sheaf on \(S_d\) is in its essential
image. In particular there is a rank-one \(L_d^{\mathrm{Pic}}\) and an
isomorphism \(\theta:f^*L_d^{\mathrm{Pic}}\simeq L_d\). Two pairs
\((M,\theta)\), \((M',\theta')\) descending the same input admit exactly
one comparison compatible with \(\theta,\theta'\). A bare rank-one sheaf
still has its scalar automorphisms. The comparisons are compatible with
base change, tensor operations and any given Frobenius structure.

The specific \(L_d\) statement is
[YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Lemma A.9,
pp. 520–521. The formulation for any rank-one lisse input and normalized
full faithfulness is the consequence of the family argument specified here.

## Ownership and the imported targets

The eight accepted parent GC.4 node ids are preserved. This part neither
overwrites their statements nor repeats their scalar-field theory as new
nodes. The following table accounts for every GC.4 target; the right column
identifies the family or descent interface supplied here.

| Parent node suffix in `FunctionFieldArithmeticPartII:GC.4/` | Imported result | Interface in this part |
| --- | --- | --- |
| `evaluation-surjective` | Vanishing, ranks and surjective evaluation at \(d\ge B\) | Exact family sequence and arbitrary base change |
| `affine-fibre-chart` | The fixed-object geometric two-fibre and weights | Canonical family fibre product, scheme open and nonlinear chart transitions |
| `weighted-cover` | Projective square-coordinate cover and generic sign group | Relative quotient and finite locally free cover of rank \(2^a\) |
| `weighted-ramification` | Every nontrivial intermediate sign extension ramifies | Explicit monomial argument on a weight-one affine chart |
| `weighted-simply-connected` | Trivial geometric finite étale covers of the weighted stack | Simply connected geometric fibres of the proper family quotient |
| `fibre-triviality` | Constancy of \(L_d\) on actual geometric fibres | Canonical local descent line, for any rank-one lisse input |
| `empty-ramification-descent` | Ordinary scalar/projective comparison when \(R=\varnothing\) | Weight-one branch of the same quotient and gluing construction |
| `high-degree-descent` | Picard descent and normalized comparison | Proper degree-zero base change, actual-chart full faithfulness and effective atlas gluing |

The parent end theorem is a comparison target, not a premise in its own new
proof. Its pointwise weighted-cover and ramification arguments are imported.
Their projective-space theorem is explicitly requested from IG.0 below.

Ordinary geometry stays with its owners:

- `SchemeAndStackFoundations:SF.1/two-fibre-product`, `/quotient-stack`,
  `/quotient-stack-algebraic` and `/stack-morphism-properties` supply the
  general stack constructions and descent of their morphism properties.
- `SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds` supplies the
  high-degree vanishing and locally Noetherian family base-change interface.
  `/picard-stack-curve` supplies the unpointed ordinary Picard stack.
  These are planned supplier interfaces; their partial packets are not claims
  of an implementation or of accepted closure.
- Current TauCetiRoadmap **JacobianChallenge**, Layers B/C/D, owns coherent
  Riemann–Roch, relative cohomology and base change, and ordinary Picard
  geometry. Its v1 assumes a rational point for the normalized Jacobian map;
  no such point is introduced here. SF.3 owns the unpointed extension.
- Current TauCetiRoadmap **AlgebraicVectorBundles**, Layers L0–L2, owns finite
  locally free sheaves, relative Spec, linear schemes and vector bundles.
  The notation \(V(F)\) below imports that theory and is pinned to represent
  sections of \(F\). Coherent tensor/dual operations are not lisse sheaves.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.0` owns scheme finite
  étale covers, fibre functors and the requested projective-space theorem.
  Its `/adic-local-systems` gives scheme coefficient conventions; extending
  them to these stacks remains explicit.

The reviewed library audit `AUDIT-20`, FunctionFieldArithmetic FA.0/FA.1,
already records native function fields, places, weighted divisor degree and
function-field Riemann–Roch. Those are not repeated and do not stand in for
coherent cohomology in families. At the pins, the actual
`TauCeti.AlgebraicGeometry.InvertibleSheaf` carrier and
`TauCeti.AlgebraicGeometry.Scheme.Modules.sections_surjective` theorem are
imports. The latter gives surjectivity of global sections of a short exact
sequence when the first sheaf has vanishing \(H^1\); it does not itself give
relative base change or curve vanishing.

The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The current Tau Ceti
tree at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current roadmap tree
at `0d144d044dacebca17b654695b6f1ad58f159b27` were also inspected read-only.
The two READMEs above and relevant suggested interfaces were read; all nine
post-snapshot roadmap directories were searched. Current coherent cohomology,
line-bundle duality, degree and Picard-functor work remain existing work to
import. No compatible root Picard/weighted stack/stack-lisse carrier was
located. Open Mathlib PR searches for “root stack” and “lisse” returned no
matches on 18 October 2026; a public Zulip search did not locate a usable
design. These searches do not certify absence from every discussion.

## How the family proof fits together

For a locally Noetherian test scheme \(T\) and an actual object
\(b=(L,K_R,\iota):T\to P_d\), write \(\pi:X_T\to T\) and
\(\pi_R:R_T\to T\). The imported coherent theorem gives

\[
 E=\pi_*L,\quad U=\pi_*L(-R),\quad
 G=(\pi_R)_*(L|_{R_T}),\quad H=(\pi_R)_*K_R,
 \qquad 0\longrightarrow U\longrightarrow E\longrightarrow G
 \longrightarrow0.
\]

Their ranks are \(n,a,\rho,\rho\), respectively. For the first two
bundles, the needed inequality is \(d-\rho>2g-2\).
[Stacks, Lemma 53.22.1](https://stacks.math.columbia.edu/tag/0E3A)
checks the vanishing bound; [Lemma 30.22.1 and Remark 30.22.2](https://stacks.math.columbia.edu/tag/07VJ)
supply the universal coherent base-change input. These statements concern
proper schemes with coherent base-flat coefficients, with a Noetherian
original base and arbitrary base changes. Applying them here gives a
degree-zero locally free pushforward because the fibrewise higher
cohomology vanishes. Finite étaleness of \(R_T\) gives the other two bundles.

The unsplit, canonical construction is

\[
 \widehat C_b=V(E)\times_{V(G)} V(H),\qquad
 q(\alpha)=\iota(\alpha^2),\qquad
 C_b=\widehat C_b\times_{V(E)}(V(E)\setminus0).
\]

It represents the actual two-pullback \(T\times_{P_d}S_d\), with no
compatible automorphisms left over the identity of \(b\). Split \(R_T\)
étale locally, choose frames and split evaluation by \(\sigma:G\to E\).
The chart is

\[
 (u,\alpha)\longmapsto(u+\sigma(q(\alpha)),\alpha),
 \qquad \widehat C_b\simeq\mathbf A_T^{a+\rho}.
\]

Only its section coordinate is \((u,\alpha^2)\); the chart retains
\(\alpha\). The excluded closed locus has ideal
\((u_i,\alpha_j^2)\). It has the same underlying support as the zero
section \((u_i,\alpha_j)\), so **the open complements agree**. The two
closed subschemes need not agree. Over \(\mathbf F_3[\epsilon]/\epsilon^2\),
\((0,\epsilon)\) is a nonzero tuple with zero section coordinate and is
excluded, whereas \((1,\epsilon)\) is effective and retains its nilpotent
root coordinate. A replacement by nonzero ring-valued tuples, or by a
reduced chart, fails one of these checks.

Changing the splitting to \(\sigma+t\) changes the kernel coordinate to
\(u-t(q(\alpha))\). This transition is quadratic, not a linear change of
frame. It respects the weight-two kernel/weight-one root action, and its
identity and composition laws come from differences of splittings. Thus
the punctured affine chart is used with its actual transition maps, not as
a claim of a globally split vector bundle.

For \(R\ne\varnothing\), the central scalar action on \(C_b\) is
\((s,\alpha)\mapsto(c^2s,c\alpha)\). The automorphism
\((c^2\operatorname{id}_L,c\operatorname{id}_{K_R})\) of \(b\) gives
coherent isomorphisms of its images in \(S_d\). Consequently there is a
map \(h_b:Q_b=[C_b/\mathbf G_m]\to S_d\). For empty \(R\), use the
ordinary weight-one scalar action and \(Q_b=\mathbf P(E)\), with the
convention that \(\mathbf P(E)\) parametrizes lines in \(E\).

One must distinguish the two maps out of \(Q_b\). Its projection
\(q_b:Q_b\to T\) is a proper smooth tame DM morphism. Its map to \(S_d\)
does **not** make its composite to \(P_d\) the constant object \(b\):
scalar descent twists \(L\) by the square of the scalar line and \(K_R\)
by that line. These composites become identified on \(C_b\), but that
identification does not descend to an identification on \(Q_b\). The
square with \(P_d\) used for checking descent is the square for \(C_b\),
not the square for \(Q_b\).

On a split chart with \(\rho>0\), the square-coordinate map gives

\[
 \mathbf P_T^{n-1}\longrightarrow W_T(2^a,1^\rho),
 \quad [x,y]\longmapsto[x_1^2,\ldots,x_a^2,y].
\]

It is representable finite locally free of rank \(2^a\): before taking
quotients its coordinate algebra is free on squarefree monomials in the
\(x_i\), and both sides use the same scalar group. It is not an étale
torsor under its generic sign group. This finite flat projective cover
also proves properness of the quotient: the relation is finite over the
projective cover, its map to the separated product is proper, and proper
diagonal and universal closedness descend. Smoothness follows from the
punctured affine atlas. Stabilizers are trivial if a root coordinate is
nonzero and \(\mu_2\) if all root coordinates vanish. Odd characteristic
makes this a tame DM stack.

For geometric simple connectivity, pull a connected representable finite
étale cover back to \(\mathbf P^{n-1}\).
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XI, Proposition 1.1,
recomposed p. 219 (original margin p. 285), makes that pullback trivial.
A component produces an intermediate extension of the generic
\(\mu_2^a\)-extension. A proper subgroup is killed by some nontrivial
character, indexed by a nonempty set \(I\). On a chart \(y_\rho\ne0\)
the resulting quadratic extension has
\(z^2=\prod_{i\in I}u_i\); its valuation along any included coordinate
divisor is odd, so it ramifies there. It cannot be part of an étale
cover. Thus the subgroup is the whole sign group and the cover is
trivial. This is the parent weighted-ramification argument; the ordinary
empty-\(R\) case uses projective space directly.

No simple-connectivity assertion is made for \(C_b\) itself. In
characteristic \(p\), an equation \(z^p-z=u_1\) gives a connected finite
étale Artin–Schreier cover of punctured affine space: its derivative is
\(-1\), and the pole of order one in \(u_1\) prevents splitting over the
function field. The relevant sheaf is pulled from the scalar quotient;
it is not an arbitrary lisse sheaf on a punctured affine fibre.

Now let \(F\) be any rank-one lisse sheaf on \(S_d\). Pull it to
\(F_Q=h_b^*F\) and put \(M_b=(q_b)_*F_Q\), first at finite coefficients.
[ACV01](https://arxiv.org/pdf/math/0106211v1), Appendix A, Theorem A.0.8,
preprint pp. 34–35, gives degree-zero proper base change on this proper
tame DM map. The stalk of \(M_b\) is therefore \(H^0\) of the geometric
fibre. That fibre is simply connected, so evaluation is an isomorphism

\[
 q_b^*M_b\xrightarrow{\sim}F_Q.
\]

This also proves lissity: smooth local scheme atlases of \(Q_b\) give
sections of \(q_b\) étale locally on \(T\); pull the displayed isomorphism
through these sections. Constant stalk dimension alone is not used as
a lissity criterion. The coefficient adapter constructs compatible
reductions of local integral lattices and then passes to lisse
\(\overline{\mathbf Q}_\ell\)-sheaves. It does not assume every lisse
object comes with one chosen global lattice. This generic adapter is
one of the explicit supplier leaves.

Pulling the evaluation map to the actual \(C_b\) compares \(f_b^*M_b\)
with \(F|_{C_b}\). Here \(f_b:C_b\to T\) is smooth surjective with
geometrically connected fibres. If a connected finite étale cover of
\(T\) is pulled back along \(f_b\), the resulting open surjection to that
cover has connected fibres and hence connected total space. The
finite-cover/fibre-functor equivalence gives a surjection on fundamental
groups and therefore full faithfulness of \(f_b^*\). The scheme sheaf
comparison is [Stacks, Lemma 59.65.1 and Remark 59.65.3](https://stacks.math.columbia.edu/tag/0DV4);
the stack and adic forms are exposed in the adapter.

Take a smooth locally finite type scheme atlas \(T\to P_d\). Its double
and triple overlaps can be algebraic spaces. Choose étale scheme covers
of these overlaps before applying the scheme finite-cover argument above.
The two restrictions of \(M_b\) pull back to the same sheaf on each
**actual** Abel–Jacobi checking chart. Full faithfulness gives the unique
comparison compatible with \(F\); uniqueness descends it from the scheme
refinements. On the triple overlap its cocycle holds after that faithful
pullback and hence on the overlap. Effective smooth descent for lisse
sheaves on the Artin Picard stack glues the line and comparison. The same
argument descends morphisms and all coherence diagrams. This proves the end statement without a general
nonproper-fibration homotopy or effective-descent theorem for \(AJ_d\).

## Targets, named API and discriminating tests

The following are the five new target nodes, with their full statements,
construction route, proposed API and tests. Geometric names are README
targets on actual supplier carriers. Only the coordinate definition and its
API/tests appear in the compact Lean file.

### Split quadratic section coordinates

Node: `FunctionFieldArithmeticPartII:GC.4/quadratic-section-coordinates`. Kind: definition.

For a commutative ring A and index types I,J, quadraticSection sends (u,alpha) in A^I x A^J to (u,(alpha_j^2)_j). In a split family chart I indexes the evaluation kernel and J the root coordinates. This is the section coordinate in E only: the full fibre-product chart sends (u,alpha) to ((u,alpha^2),alpha), retaining alpha. This polynomial function is neither asserted linear nor invertible.

**Hypotheses.**

- A is any commutative ring, including a nonreduced ring; I and J are arbitrary index types. Finite I,J are used for affine schemes.

**Construction or proof.**

1. Use the existing native product and function carriers and ordinary ring powers; the definition has its displayed real body.
2. The YZ19 split fibre description identifies the section coordinate with this function. Scalar equivariance follows from mul_pow; change of coefficient ring follows from map_pow.
3. For reduced A, sq_eq_zero_iff gives quadraticSection(v)=0 iff v=0. Over dual numbers this implication fails, which is why the geometric construction uses an open subscheme rather than raw nonzero ring-valued tuples.

**Uses.**

- GC.4/family-fibre-presentation: Identify the polynomial section coordinate after splitting evaluation and compute its effective open.
- YZ19, Lemma A.9, p. 521: Verify that kernel and root blocks carry weights two and one.

**Named API.**

- `TauCeti.RamifiedClassField.quadraticSection` (constructor): For v=(u,alpha), return (u,alpha^2) on the existing product of function spaces.
- `TauCeti.RamifiedClassField.quadraticSection.kernelCoordinates` (projection): The first projection of quadraticSection(v) equals u.
- `TauCeti.RamifiedClassField.quadraticSection.rootCoordinates` (simp): The jth second coordinate is alpha_j squared.
- `TauCeti.RamifiedClassField.quadraticSection.baseChange` (functoriality): For a ring homomorphism h:A->B, applying h to both coordinate blocks commutes with quadraticSection.
- `TauCeti.RamifiedClassField.quadraticSection.weighted` (compatibility): For any c in A, quadraticSection(c^2 u,c alpha)=c^2 quadraticSection(u,alpha), where the scalar on the right multiplies both output blocks.
- `TauCeti.RamifiedClassField.quadraticSection.zero_iff` (characterisation): If A is reduced, quadraticSection(v)=0 if and only if v=0; the reduced hypothesis is retained.

**Unit tests.** Each test rejects a plausible incorrect construction.

- `TauCeti.RamifiedClassField.quadraticSection.test_small` (computation): Over Z with one coordinate in each block, quadraticSection(2,3)=(2,9).
- `TauCeti.RamifiedClassField.quadraticSection.test_empty_root` (degenerate): For an empty root index Fin 0, quadraticSection(u,alpha)=(u,alpha).
- `TauCeti.RamifiedClassField.quadraticSection.test_not_injective` (non-example): Over Z with one coordinate in each block, (0,1) and (0,-1) are distinct and have the same section coordinate.
- `TauCeti.RamifiedClassField.quadraticSection.test_nilpotent` (non-example): Over DualNumber(F_3), the tuple (0,epsilon) is nonzero but quadraticSection(0,epsilon)=0.
- `TauCeti.RamifiedClassField.quadraticSection.test_effective_nilpotent` (computation): Over DualNumber(F_3), quadraticSection(1,epsilon)=(1,0); the full chart still retains epsilon in its root coordinate.

**Acceptance.**

- At I=J=Fin 1 over Z, (2,3) maps to (2,9).
- Over F_3[epsilon]/(epsilon^2), (0,epsilon) is nonzero but its section coordinate is zero.

**Direct prerequisites.** `mathlib:mul_pow`, `mathlib:map_pow`, `mathlib:sq_eq_zero_iff`, `mathlib:DualNumber`, `mathlib:DualNumber.eps_pow_two`.

**Sources.**

- [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Lemma A.9, proof, p. 521. The split evaluation description supplies the quadratic coordinate formula; the native ring formulation and nilpotent checks are its algebraic interface, not a claim that the source develops ring-valued charts.

### The family Abel–Jacobi fibre chart

Node: `FunctionFieldArithmeticPartII:GC.4/family-fibre-presentation`. Kind: construction.

For a root Picard object b=(L,K_R,iota) on X_T, with T locally Noetherian over k, put E=pi_*L, U=pi_*L(-R), G=pi_R*(L|R), H=pi_R*K_R, and q:H->G induced by alpha->iota(alpha^2). The imported high-degree vanishing yields a universally base-change-compatible exact sequence 0->U->E->G->0 of locally free sheaves of ranks a,n,rho, and H has rank rho. Define C_hat_b=V(E) x_{V(G)} V(H), with V(F) parametrizing sections of F, and C_b as the inverse image of V(E) minus its zero section. Then C_b is the actual two-pullback T x_{P_d} S_d. Etale locally on T, split R_T, choose frames and an evaluation splitting sigma; the isomorphism (u,alpha)->(u+sigma(q(alpha)),alpha) identifies C_hat_b with A_T^n and C_b with A_T^n minus the zero section as OPEN SCHEMES. These presentations and their effective opens commute with every base change T_prime->T, without a flatness or reducedness assumption on T_prime.

**Hypotheses.**

- k is a finite field of characteristic p different from 2; X/k is a smooth projective geometrically connected curve of genus g.
- R is a reduced finite effective divisor, including the empty divisor; rho=deg(R) is its length over k, not its number of closed points.
- d is an integer with d>=rho+max(2g-1,1); n=d-g+1 and a=n-rho, so a>=1.
- P_d denotes the degree-d root Picard stack of GC.0, S_d the effective root section stack of GC.1, and f=AJ_d:S_d->P_d forgets both sections. Coefficients are finite rank-one O_E/varpi^m local systems, then lisse Qbar_ell sheaves via the local adic formalism, with ell different from p.
- T is locally Noetherian over k for the coherent pushforward theorem; base changes from T may be arbitrary. No rational point on X and no global Poincare line bundle on a Picard scheme are chosen.

**Construction or proof.**

1. Import parent evaluation-surjective, SF.3/line-bundle-degree-bounds and the existing coherent sections_surjective theorem: H1(L_t(-R))=0 since d-rho>2g-2, and H1(L_t)=0. Relative coherent base change gives E,U and the exact evaluation sequence; finite etale R_T gives G,H and their arbitrary base change. The genus and ranks come from coherent Riemann–Roch.
2. Use GC.1/root-abel-jacobi and SF.1/two-fibre-product to identify the fixed-object two-pullback with the displayed section equation. An automorphism inducing the identity of b is the identity; the fibre is a scheme, not the weighted quotient.
3. Etale split R and trivialize K_R and U; frame L|R using iota. Locally split E->G. The displayed inverse is (s,alpha)->(s-sigma(q(alpha)),alpha). These are polynomial maps, with the section coordinate given by quadraticSection.
4. In these coordinates the inverse image of the zero section of E is defined by (u_i,alpha_j^2). Its radical equals that of (u_i,alpha_j), so its complement is exactly the usual punctured affine open. Do not identify the two CLOSED subschemes or discard nilpotents in the complement.
5. If sigma_prime=sigma+t for t:G->U, the transition is (u,alpha)->(u-t(q(alpha)),alpha). This quadratic transition is equivariant for weights (2,1), and the identity/composition laws follow by adding differences of splittings. The unsplit fibre product gives their canonical gluing and all base-change comparisons.

**Uses.**

- GC.4/relative-projective-quotient: Supply the canonical family carrying the scalar action and its local positive weights.
- GC.4/high-degree-effective-descent: Prove that the actual checking map C_b->T is smooth surjective with geometrically connected fibres.

**Named API.**

- `TauCeti.RamifiedClassField.abelJacobiFibre` (constructor): C_b is the two-fibre T x_{P_d} S_d, represented by the effective open in the square-evaluation fibre product.
- `TauCeti.RamifiedClassField.abelJacobiFibre.evaluationSequence` (data): Supply 0->U->E->G->0, ranks (a,n,rho), rank(H)=rho, and arbitrary base change for all four sheaves and evaluation.
- `TauCeti.RamifiedClassField.abelJacobiFibre.splitIso` (equivalence): An evaluation splitting and compatible etale frames identify C_hat_b with A_T^n by (u,alpha)->(u+sigma(q(alpha)),alpha), and restrict to C_b.
- `TauCeti.RamifiedClassField.abelJacobiFibre.effectiveOpen` (characterisation): The removed closed locus has ideal (u_i,alpha_j^2); the complement equals A_T^n minus the zero section, without identifying the closed loci.
- `TauCeti.RamifiedClassField.abelJacobiFibre.changeSplitting` (compatibility): For sigma_prime=sigma+t the coordinate transition is u_prime=u-t(q(alpha)), with alpha fixed; it respects weighted scaling.
- `TauCeti.RamifiedClassField.abelJacobiFibre.baseChange` (functoriality): The fibre product, effective open and chart comparison commute with every T_prime->T and with isomorphisms of b; the identity and composition comparisons satisfy the cocycle law.
- `TauCeti.RamifiedClassField.abelJacobiFibre.smoothConnected` (structure): C_b->T is smooth and surjective with geometrically connected fibres A^n minus the origin.

**Unit tests.** Each test rejects a plausible incorrect construction.

- `TauCeti.RamifiedClassField.abelJacobiFibre.test_minimal_elliptic` (computation): For g=1,rho=1,d=2 the chart has one kernel coordinate and one root coordinate and section coordinate (u,alpha^2).
- `TauCeti.RamifiedClassField.abelJacobiFibre.test_nilpotent_excluded` (non-example): For T=Spec F_3[epsilon]/(epsilon^2), u=0 and alpha=epsilon do not define a T-point of C_b: the global section is zero, even though (u,alpha) is a nonzero tuple.
- `TauCeti.RamifiedClassField.abelJacobiFibre.test_nilpotent_retained` (computation): On the same base, u=1 and alpha=epsilon lie in C_b, and their root coordinate remains epsilon under the chart; no reduction of the scheme is allowed.
- `TauCeti.RamifiedClassField.abelJacobiFibre.test_empty` (degenerate): If R is empty, G=H=0 and C_b=V(E) minus its zero section, the ordinary section-stack fibre over the Picard STACK.
- `TauCeti.RamifiedClassField.abelJacobiFibre.test_splitting` (compatibility): For one-dimensional G,U and t the identity, replacing sigma by sigma+t sends u to u-alpha^2. Retaining u unchanged would fail the section equation.
- `TauCeti.RamifiedClassField.abelJacobiFibre.test_residue_degree` (non-example): A single closed point of residue degree two contributes rho=2 and two geometric root coordinates; it is not counted as rho=1.

**Acceptance.**

- For g=1,rho=1,d=2, the ranks are (a,n,rho)=(1,2,1), and the split equation is s=(u,alpha^2).
- At d=2g-2+rho, L=omega_X(R) has L(-R)=omega_X and nonzero H1. The requested threshold cannot silently lose rho or replace strict vanishing by equality.
- T may have square-zero nilpotents: the effective open is tested on all geometric fibres, not by whether its raw section tuple is unequal to zero.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:GC.4/quadratic-section-coordinates`, `FunctionFieldArithmeticPartII:GC.4/evaluation-surjective`, `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi`, `FunctionFieldArithmeticPartII:GC.1/root-symmetric-space`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.3/line-bundle-degree-bounds`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.sections_surjective`.

**Sources.**

- [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Definition A.2, p. 515; §A.1.5, p. 517; Lemma A.9, pp. 520–521. Defines effectiveness by geometric fibres and the two Abel–Jacobi maps, then describes a geometric fibre by the square-evaluation equation. The node promotes that equation to families and records the scheme-theoretic open and transition maps.
- [StacksVanishing](https://stacks.math.columbia.edu/tag/0E3A), Lemma 53.22.1, tag 0E3A, Algebraic Curves §53.22 (online numbering). Nonvanishing of H1(L(-R)) forces d<=2g-2+rho, giving the strict high-degree vanishing used by the imported coherent supplier.
- [StacksBaseChange](https://stacks.math.columbia.edu/tag/07VJ), Lemma 30.22.1 and Remark 30.22.2, tag 07VJ, Cohomology of Schemes §30.22 (online numbering). A proper scheme with coherent base-flat coefficients has a perfect cohomology complex compatible with arbitrary ring maps. With fibrewise higher-cohomology vanishing it yields the locally free degree-zero pushforward used here.

### The proper scalar quotient of a family chart

Node: `FunctionFieldArithmeticPartII:GC.4/relative-projective-quotient`. Kind: construction.

For b and C_b as above, define Q_b=[C_b/G_m,T]. If rho>0 the scalar c acts by (s,alpha)->(c^2 s,c alpha); its automorphism of b is (c^2 id_L,c id_K_R). If rho=0 use the ordinary scalar c id_L and weight one on s. The map C_b->S_d is 2-equivariant for this scalar action and the trivial action on S_d, hence induces h_b:Q_b->S_d. The projection q_b:Q_b->T is proper smooth surjective with geometrically connected, geometrically simply connected tame DM fibres of dimension n-1. For rho>0 it is etale locally W(2^a,1^rho); for rho=0 it is the ordinary projective bundle parametrizing lines in E. All data are functorial in b and commute with base change. Although f h_b and b q_b agree after pullback to C_b, they are generally NOT 2-isomorphic on Q_b: the scalar descent twists the Picard object. No factorization over P_d is claimed.

**Hypotheses.**

- k is a finite field of characteristic p different from 2; X/k is a smooth projective geometrically connected curve of genus g.
- R is a reduced finite effective divisor, including the empty divisor; rho=deg(R) is its length over k, not its number of closed points.
- d is an integer with d>=rho+max(2g-1,1); n=d-g+1 and a=n-rho, so a>=1.
- P_d denotes the degree-d root Picard stack of GC.0, S_d the effective root section stack of GC.1, and f=AJ_d:S_d->P_d forgets both sections. Coefficients are finite rank-one O_E/varpi^m local systems, then lisse Qbar_ell sheaves via the local adic formalism, with ell different from p.

**Construction or proof.**

1. The scalar automorphisms of b identify each scaled section object with its original image in S_d. Their multiplication law supplies the coherent 2-equivariance needed to descend the map through the quotient; the action is intrinsic before choosing a splitting.
2. Use SF.1/quotient-stack and quotient-stack-algebraic for the quotient and its G_m torsor. By the family presentation, the local weights are (2^a,1^rho) for rho>0. For rho=0 the ordinary action yields P(E) and does not insert an artificial mu_2 stabilizer.
3. On a split nonempty-R chart the square-coordinate map from ordinary punctured A^n to weighted punctured A^n is equivariant. Before quotients it is finite free of rank 2^a, with basis the squarefree monomials in the a source kernel coordinates. Equivariance for the SAME G_m makes the descended P_T^{n-1}->Q_b representable finite locally free of that rank. It is a branched map, not a torsor under its generic sign group.
4. This finite faithfully flat cover by projective space proves properness: its relation is finite over projective space, hence proper over T and over the separated product; descend the proper diagonal and universal closedness. Smoothness follows from the punctured affine smooth atlas. Stabilizers are trivial when a root coordinate is nonzero and mu_2 on the remaining locus, so the stack is DM and tame in odd characteristic. These properties descend along the etale chart cover.
5. Import the parent weighted-cover, weighted-ramification and weighted-simply-connected nodes, with projective-space simple connectivity supplied by IG.0. A connected representable finite etale cover of a geometric Q_b pulls back trivially to projective space. A component gives an intermediate generic sign extension. Any proper subgroup admits a nonempty quadratic monomial character, ramified on a weight-one chart, a contradiction. Normality then identifies the degree-one cover with Q_b. For rho=0 use projective-space simple connectivity directly.
6. Under a quotient torsor the descended line bundle L is twisted by the square of its scalar line and K_R by that scalar line (by its inverse with the opposite torsor convention). This explains why the quotient square over P_d cannot be used as a Cartesian square. Only C_b=T x_{P_d} S_d has that property.

**Uses.**

- GC.4/chart-descent-line: Replace the nonproper chart map by a proper tame DM map for degree-zero proper base change.
- Parent GC.4/fibre-triviality: Pull any lisse input to the simply connected weighted quotient, then to the actual geometric fibre.

**Named API.**

- `TauCeti.RamifiedClassField.abelJacobiQuotient` (constructor): Form Q_b with the intrinsic central scalar action, using weight one when R is empty.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.toSections` (projection): The scalar isomorphisms give h_b:Q_b->S_d with h_b composed with C_b->Q_b equal to the original C_b->S_d up to the specified 2-isomorphism.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.localModel` (equivalence): Etale locally Q_b=W(2^a,1^rho) for rho>0; for rho=0 it is the projective bundle of lines in E.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.projectiveCover` (data): For rho>0 in a split chart, P_T^{n-1}->Q_b is representable finite locally free of rank 2^a, generically Galois with independent sign changes.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.properSmooth` (structure): q_b is proper smooth surjective tame DM with geometrically connected fibres of dimension n-1.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.geometricCovers` (characterisation): Every connected representable finite etale cover of a geometric fibre of q_b has degree one.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.baseChange` (functoriality): The intrinsic quotient and h_b commute with base change and isomorphisms of b, with identity and composition coherence.

**Unit tests.** Each test rejects a plausible incorrect construction.

- `TauCeti.RamifiedClassField.abelJacobiQuotient.test_weighted_line` (computation): At g=1,rho=1,d=2 the fibre is W(2,1); the weight-one chart is A^1 with projective cover x->x^2, ramified at x=0.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.test_inertia` (non-example): On a geometric nonempty-R fibre, a point with every alpha_j=0 and some u_i!=0 has stabilizer mu_2, while a point with some alpha_j!=0 has trivial stabilizer; replacing the stack by its coarse space fails this test.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.test_empty_elliptic` (degenerate): For g=1,R empty,d=1, E has rank one and Q_b=T=P^0_T. An all-weight-two quotient would instead have mu_2 stabilizer and is not this Q_b.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.test_picard_twist` (non-example): In a split nonempty-R chart, pulling the descended L along P^{n-1}->Q_b twists L by the square of the tautological scalar line. Thus Q_b->S_d->P_d cannot be identified with the constant object b over T.
- `TauCeti.RamifiedClassField.abelJacobiQuotient.test_finite_rank` (compatibility): For (a,rho)=(2,1), the square-coordinate cover has rank four even at the branch divisor; it is not an etale double cover.

**Acceptance.**

- For (a,rho)=(1,1), the fibre is W(2,1), with a degree-two projective cover; on y!=0 its coordinate is z=x^2 and the quadratic intermediate extension ramifies at z=0.
- Geometric simple connectivity concerns the quotient, not the positive-characteristic punctured affine fibre.
- A nonempty weight-one block is used in the monomial-chart argument; the empty-R case is separately ordinary projective space.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:GC.4/family-fibre-presentation`, `FunctionFieldArithmeticPartII:GC.4/weighted-cover`, `FunctionFieldArithmeticPartII:GC.4/weighted-ramification`, `FunctionFieldArithmeticPartII:GC.4/weighted-simply-connected`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

**Sources.**

- [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Lemma A.9, proof and simple-connectivity claim, p. 521. The source factors the fixed geometric-fibre map through a weighted scalar quotient and uses its projective square-coordinate cover and ramification. The family quotient, finite-flat rank and properness are explicit deductions here.
- [SGA1](https://arxiv.org/pdf/math/0206203v2), Expose XI, Proposition 1.1, recomposed p. 219 (original margin p. 285), arXiv v2. Projective space over an algebraically closed field has trivial etale fundamental group, including dimension zero; this is the exact scheme theorem requested from IG.0.

### The canonical local descent line

Node: `FunctionFieldArithmeticPartII:GC.4/chart-descent-line`. Kind: construction.

Let F be a rank-one lisse sheaf on S_d. For every b:T->P_d as in the family construction, set F_Q=h_b^*F on Q_b and M_b=(q_b)_*F_Q at finite coefficient level. Proper degree-zero base change and the geometric simple connectivity of Q_b give a canonical evaluation isomorphism e_b:q_b^*M_b->F_Q. M_b is lisse of rank one, and its pullback to the actual C_b is canonically F|C_b. Define the adic and Qbar_ell version by compatible local coefficient lattices and reduction, invert ell, and extend coefficients; it is independent of these presentations. Base change, isomorphisms of b, and morphisms of F give coherent comparison maps for M_b, including composition and identity laws.

**Hypotheses.**

- k is a finite field of characteristic p different from 2; X/k is a smooth projective geometrically connected curve of genus g.
- R is a reduced finite effective divisor, including the empty divisor; rho=deg(R) is its length over k, not its number of closed points.
- d is an integer with d>=rho+max(2g-1,1); n=d-g+1 and a=n-rho, so a>=1.
- P_d denotes the degree-d root Picard stack of GC.0, S_d the effective root section stack of GC.1, and f=AJ_d:S_d->P_d forgets both sections. Coefficients are finite rank-one O_E/varpi^m local systems, then lisse Qbar_ell sheaves via the local adic formalism, with ell different from p.
- F is an arbitrary rank-one lisse input on S_d; it need not be the particular symmetric local system L_d. The generic stack-lisse interfaces listed in gap GC4-LISSE-ADAPTER are required and are not claimed present in a scheme-only supplier.

**Construction or proof.**

1. Use the previous construction to obtain q_b proper smooth surjective tame DM and F_Q. At finite coefficient level apply ACV01 Theorem A.0.8 in degree zero: the stalk of (q_b)_*F_Q is H0 of its geometric fibre.
2. By the parent weighted simple-connectivity theorem (or ordinary projective simple connectivity for R empty), F_Q on a geometric fibre is constant, and evaluation of its global sections at any point is an isomorphism. Therefore the adjunction counit q_b^*(q_b)_*F_Q->F_Q is an isomorphism on all geometric stalks.
3. The smooth surjection q_b has sections etale locally after choosing a smooth scheme atlas of Q_b. Pull the counit back along such sections: M_b becomes a rank-one lisse sheaf there. This proves local constancy, instead of inferring it merely from the rank of its stalks.
4. Proper base change gives M_{b|T_prime} canonically isomorphic to the inverse image of M_b. The comparisons are the natural base-change maps and satisfy identity and composition. Pull the counit through C_b->Q_b to compare on the actual Abel–Jacobi fibre product.
5. Do the construction for finite reductions of local O_E lattices. Full faithfulness of inverse image along q_b (unit checked by the same fibre H0 calculation) forces the coefficient reductions and comparisons to be compatible; pass to the local adic category, invert ell and extend scalars. Glue different local lattices using the same full faithfulness. This coefficient/stack adapter is the explicit generic supplier gap, not an extra assumption of effective Abel–Jacobi descent.

**Uses.**

- GC.4/high-degree-effective-descent: Supply compatible rank-one local systems on a smooth Picard atlas, including their comparison with F.
- FunctionFieldArithmeticPartII:GC.5/normalized-character-universal-property: Provide the actual high-degree descent and its canonical normalization used before translating to all degrees.

**Named API.**

- `TauCeti.RamifiedClassField.abelJacobiDescentLine` (constructor): At finite coefficients M_b=(q_b)_*h_b^*F, extended by compatible local adic presentations.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.evaluation` (equivalence): The canonical counit e_b:q_b^*M_b->h_b^*F is an isomorphism.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.onFibreProduct` (compatibility): Pulling e_b along C_b->Q_b gives f_b^*M_b isomorphic to F|C_b for f_b:C_b->T.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.baseChange` (functoriality): For T_prime->T the proper base-change comparison identifies M_{b|T_prime} with the pullback of M_b and respects e_b; identity and composition commute.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.map` (functoriality): A morphism F->F_prime induces M_b(F)->M_b(F_prime); identity and composition are preserved.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.coefficients` (compatibility): Reduction of compatible integral lattices, inversion of ell and finite coefficient extension commute with the construction and its evaluation; different local lattice presentations give the same lisse Qbar_ell line.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.tensor` (compatibility): The natural tensor comparison M_b(F) tensor M_b(G)->M_b(F tensor G) is the unique isomorphism whose pullback is the tensor of the evaluation maps; it respects units, associators and symmetry.

**Unit tests.** Each test rejects a plausible incorrect construction.

- `TauCeti.RamifiedClassField.abelJacobiDescentLine.test_unit` (degenerate): The constant coefficient line on S_d gives the constant coefficient line on T, with the identity evaluation comparison.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.test_arithmetic` (non-example): For F pulled back from Spec k with geometric Frobenius zeta_3, M_b is the same arithmetic line on T; it is not forced to have Frobenius 1 or -1.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.test_square_zero_base` (compatibility): The base change from Spec F_3[epsilon]/(epsilon^2) to Spec F_3 commutes with M_b and e_b, despite not being flat.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.test_scalar` (computation): Multiplication by c in the coefficient field on F induces multiplication by c on M_b, including c=0; the construction acts on sheaf morphisms, not just isomorphism classes.
- `TauCeti.RamifiedClassField.abelJacobiDescentLine.test_empty` (compatibility): If R is empty, the construction is q_*h^*F for the ordinary projective bundle q:P(E)->T, with its ordinary evaluation comparison.

**Acceptance.**

- A geometrically constant arithmetic line with geometric Frobenius eigenvalue zeta_3 descends with eigenvalue zeta_3; geometric constancy does not force arithmetic triviality or sign-valued global monodromy.
- For a constant coefficient line on S_d, e_b is its canonical constant-line comparison.
- The construction retains rank one at every geometric point and commutes with nonflat base changes.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:GC.4/relative-projective-quotient`, `FunctionFieldArithmeticPartII:GC.3/collision-descent`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/adic-local-systems`.

**Sources.**

- [ACV01](https://arxiv.org/pdf/math/0106211v1), Appendix A, Proposition A.0.7 and Theorem A.0.8, preprint pp. 34–35. Theorem A.0.8 gives proper base change for torsion sheaves on a tame DM stack over a scheme. Only degree zero is used. The lisse evaluation and local adic construction are the corollary proved in this node, not assertions quoted from the source.
- [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Lemma A.9, p. 521. The geometric weighted quotient supplies the simply connected fibres; the present construction makes the effective family descent step explicit.

### Effective high-degree Abel–Jacobi descent

Node: `FunctionFieldArithmeticPartII:GC.4/high-degree-effective-descent`. Kind: theorem.

At d>=rho+max(2g-1,1), inverse image along f=AJ_d:S_d->P_d is fully faithful on rank-one lisse Qbar_ell sheaves and every rank-one lisse sheaf F on S_d is in its essential image. In particular there is a rank-one L_d^Pic with a comparison theta:f^*L_d^Pic isomorphic to the unshifted symmetric rank-one L_d from GC.3. Given two pairs (M,theta),(M_prime,theta_prime) for the same F, there is exactly one isomorphism M->M_prime whose pullback intertwines the two comparisons. This uniqueness is for the normalized pair, not for the underlying sheaf with its scalar automorphisms. Descent, comparisons, tensor operations and any supplied geometric-Frobenius structure are compatible with base change over k. The empty-R branch uses ordinary projective quotients.

**Hypotheses.**

- k is a finite field of characteristic p different from 2; X/k is a smooth projective geometrically connected curve of genus g.
- R is a reduced finite effective divisor, including the empty divisor; rho=deg(R) is its length over k, not its number of closed points.
- d is an integer with d>=rho+max(2g-1,1); n=d-g+1 and a=n-rho, so a>=1.
- P_d denotes the degree-d root Picard stack of GC.0, S_d the effective root section stack of GC.1, and f=AJ_d:S_d->P_d forgets both sections. Coefficients are finite rank-one O_E/varpi^m local systems, then lisse Qbar_ell sheaves via the local adic formalism, with ell different from p.

**Construction or proof.**

1. For each smooth locally finite type scheme atlas T->P_d, construct M_b and its comparison using chart-descent-line. This uses a proper DM map Q_b->T, not properness or a homotopy exact sequence for the nonproper AJ_d.
2. By family-fibre-presentation, the actual f_b:C_b->T is smooth surjective with geometrically connected fibres. Pulling back any connected finite etale cover of connected T leaves a connected space: the projection to that cover is an open surjection with connected geometric fibres. The finite-cover/fibre-functor comparison therefore gives a surjection on pi1, so f_b^* is fully faithful on finite locally constant sheaves. The local adic formalism gives the same full faithfulness for rank-one lisse sheaves.
3. The double and triple overlaps of the scheme atlas over the Artin stack P_d may be algebraic spaces. Choose etale scheme covers of these overlaps and apply the preceding scheme-chart full-faithfulness argument after each refinement. On the double overlap the two M_b pull back to the same F on its actual Abel–Jacobi fibre product, so this supplies the unique overlap isomorphism compatible with those comparisons. Uniqueness makes these isomorphisms descend from the refinements. On the triple overlap the cocycle holds because its pullback holds. Effective smooth descent for lisse sheaves glues M and theta on P_d; no scheme fundamental-group statement is applied directly to an algebraic stack or algebraic space.
4. Check arbitrary morphisms on the atlas and its overlaps by the same full faithfulness; this proves full faithfulness globally and normalized uniqueness. It also identifies this construction with parent high-degree-descent for the specific symmetric L_d, without assuming that parent end theorem to prove itself.
5. Apply the comparisons to tensor products, units and any Frobenius pullback; uniqueness makes their coherence diagrams descend. Carry out the same argument using P(E) when R is empty.

**Acceptance.**

- For g=1,R empty,d=1 the local quotient is P^0, while the actual fibre is G_m; the theorem descends to the Picard stack, not an assumed chosen Picard-scheme point.
- For g=0 and rho=2, the stated source threshold is d>=3; it is a sufficient bound and no assertion of sharpness or descent below it is made.
- A scalar automorphism c of M changes theta unless c=1. The normalized pair has only its identity automorphism, but a bare rank-one sheaf retains its coefficient-field scalars.
- The source L_d is unshifted and lisse. The perverse normalization would be L_d[d] on S_d, not the object in this rank-one descent statement.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:GC.4/family-fibre-presentation`, `FunctionFieldArithmeticPartII:GC.4/chart-descent-line`, `FunctionFieldArithmeticPartII:GC.0/root-picard`, `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi`, `FunctionFieldArithmeticPartII:GC.3/collision-descent`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

**Sources.**

- [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Lemma A.7, pp. 519–520; Lemma A.9, pp. 520–521. A.7 supplies the unshifted rank-one symmetric local system and A.9 gives its high-degree Picard descent. The all-rank-one essential-image and normalized full-faithfulness formulation follows from the explicit family quotient argument here.
- [ACV01](https://arxiv.org/pdf/math/0106211v1), Appendix A, Theorem A.0.8, preprint pp. 34–35. Degree-zero proper base change is the extra generic input making the quotient construction an effective descent proof.
- [StacksLisse](https://stacks.math.columbia.edu/tag/0DV4), Lemma 59.65.1 and Remark 59.65.3, tag 0DV4, Etale Cohomology §59.65 (online numbering). For connected schemes finite locally constant coefficient sheaves are representations of the etale fundamental group, compatibly with inverse image. This is used only on the actual scheme charts C_b->T; extending the sheaf formalism to the Picard stack is separately exposed.

## Worked acceptance cases

1. **Small ramified fibre.** For \(g=1,\rho=1,d=2\), one has
   \(n=2,a=1\), the actual fibre is \(\mathbf A^2\setminus0\), and its
   proper quotient is \(W(2,1)\). On the root-coordinate-nonzero chart,
   \([x:y]\mapsto[x^2:y]\) becomes \(x/y\mapsto(x/y)^2\), a finite
   flat double cover ramified at zero. At the point with zero root
   coordinate the quotient retains its \(\mu_2\) stabilizer.
2. **Small unramified fibre.** For \(g=1,R=\varnothing,d=1\), the actual
   fibre is \(\mathbf G_m\), while its ordinary scalar quotient is
   \(\mathbf P^0\). It is this quotient, with ordinary weight one, that
   supplies the proper descent chart. The Picard stack still retains
   its scalar automorphisms.
3. **The bound and residue degrees.** For a degree-two closed point in
   \(R\), evaluation has a rank-two restriction bundle after base
   change, even though the support has only one closed point. At
   \(d=2g-2+\rho\), choosing \(L=\omega_X(R)\) gives
   \(H^1(L(-R))=H^1(\omega_X)\ne0\). For a genus-one curve with a
   rational \(R\), this is \(d=1\), and evaluation fails to be
   surjective. Conversely \(g=0,\rho=2,d=3\) satisfies the source bound;
   no claim that it is the optimal bound is imposed.
4. **Arithmetic normalization.** A constant geometric line with
   geometric-Frobenius eigenvalue a primitive cube root of unity
   descends with that eigenvalue. Geometric constancy does not turn
   arbitrary global monodromy into signs. If \(\theta\) is rescaled,
   the unique comparison of normalized descent pairs compensates
   by the matching scalar. Bare sheaf automorphisms are not erased.

## Supplier leaves and closure

There is one request:

- **GC4-PROJECTIVE-PI1**, to
  `InverseGaloisAndArithmeticFundamentalGroups:IG.0`: the exact export
  \(\pi_1^{\mathrm{et}}(\mathbf P^m_K)=1\) for every \(m\ge0\) over an
  algebraically closed field, in arbitrary characteristic. Its source is
  SGA 1, Exposé XI, Proposition 1.1, recomposed p. 219 / original p. 285.
  IG.0 scheme finite covers and adic conventions are imports. Its
  scheme statements are not silently used as statements about stacks.

Two gaps remain explicit:

- **GC4-LISSE-ADAPTER.** Supply actual stack sites and the generic finite
  locally constant/representable finite-cover comparison; degree-zero
  proper base change for a proper tame DM stack over a scheme; detection
  of local constancy and effective sheaf descent on smooth covers;
  inverse image, Hom and tensor; compatible coefficient reductions and
  local adic lattice presentations. The Picard stack is Artin even
  though the proper quotient family is DM. ACV01 gives the torsion
  proper-base-change statement; its transfer to the chosen formal
  stack-lisse and adic interfaces is required. A scheme-only EDC or IG
  target does not discharge it. The root-specific construction and
  atlas gluing belong to GC.4. The proposed **EtaleDualityAndPerverseSheaves,
  Part II: Stacks** extension owns the generic adapter; it is not a
  registered stage dependency in this packet.
- **GC4-GEOMETRIC-SIGNATURES.** Instantiate the actual SF.1/SF.3 family
  and stack carriers, their scheme opens and morphisms, and the lisse
  interfaces. Then state the named geometric API and tests above on
  those carriers and elaborate them. The compact file has one genuine
  native definition, five API lemmas and five examples. It does not
  create arbitrary carriers or property bundles for the missing
  geometry. Its omission ledger identifies each construction and the
  end theorem precisely.

Thus this is a **complete planning pass** with GC.4 **planned**, not
closed. Every original target is imported and has an explicit refinement
or checking route. The parent `ST-LISSE` leaf is narrowed to the generic
adapter just stated: this proof does not require an unspecified
nonproper-fibration descent theorem. The accepted GC.5 consumer must
import the reviewed effective result and update its inherited
nonproper-fibration requirement accordingly; it does not build another
high-degree descent theory.

## Sources, versions and verification

All statements and proof routes are authored mathematical descriptions;
source locators identify the results used. No source text is reproduced.
The extra family/proper-quotient argument is a deduction using the cited
results, rather than a claim that YZ19 states every interface in this part.
No new source misprint or false statement was established in the passages
read, so `sourceIssues` is empty. The parent corrections to the unshifted
lisse normalization and arbitrary rank-one character convention are
respected; no new erratum claim is made from expanding the descent proof.

- **YZ19**: Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Annals of Mathematics 189 (2019), 393–526; author-hosted published copy. [Source](https://math.mit.edu/~zyun/GZW_ramified_published.pdf). Read 2026-10-18: Appendix A.1 definitions and Abel–Jacobi maps, pp. 514–517; Appendix A.2.1, Lemmas A.7–A.9 and their proofs, pp. 519–521; A.2.2 opening and the high-degree input to Lemma A.10, pp. 521–522. SHA-256 `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
- **ACV01**: Dan Abramovich, Alessio Corti and Angelo Vistoli, *Twisted bundles and admissible covers*, arXiv:math/0106211v1, 25 June 2001; locators use the 36-page preprint, not the 2003 journal pagination. [Source](https://arxiv.org/pdf/math/0106211v1). Read 2026-10-18: Appendix A, introductory site convention, p. 33; Proposition A.0.7 and Theorem A.0.8 with proof, pp. 34–35. SHA-256 `8c890d5355ddeb77ab1ccb18fe15f1a89c0d666904920ea6ff4ba95ed02b6ca1`.
- **SGA1**: Alexander Grothendieck and collaborators; updated edition with Michel Raynaud, *Revetements etales et groupe fondamental (SGA 1)*, Recomposed annotated edition, arXiv:math/0206203v2, 4 January 2004. [Source](https://arxiv.org/pdf/math/0206203v2). Read 2026-10-18: Expose XI §1, Proposition 1.1 and its two proofs, recomposed p. 219, original margin p. 285. SHA-256 `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c`.
- **StacksVanishing**: The Stacks Project Authors, *Algebraic Curves: More vanishing results*, Online tags read 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/0E3A). Read 2026-10-18: Lemma 53.22.1 and proof; online section/theorem numbering replaces page numbering. SHA-256 `babef1f7f3842828ca7559097dcef5d9e0b3e97c9300d8283f8a3f1a0a1bbf8b`.
- **StacksBaseChange**: The Stacks Project Authors, *Cohomology of Schemes: Cohomology and base change, III*, Online tags read 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/07VJ). Read 2026-10-18: Lemma 30.22.1, its proof and Remark 30.22.2; online section/theorem numbering replaces page numbering. SHA-256 `7c4b71eb78f816e2e4467faf628819b4276c65a46ad7168076f5368e072d5f8d`.
- **StacksLisse**: The Stacks Project Authors, *Etale Cohomology: Locally constant sheaves and the fundamental group*, Online tags read 18 October 2026. [Source](https://stacks.math.columbia.edu/tag/0DV4). Read 2026-10-18: Lemma 59.65.1 with proof and Remark 59.65.3; online section/theorem numbering replaces page numbering. SHA-256 `b5798205e731db7758c74e3b69cd04545d180a729be288bd2f143f2b2ffcf3ef`.

The seven baseline declarations are listed with exact modules and statement
checks in the packet. Their statements were read at the pins, and the full
names resolve in the baseline index. The compact suggested file elaborated
using `lean-check` at the shared pinned build, with only ten admission
warnings. The real-bodied definition is not an admitted construction.
The packet checker reports zero errors and zero warnings. These checks
validate the blueprint format and native signatures; the geometric leaves
above remain requirements of the plan.
