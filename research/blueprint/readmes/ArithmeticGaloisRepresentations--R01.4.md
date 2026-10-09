# Residual images in dimension two — R01.4

This layer connects finite subgroups of linear groups with continuous residual Galois representations. Its outputs are image recognition, precise restriction criteria, and the exceptional cases used by deformation and automorphy arguments. It assumes the representation operations of R01.1 and the local Galois interfaces of R01.2. It does not construct adjoint deformation functors, prove adequacy, or provide automorphic input for large-image theorems; those belong to the consumer layers that consume these results.

The 31 principal targets of the accepted `ArithmeticGaloisRepresentations.json` remain the principal targets here. This supplement supplies seven reusable definitions/constructions, five key theorems, and one arithmetic example. At the target density specified in `detail.json`, root-group calculations, elementary subgroup counting and finite-matrix manipulations are proof steps, rather than additional nodes. No result is asserted to be formalised. The accompanying [suggested file](../suggested/ArithmeticGaloisRepresentations--R01.4.lean) gives mathematical predicates, construction signatures, theorem signatures and acceptance examples; its proof placeholders record proposed work.

## Conventions and existing inputs

Write $G_F=\operatorname{Gal}(F^{\mathrm{sep}}/F)$, with its Krull topology, and $\rho:G_F\to\mathrm{GL}(V)$ for a continuous representation. Arithmetic examples have a number field $F$, a finite coefficient field $k$ of characteristic $p$, and a plane $V$. Discrete finite coefficients make the image finite. The prototype uses `AlgebraicClosure F`; number fields are perfect, so this agrees with the separable-closure convention. Its one arbitrary-field kernel-field signature explicitly assumes `PerfectField F`.

Absolute irreducibility means irreducibility after extension to an algebraic closure of $k$. For finite-dimensional representations over a field it is equivalently the assertion that the $k$-span of the image operators is all of $\operatorname{End}_k(V)$, together with $V\ne0$. This is the R01.1 predicate used in the prototype, not a synonym for ordinary irreducibility. A Cartan is a subgroup of the linear group; its projective image is its image modulo scalar matrices. A dihedral group $D_{2n}$ has order (2n), with $n\ge2$; the case $n=2$ is the Klein four group.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records the individual declarations read at these pins. In particular:

