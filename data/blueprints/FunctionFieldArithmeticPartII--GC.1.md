# Root divisors and Abel–Jacobi maps

This is the GC.1 layer of **Global function fields, reciprocity and automorphic foundations, Part II**. It specifies the geometry used by ramified symmetric local systems, root-Picard descent and the hat coefficient pullbacks: root symmetric powers, their local charts and coarse spaces, ordered addition, and the refined and unrefined Abel–Jacobi maps.

The objects are imported from the [accepted parent blueprint](../packets/FunctionFieldArithmeticPartII.json), whose GC.1 node ids remain authoritative. The [companion packet](../packets/FunctionFieldArithmeticPartII--GC.1.json) gives new ids for the refinements below and records every direct prerequisite. Names in this document are in `TauCeti.RamifiedClassField` unless qualified. The geometry is a specification; the compact [suggested file](../suggested/FunctionFieldArithmeticPartII--GC.1.lean) contains only the coordinate statements expressible over existing library carriers.

## Conventions and ownership

Let $k$ be a finite field of characteristic different from $2$, let $X/k$ be a smooth projective geometrically connected curve, and let $R\hookrightarrow X$ be a reduced finite effective divisor, possibly empty. Write $\rho=\deg R$. The finite scheme $R$ is étale over $k$; after a separable splitting extension it consists of $\rho$ geometric points. The number of closed points over $k$ is not the index for a split product. All degree indices in this layer are natural numbers. Picard-stack degrees imported from GC.0 range over the integers.

For every $k$-scheme $T$, write $X_T=X\times_kT$ and $R_T=R\times_kT$. Test schemes and coefficient algebras may be nonreduced. A product of stacks over a stack means a two-fibre product, retaining its comparison isomorphism. Morphisms between line-bundle objects here are isomorphisms. Pullback comparisons carry identity and composition coherence. No rational point of $X$ is chosen, and no coefficient local system is needed in this layer.

Ordinary relative effective Cartier divisors, their symmetric schemes and universal divisors belong to **JacobianChallenge, Layer C**, with the section-stack and no-basepoint adapters in `SchemeAndStackFoundations:SF.3`. Ordinary Picard stacks belong to **JacobianChallenge, Layer D** and `SF.3/picard-stack-curve`. The pointed v1 Jacobian goal does not by itself supply the no-basepoint degree torsors. General coherent tensor products and pullbacks are imported from **AlgebraicVectorBundles, L0A–L0B**. Generic root charts and their invariant calculation belong to Part II `RS.1`; the two root-Picard stacks belong to `GC.0`. This layer applies those constructions to branch evaluation on symmetric powers.

The native `WeilDivisor.EffectiveDivisorOfDegree` and its comparison with `Sym` concern formal divisors on a type. They provide a geometric-point reconciliation test, not a relative symmetric scheme. Native `InvertibleSheaf` has module maps as morphisms; its core supplies isomorphisms, but is not itself a Picard-stack carrier. The current upstream roadmaps and library were checked as well as the pinned baseline; none of these ordinary constructions is redefined here.

## Imported objects and their usable interfaces

### Root symmetric powers

The declaration `rootSymmetricPower`, imported from `FunctionFieldArithmeticPartII:GC.1/root-symmetric-space`, has hat groupoid $\widehat{\mathcal X}_d(T)$ with objects
$$
(L,K_R,\iota,a,\alpha),\qquad
\iota:K_R^{\otimes2}\xrightarrow{\sim}L|_{R_T},\qquad
\iota(\alpha^{\otimes2})=a|_{R_T}.
$$
Here $L$ is an invertible sheaf on $X_T$ of degree $d$ on each geometric fibre, $K_R$ is an invertible sheaf on $R_T$, and $a,\alpha$ are sections on those respective spaces. An arrow to the primed tuple is a pair of isomorphisms $u:L\to L'$, $v:K_R\to K'_R$ satisfying
$$
u(a)=a',\qquad v(\alpha)=\alpha',\qquad
\iota'\circ v^{\otimes2}=u|_{R_T}\circ\iota.
$$
The effective open $\mathcal X_d$ requires $a$ to be nonzero on **each geometric fibre**. Its divisor gives the coarse map $c_d:\mathcal X_d\to\operatorname{Sym}^dX$. The open $U_d$ is the inverse image of $\operatorname{Sym}^d(X\setminus R)$. Hat objects admit $a=0$. A global section that is nonzero as an element can still be zero on every geometric fibre.

This object supports the ordered-map pushforwards in GC.3, the Abel–Jacobi descent in GC.4, and the hat pullbacks in GC.5. Its source locator is Yun–Zhang, Definition A.2, printed p. 515, and A.1.3, pp. 515–516, with the two inherited source corrections recorded below.

The imported API and tests retain their parent names:

| Name | API contract |
| --- | --- |
| `rootSymmetricPower.hatObject` | Construct a hat object from the five data and the restriction equation. |
| `rootSymmetricPower.effectiveOpen` | The open X_d consists exactly of sections nonzero on every geometric fibre. |
| `rootSymmetricPower.forgetRoot` | Forgetting the root line and section maps to the ordinary degree-d section space. |
| `rootSymmetricPower.awayFromR` | On divisors disjoint from R the root-forgetting map is an equivalence. |

| Name | Unit test |
| --- | --- |
| `rootSymmetricPower.test_d_zero` | At d=0 the effective space is Spec k; the section nowhere vanishes. |
| `rootSymmetricPower.test_empty_R` | At R=∅ the effective space is Sym^d X. |
| `rootSymmetricPower.test_closed_fibre` | Over a divisor containing a branch point the full fibre has the nilpotent root chart, rather than only Bμ₂. |
| `rootSymmetricPower.test_hat_zero` | The hat degree-d space admits a=0 and α_R=0 for any root-Picard object in that degree. |

### Addition and ordered divisors