| Existing input | What is reused |
|---|---|
| `Field.absoluteGaloisGroup`, `Field.absoluteGaloisGroup.mapOfAlgebra` | Galois carriers and restriction maps |
| `NumberField.InfinitePlace.IsReal`, `Complex.conjAe` | Real places and complex conjugation as an algebra automorphism |
| `Matrix.GeneralLinearGroup.toLin'`, `Matrix.ProjGenLinGroup`, `Matrix.ProjectiveSpecialLinearGroup.toPGL` | Coordinate transport and projective linear groups |
| `TauCeti.diagonalTorus`, `mem_diagonalTorus_iff`, `diagonalTorusEquiv` | The already implemented coordinate split torus |
| `TauCeti.diagonalNormalizerQuotientMulEquivPerm` | Split normaliser quotient when the unit group is nontrivial |
| `TauCeti.GL2NonSplitTorus`, its unit equivalence, trace, determinant and centralizer lemmas | Multiplication model for a quadratic field extension |
| `Matrix.SL2.commutator_eq_top`, `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | Perfectness of SL₂ and simplicity of PSL₂ with their cardinality hypotheses |
| `IntermediateField.fixedField`, `lift`, `IsGalois.intermediateFieldEquivSubgroup` | Finite Galois correspondence and the quadratic cyclotomic field |
| `IsCyclotomicExtension.Rat.galEquivZMod`, `IsPrimitiveRoot.autToPow_injective`, `gaussSum_sq` | Cyclotomic Galois groups and the rational quadratic Gauss-sum calculation |
| `groupCohomology.H1` and its low-degree cocycle/coboundary interface | Interpretation of the explicit cohomology proof |

The current upstream `RepresentationTheory/InductionRestriction` roadmap owns general induction, Clifford theory and projective representations. `LocalGaloisGroups`, together with R01.2, owns inertia, decomposition groups and fundamental characters. Their current files and the current Tau Ceti library were inspected. None of that general machinery is planned again here. These inputs, R01.1, and baseline linear algebra are the ends of the prerequisite chains below. The six principal planets already selected for R01.4 are retained; this supplement adds none.

## 1. Real places and oddness

**Complex conjugation.** For a real infinite place $v$, choose an embedding $\iota:\bar F\hookrightarrow\mathbf C$ extending its real embedding. Conjugation preserves the subfield of elements algebraic over $\iota(F)$. Transporting it gives the unique $c_\iota\in G_F$ with
\[
\iota(c_\iota x)=\overline{\iota(x)}\qquad(x\in\bar F).
\]
It squares to one and is nonidentity, as its action on a square root of $-1$ shows. Any two embeddings over the same real place differ by an element of $G_F$, so the resulting conjugations are conjugate. The construction uses the inverse of an embedding on its image, never an alleged inverse on all of the complex numbers. Source: Serre 1987, §1.3, p. 182; the real-place formulation and comparison of choices are the explicit extension to number fields.

**Totally odd character and odd representation.** For a commutative ring $A$, define a homomorphism $\mu:G_F\to A^\times$ to be totally odd when $\mu(c_v)=-1$ at every real place. The algebraic predicate does not impose continuity; arithmetic characters carry continuity separately. A rank-two finite projective representation is odd when its determinant character is totally odd. Character values are conjugation invariant, hence the predicate is independent of choices. Coefficient maps preserve oddness; injective maps reflect it. Restriction to a finite extension preserves it at every real place of that extension. Multiplying by the square of any character preserves it. Sources: Serre 1987, §1.3, (1.3.8)–(1.3.9), p. 182; Khare–Wintenberger I, §1, p. 2.

Over a field of characteristic different from two, oddness at $v$ is equivalent to the conjugation operator having eigenvalues $1,-1$, or being conjugate to $\operatorname{diag}(1,-1)$; it then has trace zero. In characteristic two the condition is automatic for characters into a reduced ring: an involutory unit satisfies $(u-1)^2=0$. Reducedness matters. The character of $\mathbf Q(i)/\mathbf Q$ taking conjugation to $1+\varepsilon$ over $\mathbf F_2[\varepsilon]/(\varepsilon^2)$ fails total oddness. Checking one real place also fails: the character of $\mathbf Q(\sqrt2)(\sqrt{\sqrt2})/\mathbf Q(\sqrt2)$ is positive at one real embedding and negative at the other. Fields with no real places impose no condition.

**Rational lines and absolute irreducibility.** A nonscalar operator on a plane whose characteristic polynomial splits over $k$ has every invariant line over an extension field obtained from a $k$-line. With distinct roots these are its two eigenspaces; with a repeated root and a nontrivial Jordan block there is just one. Thus an irreducible rank-two representation containing such an operator is absolutely irreducible. Odd conjugation supplies it when $p\ne2$. In characteristic two a nonidentity conjugation is a nonscalar unipotent operator, so ordinary irreducibility plus that condition also gives absolute irreducibility. Identity conjugation does not suffice; an irreducible order-three representation over $\mathbf F_2$ supplies the excluded case. Sources: Serre 1987, §3.3, p. 198; Khare–Wintenberger I, Lemma 6.1 and proof, pp. 10–11.

Principal targets: `odd-representation`, `rational-lines-of-a-split-nonscalar-element`, `odd-irreducible-implies-absolutely-irreducible`, `absolute-irreducibility-from-dyadic-conjugation`. Dependencies: R01.1 determinant/base change, complex conjugation, eigenspaces and the span criterion.

## 2. Cartans in a plane

**Split Cartan.** For distinct lines $D_1,D_2\subset V$, let $C_s(D_1,D_2)$ preserve each individually. Restriction identifies it with $\operatorname{Aut}(D_1)\times\operatorname{Aut}(D_2)$; an adapted basis identifies it with $k^\times\times k^\times$, exactly the existing diagonal torus. Swapping the ordered lines leaves this subgroup unchanged. Its normaliser preserves the unordered pair when $q=|k|\ge3$, and its quotient by the Cartan has order two. At $q=2$ the Cartan is trivial and the normaliser has order six, so the index is six. This exceptional case is explicit in the API and tests.

**Half-Cartan.** Use the ordered convention preserving $D_1$ and fixing $D_2$ pointwise, namely $\operatorname{diag}(a,1)$. Determinant identifies it with $k^\times$; adjoining scalars generates the full split Cartan, and the projective images coincide. For $q\ge3$ a half-Cartan determines the unique split Cartan containing it. At $q=2$ it is trivial, so uniqueness fails. Serre chooses the other ordered line; exchanging the labels reconciles the conventions.

**Nonsplit Cartan.** Let $E\subset\operatorname{End}_k(V)$ be a quadratic field subalgebra. Its units, mapped into $\mathrm{GL}(V)$, form $C_{ns}(E)$. The action makes $V$ rank one over $E$, and any nonzero vector identifies the representation with multiplication on $E$. This gives a basis-free carrier and an exact comparison with Tau Ceti's existing quadratic multiplication torus. Multiplication by $a\in E^\times$ has trace $\operatorname{Tr}_{E/k}(a)$ and determinant $N_{E/k}(a)$. For finite $k$, the normaliser consists precisely of $x\mapsto ax$ and $x\mapsto ax^q$. Its index is two even at $q=2$. The projective Cartan has order $q+1$, and the normaliser acts dihedrally by inversion.

**Three recognition results.** A nonscalar regular semisimple matrix, equivalently one with nonzero characteristic-polynomial discriminant in odd characteristic, has a unique containing Cartan: the unit group of its quadratic commutative centralizer algebra. It is split exactly when the discriminant is a square. An element of a Cartan normaliser outside the Cartan has trace zero and scalar square. Finally, if a Cartan lies in the normaliser of another, the two are equal under Serre's bounds: $q\ge5$ for a split Cartan and $q\ge3$ for a nonsplit one. The split $q=3$ exception must not be absorbed into the theorem.

Proof chains: complementary lines give the split and half-Cartan equivalences; the quadratic algebra gives the nonsplit multiplication model; normalising it induces a $k$-automorphism of $E$, hence identity or Frobenius. Conversely both displayed kinds normalise the unit group. Centralizer calculations identify the unique regular Cartan. The trace-zero statement bounds how many elements of one Cartan could lie outside the other, proving the containment result. Sources: Serre 1972, §§2.1–2.2, Proposition 14 and its remark, pp. 278–280; the coordinate comparisons end in the Tau Ceti declarations listed above.

Principal target: `cartan-subgroups-and-normalisers`. New key targets: `cartan-normaliser-semilinear`, `regular-semisimple-cartan`, `cartan-contained-in-normaliser`. These remain consequences within R01.4, without replanning the existing coordinate tori.

## 3. Finite projective images and their coefficient fields

**Dickson classification.** A finite subgroup of $\mathrm{PGL}_2$ over a field of characteristic $p$, after conjugation over an algebraic closure, fixes a point, is cyclic or dihedral, is $A_4,S_4,A_5$, or is a standard $\mathrm{PSL}_2(k_0)$ or $\mathrm{PGL}_2(k_0)$ for a finite subfield $k_0$. The point-fixing case includes the affine groups in the modular situation and is incompatible with absolute irreducibility of the original plane representation. The exceptional groups have maximum element orders (3,4,5). Standard groups of the same type and coefficient field are conjugate. The icosahedral group becomes $\mathrm{PSL}_2(\mathbf F_4)$ in characteristic two and $\mathrm{PSL}_2(\mathbf F_5)$ in characteristic five. Sources: Dickson, Chapter XII, §§239–262, pp. 260–287; Darmon–Diamond–Taylor, Theorem 2.47, p. 81.

**The visible coefficient field.** For $G\le\mathrm{GL}_2(k)$, define its projective trace field to be the subfield generated by
\[
\frac{\operatorname{tr}(g)^2}{\det(g)},\qquad g\in G.
\]
These expressions survive scalar multiplication and conjugation. A field map carries this field to the corresponding generated field of the mapped image. In a standard subgroup containing $\mathrm{SL}_2(k_0)$, $q_0\ge4$, it recovers $k_0$. This is a field generated by projective invariants, not the field generated by matrix entries, traces alone, or determinants alone. If the projective image is standard over $k_0$, then after the same choice of coordinates the commutator subgroup is $\mathrm{SL}_2(k_0)$ and the linear image lies in scalars times $\mathrm{GL}_2(k_0)$. Conversely containing that special linear group forces the classified coefficient field to contain $k_0$. This follows by perfectness and descent of the projective standard model. Sources: Khare–Wintenberger I, §6, p. 10; Allen et al., proof of Lemma 7.1.6, p. 1090. This paragraph makes the descent interface explicit; it does not identify an arbitrary entry field with the projective field.

In characteristic two an absolutely irreducible soluble projective image is dihedral of order (2n), with odd $n\ge3$. An absolutely irreducible nonsoluble projective image is a standard $\mathrm{PSL}_2(\mathbf F_{2^r})$, $r\ge2$; the linear commutator is its special linear group. Finite fields of characteristic two have surjective squaring, so PSL and PGL coincide there. Sources: Khare–Wintenberger I, Lemma 6.1, pp. 10–11; II, Lemma 4.3$2$(ii), p. 40.

An absolutely irreducible projective image with an element of order greater than five avoids the exceptional groups. The soluble case is dihedral. Over a prime field, if it additionally lies in no Cartan normaliser, it contains SL₂. The absolute irreducibility and normaliser exclusion are required: a Borel or a dihedral group can also contain large-order elements. This is the direct Dickson consequence used for large-image arguments.

Principal targets: `dickson-classification-and-the-dyadic-refinement`, `conjugacy-of-standard-projective-images`, `projective-image-and-its-coefficient-field`, `linear-image-over-the-projective-trace-field`, `dyadic-solvable-projective-image`, `dyadic-nonsolvable-projective-image`, `large-order-projective-image-criterion`. Dependencies: §2, §4 below, finite-field subfields, projective scalar quotient and the baseline perfectness theorem.

## 4. Modular and prime-to-characteristic subgroup recognition

A nontrivial finite $p$-subgroup of $\mathrm{GL}_2(k)$, in characteristic $p$, has one fixed line over $k$, and every element acts unipotently. Consequently a subgroup with a nontrivial normal $p$-subgroup is reducible. The Sylow $p$-subgroups of $\mathrm{GL}_2(\mathbf F_q)$ have order $q$, are indexed by the $q+1$ lines, and consist of the unipotents fixing that line. In an algebraically closed coefficient field a reducible finite subgroup has normal Sylow $p$-subgroup: upper triangular coordinates put all its $p$-elements in the unipotent kernel. The projective analogue says that a nontrivial normal $p$-subgroup fixes a unique projective point, which its normaliser preserves. Sources: Serre 1972, §§2.3–2.4, p. 280; Khare–Wintenberger I, proof of Lemma 6.1, p. 11.

For $H\le\mathrm{PSL}_2(\mathbf F_{p^n})$ with $p\mid|H|$, each nontrivial root intersection $H\cap U_x$ is a Sylow subgroup, of common order $p^m$, and their number is $1+fp^m$. If $f=0$, $H$ fixes a point. Otherwise $m\mid n$, and exactly the following possibilities occur up to PGL conjugacy:

| Case | Group and parameters |
|---|---|
| A | $p^m>2, f=1, H=\mathrm{PSL}_2(\mathbf F_{p^m})$ |
| A₂ | $p^m=2, H=D_{2(1+2f)}$; $f=1$ gives $S_3$ |
| B | $p$ odd, $n/m$ even, $f=1, H=\mathrm{PGL}_2(\mathbf F_{p^m})$ |
| B₃ | $p=3, m=1, n$ even, $f=3, H=A_5$ |

The proof first counts conjugate root subgroups and their normalisers. Two opposed root groups recover additive parameters; the diagonal multipliers recover a finite field, which gives $m\mid n$. The remaining counting alternatives distinguish A and B, the dyadic dihedral case and the order-60 case. No exceptional case is suppressed by an irreducibility shortcut. Source: Dickson, §§239–254, especially §§251–253, pp. 272–279.

For a finite $H\le\mathrm{PGL}_2(K)$ of order $\Omega$ prime to the characteristic, each nonidentity element belongs to exactly one maximal cyclic subgroup. If $d_i$ are orders of conjugacy representatives and $f_i\in\{1,2\}$ are their normaliser indices, counting the nonidentity elements gives
\[
1-\sum_i\frac{d_i-1}{f_i d_i}=\frac1\Omega.
\]
There are at most three classes. The trivial and one-class solutions are cyclic. The two-class solutions are odd dihedral groups, with orders ((2,n)), and $A_4$, with orders ((3,2)). Three classes give even dihedral groups ((n,2,2)), $S_4$ with ((4,3,2)), or $A_5$ with ((5,3,2)). Fixed-point pairs give cyclic centralizers and normaliser index at most two; the class equation then leaves the displayed small list, and their permutation actions identify the groups. Sources: Dickson, §§256–259, pp. 280–285; Serre 1972, Proposition 16, p. 281.

Over $\mathbf F_\ell$, if $\ell\mid|G|$, either $G$ contains SL₂ or lies in a Borel. Two transvections in opposite root directions, with nonzero parameters, generate SL₂ over the prime field, which proves this alternative. If $\ell\nmid|G|$, then $G$ is in a Cartan, its normaliser, or has exceptional projective image. For $\ell=2,3$, only the Cartan/dihedral alternatives remain under the prime-to-$\ell$ condition. The icosahedral alternative in other prime characteristics requires $\ell\equiv\pm1\pmod5$. A semisimple reducible representation splits into two characters and its image lies in a split Cartan; a semisimple irreducible image follows the preceding alternatives, including the SL₂ alternative when its order is divisible by $\ell$.

Serre's Cartan-containment results are separate: containing a nonsplit Cartan, or a split half-Cartan when $\ell\ne5$, forces the subgroup into the appropriate normaliser or Borel, or makes it all GL₂. A normal subgroup containing a Cartan or half-Cartan is all GL₂ when $\ell\ne2$. The excluded split case at five admits an exceptional projective image. Sources: Serre 1972, Propositions 15–18, §§2.4–2.7, pp. 280–283.

Principal targets: `p-subgroups-and-borel-subgroups`, `subgroups-of-psl2-with-several-sylow-p-subgroups`, `finite-subgroups-of-pgl2-of-order-prime-to-the-characteristic`, `two-transvections-generate-sl2-over-a-prime-field`, `subgroups-of-gl2-over-a-prime-field`, `prime-to-ell-subgroups-of-gl2`, `semisimple-subgroups-over-a-prime-field`, `subgroup-containing-a-cartan`, `normal-subgroup-containing-a-cartan`. Dependencies: root subgroups, finite Galois fields, §2 Cartans and finite subgroup counting. Routine arithmetic and root-group calculations stay inside these target proofs.

## 5. Dihedral induction and cyclic restriction

Let $\Gamma$ be profinite, let $k$ be algebraically closed, and let a rank-two representation have finite projective image and open projective kernel. It is irreducible with projective image $D_{2n}$, $n\ge2$, exactly when it is induced from a character $\chi$ of an open index-two subgroup $\Delta$, with $\chi\ne\chi^\sigma$. The cyclic rotation subgroup has order prime to the characteristic. Pull back the rotation subgroup and choose an eigenline; the second coset exchanges the two eigenlines. Conversely the induced basis gives diagonal matrices on $\Delta$ and off-diagonal matrices on the other coset, producing the claimed projective group. The prototype's invariant-line encoding is accompanied by a character-and-basis signature, so the induced condition is concrete.

In this basis $\rho|_\Delta=\chi\oplus\chi^\sigma$, the trace vanishes outside $\Delta$, and
\[
\det\rho=\varepsilon_\Delta\,\operatorname{Ver}(\chi),
\]
where the transfer is Mathlib's `MonoidHom.transfer` and $\varepsilon_\Delta$ is the permutation sign. In characteristic two that sign is trivial. The induction subgroup is unique for $n\ge3$; for $n=2$ there are three choices. When $2\ne0$, self-twisting by a nontrivial quadratic character detects induction from its kernel. Scalar twisting preserves the projective image and induction pattern. Sources: Serre 1972, §2.6(ii), p. 282; Dieulefait–Pacetti, proof of Lemma 1.14, p. 9; Boxer–Calegari–Gee, proof of Theorem 3.1, p. 516. General induction and its determinant construction are imported from R01.1 and upstream InductionRestriction.

An irreducible representation with abelian projective image has Klein-four projective image. For a normal subgroup $N\triangleleft\Gamma$ with abelian quotient, a reducible restriction has either distinct character constituents, yielding an index-two stabiliser of a constituent, or scalar restriction, yielding that Klein case. The scalar case cannot persist when the quotient is cyclic: a cyclic projective representation lifts to a scalar times one matrix, hence has an eigenline. These arguments use Clifford restriction and centralizers, with the rank-two consequences owned here. Sources: Dieulefait–Pacetti, proof of Lemma 1.13, p. 8; Caraiani–Newton, proof of Lemma 7.1.1, p. 92.

More precisely, for a finite cyclic quotient $\Gamma/N$, let $J$ be the inverse image of its squares. A two-dimensional representation is absolutely irreducible on $N$ exactly when it is on $J$. If a restriction splits into distinct lines, its permutation action has order at most two and is killed on the square subgroup. The isotypic scalar case has a cyclic projective image and is already reducible. This does not require oddness. The same argument, applied successively to the odd-$p$ quotient between cyclotomic levels, gives equivalence of absolute irreducibility on $G_{F(\zeta_{p^m})}$, $G_{F(\zeta_p)}$ and the quadratic square-subgroup field, for every $m\ge1$.

Principal targets: `dihedral-projective-image-iff-induced`, `irreducible-with-abelian-projective-image-is-klein`, and the cyclic-restriction clauses of `bad-dihedral-representations-and-the-oddness-criterion`. Dependencies: §2, the R01.1/upstream induction and Clifford interfaces, and §6's actual cyclic cyclotomic Galois group.

## 6. The cyclotomic square field and bad-dihedral representations

For odd $p$, set $K_p=F(\zeta_p)$ inside a fixed closure. Its Galois group $C$ embeds in $(\mathbf Z/p)^\times$, hence is cyclic. Define
\[
E_p=K_p^{C^2}.
\]
Its degree over $F$ is one for odd (|C|) and two for even (|C|). In the latter case it is the unique quadratic subextension. This is the square subgroup of the **actual** cyclotomic Galois group over $F$.

Over $\mathbf Q$, $E_p=\mathbf Q(\sqrt{p^*})$, with $p^*=$-1$^{(p-1)/2}p$. The quadratic Gauss sum generates this field: its square is $p^*$, and the cyclotomic Galois action on it is the quadratic character. The result uses the pinned `gaussSum_sq` and rational cyclotomic Galois equivalence. Over a general number field it is unsafe to replace the fixed-field definition by $F(\sqrt{p^*})$. For example, when $F=\mathbf Q(\sqrt5)$, $F(\sqrt{5^*})=F$, while $E_5=F(\zeta_5)\ne F$. The field API tests the odd-degree, unique quadratic and rational Gauss-sum cases separately.

A residual plane representation is **bad dihedral at $p$** when it is absolutely irreducible over $G_F$ and ceases to be so over $G_{E_p}$. The definition itself is a predicate on the actual representation; the useful equivalences assume a finite coefficient field of odd characteristic $p$. Under those hypotheses it is equivalent to loss of absolute irreducibility on $G_{K_p}$. It forces $[E_p:F]=2$, induction from $G_{E_p}$ with distinct conjugate characters after coefficient extension, and image order prime to $p$. Coefficient extension and scalar character twisting preserve it. Sources: Dieulefait–Pacetti, Definition 1.12 and Lemmas 1.13–1.14, pp. 7–9; Khare–Wintenberger I, Lemma 6.2(ii), p. 11. Their rational convention is extended here by the fixed-field construction and the cyclic-restriction proof in §5.

For $F=\mathbf Q$, projective inertia at $p$ has order exactly two. The cited proof bounds it by two; the quadratic field $E_p/\mathbf Q$ is ramified at $p$, so inertia also contains an element outside the rotation subgroup. The linear inertia image has order prime to $p$, hence is tame and cyclic. Its projective cyclic subgroup cannot contain an outside involution and a nontrivial rotation at the same time, giving the bound. If its semisimplification is $\omega^a\oplus1$ with a level-one fundamental character, then $p-1\mid2a$. If it is $\omega_2^b\oplus\omega_2^{pb}$, then $p+1\mid2b$. These follow by taking the ratio of the two characters and using the exact projective order. Fundamental characters and the passage to inertia remain R01.2 inputs. Source: Dieulefait–Pacetti, Lemma 1.14, proof and Remark 5, p. 9; conversion to Serre weight belongs to the Serre-modularity layer.

**An actual niveau-two example.** Let $L$ be the splitting field of $X^4+3$, choose $\alpha^4=-3$ with complex argument $\pi/4$, and choose $i^2=-1$. The field is $\mathbf Q(\alpha,i)$. Put $K=\mathbf Q(\alpha^2)=\mathbf Q(\sqrt{-3})$. At three, (K(i)/K) is unramified quadratic, while $K(\alpha)/K$ is ramified quadratic: $-1$ is a nonsquare residue unit and $\alpha^2$ is a uniformizer. The quadratic extensions are distinct, proving $[L:\mathbf Q]=8$. Automorphisms
\[
r(\alpha)=i\alpha,\quad r(i)=i,\qquad
s(\alpha)=\alpha,\quad s(i)=-i
\]
give $r^4=s^2=1, srs=r^{-1}$. Map them over $\mathbf F_3$ to
\[
R=\begin{pmatrix}0&-1\\1&0\end{pmatrix},\qquad
S=\begin{pmatrix}1&0\\0&-1\end{pmatrix}.
\]
Their eight products are distinct, and (1,R,S,RS) span $M_2(\mathbf F_3)$; the resulting continuous Galois representation is absolutely irreducible. Complex conjugation is $r^3s$, with determinant $-1$. The subgroup fixing $K=\mathbf Q(\zeta_3)$ is $\langle r^2,s\rangle$, which acts diagonally, so it is bad dihedral.

Locally, $\mathbf Q_3(i)/\mathbf Q_3$ is unramified quadratic and $X^4+3$ is Eisenstein over it. Thus the full local degree is eight, the ramification index is four, and inertia is $\langle r\rangle$. Over $\mathbf F_9$, $R$ has eigenvalues $i,-i=i^3$. Their tame characters are $\omega_2^2,\omega_2^6$, up to exchanging them; a primitive level-two character has order eight. The projective ratio is $-1$, so projective inertia has order two. This polynomial example and its calculations are supplied here, rather than attributed to the paper; the criterion it tests is the cited Dieulefait–Pacetti result. The suggested file asserts existence of the Galois representation with this kernel and has a separate fundamental-character signature.

Principal targets: `bad-dihedral-representation`, `bad-dihedral-representations-and-the-oddness-criterion`. New targets: `cyclotomic-square-subfield`, `niveau-two-bad-dihedral-witness`. Dependencies: §5, finite Galois correspondence, cyclotomic characters, Gauss sums, and R01.2 inertia/fundamental characters.

## 7. Restriction images and cyclotomic bookkeeping

For a finite-image representation, let $K/F$ be its finite Galois kernel field, and let $M/F$ be the projective kernel field. For a finite separable extension $F'/F$ inside the chosen closure, restriction identifies the linear image with $\operatorname{Gal}(K/K\cap F')$, and the projective image with $\operatorname{Gal}(M/M\cap F')$. These identifications are through the original factorisation maps, not arbitrary abstract group isomorphisms. Therefore disjointness from $K$ preserves the linear image and absolute irreducibility. Disjointness from $KF(\zeta_p)$ preserves both the global image and the cyclotomic restricted image, and consequently the bad-dihedral test. Disjointness from $K$ alone does not control that second image.

A perfect subgroup of the image survives a normal restriction with soluble quotient: its image in the soluble quotient is simultaneously perfect and soluble, hence trivial. Iterate through a tower of soluble Galois extensions to get the soluble-base-change result. Sources: Allen et al., proof of Lemma 7.1.6$2$, p. 1090; Newton–Thorne, discussion after Theorem 4.1, arXiv v2 p. 26. Dependencies: R01.1 finite-image factorisation and baseline finite Galois correspondence; no new general restriction functor is introduced.

For $G=\rho(G_F)$ and $H=\rho(G_{F(\zeta_p)})$, $H\triangleleft G$ and $G/H$ is cyclic. The eight cyclotomic clauses are:

1. For odd $p$, restriction to every $p$-power cyclotomic level, to level $p$, and to $E_p$ have equivalent absolute irreducibility (§5).
2. An irreducible representation becoming absolutely reducible on that subgroup lies in a Cartan normaliser. If it was already absolutely reducible, its image lies in a nonsplit Cartan. This follows from the two-line permutation or scalar-centralizer alternatives.
3. With $k=\mathbf F_p$ and determinant the mod-$p$ cyclotomic character, at $p=3$ the image is conjugate to the split normaliser or a subgroup of the nonsplit Cartan. At $p=5$, if the cyclotomic degree is four, it lies in a nonsplit normaliser. Source: Caraiani–Newton, Lemma 7.1.1$1$–$3$ and proof, p. 92.
4. A contained $\mathrm{SL}_2(\mathbf F_q)$, $q\ge4$, survives to $H$ by perfectness. In the prime-field case $p\ge5$, if determinant is trivial on $H$, then $H=\mathrm{SL}_2(\mathbf F_p)$. This is the group calculation behind Boxer–Calegari–Gee–Newton–Thorne, Proposition 6.2.3, hypothesis $13$ and proof, arXiv v3 p. 62.
5. A standard PSL/PGL projective group has no cyclic quotient of order greater than two. Thus if $[F(\zeta_p):F]>2$, its projective kernel field cannot contain $\zeta_p$. This gives the disjoint-base-change/unramified-at-$p$ criterion of Allen et al., Lemma 7.1.6$1$, p. 1090: after such a base change the cyclotomic degree is $p-1>2$. The inherited normal-closure large-image hypothesis supplies the standard projective group.
6. At five, determinant equal to the cyclotomic character and projective cyclotomic image PSL₂(F₅) rule out containment even if the cyclotomic degree is two. At degree two all determinants are squares, so the global projective group is PSL₂(F₅), which is simple; at degree four the PGL/PSL quotient has order only two. Source: Caraiani–Newton, Lemma 6.1.4 and proof, p. 88. The argument uses only the stated representation/determinant conditions, extending the source's elliptic-curve formulation.
7. For a prime $\ell\ge3$, a normal subgroup of GL₂(Fℓ) with surjective determinant is all GL₂(Fℓ). Three has a separate small-group proof. The assertion at two is false: the normal order-three subgroup has the same trivial determinant image. Source: Allen et al., Lemma 7.1.8$2$, proof p. 1092; the corrected small-field hypothesis is retained.
8. If $p>2$ and restriction to $G_{F(\zeta_p)}$ is absolutely irreducible, every trace-zero adjoint eigenvector with character trivial on this subgroup is zero. Its centralizer is scalar on the subgroup, and trace $2a=0$ forces the scalar to vanish. This covers the trivial character and cyclotomic twists by $1$ and $-1$. Source: Khare–Wintenberger II, Lemma 4.3$2$$i$ and proof, p. 40; the adjoint representation object itself belongs to G7.

Principal targets: `image-of-restriction-to-a-subfield`, `restriction-to-the-cyclotomic-field`. The prototype has signatures for the intersection calculation, both disjoint images, perfect-subgroup persistence, the exceptional cyclotomic cases, determinant equality, cyclotomic noncontainment and the trace-zero assertion.

## 8. Normal subgroups, automorphisms and minimum index

For $q\ge4$, SL₂(Fq) is perfect and PSL₂(Fq) is simple. A normal subgroup of GL₂(Fq) is central or contains SL₂(Fq). The normal subgroups of SL₂ are $1$, its centre, and itself. For odd $q$, those of PGL₂ are $1$, PSL₂ and PGL₂; for even $q$, PSL₂=PGL₂ is simple. For $q\ge3$, determinant gives the GL₂ abelianization $\mathbf F_q^\times$, and the PGL₂ abelianization is $\mathbf F_q^\times/(\mathbf F_q^\times)^2$. The bound three in the latter statements matters. GL₂(F₂)=S₃ has the additional normal order-three subgroup; GL₂(F₃) has normal subgroups $1,Z,Q_8,\mathrm{SL}_2,\mathrm{GL}_2$, while PGL₂(F₃)=S₄ and PSL₂(F₃)=A₄. Sources: Dickson, §§260–262, pp. 285–287; Allen et al., proof of Lemma 7.1.8$2$, p. 1092. Perfectness and simplicity use existing pinned declarations, rather than new nodes.

**Semilinear automorphisms.** For every $q\ge4$, each automorphism of PSL₂(Fq), and each automorphism of PGL₂(Fq), is uniquely conjugation by $x\in\mathrm{PGL}_2(\mathbf F_q)$ composed with a field automorphism. There is no additional rank-one graph automorphism. Source: Steinberg 1960, Theorem 3.2, §§3.3–3.6, p. 608; rank-one relations §4.10, p. 610; proof §§5.1–5.2, pp. 610–611, and §5.7 with completion, pp. 612–613. This source was read directly.

For the proof, transport a Sylow $p$-subgroup and its distinguished projective point, normalise the opposite root group and torus, and compare their parameters. Root addition forces additivity; torus/root conjugation and the rank-one relations force multiplicativity. The remaining scaling is represented by PGL conjugation. Uniqueness follows from the trivial centralizer of PSL₂ in PGL₂ and faithfulness of the field action on root parameters. For PGL₂, its characteristic derived subgroup is PSL₂; every PSL automorphism has the specified extension. Two such extensions differ by an automorphism fixing PSL₂ pointwise, hence are equal because the centralizer is trivial. This supplies the previously missing primary-source proof, including $q=4,9$.

The subdirect-product consequence is that a subgroup surjecting to two copies of a nonabelian simple PSL₂ is either their whole product or the graph of a semilinear automorphism. Products of $r$ copies have independent automorphisms on each factor followed by a permutation:
\[
\operatorname{Aut}(S^r)=\operatorname{Aut}(S)^r\rtimes S_r.
\]
For projective kernel fields with standard images of a fixed characteristic, their intersection is the base field, a common quadratic field when both images are odd PGL groups, or the entire common projective field when the groups agree and the quotient representations differ by a semilinear automorphism. Goursat's lemma and the normal-subgroup list prove this. General Goursat/Clifford machinery remains upstream; this is the rank-one consumer. Source context: Boxer–Calegari–Gee–Newton–Thorne, Lemmas 5.2.3–5.2.4, published pp. 45–47. Its proof on p. 47 omits the exponent $r$ on the automorphism factor; the correction is already registered as `PAPER-BOXER-CALEGARI-GEE-ETAL-25/E26` and is carried by reference in this packet.

The minimum index of a proper subgroup of PSL₂(Fq) is $q+1$, except for $q=2,3,5,7,9,11$, where the values are $2,3,5,7,6,11$. A Borel provides index $q+1$; the classification compares its size with dihedral, exceptional and subfield subgroups, giving both the lower bound and the listed exceptions. Proper subgroups of SL₂ obey the same $q+1$ bound for $q\ge4$ outside $5,7,9,11$, since a subgroup projecting onto PSL₂ is all SL₂ in that range. Source: Dickson, §262 and proof, pp. 286–287. The exceptional indices are actual attained minima, not merely loose lower bounds.

Principal targets: `normal-subgroups-and-automorphisms-of-psl2-pgl2`, `minimal-index-of-proper-subgroups-of-psl2`. New target: `semilinear-projective-automorphisms`. Dependencies: §4 classification, root groups, pinned perfectness/simplicity, and the existing projective quotient.

## 9. Persistence and the tame-inertia criterion

Let $p\ge5$ and let a finite $G\le\mathrm{GL}_2(\bar{\mathbf F}_p)$ contain a fixed conjugate of SL₂(Fpᵃ). If $a\ge2$, a subgroup of $G$ of index less than (2p) contains the same conjugate. Restrict the action on cosets to this special linear group. Its proper stabilizers would have index at least the minimum in §8. This is at least (2p), including the only relevant exceptional subfield $q=9$; the strict index inequality excludes it. The exponent condition cannot be dropped: at $a=1$ a Borel has index $p+1<2p$. Source: Newton–Thorne, Lemma 2.3$3$, arXiv v2 p. 11, for the source's $a\ge a_0(p)\ge3$; the stated group strengthening to $a\ge2$ follows from Dickson's exact minimum-index calculation. Soluble-base-change persistence is the perfect-subgroup result of §7, with no exponent restriction beyond perfectness.

For a continuous residual $\rho:G_{\mathbf Q}\to\mathrm{GL}_2(\bar{\mathbf F}_p)$, $p\ge5$, suppose it is unramified outside $p$, its local representation at $p$ is absolutely irreducible, and its inertia representation is
\[
\omega_2^a\oplus\omega_2^{pa},\qquad\gcd(a,p+1)=1.
\]
Then its image contains a conjugate of SL₂(Fp). The projective inertia order is $p+1>5$, excluding the exceptional groups. Local absolute irreducibility excludes a global Borel or cyclic group. In the remaining dihedral case the inducing quadratic field would be unramified outside $p$, hence $\mathbf Q(\sqrt{p^*})$; it would be bad dihedral and have projective inertia order two, contradicting (p+1). Dickson leaves a standard large image. Source: the group argument in Boxer–Calegari–Gee, proof of Theorem 3.1, published p. 516. The source's modular representation and $p>5$ setting is replaced here by the explicit pure Galois hypotheses; the same argument covers $p=5$. No automorphic large-image statement is imported without its separate input.

Principal target: `large-image-persistence`. Dependencies: §§3, 6–8, finite-image factorisation, and R01.2 local fundamental characters and unramifiedness.

## 10. Characteristic-two matrix modules and cohomology

Let $k_0\subset k$ be fields of characteristic two, with $k_0$ finite of cardinal $q\ge4$, and let SL₂(k₀) act on $M_2(k)$ by conjugation. Put $Z=kI$ and $\mathrm{Ad}^0=\ker\operatorname{tr}$. The invariant matrices are exactly $Z$; the invariants of $M_2(k)/Z$ are zero. The latter assertion is stronger than the first: if every conjugation difference is scalar, then the matrix is scalar. The only stable subspaces, when $k$ is finite as in the principal target, are $0,Z,\mathrm{Ad}^0,M_2(k)$. Moreover $\mathrm{Ad}^0/Z$ is the irreducible Frobenius twist of the standard plane: $\begin{pmatrix}a&b\\c&d\end{pmatrix}$ acts on the off-diagonal coordinates by $\begin{pmatrix}a^2&b^2\\c^2&d^2\end{pmatrix}$. All one-dimensional characters are trivial by perfectness. Sources: Khare–Wintenberger II, Lemma 4.3$2$(ii), $5$ and proof, pp. 40–41.

Elementary matrices give the centralizer and quotient-invariant calculations. The trace pairing identifies $M_2/Z$ with the dual of $\mathrm{Ad}^0$; the off-diagonal formula identifies its two-dimensional quotient, whose irreducibility follows from the standard root actions. The possible stable subspaces are then constrained by these composition factors. The suggestion gives the off-diagonal map, its scalar kernel, surjectivity and the squared-entry action, in addition to the stable-subspace target.

**All-field cohomology theorem.** For the same $k_0\subset k$, with arbitrary extension field $k$,
\[
H^1(\mathrm{SL}_2(k_0),M_2(k))=0
\]
for conjugation. In concrete terms, every function satisfying
\[
f(gh)=f(g)+g f(h)g^{-1}
\]
has the form $f(g)=gXg^{-1}-X$ for one matrix $X$. Khare–Wintenberger II, Lemma 4.3$5$$i$, pp. 40–41, cites Dickinson's Lemma 42; that source was not accessible and is not claimed read. The following elementary proof supplies the entire required vanishing, avoiding an unread theorem.

1. Average over the diagonal torus $T$, whose order $q-1$ is odd. Subtract the resulting coboundary so that $f|_T=0$.
2. Write $u(t)=\begin{pmatrix}1&t\\0&1\end{pmatrix}$. Since $u(t)^2=1$, the cocycle identity forces $f(u(t))=\begin{pmatrix}A(t)&B(t)\\0&A(t)\end{pmatrix}$. The root-group law makes (A,B) additive.
3. Torus conjugation gives $A(a^2t)=A(t)$ and $B(a^2t)=a^2B(t)$. Squaring is a bijection on $k_0$. Thus $A$ is constant on nonzero parameters. Choosing distinct nonzero (s,t) with $s+t\ne0$, possible since $q\ge4$, forces that constant to vanish. Also $B(t)=tB(1)$.
4. The coboundary of $\operatorname{diag}(B(1),0)$ has this value on (u(t)) and vanishes on $T$. Subtract it; the cocycle is now zero on the whole upper Borel $B=TU$.
5. It is constant on right $B$-cosets. Average its values over $G/B$, whose size $q+1$ is odd. Left multiplication permutes the cosets. Applying the cocycle equation to this average gives a global coboundary.

Both averaging denominators are invertible in every characteristic-two extension field. The proof treats the full matrix module, including scalars, and works for every $q=2^r$, $r\ge2$. It does not assert the same argument at $q=2$. Guralnick–Herzig–Tiep, Corollary 9.4 and proof, pp. 1282–1283, corroborates self-extension vanishing; its cited Ext calculation is not used here. The prototype states the actual cocycle equation and existential coboundary, which connects to the pinned low-degree group-cohomology API.

Principal target: `characteristic-two-residual-image-facts`. New target: `characteristic-two-matrix-cocycles`. Dependencies: elementary matrices, the Sylow/Borel description in §4, trace pairing, R01.1 standard representations, and Mathlib's cocycle interpretation. The nonsoluble dyadic image clause is supplied in §3.


## Definition APIs and acceptance tests

Each new definition or construction below has six API entries and at least four discriminating tests. An API entry names the suggested declaration, states its contract, and records why a consumer needs it. Mathematical tests are proposed examples with proof placeholders, not executable assertions of an implemented result. The accepted odd-representation and bad-dihedral definitions retain their existing APIs and examples, including the splitting field of (X^3-X-1) at 23 and the absolutely reducible representations that their predicates must reject.

### Complex conjugation at a real place

Node: `ArithmeticGaloisRepresentations:R01.4/complex-conjugation`. Namespace: `TauCeti.GaloisRep`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GaloisRep.lean`.

For a number field F, a real infinite place v, and an embedding ι:F̄→ℂ inducing v, construct the unique c_ι∈G_F satisfying ι(c_ι x)=conj(ι x) for every x∈F̄. Choose one such element c_v from v alone. It has order two. Any two choices over the same v are conjugate in G_F. The embedding is not an inverse map on all of ℂ: the inverse used in the construction is on the algebraic closure of ι(F) inside ℂ.

| Suggested API | Contract |
|---|---|
| `TauCeti.GaloisRep.complexConjugationOfEmbedding` | Given ι above a real place, return the transported F-automorphism of F̄. |
| `TauCeti.GaloisRep.complexConjugationOfEmbedding_spec` | ι(c_ιx)=conj(ιx) for every x. |
| `TauCeti.GaloisRep.complexConjugationOfEmbedding_unique` | An F-automorphism satisfying the intertwining identity equals c_ι. |
| `TauCeti.GaloisRep.complexConjugation_spec` | There exists an embedding above v for which the chosen c_v satisfies the same identity. |
| `TauCeti.GaloisRep.complexConjugation_sq` | c_v²=1, c_v≠1, and order(c_v)=2. |
| `TauCeti.GaloisRep.isConj_complexConjugation` | Every transported c_ι above v is conjugate to c_v in G_F. |