The imported `rootAddition` (`GC.1/root-addition`) sends two tuples to
$$
(L\otimes L',\ K_R\otimes K'_R,\ \iota\otimes\iota',\ a\otimes a',\ \alpha\otimes\alpha'),
$$
using the canonical rearrangement of the tensor factors in the power isomorphism. It is defined on both hat spaces and restricts to $\mathcal X_d\times\mathcal X_e\to\mathcal X_{d+e}$. Products of nonzero sections on each integral geometric curve fibre are nonzero. It also defines effective-divisor translation on the hat space. The degree-zero unit has both line bundles trivial and both sections $1$. General tensor associators, symmetry and units are imported, and their compatibility with the root equation is part of the contract.

The imported `orderedRootDivisors` (`GC.1/ordered-divisors`) is the iterated sum
$$
p_d:(\mathcal X_1)^d\longrightarrow\mathcal X_d.
$$
The empty sum is the unit and $p_1$ is the identity. Permutations of the ordered factors come with coherent isomorphisms over the target. This map is used to form symmetric direct images in GC.3; its coherence is required before any symmetric-group invariant operation. Yun–Zhang A.1.4, (A.2)–(A.3), printed p. 517, is the source for these operations. Their coordinate and inertia refinements appear below.

The imported API and tests retain their parent names:

| Name | API contract |
| --- | --- |
| `rootAddition.object` | Root addition tensors line bundles and multiplies sections. |
| `rootAddition.unit` | Adding the degree-zero unit object gives the original divisor. |
| `rootAddition.coherence` | Associativity and symmetry are the imported coherent tensor isomorphisms, with the same section equations. |

| Name | Unit test |
| --- | --- |
| `rootAddition.test_empty` | Adding two empty divisors gives the empty divisor. |
| `rootAddition.test_ordinary` | At R=∅ this is ordinary symmetric-power addition. |
| `rootAddition.test_branch_section` | Two zero root-section values multiply to zero, rather than cancel or become nonzero. |

The imported API and tests retain their parent names:

| Name | API contract |
| --- | --- |
| `orderedRootDivisors.one` | p_1 is the identity. |
| `orderedRootDivisors.permutation` | Every σ∈S_d acts on the source and p_d is equivariant with coherent target isomorphisms. |
| `orderedRootDivisors.blockAddition` | Concatenating ordered tuples agrees with root addition after their separate p_d maps. |

| Name | Unit test |
| --- | --- |
| `orderedRootDivisors.test_zero` | p_0 maps the point to the empty root divisor. |
| `orderedRootDivisors.test_one` | p_1 is identity on the root curve. |
| `orderedRootDivisors.test_collision` | p_2 is not representable at two equal branch points: its relative inertia contains diagonal μ₂. |

### The four Abel–Jacobi maps

The imported `rootAbelJacobi` (`GC.1/root-abel-jacobi`) takes values in the **stacks** from `GC.0/root-picard` and `GC.0/root-picard-section`. Write them as $\mathcal P_d$ and $\mathcal P_d^{\mathrm{sec}}$. Their objects are respectively $(L,K_R,\iota)$ and $(L,K_R,\iota,\alpha)$. The latter does not require that $\iota(\alpha^2)$ lift to a global section on $X_T$.

There are two hat maps and their two effective restrictions:
$$
\widehat{AJ}_d:\widehat{\mathcal X}_d\to\mathcal P_d,
\qquad
\widehat{AJ}^{\mathrm{sec}}_d:\widehat{\mathcal X}_d\to\mathcal P_d^{\mathrm{sec}},
\qquad
AJ_d,\ AJ_d^{\mathrm{sec}}\text{ on }\mathcal X_d.
$$
The first forgets $a,\alpha$, while the refined map forgets only $a$. Their arrows are the corresponding forgetful operations on actual isomorphisms. They feed the unrefined high-degree geometry of GC.4 and the hat character pullbacks of GC.5. Yun–Zhang A.1.5, printed p. 517, gives both hat maps. For empty $R$, their effective versions are the ordinary degree-$d$ Abel map to the Picard stack; composition to its Picard sheaf is the usual map to $\mathrm{Pic}^d$. This specifies the stack/sheaf distinction in the inherited empty-branch test.

The imported API and tests retain their parent names:

| Name | API contract |
| --- | --- |
| `rootAbelJacobi.hat` | The hat map forgets both sections and retains the two root line bundles and ι. |
| `rootAbelJacobi.refined` | The refined map forgets a and retains α_R. |
| `rootAbelJacobi.addition` | AJ_{d+e}∘add≅mult∘(AJ_d×AJ_e). |

| Name | Unit test |
| --- | --- |
| `rootAbelJacobi.test_empty_R` | At R=∅ the effective map is the ordinary Abel–Jacobi map to Pic^d. |
| `rootAbelJacobi.test_zero` | At d=0 the effective point maps to the tensor unit. |
| `rootAbelJacobi.test_hat_zero` | A zero global section still has a defined hatAJ image. |

## Targets and checks

Every target below has the standing hypotheses above. Statements over an algebraic closure $K$ also specify the test-scheme functor over $K$; they are not assertions only about $K$-points. Local geometric charts descend through a finite separable splitting of $R$. Each displayed declaration refines the parent node or nodes named in the packet's `targetCoverage` table.

### 1. Relative evaluation and its chosen two-pullback equivalence

Target: `relativeEvaluationEquivalence`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`.

Let $\mathcal H_d(T)$ be the ordinary groupoid of degree-$d$ invertible sheaves with section on $X_T$. Let $\mathcal A_R(T)$ be the groupoid of invertible sheaves with section on $R_T$. Restriction gives $\mathrm{ev}_R:\mathcal H_d\to\mathcal A_R$; squaring gives $\theta_2(K,\alpha)=(K^{\otimes2},\alpha^{\otimes2})$. Construct
$$
\texttt{relativeEvaluationEquivalence}:\quad
\widehat{\mathcal X}_d\simeq
\mathcal H_d\mathbin{\times_{\mathcal A_R,\theta_2}}\mathcal A_R.
$$
Its object map is $(L,K_R,\iota,a,\alpha)\mapsto((L,a),(K_R,\alpha),\iota)$; its arrow equation is exactly the three equations in the imported definition. The inverse reconstructs the five data. Unit and counit have identity components. The equivalence is pseudonatural for **every** $T'\to T$, with its identity and composition modifications.

The restriction stack has the presentation $[\operatorname{Res}_{R/k}\mathbb A^1/\operatorname{Res}_{R/k}\mathbb G_m]$. After splitting $R$ this is a product of $\rho$ copies of $[\mathbb A^1/\mathbb G_m]$; the comparison respects the Galois permutation of the geometric points. A two-pullback of sets would discard the root isomorphism and the automorphisms and fails this target.

Uses: `YZ19 Lemma A.4, pp. 516–517` pull back ordinary evaluation to obtain root symmetric geometry. `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi` retain the two different forgetful maps on arbitrary test schemes.

Construction / proof check:

1. Use the ordinary section stack from SF.3 and the finite-etale restriction contract GC1-RESTRICTION; restriction of invertible sheaves and sections gives ev_R, without any assertion that a pushforward on X is locally free.
2. Apply the SF.1 two-fibre-product construction. The specified isomorphism between the two restricted section objects is exactly iota with iota$\alpha squared$=a restricted to R.
3. Check the two arrow compatibility equations before constructing the inverse functor. Unit and counit are componentwise identities under the chosen two-pullback model.
4. Use imported coherent sheaf pullback (upstream AlgebraicVectorBundles L0A–L0B) to give the pseudonaturality modifications. Verify their equations on L, K, both sections and iota.
5. Split the finite etale k-scheme R and use Galois descent to recover the unsplit comparison.

| Name | API contract |
| --- | --- |
| `relativeEvaluationEquivalence.object` | The forward functor sends a root tuple to its two section objects and iota, preserving a=0. |
| `relativeEvaluationEquivalence.arrow` | An arrow is exactly a pair $u,v$ satisfying the section and square-isomorphism equations in the statement. |
| `relativeEvaluationEquivalence.inverse` | The inverse functor recovers the five pieces of root data, including the specified power isomorphism. |
| `relativeEvaluationEquivalence.unitCounit` | The unit and counit have identity components on all root data; their triangle equations hold. |
| `relativeEvaluationEquivalence.baseChange` | For every T prime→T the pullback comparison is a natural isomorphism; identity and composition comparisons obey the pseudofunctor coherence equations. |
| `relativeEvaluationEquivalence.splitBranch` | After a splitting field extension the restriction stack is the product over all geometric points of R, and the equivalence is Galois equivariant. |

| Name | Unit test |
| --- | --- |
| `relativeEvaluationEquivalence.test_empty_R` | For R empty, A_R is terminal and the equivalence reduces to the ordinary section stack H_d, including zero sections. |
| `relativeEvaluationEquivalence.test_zero` | For d=0, trivial L and K and iota=1, the tuple a=0, alpha=0 exists in the hat stack and maps to the zero-section object. |
| `relativeEvaluationEquivalence.test_nilpotent` | For d=0 over T=Spec k[epsilon]/epsilon squared with R nonempty, trivial lines, iota=1, a=0 and alpha=epsilon is a hat object. It maps to alpha=0 after reduction, and is not isomorphic to that zero-root-section object over T. |
| `relativeEvaluationEquivalence.test_arrow` | Over an algebraically closed field, d=0, a=alpha=0 and trivial lines, automorphisms are v in $G_m$^rho and u in G_m satisfying v_x squared=u for every x. The comparison preserves this group, not only its set of isomorphism classes. |

Acceptance checks:

- The specified iota and all automorphisms survive the equivalence.
- The construction is natural for a map killing a nonzero nilpotent root section.

Upstream imports: `UPSTREAM:AlgebraicVectorBundles:L0A`, `UPSTREAM:AlgebraicVectorBundles:L0B`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-symmetric-space`, `FunctionFieldArithmeticPartII:GC.1/evaluation-pullback`, `SchemeAndStackFoundations:SF.3/universal-section-stack`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `SchemeAndStackFoundations:SF.1`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Definition A.2, p. 515, and diagram (A.1), p. 516. The moduli data and evaluation square determine the functor; the arrow and coherence formulas here spell out the relative equivalence. [Algebraic vector bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md), Layers L0A–L0B (unpaginated README and Suggested.lean). General tensor and pullback coherence is an import, not a second construction here.

### 2. The relative effective open and nilpotent sections

Target: `rootEffectiveOpen_baseChange`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/effective-open-base-change`.

The theorem `rootEffectiveOpen_baseChange` identifies the effective locus of a hat family over $T$ with the inverse image of the ordinary fibrewise-nonzero section open. This locus is open and its formation commutes with every $T'\to T$. The associated zero divisor on $X_T$ is a relative effective Cartier divisor finite locally free of degree $d$. There is no independent nonvanishing condition on $\alpha$.

At degree zero a fibrewise-nonzero section trivializes $L$; the root equation makes $\alpha$ a trivialization of $K_R$. The effective space is therefore $\operatorname{Spec}k$, including its automorphisms. The hat space is larger: over $k[\epsilon]/(\epsilon^3)$, the trivial lines with $a=\epsilon^2$, $\alpha=\epsilon$, $\iota=1$ form a degree-zero hat object with empty effective locus. The section $a$ is nevertheless nonzero in its section module. Fibrewise vanishing and factoring through a chosen zero-section substack are separate conditions for such test schemes.

Construction / proof check:

1. Use the fibrewise-nonzero open and its relative Cartier-divisor comparison in SF.3/universal-section-stack. The exact section-functor restriction adapter is GC1-CURVE-FAMILY.
2. Pull back that open along the two-pullback projection. Fibrewise nonzeroness is unchanged by residue-field extension, giving arbitrary base-change compatibility.
3. Use the relative divisor dictionary of upstream JacobianChallenge C and Stacks Lemma 44.3.1 to obtain finite locally free degree d.
4. In degree zero, a nonzero-on-fibres section trivializes L. Its restriction is a unit, so alpha trivializes K as well, leaving the unit object with trivial automorphisms.

Acceptance checks:

- Over k[epsilon]/epsilon cubed take trivial lines, a=epsilon squared and alpha=epsilon. This is a hat degree-zero family, has empty effective locus, and has a nonzero global section.
- For R empty the effective open is the imported Sym^d X.

Upstream imports: `UPSTREAM:JacobianChallenge:C`, `UPSTREAM:JacobianChallenge:D`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`, `FunctionFieldArithmeticPartII:GC.1/root-symmetric-space`, `SchemeAndStackFoundations:SF.3/universal-section-stack`, `SchemeAndStackFoundations:SF.3`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Definition A.2, p. 515. The effective condition concerns the global section on every geometric fibre, while the hat object allows zero sections. [Moduli of divisors on smooth curves](https://stacks.math.columbia.edu/tag/0B9C), Section 44.3, Lemma 44.3.1 (HTML, no page numbering). For a proper smooth curve, relative effective Cartier divisors of finite degree are finite locally free over the base.

### 3. Scheme-theoretic incidence residuals

Target: `incidenceResidualEquivalence`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/incidence-residual-equivalence`.

Over an algebraic closure $K$, let $D_x\subset\operatorname{Sym}^dX_K$ be the **scheme-theoretic** zero locus of the universal divisor section evaluated at $x\in R_K$. For a set $I$ of distinct such points and $r=|I|\le d$, construct
$$
\texttt{incidenceResidualEquivalence}:\quad
\operatorname{Sym}^{d-r}X_K\xrightarrow{\sim}\bigcap_{x\in I}D_x,
\qquad E\longmapsto E+\sum_{x\in I}x.
$$
The inverse subtracts the relative Cartier subdivisor $E_I\times T$. A $T$-point of the intersection means precisely that $E_I\times T\subset D$ as closed subschemes of $X_T$; reducing the incidence ideals first is not permitted. Residual subtraction is natural for arbitrary $T$ and obeys the nesting identity for disjoint sets of points. When $r>d$, the intersection is empty. Thus every nonempty intersection is smooth of dimension $d-r$ and codimension $r$.

At $D=2x$ the single incidence divisor $D_x$ is smooth: removing $x$ leaves $x$. The multiplicity two has not introduced another distinct branch equation. This is the geometric input that prevents a spurious singularity in the root symmetric power at repeated branch support.

Uses: `YZ19 Lemma A.4, pp. 516–517` produces transverse incidence divisors for smooth evaluation. `FunctionFieldArithmeticPartII:GC.1/root-normal-crossing-chart` provides independent local equations for the branch divisors.

Construction / proof check:

1. Use the universal relative divisor from the ordinary symmetric-power supplier. Its restriction at x vanishes scheme-theoretically exactly when the graph x times T is contained in the divisor.
2. The graphs for distinct x are disjoint Cartier divisors, so joint containment is containment of E_I times T. Apply residual subtraction for relative effective Cartier divisors (Stacks Lemma 44.3.3).
3. Subtracting E_I and adding it back are inverse natural transformations of represented functors, including on nonreduced T; apply Yoneda.
4. Negative residual degree is impossible on any geometric fibre. Smoothness and the dimension d-r follow from ordinary symmetric powers, not a tangent-space calculation on geometric points alone.

| Name | API contract |
| --- | --- |
| `incidenceResidualEquivalence.forward` | Add the fixed divisor E_I to the universal degree-$d-r$ divisor. |
| `incidenceResidualEquivalence.inverse` | Take the unique relative Cartier residual D minus E_I; its degree is d-r. |
| `incidenceResidualEquivalence.universalDivisor` | Under the comparison, the pulled-back universal divisor equals the residual universal divisor plus E_I times the parameter scheme. |
| `incidenceResidualEquivalence.baseChange` | Residual subtraction and the scheme isomorphism commute with every base change of the test scheme, with identity and composition laws. |
| `incidenceResidualEquivalence.nesting` | For disjoint I and J, removing I then J agrees with removing their union under the canonical degree identifications. |

| Name | Unit test |
| --- | --- |
| `incidenceResidualEquivalence.test_empty` | For I empty the comparison is the identity of Sym^d X. |
| `incidenceResidualEquivalence.test_degree_one` | For d=1 and I={x}, the incidence scheme is the point x, identified with Sym^0 X. |
| `incidenceResidualEquivalence.test_excess` | For d=1 and I={x,y}, x different from y, the intersection is empty, rather than a point of a fictitious negative symmetric power. |
| `incidenceResidualEquivalence.test_double` | For d=2 and I={x}, the residual of the divisor 2x is x; D_x is smooth at 2x. Repeated multiplicity at one branch is not a second incidence equation. |

Acceptance checks:

- The defining ideal is the sum of incidence ideals, rather than its radical.
- For d=2, I={x,y} with x different from y, the intersection is the reduced point x+y; at 2x the single divisor D_x is smooth.

Upstream imports: `UPSTREAM:JacobianChallenge:C`, `UPSTREAM:JacobianChallenge:D`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/incidence-transversality`, `SchemeAndStackFoundations:SF.3/universal-section-stack`, `SchemeAndStackFoundations:SF.3`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Proof of Lemma A.4, pp. 516–517, incidence intersections. The proof uses residual addition to identify simultaneous branch incidence with a smaller symmetric power. [Moduli of divisors on smooth curves](https://stacks.math.columbia.edu/tag/0B9C), Lemmas 44.3.2–44.3.4 and Proposition 44.3.6 (HTML, unpaginated). Relative divisor addition and subtraction give the arbitrary-base functorial inverse and the needed dimension statement.

### 4. The frame atlas and its differential

Target: `evaluationAtlas_differential`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/evaluation-atlas-differential`.

For `evaluationAtlas_differential`, let $Z$ be a smooth finite-type $K$-scheme and let $r$ invertible sheaves with sections define $f:Z\to[\mathbb A^r/\mathbb G_m^r]$. The pullback of the quotient atlas is the product of frame torsors $E\to Z$. In local frames its map to affine space has coordinates
$$
F_i=\lambda_i f_i,\qquad dF_i=\lambda_i\,df_i+f_i\,d\lambda_i.
$$
At $z$, put $I=\{i:f_i(z)=0\}$. Vertical frame directions supply the coordinates outside $I$; the remaining differential is surjective exactly when $(df_i(z))_{i\in I}$ is independent. A change of frame multiplies each of these zero-coordinate covectors by a unit. Consequently the classifying map is smooth exactly when every scheme-theoretic vanishing intersection is smooth of the expected codimension at its points. Empty intersections impose no condition. For incidence divisors the preceding residual equivalence supplies these intersections, so evaluation is smooth in every degree. No invertibility of $d!$ is used.

This assertion uses the cotangent criterion for a map between smooth schemes and its extension to prescribed étale coordinates. Smoothness of $Z$ alone does not make arbitrary evaluation sections transverse. For example, the pair ((z,z)) on $\mathbb A^1$ has dependent differentials at zero, and (z^2) has zero differential there in odd characteristic. A nowhere-zero section instead obtains its coordinate from a frame direction.

Construction / proof check:

1. Pull back the quotient atlas by taking the product of frame torsors, not the finite root cover A^r→A^r.
2. Compute dF_i=lambda_i df_i+f_i d lambda_i. For i outside I the vertical frame direction supplies that coordinate independently. For i in I the remaining rank is exactly that of df_i.
3. Apply the prescribed-function smooth-coordinate criterion GC1-SMOOTH-COORDINATES. Independence is equivalent to a smooth complete intersection of the expected codimension at every stratum.
4. Use incidenceResidualEquivalence to supply the required smooth scheme-theoretic intersections.

Acceptance checks:

- For Z=A1, two equal sections both given by z fail surjectivity at zero: the two covectors coincide.
- For Z=A1 and a section z squared, smoothness fails at zero in odd characteristic.
- A nowhere-vanishing section has empty zero divisor and its frame direction contributes full rank.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/evaluation-smooth-criterion`, `FunctionFieldArithmeticPartII:GC.1/incidence-residual-equivalence`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.0`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Claim in the proof of Lemma A.4(1), p. 516, and its application on pp. 516–517. The smoothness claim is a criterion for the classifying map. The explicit frame-torsor differential supplies its atlas-level content.

### 5. Smooth quotient charts for root symmetric powers

Target: `rootNormalCrossingChart`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/root-normal-crossing-chart`.

For `rootNormalCrossingChart`, fix $D\in\operatorname{Sym}^dX_K$ and $I=R_K\cap\operatorname{supp}D$. Choose an étale neighbourhood $V=\operatorname{Spec}A$ of $D$ avoiding all other incidence divisors. The incidence equations $f_x$, $x\in I$, extend to étale coordinates on $V$. Then
$$
\mathcal X_d\times_{\operatorname{Sym}^dX}V\simeq
[\operatorname{Spec}B/\mu_2^I],\qquad
B=A[t_x:x\in I]/(t_x^2-f_x:x\in I).
$$
The sign in the $x$-factor changes $t_x$ alone. Root data for the other incidence sections are trivialized by their nowhere-zero root sections. The scheme $\operatorname{Spec}B$ is étale over affine $d$-space with coordinates $t_x$ and the remaining coordinates of $V$. It is smooth of dimension $d$. Since $2$ is invertible, the quotient atlas is finite étale and surjective. The resulting stack is smooth, separated and Deligne–Mumford of dimension $d$.

The étale-coordinate argument replaces $f_x$ by (t_x^2) through base change; it does not require the derivative of squaring at $t_x=0$ to be invertible. At $D=2x$ there is one root variable and one sign factor. The degree-one case is the root curve, and empty $R$ gives the ordinary symmetric scheme. These conclusions concern the effective open; the whole hat stack is not asserted smooth in every degree.

Construction / proof check:

1. After splitting R, identify the effective evaluation pullback with simultaneous square roots of the incidence line bundles and sections.
2. Use the residual and differential comparisons with GC1-SMOOTH-COORDINATES to choose the f_x as part of etale coordinates on V. Invert the incidence sections not vanishing at D; their root sections trivialize their root data.
3. Apply the inherited root affine-chart and base-change contracts in each remaining coordinate. The result is the stated independent sign action, not an S_d quotient of root curves.
4. Spec B is etale over affine d-space with coordinates (t_x, remaining coordinates), by base change of the etale coordinate map for V. Thus its smoothness does not require the derivative of t_x squared to be a unit.
5. Since 2 is invertible, the finite sign group is etale; its torsor atlas is etale. Finite diagonal and separatedness follow from the finite quotient charts and the separated ordinary coarse scheme; descend the presentation along the finite separable splitting extension.

Acceptance checks:

- At d=1 this is the root curve with its square-root chart at each point of R.
- At D=2x with x in R there is one root coordinate and one sign factor, regardless of multiplicity two.
- At R empty the chart is an ordinary smooth symmetric-power chart.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`, `FunctionFieldArithmeticPartII:GC.1/effective-open-base-change`, `FunctionFieldArithmeticPartII:GC.1/incidence-residual-equivalence`, `FunctionFieldArithmeticPartII:GC.1/evaluation-atlas-differential`, `FunctionFieldArithmeticPartII:RS.1/affine-chart`, `FunctionFieldArithmeticPartII:RS.1/base-change`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.0`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), Diagram (A.1), p. 516, and Lemma A.4, pp. 516–517. The root evaluation square and the smooth incidence criterion give smooth DM root symmetric powers; the displayed rings specify the local presentation.

### 6. Invariant coordinates and the proper coarse map

Target: `rootCoarseChart`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/root-coarse-chart`.

The theorem `rootCoarseChart` identifies $B^{\mu_2^I}$ with $A$ in the preceding chart. Expand in the monic squarefree basis $\prod_x t_x^{e_x}$, $e_x\in\{0,1\}$. The inverse on invariants takes the constant coefficient. Apply the parent `RS.1/affine-invariants` calculation successively in the independent variables; this generic invariant theorem is imported, not rebuilt here. The coefficient identification remains valid after every $A\to A'$, including nonflat changes.

These chart maps glue and descend to $c_d:\mathcal X_d\to\operatorname{Sym}^dX$, with the universal property for maps to algebraic spaces and the bijection on geometric isomorphism classes. The map is proper and becomes an equivalence over $\operatorname{Sym}^d(X\setminus R)$. Both coarse formation and its universal property commute with arbitrary base change on the symmetric scheme. Properness follows locally from the finite atlas over the coarse chart, finite diagonal, finite type and universal closedness. It does not assert that $c_d$ is representable.

Construction / proof check:

1. Import the generic finite-root invariant calculation from RS.1/coarse-space, iterating in the independent root coordinates. The monic squarefree basis has one coefficient in each sign character; only the constant character survives.
2. Use SF.1/finite-quotient-coarse on the finite constant sign group after splitting R. The constant coefficient calculation identifies its invariant scheme with V and gives arbitrary base change directly, including for nonreduced coefficients.
3. The atlas Spec B→[Spec B/Gamma] is finite etale surjective and Spec B→Spec A is finite. The quotient has proper diagonal (finite isomorphism spaces); it is of finite type and universally closed because its atlas is finite over A. Apply GC1-PERMANENCE to obtain properness.
4. Descend the charts, the universal property and the point bijection. When the universal divisor avoids R, every root section is a unit and trivializes its root line, giving the equivalence.

Acceptance checks:

- At a point meeting one branch, the invariant algebra of K[t]/t squared is K although the full fibre stack is nonreduced.
- Coarse formation remains correct after A→A/I for an arbitrary ideal I; no flatness assumption is added.
- The map to the coarse scheme is not asserted representable.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-normal-crossing-chart`, `FunctionFieldArithmeticPartII:GC.1/root-symmetric-coarse`, `FunctionFieldArithmeticPartII:RS.1/coarse-space`, `SchemeAndStackFoundations:SF.1/finite-quotient-coarse`, `SchemeAndStackFoundations:SF.1/tame-local-structure`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1`, `FunctionFieldArithmeticPartII:RS.1/affine-invariants`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.3, pp. 515–516, and Lemma A.4(2), p. 517. The coarse symmetric scheme follows from the evaluation root construction. The full fibre is read with the inherited nilpotent correction. [Proper morphisms of algebraic stacks](https://stacks.math.columbia.edu/tag/0CL4), Definition 101.37.1 and Lemmas 101.37.2–101.37.3 (HTML, unpaginated). Properness is a stack-morphism property separate from representability; base change and composition preserve it.

### 7. Full branch fibres and their inertia

Target: `rootFullFibre_inertia`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/full-fibre-inertia`.

The theorem `rootFullFibre_inertia` computes, for a fixed geometric divisor $D$, the full fibre of $c_d$:
$$
\mathcal X_d\times_{\operatorname{Sym}^dX}\operatorname{Spec}K
\simeq
\left[\operatorname{Spec}\frac{K[t_x:x\in I]}{(t_x^2:x\in I)}\bigg/\mu_2^I\right],
\qquad I=R_K\cap\operatorname{supp}D.
$$
Its reduction is $B(\mu_2^I)$; its geometric inertia is $\mu_2^I$. Distinct branches contribute factors, irrespective of their multiplicities in $D$. For empty $I$ the fibre is $\operatorname{Spec}K$. This equivalence retains the full functor on nonreduced $K$-schemes. For one branch the test $t=\epsilon$ over $K[\epsilon]/(\epsilon^2)$ is not isomorphic to $t=0$.

Thus $2x$ at a branch has inertia $\mu_2$, while $x+y$ at distinct branches has inertia $\mu_2^2$. This fibre statement applies the inherited correction E2: the classifying stack describes the reduction, rather than the full fibre.

Construction / proof check:

1. Base change the local root chart by the geometric coarse point. Every incident f_x becomes zero; the other root factors have already been trivialized by units.
2. Retain the quotient of the full tensor product of dual-number algebras. Reduction replaces every t_x by zero, giving the classifying stack.
3. At the geometric object all root sections vanish, so each sign independently preserves the root data. Multiplicity changes the coarse divisor but does not repeat an incidence coordinate.

Acceptance checks:

- For d=2 and D=2x at one branch, the geometric inertia is mu_2 and the full fibre is the one-variable nilpotent quotient, not B$\mu_2 squared$.
- Over K[epsilon]/epsilon squared the section t=epsilon is a valid fibre object and is not identified with t=0 by a sign.
- For d=2 and D=x+y at two distinct branches the full fibre has two independent nilpotent coordinates and inertia mu_2 squared.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-normal-crossing-chart`, `FunctionFieldArithmeticPartII:GC.1/root-coarse-chart`, `FunctionFieldArithmeticPartII:RS.1/closed-fibre`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.3, pp. 515–516, read with source issue E2; diagram (A.1), p. 516. The evaluation square determines the full nilpotent fibre; the classifying-stack description applies to its reduction. [Native roots of unity and their group-scheme points](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Scheme.lean), Mathlib rootsOfUnity and Tau Ceti RootsOfUnityGroup.schemePointsMulEquiv at the recorded pins (unpaginated Lean sources). The group factors are genuine mu_2 evaluated on all coefficient algebras, not a replacement by two geometric signs.

### 8. The equivariant coordinate map for root addition

Target: `rootAdditionChart`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/addition-chart-map`.

The construction `rootAdditionChart` describes addition after pulling back and trivializing the two incidence lines at one branch. For any commutative coefficient algebra $A$ and $f,g\in A$, use
$$
C=A[u]/(u^2-fg),\qquad
B=A[s,t]/(s^2-f,t^2-g).
$$
The coefficient map is the identity on $A$, and $u\mapsto st$ defines $C\to B$. It is equivariant for $\mu_2^2\to\mu_2$, $(\epsilon,\eta)\mapsto\epsilon\eta$. The identity ((st)^2=fg) gives the required root equation over nonreduced algebras as well. Take one copy at each branch; changes of trivialization are precisely the coherent tensor maps of the imported `rootAddition`. These maps glue on hat and effective spaces, commute with arbitrary base change and give the actual chart map of that operation.

This chart is used in the inertia product and ordered block comparisons, and in the Abel–Jacobi addition square. For $f=g=0$, the element $st$ is nonzero in (K[s,t]/(s^2,t^2)) although its square is zero. Replacing this ring by its reduction would erase a value of the construction.

Uses: `FunctionFieldArithmeticPartII:GC.1/ordered-divisors` identifies the inertia homomorphism of an iterated ordered sum. `FunctionFieldArithmeticPartII:GC.3/symmetric-multiplicativity` provides the actual addition correspondence and its associative and symmetric comparisons. `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi` matches root addition with Picard tensor multiplication.

Construction / proof check:

1. The relation $st$ squared=fg gives the quotient-ring lift. General polynomial-quotient lifts and tensor products are imported, not separate theory targets.
2. On all test A-algebras the sign action sends st to (zeta eta)st. This gives an equivariant scheme morphism in the opposite direction and then the quotient-stack morphism.
3. The universal ordinary divisor of a sum is the sum of divisors, so in compatible frames its section is the product fg; compare the root data component by component using relativeEvaluationEquivalence.
4. Pullback and the tensor coherence isomorphisms give arbitrary-base naturality and the unit, block and permutation comparisons. Their equality is checked on the root line, the section and its square identification.

| Name | API contract |
| --- | --- |
| `rootAdditionChart.coefficient` | The algebra map is the identity on the coefficient image A. |
| `rootAdditionChart.root` | The target root coordinate u pulls back to st; its square relation pulls back to $st$ squared=fg. |
| `rootAdditionChart.equivariance` | The quotient map is equivariant for (zeta,eta) mapped to zeta eta, on every coefficient algebra. |
| `rootAdditionChart.baseChange` | The ring map, group homomorphism and quotient morphism commute with arbitrary A→A prime and obey identity and composition laws. |
| `rootAdditionChart.globalCompatibility` | On overlaps the coordinate morphisms agree with parent rootAddition through the tensor associator, symmetry and unit; they therefore descend to its global morphism. |

| Name | Unit test |
| --- | --- |
| `rootAdditionChart.test_unit` | For the effective degree-zero unit, f=1 and its chosen root s=1; the formula u=st gives u=t. |
| `rootAdditionChart.test_zero` | For f=g=0 over a field, the tensor root coordinate st in K[s,t]/(s squared,t squared) is nonzero and square-zero. Multiplying the sections does not discard this infinitesimal root. |
| `rootAdditionChart.test_signs` | The pair of signs $-1,-1$ sends st to itself; either single minus sign sends it to -st. |
| `rootAdditionChart.test_ordinary` | For R empty the global quotient comparison is ordinary divisor addition, and on geometric formal divisors it agrees with Tau Ceti EffectiveDivisorOfDegree.add via equivSym_add. |

Acceptance checks:

- This map is defined even when f or g is zero or nilpotent.
- For two ordered factors supported at the same branch, the induced stabilizer map is multiplication, with a nontrivial diagonal kernel in odd characteristic.

Upstream imports: `UPSTREAM:AlgebraicVectorBundles:L0A`, `UPSTREAM:AlgebraicVectorBundles:L0B`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-addition`, `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`, `FunctionFieldArithmeticPartII:RS.1/affine-chart`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `mathlib:rootsOfUnity`, `mathlib:restrictRootsOfUnity`, `tauceti:TauCeti.AlgebraicGeometry.WeilDivisor.EffectiveDivisorOfDegree.equivSym_add`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.4, formula (A.2), p. 517. Root addition tensors the two root lines and multiplies their sections; the local algebra and sign formulas are its coordinate expression. [Algebraic vector bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md), L0A–L0B (unpaginated). Tensor associativity, symmetry, units and pullback coherence have an existing upstream owner.

### 9. Inertia of the ordered divisor morphism

Target: `orderedInertia`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/ordered-inertia-comparison`.

Let a geometric ordered tuple have multiplicity $m_x$ at each branch $x$ in its coarse divisor. The theorem `orderedInertia` identifies the actual source-to-target inertia homomorphism of $p_d$ with the blockwise products
$$
\prod_{x:m_x>0}\mu_2^{m_x}\longrightarrow\prod_{x:m_x>0}\mu_2,
\qquad (\zeta_{x,j})\longmapsto(\prod_j\zeta_{x,j})_x.
$$
This is an identification of group schemes, evaluated naturally on all commutative test algebras. For a block of size $m=n+1$, dropping coordinate zero gives
$$
\ker(\mu_2^{n+1}\to\mu_2)\simeq\mu_2^n;
$$
the inverse inserts $(\prod_{j=1}^n\zeta_j)^{-1}$ in coordinate zero. This coordinate isomorphism is natural in the test algebra. Under a permutation it is compatible with the coordinate map that omits the transported distinguished index. If coordinate zero stays distinguished, use the induced action obtained by conjugating through this isomorphism. For three factors, the kernel tuple is $((\zeta\eta)^{-1},\zeta,\eta)$, so swapping factors zero and one acts on the two retained coordinates by $(\zeta,\eta)\mapsto((\zeta\eta)^{-1},\eta)$. It is not the transposition of the two retained coordinates. The multiplication map and its kernel are themselves canonical under every reindexing. The full kernel is the product of these kernels. A branch occurring once contributes a trivial kernel; a repeated branch contributes $\mu_2^{m_x-1}$. There is no branch factor at multiplicity zero.

At a double branch collision the diagonal $\mu_2$ is relative inertia, so $p_2$ is not representable there. At repeated support away from $R$ there is no sign inertia. The criterion in terms of the $m_x$ characterizes injectivity on these geometric stabilizers, not a replacement for the full morphism-property interface. The character-triviality consequence belongs to `GC.3/collision-kernel` and is imported by its consumers.

The suggested file uses the native finite product of `Pi.evalMonoidHom`, native `rootsOfUnity 2 B`, and `restrictRootsOfUnity` for algebra changes. Its kernel, algebra-change and reindexing theorems are coordinate consequences of this geometric target. The existing `RootsOfUnityGroup.schemePointsMulEquiv` connects them to actual group-scheme points. No new model of $\mu_2$ is introduced.

Construction / proof check:

1. Use the coordinate addition comparison to show that each branch sign acts on the output root line by the product of all signs over that branch. The output has one inertia factor per distinct branch by rootFullFibre_inertia.
2. The fibre automorphism group is the kernel of this actual inertia homomorphism; separated branch factors give a product of kernels.
3. In native rootsOfUnity the kernel coordinate formula and its inverse are finite-product identities in a commutative group. Natural algebra change follows from restrictRootsOfUnity and map_prod, and agrees with the existing schemePointsMulEquiv comparison.
4. Finite products are invariant under reindexing. A permutation transports the omitted index with the other factors; fixing that index instead gives the conjugated action just computed.
5. For m at least two the element with -1 in two coordinates and 1 elsewhere is a nonidentity kernel point. A morphism representable by algebraic spaces has injective maps of geometric stabilizers, so it cannot have this kernel.

Acceptance checks:

- For d=0 both source and target inertia are trivial, and for d=1 each inertia map is the identity.
- At two equal branch points the source has mu_2 squared, the target has mu_2, and the relative kernel is diagonal mu_2.
- At a double collision away from R both inertia groups are trivial; any symmetric-group ramification of the coarse ordered map is a different phenomenon.
- No invertibility of d! is used, including when the characteristic divides d!.
- With three factors and omitted coordinate zero, swapping factors zero and one sends $(\zeta,\eta)$ to $((\zeta\eta)^{-1},\eta)$ in the retained coordinates.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/ordered-divisors`, `FunctionFieldArithmeticPartII:GC.1/addition-chart-map`, `FunctionFieldArithmeticPartII:GC.1/full-fibre-inertia`, `mathlib:rootsOfUnity`, `mathlib:restrictRootsOfUnity`, `mathlib:Pi.evalMonoidHom`, `mathlib:MonoidHom.finsetProd_apply`, `mathlib:map_prod`, `tauceti:TauCeti.RootsOfUnityGroup.schemePointsMulEquiv`, `tauceti:TauCeti.RootsOfUnityGroup.schemePointsMulEquiv_mapValue`, `SchemeAndStackFoundations:SF.1/representable-stack-morphism`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.4, (A.3), p. 517; proof of Lemma A.7, pp. 519–520. The ordered sum and its local multiplication homomorphism identify the geometric inertia. The kernel character-triviality conclusion remains owned by GC.3/collision-kernel. [Native roots of unity and their group-scheme points](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Scheme.lean), Pinned rootsOfUnity, finite-product API, schemePointsMulEquiv and schemePointsMulEquiv_mapValue (unpaginated). These existing carriers give the algebra-valued kernel-coordinate statements and their native group-scheme agreement.

### 10. Geometric two-fibres of ordered divisors

Target: `orderedGeometricFibre`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/ordered-geometric-fibres`.

The theorem `orderedGeometricFibre` computes the two-fibre of $p_d$ over a fixed geometric **object** $y\in\mathcal X_d(K)$, with coarse divisor $D=\sum_zm_z z$. Its underlying points are the orderings of this multiset, so their number is
$$
\frac{d!}{\prod_zm_z!}.
$$
After a choice of a lift and comparison isomorphism for each ordering $q$, its reduced two-fibre is the disjoint union of $B K_q$, where
$$
K_q=\prod_{x\in R_K,\ m_x>0}\ker(\mu_2^{m_x}\to\mu_2).
$$
Surjectivity of the block products makes the possible comparison isomorphisms a single orbit for each ordering. The kernel is its stabilizer. Finite ordinary ordering fibres and finite local root charts give a finite-type zero-dimensional DM fibre. Its reduced singleton components are residual gerbes; a chosen object neutralizes each. The description of the reduction does not identify the full two-fibre with it.

For a discriminating calculation take $X=\mathbb P^1$, $R=\{0\}$, $d=2$, $D=2\cdot0$. Let (x_1=s^2), (x_2=t^2). The target root chart has coordinates $c_1=x_1+x_2$ and $u$, with (u^2=x_1x_2). Addition sends $c_1\mapsto s^2+t^2$, $u\mapsto st$. Fixing the target root object gives the **full** two-fibre
$$
\left[\operatorname{Spec}\frac{K[s,t]}{(s^2+t^2,st)}\bigg/\mu_2\right],
$$
where the remaining kernel acts by $(s,t)\mapsto(-s,-t)$. Its reduction is $B\mu_2$, while $s,t$ remain nonzero nilpotents in the full ring.

These fibres supply the field-fibre check for the parent's `GC.1/ordered-proper`: $p_d$ is proper and quasi-finite in the nonrepresentable stack sense. The source is proper over $k$ by the degree-one coarse chart; the target is separated, so Stacks Lemma 101.37.5(2) gives properness. The map is quasi-DM, locally of finite type and has discrete geometric two-fibres; it is quasi-compact by properness. Stacks Definitions 101.23.2 and 101.24.1 give quasi-finiteness. The properties persist under arbitrary base change. On the multiplicity-free locus avoiding $R$ it is the ordinary finite étale $S_d$-torsor. The constant group scheme $S_d$ is étale even when the characteristic divides $d!$.

Construction / proof check:

1. The coarse ordered map X^d→Sym^d X is finite locally free (Stacks Proposition 44.3.6), and its geometric points are precisely the orderings of the multiset D. Each geometric root-curve point over a fixed coarse point is unique up to isomorphism.
2. At each ordering q, orderedInertia identifies the source-to-target inertia map. It is surjective: the product map has at least one factor over every branch occurring in D. Thus the set of isomorphisms from p_d$q$ to y modulo source automorphisms is a singleton. The fibre stabilizer is the stated kernel. Local root charts are finite over ordinary divisor charts; after fixing y the remaining root-isomorphism choices are finite too. Together with the finite ordinary ordering fibre this gives a finite-type zero-dimensional DM two-fibre, without assuming the parent proper quasi-finite conclusion.
3. A finite-type zero-dimensional DM stack over an algebraically closed field with finitely many points has reduction a disjoint union of its residual gerbes. The chosen lifts neutralize them. This exact residual-gerbe fact is included in GC1-PERMANENCE; it gives the displayed reduced-fibre description without erasing nilpotent directions in the full fibre.
4. For parent ordered-proper, rootCoarseChart in degree one makes the source proper over k, and the target is separated. Apply Stacks Lemma 101.37.5(2). The map is quasi-DM and locally of finite type, has the discrete fibres just computed, and is quasi-compact by properness. Apply Definitions 101.23.2 and 101.24.1. These properties commute with arbitrary base change.
5. Away from R on the multiplicity-free locus the same map is the ordinary finite etale S_d-torsor of orderings. Constant S_d is etale even when the characteristic divides d!, so no factorial-invertibility hypothesis is used.

Acceptance checks:

- For d=0 the two-fibre is Spec K, and for d=1 it is Spec K because p_1 is the identity.
- For d=2 and D=x+y with x different from y, there are two fibre points and both relative stabilizers are trivial, including when x or y is a branch point.
- For X=P1, R={0}, d=2 and D=2 times 0, local coordinates give the full two-fibre [Spec K[s,t]/(s squared+t squared,st)/mu_2], with diagonal sign action. Its reduction is Bmu_2; the full fibre retains s and t as nonzero nilpotents.
- At a double collision away from R the reduction is one point with trivial inertia; the ordinary ordering fibre can still be nonreduced.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/ordered-divisors`, `FunctionFieldArithmeticPartII:GC.1/root-coarse-chart`, `FunctionFieldArithmeticPartII:GC.1/ordered-inertia-comparison`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3/universal-section-stack`, `SchemeAndStackFoundations:SF.3`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.4, (A.3), p. 517; A.2.1, p. 519. The source uses the ordered map for pushforward. The explicit stack property convention here preserves its nonrepresentable collision behaviour. [Proper morphisms of algebraic stacks](https://stacks.math.columbia.edu/tag/0CL4), Lemma 101.37.5(2) and Lemmas 101.37.2–101.37.3 (HTML, unpaginated). A morphism from a proper stack to a separated stack over the same base is proper; base changes preserve it. [Locally quasi-finite and quasi-finite morphisms of algebraic stacks](https://stacks.math.columbia.edu/tag/06PT), Definition 101.23.2 and Definition 101.24.1 (HTML, unpaginated; latter in tag 0G2L). Quasi-finiteness for stacks includes quasi-DM and the discrete two-fibre condition; representability is not part of this definition. [Moduli of divisors on smooth curves](https://stacks.math.columbia.edu/tag/0B9C), Proposition 44.3.6 and its proof (HTML, unpaginated). The coarse ordering morphism is finite locally free of degree d!, in every characteristic. [Reduced singleton Deligne–Mumford stacks](https://stacks.math.columbia.edu/tag/06MC), Lemma 101.21.4, with its quotient-groupoid proof; Lemma 101.31.2 (HTML, unpaginated). A reduced singleton DM stack has an etale field atlas. Over the algebraically closed field in this finite-type situation, a chosen object identifies the singleton component with its automorphism classifying stack.

### 11. Coherence of ordered sums

Target: `orderedDivisors_coherence`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/ordered-block-permutation-coherence`.

The theorem `orderedDivisors_coherence` supplies a specified $S_d$-invariance isomorphism for every permutation of the factors of $p_d$, with the group-action composition law. For two blocks it supplies
$$
p_{d+e}\simeq\operatorname{add}_{d,e}\circ(p_d\times p_e)
$$
after the canonical regrouping of the source factors. The comparisons commute with arbitrary base change, three-block reassociation, and permutations inside and between the blocks. They use the same tensor unit, associator and symmetry as `rootAddition`. In particular $p_0$ is its unit map and $p_1$ its identity, with no auxiliary choice of a point of $X$.

Construct these two-isomorphisms on the two invertible sheaves and their sections and check the power-isomorphism equation. The two-pullback comparison detects equality on those components. The pentagon, unit and symmetry equations are the imported tensor equations. A transposition at a double branch collision exchanges its two sign factors and fixes their product; both ways of regrouping three zero-section hat objects give the same root-line isomorphism.

Construction / proof check:

1. Iterate the parent tensor operation on L, K and the two sections. Import its general monoidal coherence from AlgebraicVectorBundles L0A–L0B.
2. Define the permutation and block isomorphisms by these actual sheaf isomorphisms, then check they preserve the root square identification and the sections.
3. Use the two-pullback comparison to test equality of the resulting two-morphisms on all components. The pentagon, symmetry and unit equations reduce to the imported coherence equations.

Acceptance checks:

- The transposition at a double branch collision swaps the two source sign factors but leaves their product unchanged.
- The two ways to regroup three factors have the same induced root-line isomorphism, including when every section is zero.
- The empty block gives the unit constraints rather than a chosen point of X.

Upstream imports: `UPSTREAM:AlgebraicVectorBundles:L0A`, `UPSTREAM:AlgebraicVectorBundles:L0B`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/ordered-divisors`, `FunctionFieldArithmeticPartII:GC.1/root-addition`, `FunctionFieldArithmeticPartII:GC.1/addition-chart-map`, `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.4, (A.2)–(A.3), p. 517. The tensor addition and invariant ordered sum require coherent permutation and block comparisons. [Algebraic vector bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md), L0A–L0B (unpaginated). General tensor coherence is already planned upstream and is reused on the root data.

### 12. Fixed-root-section fibres of Abel–Jacobi

Target: `refinedAbelJacobiFibre`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/refined-abel-jacobi-fibre`.

For `refinedAbelJacobiFibre`, fix an algebraically closed extension $K$ and an **object** $(L,K_R,\iota,\alpha)\in\mathcal P_d^{\mathrm{sec}}(K)$. Put
$$
V=H^0(X_K,L),\quad W=H^0(R_K,L|_{R_K}),\quad
c=\iota(\alpha^{\otimes2})\in W.
$$
There is a canonical equivalence of the refined hat two-fibre with the affine $K$-scheme
$$
(\widehat{AJ}^{\mathrm{sec}}_d)^{-1}(L,K_R,\iota,\alpha)
\simeq\mathrm{ev}_R^{-1}(c)\subset V.
$$
The effective restriction deletes the origin when $c=0$, and deletes nothing when $c\ne0$. If $a_0$ is a point of this fibre, translation identifies it with $H^0(X_K,L(-R))$; without such a point it can be empty. Left exactness of the section sequence supplies the kernel and does not assert that evaluation is surjective.

A point of a two-fibre includes its isomorphism to the fixed target object. Transporting by that isomorphism fixes $L,K_R,\iota,\alpha$, and any compatible arrow then acts identically. Thus this is an affine fibre, without a scalar quotient. With empty $R$ it is $V$, with effective fibre $V\setminus\{0\}$; a projective-space answer would instead have forgotten the fixed-object trivialization. Over $K$, finite-dimensional cohomology and extension to arbitrary $K$-algebras identify the section functor with this affine scheme. Over general parameter schemes the statement uses actual section functors, without a uniform vector-bundle assertion for small degrees.

Varying $\alpha$ gives the unrefined fixed-root-Picard equation $\mathrm{ev}_R(a)=\iota(\alpha^2)$. Its high-degree splitting and weighted-quotient geometry already belong to `GC.4/affine-fibre-chart` and are not targets reintroduced here.

Uses: `FunctionFieldArithmeticPartII:GC.4/affine-fibre-chart` separates the linear fixed-alpha fibre from the unrefined quadratic family; the high-degree splitting and weighted quotient remain in GC.4. `FunctionFieldArithmeticPartII:GC.5/hat-character-pullback` keeps the retained root section and the zero global section distinct in the hat pullback.

Construction / proof check:

1. Use a specified isomorphism to the fixed target object to transport all data to L, K_R, iota and alpha. An arrow compatible with that isomorphism is then the identity, so the two-fibre is the section functor with one linear evaluation equation.
2. Over K the ordinary coherent-cohomology supplier gives finite-dimensional V and W. The inverse image of the K-point c under their linear evaluation map is a closed affine subscheme.
3. The exact sequence of sheaves $L(-R)\to L\to L|_R$ identifies the kernel on global sections with H0(L(-R)); this needs left exactness, not surjectivity of evaluation.
4. The effective condition deletes a=0, using rootEffectiveOpen_baseChange. Forgetting alpha gives the family of these affine equations parametrised by the root-section space, matching the already-owned unrefined GC.4/affine-fibre-chart formula.

| Name | API contract |
| --- | --- |
| `refinedAbelJacobiFibre.section` | The equivalence sends a point to its transported global section a in V. |
| `refinedAbelJacobiFibre.equation` | A section lies in the two-fibre exactly when $\mathrm{ev}_R(a)=\iota(\alpha^{\otimes2})$, as an equality of sections including on nonreduced K-test algebras. |
| `refinedAbelJacobiFibre.effectiveOpen` | The effective two-fibre is the complement of the origin when c=0 and is the whole affine fibre when c is nonzero. |
| `refinedAbelJacobiFibre.translation` | Given a point a_0 of the fibre, b mapped to a_0+b is an isomorphism from H0(L(-R)); replacing a_0 translates by the corresponding kernel vector. |
| `refinedAbelJacobiFibre.forgetRootSection` | Varying alpha and then forgetting it recovers the quadratic equation $\mathrm{ev}_R(a)=\iota(\alpha^{\otimes2})$ for the unrefined fixed-root-Picard two-fibre, whose high-degree geometry is GC.4. |

| Name | Unit test |
| --- | --- |
| `refinedAbelJacobiFibre.test_empty_R` | For R empty the hat two-fibre is V, and the effective two-fibre is V minus the origin, rather than projective space. |
| `refinedAbelJacobiFibre.test_inconsistent` | For X=P1, L=O, R={0,infinity}, trivial K_R and iota, and $\alpha=(0,1)$, evaluation of a constant is $a,a$, so the refined fibre is empty. |
| `refinedAbelJacobiFibre.test_zero` | For alpha=0, the hat fibre contains a=0 and equals H0(L(-R)); its effective restriction excludes that zero point. |
| `refinedAbelJacobiFibre.test_degree_zero` | For d=0, L=O, nonempty R, trivial K_R and iota and alpha=1, the fibre is the single section a=1, and it is effective. |

Acceptance checks:

- Fixing an actual Picard-stack object gives an affine two-fibre, with no quotient by scalar automorphisms of that fixed object.
- A small-degree fibre is allowed to be empty; no high-degree Riemann–Roch bound is smuggled into this construction.

Upstream imports: `UPSTREAM:JacobianChallenge:C`, `UPSTREAM:JacobianChallenge:D`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi`, `FunctionFieldArithmeticPartII:GC.0/root-picard-section`, `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`, `FunctionFieldArithmeticPartII:GC.1/effective-open-base-change`, `SchemeAndStackFoundations:SF.3/universal-section-stack`, `SchemeAndStackFoundations:SF.3`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.5, p. 517; geometric fibre equation in the proof of Lemma A.9, p. 521. The refined map retains alpha. Fixing that coordinate in the section equation gives this linear fibre; the source unrefined equation is used without its high-degree conclusions.

### 13. The four relative Abel–Jacobi maps and their tensor squares

Target: `rootAbelJacobi_compatibility`. Refinement id: `FunctionFieldArithmeticPartII:GC.1/abel-jacobi-relative-compatibility`.

The theorem `rootAbelJacobi_compatibility` gives all four forgetful maps and their specified two-commuting squares. Forgetting $\alpha$ on $\mathcal P_d^{\mathrm{sec}}$ composes with the refined map to the unrefined map, on the hat domain and on the effective domain. Both restriction squares have identity comparison on retained data. Every map is pseudonatural for arbitrary $T'\to T$.

For either target and either hat or effective version, addition obeys
$$
AJ_{d+e}\circ\operatorname{add}_{d,e}
\simeq\operatorname{tensor}\circ(AJ_d\times AJ_e).
$$
These comparisons obey unit, associativity and symmetry coherence, including for zero or nilpotent-section hat objects. The targets are the GC.0 Picard stacks. The refined image of $a=0,\alpha=\epsilon$ over dual numbers retains $\epsilon$; the unrefined image forgets it. The degree-zero effective unit maps to the Picard unit. A two-fibre over that fixed stack object can still record scalar trivializations, as the empty-$R$ fibre calculation requires. This is compatible with the effective degree-zero **domain** being a point.

Construction / proof check:

1. Define the four arrows by the parent forgetful functors and effective-open restriction, retaining the specified root power identification and the appropriate sections.
2. Compute each composite on objects and arrows under relativeEvaluationEquivalence; both forget-alpha composites and the restriction squares have identity components.
3. Transport the tensor and pullback comparison isomorphisms from the parent Picard stacks. Equality of their coherence two-morphisms follows componentwise from the imported tensor and pullback coherence.
4. Use refinedAbelJacobiFibre as an acceptance calculation, without making its field-wise vector-space model the definition in families.

Acceptance checks:

- The tuple a=0, alpha=epsilon over dual numbers has both hat images, and the refined one still retains epsilon.
- With R empty the maps agree with the ordinary degree-d Abel map to the Picard stack; composition to its Picard sheaf gives the usual map to Pic^d.
- At d=0 the effective unit maps to the Picard tensor unit. A fixed-object two-fibre over that stack point can still contain scalar trivializations, as the R-empty fibre test requires.

Upstream imports: `UPSTREAM:AlgebraicVectorBundles:L0A`, `UPSTREAM:AlgebraicVectorBundles:L0B`.

Direct prerequisites: `FunctionFieldArithmeticPartII:GC.1/root-abel-jacobi`, `FunctionFieldArithmeticPartII:GC.1/root-addition`, `FunctionFieldArithmeticPartII:GC.0/root-picard`, `FunctionFieldArithmeticPartII:GC.0/root-picard-section`, `FunctionFieldArithmeticPartII:GC.1/relative-evaluation-equivalence`, `FunctionFieldArithmeticPartII:GC.1/effective-open-base-change`, `FunctionFieldArithmeticPartII:GC.1/addition-chart-map`, `FunctionFieldArithmeticPartII:GC.1/refined-abel-jacobi-fibre`.

Sources: [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), A.1.4–A.1.5, (A.2), p. 517. Both hat forgetful maps, the effective restriction and tensor addition are specified; their relative squares are the functorial compatibility required here.

## Supplier contracts and acceptance boundary

The generic suppliers keep their existing ownership. This layer requires the following bounded extensions of their stated interfaces; the packet records them as requests rather than assuming that a nearby node already states them.

**`GC1-RESTRICTION` — `SchemeAndStackFoundations:SF.1`.** For a finite etale k-scheme R, supply the restriction stack whose T-objects are invertible sheaves with sections on R times T, its equivalence with [Res_R A1/Res_R G_m], the tensor-square 1-morphism, and its Galois-equivariant identification after a splitting extension with a product indexed by all geometric points of R. The existing line-bundle-section-stack node gives the rank-one factor, but does not state this restriction/descent adapter. Its chosen comparisons must obey identity/composition pullback coherence.

**`GC1-PERMANENCE` — `SchemeAndStackFoundations:SF.1`.** Extend the actual stack-morphism-property interface with the nonrepresentable quasi-finite definition of Stacks 101.23.2 and 101.24.1, its base-change law, properness base change/composition, and Lemma 101.37.5(2): over a base, any morphism from a proper stack to a separated stack is proper. Include the proper finite-quotient chart criterion: for finite etale Gamma, a finite Gamma-equivariant affine scheme over A gives a proper quotient stack over Spec A (finite diagonal, finite type, universally closed). Existing stack-morphism-properties defines properness but does not supply these exact permanence statements. Also supply the finite-type zero-dimensional DM residual-gerbe decomposition: over an algebraically closed field a reduced such stack with finitely many points is the disjoint union of its residual gerbes, each neutralized by a chosen object.

**`GC1-CURVE-FAMILY` — `SchemeAndStackFoundations:SF.3`.** Using SF.3/universal-section-stack and picard-stack-curve, supply the ordinary section-functor restriction map to a finite etale divisor R, and the left-exact kernel identification for $L(-R)\to L\to L|_R$, functorially in actual invertible sheaves and pullbacks. Over a field identify these section functors with their finite-dimensional affine spaces, including after extension to arbitrary test algebras. Integrate upstream JacobianChallenge C/D without assuming a rational point. In general parameter families do not replace the section functor by a vector bundle or assert that pi_*L commutes with every base change in small degree. The fibrewise-zero locus is a statement about geometric fibres: a nilpotent-valued section supported there need not factor through the zero-section substack.

**`GC1-SMOOTH-COORDINATES` — `SchemeAndStackFoundations:SF.0`.** For a smooth finite-type scheme Z over an algebraically closed field and functions f_1,...,f_r, supply the prescribed-function criterion: Z→A^r is smooth at z precisely when the df_i at z are linearly independent, and an independent list extends locally to etale coordinates. SF.0/etale-coordinates supplies some coordinates at a smooth point; it does not state that they can start with these specified functions. Use the scheme cotangent/Jacobian interface, not a set-theoretic tangent test.

All direct prerequisite chains in the packet end in pinned library ingredients, named parent or supplier nodes, these four requests, or the explicit geometry-carrier gap `GC1-NATIVE-GEOMETRY`. The SF.0, SF.1 and SF.3 follow-up packets have `needs_changes` reviews at this snapshot; their nodes are planned contracts. The layer is **planned**, with the four exact supplier contracts and actual typed geometric declarations remaining. It is not closed. All implementation status fields remain `unchecked`.

The compact suggested file uses native roots of unity, finite products and the existing group-scheme point equivalence. It states the kernel, algebra-change and reindexing milestones, with checks for multiplicities zero, one and two, a noninjectivity check, the native group-scheme comparison and the root-product ring equation. The abbreviation for the product is only a real-bodied use of existing evaluation homomorphisms. The file's omission ledger names all thirteen geometric targets, all twenty-one new construction API items and all sixteen new construction tests. Those names require the actual relative section-stack, quotient, coarse-map and Picard-stack carriers, together with their chosen coherent transports. Elaborating the coordinate fragment does not establish those geometric signatures. No arbitrary predicate or data placeholder substitutes for them.

The final geometric acceptance pass must check the restriction equivalence on arrows and arbitrary pullbacks; incidence on nonreduced test schemes; the chart and full coarse fibre at one and two distinct branches; the collision two-fibre and its relative inertia; the permutation and block coherence; and all four Abel–Jacobi maps, including the empty refined fibre example and the hat nilpotent example. These checks use the exact API and unit-test statements above.

## Atlas selection

The parent already selects **Root symmetric powers**, **Root symmetric-power smoothness**, **Root symmetric coarse space**, **Addition of root divisors**, and **Root Abel–Jacobi maps** in GC.1. This refinement adds only **Ordered root divisors**, attached to `ordered-inertia-comparison`. The combined layer therefore has six planets. Local charts, residual intersections, full fibres and the differential comparison are targets supporting those objects, without additional planets.

## Source and baseline receipts

The principal source is [Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), *Annals of Mathematics* **189** (2019), 393–526, author-hosted published PDF, read 18 October 2026. Locators above use printed pages, not PDF viewer indices: Definition A.2 p. 515; the evaluation diagram and the claim in the proof of Lemma A.4 p. 516; its incidence application and (A.2)–(A.3), A.1.5 p. 517; the ordered-map use in A.2.1 pp. 519–520; the fibre equation in the proof of Lemma A.9 p. 521. The PDF SHA-256 is `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.

Two inherited, previously confirmed source issues are retained under their parent ids. **E2**, A.1.3 pp. 515–516, requires the nonreduced root quotient for the full ramified fibre and the classifying stack only for its reduction. **E5**, Definition A.2 p. 515, makes the restricted section the restriction of the preceding global section $a$. The packet credits the original extraction and review. Independent review `REV-FunctionFieldArithmeticPartII--GC.1` confirms both corrections against the published pages, including the p. 515 image; it does not assert a new erratum search. The finite-map language in A.2.1 p. 519 is used with the parent's explicit proper quasi-finite stack convention, preserving its nonrepresentable collision. This convention is not an assertion of a new source error.

The Stacks Project inputs are [Section 44.3](https://stacks.math.columbia.edu/tag/0B9C), Lemmas 44.3.1–44.3.5 and Proposition 44.3.6, for ordinary relative divisors and ordered finite flat addition; [Section 101.37](https://stacks.math.columbia.edu/tag/0CL4), especially Lemma 101.37.5(2), for properness; [Definition 101.23.2](https://stacks.math.columbia.edu/tag/06PT) and [Definition 101.24.1](https://stacks.math.columbia.edu/tag/0G2L), for the nonrepresentable quasi-finite convention; and [Lemma 101.21.4](https://stacks.math.columbia.edu/tag/06MC) with [Lemma 101.31.2](https://stacks.math.columbia.edu/tag/06UI), for the residual-gerbe step. These HTML sources are unpaginated; their numbered statements and tags are the locators. All were read on 18 October 2026.

The exact library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Eleven baseline declarations are recorded in the packet: `rootsOfUnity`, `restrictRootsOfUnity`, `Pi.evalMonoidHom`, `MonoidHom.finsetProd_apply`, `map_prod`; `RootsOfUnityGroup.groupScheme`, `RootsOfUnityGroup.schemePointsMulEquiv`, `RootsOfUnityGroup.schemePointsMulEquiv_mapValue`; `AlgebraicGeometry.InvertibleSheaf`; and `AlgebraicGeometry.WeilDivisor.EffectiveDivisorOfDegree` with its `equivSym_add`. Their statements were read at those pins. The packet includes six byte-for-byte source-file receipts.

The read-only current upstream check used TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including the README and suggested signatures of [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles) and [JacobianChallenge](https://github.com/TauCetiProject/TauCetiRoadmap/tree/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/JacobianChallenge), and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed library audit has no Part II entry; the `FunctionFieldArithmetic:FA.1` entry (AUDIT-20, partly built) concerns the arithmetic formal-divisor lane, not these relative geometric stacks. No restricted-library source was needed.