Acceptance examples:

1. `TauCeti.GaloisRep.complexConjugation_on_sqrt_minus_one`: If i²=−1 in F̄ then c_ι(i)=−i. The identity automorphism fails this test.
2. `TauCeti.GaloisRep.complexConjugation_on_real_base`: c_ι fixes every algebraMap(F,F̄)(a), because the chosen place is real.
3. `TauCeti.GaloisRep.complexConjugation_on_primitive_root`: For a root of unity ζ in F̄, c_ι(ζ)=ζ⁻¹; this agrees with complex conjugation and the cyclotomic character.
4. `TauCeti.GaloisRep.complexConjugation_change_embedding`: If ι′=ι∘g for g∈G_F, then c_ι′=g⁻¹c_ιg, without asserting equality of the chosen elements.

Consumers: ArithmeticGaloisRepresentations:R01.4/odd-representation — Makes the determinant condition at each real place independent of the embedding.; ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness — Computes the action on roots of unity and hence the determinant of Tate modules.

### Totally odd characters

Node: `ArithmeticGaloisRepresentations:R01.4/totally-odd-character`. Namespace: `TauCeti.GaloisRep`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GaloisRep.lean`.

For a commutative ring A and a homomorphism μ:G_F→A×, IsTotallyOddChar μ means μ(c_v)=−1 for every real infinite place v of F. Continuity is required when μ is used as an arithmetic character, but is not part of this algebraic predicate. The condition is invariant under the choice of c_v. When F has no real places it is vacuous. The existing odd-representation node defines oddness of a rank-two finite projective representation by this predicate on its determinant character.

| Suggested API | Contract |
|---|---|
| `TauCeti.GaloisRep.IsTotallyOddChar` | μ is totally odd exactly when μ(c_v)=−1 at every real v. |
| `TauCeti.GaloisRep.isTotallyOddChar_iff_embeddings` | The same equalities hold for every embedding of F̄ into ℂ above a real place. |
| `TauCeti.GaloisRep.isTotallyOddChar_map` | A ring map A→B preserves total oddness; an injective map also reflects it. |
| `TauCeti.GaloisRep.isTotallyOddChar_restrict` | Restriction to a finite extension preserves the condition at every real place of the extension. |
| `TauCeti.GaloisRep.isTotallyOddChar_mul_square` | μψ² is totally odd iff μ is; ψ(c_v)²=1. |
| `TauCeti.GaloisRep.isOdd_iff_isTotallyOddChar` | A rank-two representation is odd iff its determinant character is totally odd. |

Acceptance examples:

1. `TauCeti.GaloisRep.totallyOdd_trivial_Five`: The trivial character of G_ℚ with values in F₅× is not totally odd.
2. `TauCeti.GaloisRep.totallyOdd_cyclotomic`: The mod-p cyclotomic character of G_ℚ is totally odd for every odd prime p.
3. `TauCeti.GaloisRep.totallyOdd_reduced_charTwo`: Every character to the units of a reduced ring with 2=0 is totally odd; over F₂[ε]/(ε²), the quadratic character of ℚ(i) with c↦1+ε fails the condition.
4. `TauCeti.GaloisRep.totallyOdd_every_real_place`: For F=ℚ(√2), the character of F(√√2)/F with values in F₃× takes 1 at √2>0 and −1 at √2<0; it is not totally odd.
5. `TauCeti.GaloisRep.totallyOdd_no_real_place`: When F has no real places, including F=ℚ(i), every character is totally odd.

Consumers: ArithmeticGaloisRepresentations:R01.4/odd-representation — Is the basis-independent determinant predicate, including coefficient extension and twisting.; PotentialModularityAndCompatibleSystems:R24.6/residual-members — Reduction of an odd determinant preserves its real-place values.

### Split Cartan subgroups

Node: `ArithmeticGaloisRepresentations:R01.4/split-cartan`. Namespace: `TauCeti.GL2Cartan`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GL2Cartan.lean`.

For a two-dimensional k-vector space V and distinct one-dimensional subspaces D₁,D₂, split(D₁,D₂) is the subgroup of GL(V) preserving each line individually. It is naturally the product of the automorphism groups of the two lines, and after choosing a nonzero vector in each line it is (k×)². The definition uses ordered lines, but the subgroup is unchanged by swapping them. Its matrix model under an adapted basis is the already implemented TauCeti.diagonalTorus k 2.

| Suggested API | Contract |
|---|---|
| `TauCeti.GL2Cartan.split` | Return the simultaneous line stabiliser as a subgroup of GL(V). |
| `TauCeti.GL2Cartan.mem_split_iff` | g∈split(D₁,D₂) iff gD₁=D₁ and gD₂=D₂. |
| `TauCeti.GL2Cartan.split_comm` | split(D₁,D₂)=split(D₂,D₁). |
| `TauCeti.GL2Cartan.splitEquivUnits` | An adapted basis identifies split(D₁,D₂) with k××k×. |
| `TauCeti.GL2Cartan.split_diagonalTorus` | For b=(v₁,v₂) with vᵢ spanning Dᵢ, mapping TauCeti.diagonalTorus k 2 along Matrix.GeneralLinearGroup.toLin′ b gives split(D₁,D₂). |
| `TauCeti.GL2Cartan.split_conj` | Conjugation by g gives split(gD₁,gD₂). |

Acceptance examples:

1. `TauCeti.GL2Cartan.split_card_Five`: The split Cartan in GL₂(F₅) has order 16 and its normaliser has order 32.
2. `TauCeti.GL2Cartan.split_trivial_q_two`: Over F₂ the split Cartan is trivial and its normaliser has order 6, with index 6 rather than 2.
3. `TauCeti.GL2Cartan.split_diagonal_baseline`: For the coordinate axes, the transported subgroup is exactly TauCeti.diagonalTorus k 2.
4. `TauCeti.GL2Cartan.swap_not_mem_split`: The coordinate swap over F₅ normalises the split Cartan but is not in it. Defining an unordered-pair stabiliser would fail this test.

Consumers: Serre 1972, Propositions 14–18, pp. 279–283 — Distinguishes Cartans from their normalisers and half-Cartans in subgroup recognition.; Caraiani–Newton, Lemma 7.1.1(2), p. 92 — Identifies the exceptional mod-3 normaliser through its split Cartan.

### Split half-Cartan subgroups

Node: `ArithmeticGaloisRepresentations:R01.4/half-cartan`. Namespace: `TauCeti.GL2Cartan`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GL2Cartan.lean`.

For distinct lines D₁,D₂ in a plane V over k, halfSplit(D₁,D₂) consists of the automorphisms preserving D₁ and fixing D₂ pointwise. In an adapted basis it is diag(a,1), a∈k×. It is isomorphic to k× through the determinant. Multiplying it by the scalar subgroup gives split(D₁,D₂); both have the same projective image. For finite q≥3 it determines the unique split Cartan containing it.

| Suggested API | Contract |
|---|---|
| `TauCeti.GL2Cartan.halfSplit` | Return the subgroup preserving D₁ and fixing every vector of D₂. |
| `TauCeti.GL2Cartan.mem_halfSplit_iff` | g belongs iff gD₁=D₁ and g x=x for every x∈D₂. |
| `TauCeti.GL2Cartan.halfSplit_le_split` | halfSplit(D₁,D₂)≤split(D₁,D₂). |
| `TauCeti.GL2Cartan.halfSplitEquivUnits` | The determinant identifies the half-Cartan with k×. |
| `TauCeti.GL2Cartan.halfSplit_sup_center` | The subgroup generated by the half-Cartan and scalars equals the split Cartan; their projective images agree. |
| `TauCeti.GL2Cartan.halfSplit_unique_split` | For finite q≥3, a split Cartan containing this half-Cartan equals split(D₁,D₂). |

Acceptance examples:

1. `TauCeti.GL2Cartan.halfSplit_card_Five`: Over F₅ the half-Cartan has order 4, compared with order 16 for the split Cartan.
2. `TauCeti.GL2Cartan.halfSplit_second_axis`: diag(1,2) over F₅ is in the full split Cartan but not the half-Cartan fixing the second axis; diag(2,1) is in the half-Cartan.
3. `TauCeti.GL2Cartan.halfSplit_det_baseline`: On diag(a,1), Mathlib Matrix.GeneralLinearGroup.det returns a, giving the stated equivalence.
4. `TauCeti.GL2Cartan.halfSplit_q_two`: Over F₂ the half-Cartan is trivial; distinct unordered pairs of lines give the same subgroup, so uniqueness of the defining pair fails.

Consumers: Serre 1972, Propositions 14, 17, 18, pp. 279–283 — The half-Cartan hypothesis is weaker than containing the full split Cartan and still forces the image alternatives.

### Basis-free non-split Cartan subgroups

Node: `ArithmeticGaloisRepresentations:R01.4/basis-free-nonsplit-cartan`. Namespace: `TauCeti.GL2Cartan`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GL2Cartan.lean`.

Let k be a finite field and V a k-vector space of dimension two. For a subalgebra E⊂End_k(V) that is a field and has dimension two over k, nonsplit(E) is the image of E× in GL(V). This is a basis-free unit subgroup, not a replacement for the existing coordinate TauCeti.GL2NonSplitTorus. V is free of rank one over E. An E-linear identification V≃E, followed by TauCeti.nonSplitTorusBasis, transports nonsplit(E) to that existing left-multiplication matrix subgroup.

| Suggested API | Contract |
|---|---|
| `TauCeti.GL2Cartan.nonsplit` | The range of the unit homomorphism E×→GL(V). |
| `TauCeti.GL2Cartan.mem_nonsplit_iff` | g belongs iff its underlying endomorphism is a nonzero element of E. |
| `TauCeti.GL2Cartan.nonsplitEquivUnits` | E×≃nonsplit(E), with forward map the subalgebra inclusion on units. |
| `TauCeti.GL2Cartan.nonsplit_GL2NonSplitTorus` | For V=E with left-multiplication subalgebra, the subgroup in TauCeti.nonSplitTorusBasis is exactly TauCeti.GL2NonSplitTorus k E hE. |
| `TauCeti.GL2Cartan.nonsplit_trace_det` | Multiplication by a∈E× has trace Tr_E/k(a) and determinant N_E/k(a). |
| `TauCeti.GL2Cartan.nonsplit_conj` | Conjugating the field subalgebra conjugates its unit subgroup. |

Acceptance examples:

1. `TauCeti.GL2Cartan.nonsplit_card_Three`: For E=F₉ acting on itself over F₃, the unit subgroup has order 8, and its normaliser has order 16.
2. `TauCeti.GL2Cartan.nonsplit_card_Two`: For E=F₄ over F₂, the unit subgroup is cyclic of order 3 and its normaliser is GL₂(F₂) of order 6.
3. `TauCeti.GL2Cartan.nonsplit_eq_GL2NonSplitTorus`: The regular-representation subgroup mapped through nonSplitTorusBasis equals the pinned Tau Ceti subgroup.
4. `TauCeti.GL2Cartan.nonsplit_no_rational_line`: The F₉× subgroup of GL₂(F₃) preserves no F₃-line. Treating the split algebra F₃×F₃ as a quadratic field would fail this test.

Consumers: Serre 1972, §§2.1–2.2, pp. 279–280 — Normalisers are field-semilinear operators.; Caraiani–Newton, Lemma 7.1.1(3), p. 92 — Places the exceptional mod-5 image in a non-split Cartan normaliser.

### The projective trace field

Node: `ArithmeticGaloisRepresentations:R01.4/projective-trace-field`. Namespace: `TauCeti.GL2Subgroup`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GL2Subgroup.lean`.

For a subgroup G≤GL₂(k) over a field k, projectiveTraceField(G) is the smallest subfield of k containing Tr(g)²/det(g) for every g∈G. This scalar is unchanged by conjugation or multiplication of g by a scalar unit, so the field is an invariant of the projective image with its embedding in PGL₂(k). It is not defined as the field generated by the matrix entries. In the standard nonsolvable PSL₂/PGL₂ alternatives it is the coefficient field F₀ used by the accepted classification nodes.

| Suggested API | Contract |
|---|---|
| `TauCeti.GL2Subgroup.projectiveTraceField` | The subfield closure of the set Tr(g)²/det(g). |
| `TauCeti.GL2Subgroup.projectiveTraceField_le_iff` | It is contained in E⊂k iff every projective trace lies in E. |
| `TauCeti.GL2Subgroup.projectiveTraceField_conj` | Conjugation of G in GL₂(k) leaves the field unchanged. |
| `TauCeti.GL2Subgroup.projectiveTraceField_scalars` | Adjoining all scalar units to G leaves the field unchanged. |
| `TauCeti.GL2Subgroup.projectiveTraceField_map` | For a field embedding f:k→k′, the trace field of f(G) is the image under f of the trace field of G. |
| `TauCeti.GL2Subgroup.projectiveTraceField_standard` | For a standard SL₂(E) or GL₂(E) image with finite \|E\|≥4, the field equals E as a subfield of k. |

Acceptance examples:

1. `TauCeti.GL2Subgroup.projectiveTraceField_scalar`: The scalar subgroup has prime trace field (the bottom subfield), also in characteristic two where every generator is zero.
2. `TauCeti.GL2Subgroup.projectiveTraceField_Four_in_Sixteen`: For SL₂(F₄) embedded in GL₂(F₁₆), the trace field has 4 elements, not 16.
3. `TauCeti.GL2Subgroup.projectiveTraceField_conjugated_subfield`: Conjugating that SL₂(F₄) by a matrix over F₁₆ outside GL₂(F₄) leaves the field F₄, even when some matrix entries leave F₄.
4. `TauCeti.GL2Subgroup.projectiveTraceField_scalar_trace_ratio`: For λ∈k× and g∈GL₂(k), the two projective trace ratios of g and λg agree; the expression Tr(g)/det(g) would fail this test.

Consumers: ArithmeticGaloisRepresentations:R01.4/projective-image-and-its-coefficient-field — Exports the field appearing in the standard projective image.; ArithmeticGaloisRepresentations:R01.4/linear-image-over-the-projective-trace-field — Pins the coefficient field of the commutator SL₂ group and the containing scalar-GL₂ group.

### The cyclotomic square subfield

Node: `ArithmeticGaloisRepresentations:R01.4/cyclotomic-square-subfield`. Namespace: `TauCeti.GaloisRep`. Proposed module: `TauCeti/NumberTheory/GaloisRepresentation/ResidualImage/GaloisRep.lean`.

For a number field F and an odd prime p, let K=F(ζ_p) inside F̄ and H=Gal(K/F). Define cyclotomicSquareSubfield(F,p) as the lift to F̄ of the fixed field K^{H²}, where H²={h²:h∈H}; H is cyclic, so these squares form a subgroup. This field E equals F if [K:F] is odd, and is the unique quadratic subextension of K/F if the degree is even. For F=ℚ it is ℚ(√p*) with p*=(−1)^((p−1)/2)p, also the field generated by a primitive quadratic Gauss sum. Formation of E is not asserted to commute with arbitrary base change.

| Suggested API | Contract |
|---|---|
| `TauCeti.GaloisRep.cyclotomicSubfield` | Adjoin the primitive p-th roots to F inside F̄. |
| `TauCeti.GaloisRep.cyclotomicSquareSubfield` | Lift the fixed field of the subgroup of squares in Gal(K/F). |
| `TauCeti.GaloisRep.cyclotomicSquareSubfield_le` | F≤E≤K as intermediate fields of F̄/F. |
| `TauCeti.GaloisRep.cyclotomicSquareSubfield_degree` | [E:F]=1 when [K:F] is odd and 2 when [K:F] is even. |
| `TauCeti.GaloisRep.cyclotomicSquareSubfield_unique` | Every quadratic intermediate field of K/F is E; one exists exactly when [K:F] is even. |
| `TauCeti.GaloisRep.cyclotomicSquareSubfield_rat` | For ℚ it equals the adjoin of a root of X²−p* and the adjoin of a primitive quadratic Gauss sum. |

Acceptance examples:

1. `TauCeti.GaloisRep.cyclotomicSquareSubfield_rat_three`: At F=ℚ,p=3, E=K=ℚ(√−3).
2. `TauCeti.GaloisRep.cyclotomicSquareSubfield_rat_five`: At F=ℚ,p=5, E=ℚ(√5) is a proper quadratic subfield of K of degree four.
3. `TauCeti.GaloisRep.cyclotomicSquareSubfield_odd_degree`: If [F(ζ_p):F] is odd, E=F; in particular this holds when ζ_p∈F.
4. `TauCeti.GaloisRep.cyclotomicSquareSubfield_sqrt_five`: At F=ℚ(√5),p=5, E=ℚ(ζ₅)≠F, whereas adjoining √p* to F gives F.

Consumers: ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representation — Specifies the exact subgroup on which absolute irreducibility fails.; ArithmeticGaloisRepresentations:R01.4/bad-dihedral-representations-and-the-oddness-criterion — The square subgroup of a cyclic cyclotomic quotient fixes the possible two stable lines.


## Coverage and source accounting

The preceding sections state every inherited principal target, including all eight cyclotomic clauses and the small-field, Sylow-count, class-equation, induction-uniqueness, minimum-index and characteristic-two clauses that the earlier prototype left in comments. The packet's `inheritedRemainingResolution` maps all 19 inherited obligations to these sections and their typed interfaces. The two R01.4 proof/source gaps are supplied by the Steinberg specialization and the explicit matrix-cocycle proof. The missing arithmetic niveau-two acceptance example is supplied by (X^4+3). The parent packet's separate G7 adequacy/Schur issue is outside this layer and is neither cleared nor hidden by this supplement.

The packet records exact versions, public URLs, read sections and SHA-256 hashes for the source PDFs used in this continuation. Serre 1972 was read from the scanned pages; a missing text layer was not interpreted as missing mathematics. Sources are used for individual target statements or their inputs, with extensions explicitly identified above. No book marked restricted in the maintainer's library index was used. No source passage is reproduced.

Two known source corrections are carried by reference: the small-field failure in the normal-determinant argument of Allen et al., already recorded by the parent packet and the source register, and the missing exponent in the product-automorphism formula of Boxer et al., `PAPER-BOXER-CALEGARI-GEE-ETAL-25/E26`. The latter was checked in both arXiv v3 p. 52 and the published version p. 47. Corrected hypotheses/formulas appear in the targets. This is not a new source audit or a claim that every paper has no other errors.

| Source and version read | Target locators read |
|---|---|
| [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Lemma 7.1.6 and proof, printed p. 1090; Lemma 7.1.8(2) and proof, printed pp. 1091–1092 |
| [Cuspidal cohomology classes for GL_n(Z)](https://www.math.uchicago.edu/~fcale/papers/WeightZero.pdf) | Theorem 3.1 and its image argument, printed p. 516 |
| [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880v3) | Lemmas 5.2.2–5.2.4 and proof, arXiv v3 pp. 51–52; Proposition 6.2.3 hypothesis (13) and proof, p. 62; published Lemma 5.2.4 proof, p. 47, compared for the known product-automorphism misprint |
| [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3) | §6.2, p. 91; Lemma 6.1.4 and proof, p. 88; Lemma 7.1.1 and proof, p. 92, arXiv v3 |
| [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) | §2.1, p. 55; Theorem 2.47, p. 81; Theorem 2.49, p. 82; Remark 3.11, p. 89 |
| [Linear groups with an exposition of the Galois field theory](https://archive.org/download/lineargroupswith00dickuoft/lineargroupswith00dickuoft.pdf) | Chapter XII, §§239–262, printed pp. 260–287; especially §§251–254, pp. 272–279, and §§258–259, pp. 282–285 |
| [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2) | §1.5, Definition 1.12, Lemmas 1.13–1.14 and their proofs, Remark 5, preprint pp. 7–9 |
| [Adequate subgroups and indecomposable modules](https://ems.press/content/serial-article-files/32200?nt=1) | Corollary 9.4 and proof, pp. 1282–1283; corroboration, not a dependency on its quoted Ext calculation |
| [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | §1, p. 2; §6, Lemmas 6.1–6.2 and proofs, pp. 10–11 |
| [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | §4.1.4, Lemma 4.3 and proof, preprint pp. 40–41 |
| [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2) | Lemma 2.3(3), arXiv v2 p. 11; group discussion after Theorem 4.1, p. 26 |
| [Propriétés galoisiennes des points d'ordre fini des courbes elliptiques](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf) | §§2.1–2.7, Propositions 14–18 and remarks, printed pp. 278–283; scanned page images read |
| [Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | §1.3, (1.3.7)–(1.3.9), printed p. 182; §3.3, p. 198 |
| [Automorphisms of Finite Linear Groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/16023F257E0F21D57873B1450E9F15E4/S0008414X00010245a.pdf/div-class-title-automorphisms-of-finite-linear-groups-div.pdf) | §§2–3, p. 607–608; rank-one relations §4.10, p. 610; §§5.1–5.2, pp. 610–611; §5.7 and completion, pp. 612–613 |

The hashes and access dates are in `sourceVersions` of the packet. The published Boxer et al. comparison used [the Cambridge version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/0A073881B84E8654DB6D11D064B78A4B/S2050508624000295a.pdf/the-ramanujan-and-sato-tate-conjectures-for-bianchi-modular-forms.pdf), Lemma 5.2.4, p. 47.
