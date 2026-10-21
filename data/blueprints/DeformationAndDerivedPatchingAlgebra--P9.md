# Amplitude, depth and component support

This is layer **DeformationAndDerivedPatchingAlgebra:P9**. It specifies the algebra which turns a patched perfect complex into a concentration or support statement. Its inputs are complexes, commutative rings, finite algebra actions and explicit numerical and component hypotheses. Arithmetic construction of those inputs belongs to P8 and to PotentialAutomorphyInfrastructure:PA.3. The outputs distinguish concentration of a complex, support on selected components, full support, near faithfulness and a reduced deformation-to-Hecke comparison.

There are two main mechanisms. Over a regular local ring, a bound on Tor-amplitude gives a lower bound on the dimension of the support. When the dimension bound in the opposite direction matches it, the complex concentrates at the upper endpoint. For comparison between different patched systems, concentration at one characteristic-zero fibre gives a component with nonzero generic Euler length. A regular-divisor length formula and compatible residual actions carry that nonvanishing through the comparison system to every component of maximal dimension. This second mechanism retains complexes and their torsion throughout the comparison.

The packet is a complete lemma-level planning pass with P9 coverage **planned**. Its prerequisite graph records two gaps and three supplier contracts, described at the end. It is not a claim of formalization or of mathematical closure at the pinned library. Definitions, APIs and tests are mathematical specifications. The accompanying suggested file checks the expressible native interfaces and identifies its incomplete source-hypothesis forms explicitly.

## Inputs and ownership

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The existing library already supplies module supports, annihilators, localization, extended-natural module length, length additivity, regular sequences, regular local rings, projective dimension, native derived categories, cohomology functors and their long exact sequences. Tau Ceti's `AbelianK0.AdditiveInvariant.sum_negOnePow_obj_X_eq_sum_negOnePow_obj_homology` supplies generic bounded Euler–Poincaré bookkeeping. P9 specializes this material rather than constructing another derived category or another generic Euler invariant.

The following suppliers retain their ownership:

| Supplier | Precise input used here |
| --- | --- |
| P7/perfect-object, minimal-residual-ranks, residual-perfectness-criterion | Perfectness and finite projective representatives detected through a local residue-field fibre. |
| P7/pseudo-coherent-residual-nakayama | Detection of a zero perfect local object by its derived residue fibre. |
| P7/p7ii-derived-extension and p7ii-finite-projective-interval | Exact derived coefficient change and realization of a prescribed Tor-amplitude interval by finite projective terms. |
| P7/p7ii-coefficient-spectral-sequence, coefficient-spectral-convergence and coefficient-spectral-flat | The signed Tor coefficient spectral sequence, its finite filtration on actual cohomology, and flat coefficient comparison. |
| R03.3/depth-auslander-buchsbaum-and-dimension-bounds | Module depth, the submodule dimension bound, finite global dimension of regular local rings, Auslander–Buchsbaum and localization regularity. |
| R03.3/regular-local-cohen-macaulay and free-of-maximal-depth-regular-local | Depth of the regular base and finite maximal-depth freeness. |
| R03.6/support-base-change and framing-variables | Existing module support transport and the power-series augmentation quotient. |
| R03.6/nearly-faithful, nearly-faithful-iff-support-eq-univ and nearly-faithful-after-inverting | The radical convention, finite-module full-support criterion and inversion of a ring nonzerodivisor. |
| R03.6/patched-module-support-theorem and reduced-quotient results | The module conclusions after a complex has actually concentrated and the exact module patching hypotheses have been supplied. |
| Current DGAInfinity, Layer 5 | Existing DG perfect envelopes and Karoubi completion; its native bounded-derived comparison is a requested Part II interface. |

Generic derived tensor and Hom remain with their established P7/upstream suppliers. Generic Koszul complexes remain with their established owner; the explicit rank-one and length-two resolutions below are computations, not another general construction. The current upstream DGAInfinity and GrothendieckEulerForms documents and suggested files were checked alongside the current Tau Ceti library. Their general constructions are not targets of this part.

The algebraic results do not verify automorphic concentration, local deformation-ring dimensions, common residual Hecke images or the existence of auxiliary patched systems. PotentialAutomorphyInfrastructure:PA.3 supplies those arithmetic facts when it consumes P9. P8 produces patched complexes and compatible comparison data. In particular Calegari–Geraghty Proposition 6.6 is the source of a P8 comparison construction; P9 consumes its output rather than duplicating the simultaneous patching argument.

## Conventions and support

All rings are commutative with identity. Complexes are cochain complexes indexed by integers, and the ambient derived category is Mathlib's derived category of the module category. The shift convention is

\[
H^i(C[n])=H^{i+n}(C).
\]

A module placed in cohomological degree $i$ is therefore $M[-i]$. Every Euler sign is $(-1)^i$. The width of the interval $[a,b]$ is $b-a$, not the number $b-a+1$ of permitted terms.

Perfectness is the existing P7 notion: an object is isomorphic in the derived category to a bounded complex of finite projective modules. A chosen representative supported in $[a,b]$, Tor-amplitude in $[a,b]$, and ordinary cohomology concentrated in $[a,b]$ are distinct statements. The Tor-amplitude condition quantifies over **all** coefficient modules. P7 supplies the equivalence between a perfect object of that Tor-amplitude and a finite projective representative in the interval. Ordinary cohomology concentration alone supplies no such representative.

Define the cohomological support and annihilator by

\[
\operatorname{Supp}_R(C)=\bigcup_{i\in\mathbf Z}\operatorname{Supp}_R H^i(C),
\qquad
A_R(C)=\bigcap_{i\in\mathbf Z}\operatorname{Ann}_R H^i(C).
\]

These definitions are meaningful without finite generation or boundedness. Their finite theory assumes bounded finite cohomology: a finite set of degrees contains all nonzero groups, and each group is finite over the ring. Under those hypotheses,

\[
\operatorname{Supp}_R(C)=V(A_R(C)).
\]

The finite set is necessary here: an arbitrary infinite union of closed module supports need not be closed. The zero object has empty support and annihilator the unit ideal. A stalk recovers Mathlib's module support and annihilator. On a direct sum supports form a union and annihilators form an intersection. Shifts preserve both. Derived isomorphisms preserve them without choosing chain representatives.

Support is empty precisely when the derived object is zero. This test uses all cohomology degrees and detects torsion. In a distinguished triangle the support of any term is contained in the union of the other two supports. Equality with a union is a direct-sum assertion; an arbitrary triangle can cancel locally.

For a perfect object, a prime $p$ belongs to its support precisely when its derived fibre over $\kappa(p)$ is nonzero. Localize a finite projective representative at $p$, then apply P7 residual Nakayama. This is the reusable link between cohomological support and derived specialization. The finite hypothesis matters: the fraction field of a DVR is a nonzero module whose closed derived fibre is zero.

Consequently, for **any** ring map $R\to B$,

\[
\operatorname{Supp}_B(C\otimes_R^{\mathbf L}B)
=(\operatorname{Spec}B\to\operatorname{Spec}R)^{-1}
\operatorname{Supp}_R(C)
\]

when $C$ is perfect. At a prime of $B$, the residue field is an extension of the residue field of its contraction in $R$; that field extension detects whether the fibre complex is zero. This statement includes finite flat coefficient extension, faithfully flat descent, localization and nonflat local-condition quotients. Flatness gives the additional degreewise cohomology comparison; it is not needed for the perfect-support formula.

For $S=A[[z_1,\ldots,z_r]]$ and $J=(z_1,\ldots,z_r)$, removing framing means the **derived** augmentation $C\otimes_S^{\mathbf L}A$. Its support identifies with $\operatorname{Supp}_S(C)\cap V(J)$. Cohomology of this augmentation is generally not just $H^i(C)/JH^i(C)$. Tor terms can occupy adjacent degrees even if the original complex has only one cohomology group.

For bounded finite cohomology, full support is equivalent to $A_R(C)\subseteq\sqrt0$. Over a Noetherian ring that ideal is then nilpotent. This is the complex analogue of the R03.6 radical form of near faithfulness, obtained by applying its existing theory to the finite direct sum of the cohomology modules. It does not introduce a competing module predicate. If $f$ is a nonzerodivisor **of the ring**, full support before inversion is equivalent to full support after inverting $f$. This assertion permits $f$-torsion in the cohomology and does not imply faithful scalar action.

## Regular-local amplitude and balanced dimension

Let $R$ be regular local of dimension $n$, and let a nonzero perfect object have Tor-amplitude in $[a,b]$. Put $\ell=b-a\le n$. Then

\[
\dim\operatorname{Supp}_R(C)\ge n-\ell.
\]

Equivalently its support codimension is at most $\ell$. This is the corrected nonzero form of Calegari–Geraghty Lemma 6.2, arXiv v2, pp.65–66. The statement requires a finite projective representative in the prescribed interval; saying only that the object is perfect and its ordinary cohomology lies there is insufficient.

The proof has three precise steps, corresponding to the packet's first-cohomology nodes. Choose a finite projective representative $P$, and let $m$ be the first degree with nonzero cohomology. Its preceding exact portion resolves

\[
K^m=\operatorname{coker}(P^{m-1}\to P^m)
\]

by finite projectives, so $\operatorname{pd}_R K^m\le m-a$. The cocycle quotient embeds $H^m(P)$ in $K^m$. The submodule dimension bound of CG Lemma 6.1, imported from R03.3, and Auslander–Buchsbaum give

\[
\dim\operatorname{Supp}H^m(P)
\ge\operatorname{depth}K^m
=n-\operatorname{pd}K^m
\ge n-(m-a).
\]

Enlarging that support to the union of all cohomology supports proves the inequality. The finite-module hypotheses on both $K^m$ and $H^m(P)$ are retained. The zero complex is excluded before choosing $m$.

If an independent upper bound gives $\dim\operatorname{Supp}(C)\le n-\ell$, these inequalities force $m=b$. Thus the only nonzero cohomology is $M=H^b(C)$, and the representative is a projective resolution of $M$ placed in degree $b$. Three separate declarations record concentration, projective dimension and depth:

\[
\operatorname{pd}_R M=\ell,
\qquad
\operatorname{depth}_R M=\dim\operatorname{Supp}_R M=n-\ell.
\]

The projective resolution first gives the upper bound on projective dimension. The usual depth-versus-support bound and Auslander–Buchsbaum give the reverse bound and the asserted depth. The suggested depth signature uses the existence of an $M$-regular sequence of length $n-\ell$ in the maximal ideal, matching the existing R03.3 convention. It does not invent a numerical depth function at the pin.

The reusable patched-complex theorem assumes this data rather than constructing it: $S$ is regular local of dimension $n$, $C\ne0$ is perfect of Tor-amplitude $[q,q+\ell]$, and a finite $S$-algebra $T$ acts on it with cohomological $T$-support of dimension at most $n-\ell$. Finite algebra support has finite spectral image of the same dimension, so the $S$-support satisfies the needed upper bound. Concentration at $q+\ell$, $S$-depth $n-\ell$ and $S$-projective dimension $\ell$ follow. Finiteness of $T$ over $S$ must be proved or supplied; continuity of an action does not imply it.

The one-degree case is $\ell=0$. It gives a nonzero finite free $S$-module and an isomorphism of the complex with its stalk. The exact module patching data of R03.6 then provide freeness or near-faithfulness over the relevant deformation ring and the corresponding kernel statement. Freeness over the regular patching base alone is not freeness over an arbitrary deformation algebra. A maximal Cohen–Macaulay module can be supported on a proper union of components. Full support requires the extra component hypotheses in its supplier theorem.

All these assertions are integral only when their amplitude and dimension bounds are integral. Flat inversion identifies rational cohomology with localized integral cohomology. Vanishing outside an interval after inverting a uniformizer therefore proves only that those integral groups localize to zero. If they are finite, a power of the uniformizer kills each such group; it does not make the group zero. Component support and rational cohomological concentration address different information.

## Derived actions and finite Euler lengths

Let $S\to T$ be a commutative algebra and $C\in D(S)$. A derived algebra action consists of a unital ring homomorphism

\[
\rho:T\longrightarrow\operatorname{End}_{D(S)}(C)
\]

whose restriction along $S\to T$ is the scalar action. Applying each cohomology functor gives an $S$-compatible $T$-module structure on $H^i(C)$. This structure is induced by the specified derived action; independently chosen cohomology actions do not supply it. A compatible morphism commutes with the two actions in the derived category. In a triangle the connecting morphism must also commute with the shifted action.

If $C$ has cohomology only in $[a,b]$, the ideal of derived endomorphisms inducing zero on every cohomology group is nilpotent: a product of $b-a+1$ such ghosts is zero. A finite canonical truncation filtration supplies the proof. Each ghost passes one step farther through that filtration; after all its steps the product factors through zero. The native equivariant truncation bridge is part of the precise P7 request. The annihilator of all cohomology is thus generally different from the derived action kernel, even though their radicals agree for a bounded object.

For a Noetherian $S$ and perfect $C$, its derived endomorphism module is finite over $S$: compute it with a bounded finite projective representative and take a subquotient of a finite Hom complex. Every commutative $S$-subalgebra $T\subseteq\operatorname{End}_{D(S)}(C)$ is consequently finite. Its action on total cohomology has nilpotent kernel by the ghost statement, so the union of its cohomology supports is all of $\operatorname{Spec}T$. The endomorphism ring itself need not be commutative.

For bounded $C$ whose cohomology has **finite length over $T$**, define

\[
\chi_T(C)=\sum_{i\in s}(-1)^i
\operatorname{length}_T H^i(C),
\]

where $s$ is a finite set containing every nonzero cohomology degree. The value is integral. Mathlib's extended-natural length is converted to a natural number only under the finite-length hypothesis. Adding degrees with zero cohomology does not change the sum. A finite module over a positive-dimensional local ring can have infinite length, so finite generation is not a replacement for finite length in this definition.

Euler length is invariant under equivariant derived isomorphisms, additive on finite direct sums, and multiplied by $(-1)^n$ under shift by $n$. In a compatible distinguished triangle, bounded finite-length cohomology for two terms implies it for the third, and

\[
\chi_T(C_2)=\chi_T(C_1)+\chi_T(C_3).
\]

This follows by decomposing the finite long exact sequence into short exact sequences and using existing module length additivity. It specializes the generic Euler bookkeeping already in Tau Ceti. Nonzero Euler length implies that some cohomology survives. The converse is false: two copies of a field in adjacent degrees have Euler length zero. Concentration in one degree is the extra condition which turns nonzero cohomology into nonzero Euler length in the component seed.

## Generic localization and the divisor identity

An action through derived endomorphisms does not make $C$ a complex of $T$-modules. The generic localization in ACC uses an idempotent and a base localization, not a derived tensor product over this apparent coefficient algebra.

For a Noetherian ring $A$, a prime which is both maximal and minimal splits off a factor $A_m$. Intersect its other minimal primes, apply the Chinese remainder theorem modulo the nilradical and lift the corresponding idempotent through that nilpotent ideal. The selected factor is Artinian local and equals $A_m$. This is ACC Lemma 6.3.3, printed p.1049.

Suppose $T$ is finite over Noetherian $S$, $p$ is a minimal prime of $T$, and $q=p\cap S$. After localization at $q$, the prime of $T_q$ induced by $p$ is both minimal and maximal. Minimality is preserved by localization, and integral incomparability gives maximality above the maximal ideal of $S_q$. Therefore

\[
T_q\cong T_p\times B.
\]

Let $e_p$ select the first factor. Extend $C$ and its action to $S_q$, and split the derived idempotent $\rho_q(e_p)$. Call this summand $C_p$. Its inclusion and projection satisfy the two genuine retract equations. Its bounded finite cohomology satisfies

\[
H^i(C_p)\cong H^i(C)_p
\]

as $T_p$-modules. That local ring is Artinian, so these modules have finite length. Different splittings are canonically isomorphic respecting the inclusion and projection; equivariant maps induce maps on the summands. P9 specifies this specialized algebra-action construction while importing the idempotent splitting theory from the existing upstream owner. The suggested file exposes the concrete retract and cohomological range interfaces and assumes an actual idempotent-completeness instance; it does not assert that this instance is already available for the native bounded derived subcategory.

The scalar length calculation starts with an excellent local irreducible ring $T$, an element $f\in m_T$, and $\dim T/(f)=0$. Then $\dim T\le1$. For a finite module $M$, both $M/fM$ and $M[f]$ have finite length. They are finite modules killed by $f$, hence finite over the Artinian quotient. Define their difference as an integer expression

\[
\delta_f(M)=\operatorname{length}_T(M/fM)
-\operatorname{length}_T(M[f]).
\]

No new independent defect theory is introduced. Its additivity is the snake-lemma calculation for multiplication by $f$ in a short exact sequence. It vanishes on every finite-length module, by applying length additivity to the image of the endomorphism. These facts work even when the modules of the short exact sequence themselves have infinite length, provided the displayed kernel and cokernel lengths are finite.

In dimension zero all finite modules have finite length, so the defect is zero. In dimension one there is a unique generic $p$, and $f\notin p$. Let $N$ be the normalization of $T/p$ in its fraction field. Excellence ensures its finiteness. The positive integer

\[
a=\operatorname{length}_T(N/fN)
\]

is independent of $M$. It counts lengths over $T$, including residue field multiplicities, not merely the number of normalized branches. It is finite because of the divisor quotient, and positive because $f$ belongs to every maximal ideal of $N$.

The proof splits into the packet's normalization lemmas. The quotient $N/(T/p)$ is finite and supported only at the closed point. Tensoring a finite $T/p$-module with the normalization changes it by finite-length kernel and cokernel terms; the Tor term is retained. A semilocal Dedekind domain is a PID, so a finite $N$-module is a finite free module plus finite-length torsion. Additivity and zero defect on torsion give the formula there. Finally filter an arbitrary finite $T$-module by powers of its nilpotent minimal prime. The graded generic ranks add to its length over $T_p$. This proves the module identity of ACC Lemma 6.3.2, printed pp.1047–1048:

\[
\delta_f(M)=a\operatorname{length}_{T_p}(M_p).
\]

For the derived identity, assume $S$ excellent local, $f\in m_S$ a nonzerodivisor on $S$, $T$ finite over $S$, and $m\in\operatorname{Spec}T$ maximal with irreducible $\operatorname{Spec}T_m$ and $\dim T_m/(f)=0$. Let $C$ be bounded with finite $S$-cohomology and the specified derived $T$-action. The nonzerodivisor condition makes the two-term scalar complex a resolution of $S/(f)$, hence supplies the distinguished triangle

\[
C\xrightarrow{f}C\longrightarrow C\otimes_S^{\mathbf L}S/(f)
\longrightarrow C[1].
\]

Localized reduction cohomology has finite $T_m$-length, since its groups are extensions of the divisor kernels and cokernels on adjacent cohomology modules. It is not necessary that $C$ itself have finite $T_m$-length cohomology.

If $\dim T_m=0$, the reduction Euler length is zero. If $\dim T_m=1$ with unique generic $p$, ACC Lemma 6.3.4, printed pp.1049–1050, gives

\[
\chi_{T_m}((C\otimes_S^{\mathbf L}S/(f))_m)
=a\chi_{T_p}(C_p).
\]

Use equivariant truncation triangles to reduce to modules in one degree. Their reductions have Euler length equal to the signed module defect, so the same positive normalization constant works in every degree. Generic Euler length can still cancel. The zero-dimensional branch is a separate declaration and is essential when a residual supported point does not lie on a supported characteristic-zero component.

## Comparison of patched systems

The following is the full algebraic input of the ACC component-transfer theorem. Every item is needed; the comparison is stronger than an isomorphism of abstract residual rings.

Let $\mathcal O$ be a complete DVR with uniformizer $\pi$, let $\Lambda$ be a power series ring in finitely many variables over $\mathcal O$, and put $S=\Lambda[[X_1,\ldots,X_r]]$, with augmentation ideal $\mathfrak a_\infty$. Supply:

1. Perfect $S$-complexes $C,C'$ and a fixed derived $S/(\pi)$-isomorphism between their reductions.
2. Commutative $S$-subalgebras $T,T'$ of the two derived endomorphism rings whose images in the residual endomorphism ring, transported using that fixed isomorphism, are the same algebra $\overline T$.
3. Complete Noetherian local $S$-algebras $R,R'$, surjections onto $T/I,T'/I'$, and nilpotent ideals $I,I'$.
4. An $S$-algebra isomorphism $R/(\pi)\cong R'/(\pi)$ compatible with the induced actions on every $H^i(\overline C)/(\overline I+\overline I')H^i(\overline C)$.
5. Integers $q_0$, $\ell\ge0$, and the following dimension, component and fibre hypotheses.

The nilpotent quotient data defines the **spectral** $R$-support. The map $\operatorname{Spec}(T/I)\to\operatorname{Spec}T$ is a homeomorphism, and the surjection from $R$ embeds its source as a closed subset of $\operatorname{Spec}R$. The derived subalgebra has full cohomological $T$-support by the ghost argument, so the resulting subset is $V(\ker(R\to T/I))$. There need be no $R$-module action on $H^i(C)$: the ideal $I$ can act nontrivially there. This distinction is preserved for both patched systems.

Write $n=\dim S$ and $d=n-\ell\ge1$. Require

\[
\dim R=\dim R'=d,
\qquad
\dim R/(\pi)=\dim R'/(\pi)=d-1.
\]

Every dimension-$(d-1)$ generic point of $R/(\pi)$ has a **unique** dimension-$d$ generic point of $R$ underneath it. The ring $R'$ has a unique dimension-$d$ generic point $x'$. Every other generic point of $R,R'$ or $R/(\pi)$ has component dimension strictly below $d-1$. This permits smaller components of $R'$; it does not assert its entire spectrum is irreducible. It also prevents lower components from meeting the local divisor bridge in the dimensions used by the proof.

Finally there is a prime $q\supseteq\mathfrak a_\infty$ in $S$ with $\dim S/q=1$ and $\pi\notin q$, such that

\[
C\otimes_S^{\mathbf L}\kappa(q)\ne0,
\qquad
H^i(C\otimes_S^{\mathbf L}\kappa(q))=0
\quad(i\notin[q_0,q_0+\ell]).
\]

These are ACC §6.3.5 and Assumption 6.3.6, printed pp.1050–1051, expressed with the same residual-action and dimension information. The characteristic-zero residue field agrees with $(S/q)[1/\pi]$ here. There is no blanket mod-$\pi$ cohomology vanishing hypothesis.

The seed lemma first localizes at $q$. The finite algebra support image has dimension at most $n-\ell$. The regular-local height formula gives codimension at least $\ell$ for this localized support. P7 residue detection and finite minimal representatives give a perfect representative in the interval $[q_0,q_0+\ell]$. The balanced concentration theorem then produces a supported prime of codimension exactly $\ell$. Lift it through the finite algebra to a dimension-$d$ generic point $x_1$ of $R$. Its localized cohomology occupies one degree, so its generic Euler length is nonzero.

For any top generic $x$, choose a generic point $\overline x$ of $V(x,\pi)$. Complete local catenarity and principal-divisor dimension show it has dimension $d-1$, and the component hypotheses identify it as a generic of $R/(\pi)$. The local ring at $\overline x$ has a unique minimal prime $x$, dimension one, and zero-dimensional quotient by $\pi$. The analogous residual point in $R'$ generalizes to its unique top generic. These are the divisor bridges.

At such a bridge, the derived length identity and its zero-dimensional alternative give an equivalence between nonzero generic Euler length and nonzero residual Euler length, with the appropriate support membership. This is ACC Lemma 6.3.7, printed p.1051. Mere nonzero cohomology cannot replace nonzero Euler length.

Compatible residual actions identify the relevant localized simple factors. Nilpotent ideals are contained in every prime, so all simple factors are killed by their sum. Length is computed over the same residual image algebra at the corresponding point. The original cohomology modules are identified by the derived residual isomorphism, giving equality of their Euler lengths. One does **not** replace the length of a module by the length of its quotient by a nilpotent ideal; those numbers can differ. Compatibility on that quotient identifies the residual prime and simple action, which is what the composition-factor argument needs.

Now carry nonzero Euler length along the chain

\[
x_1\longrightarrow\overline x_1
\longleftrightarrow\overline x'_1
\longleftarrow x'
\longrightarrow\overline x'_2
\longleftrightarrow\overline x_2
\longleftarrow x_2.
\]

The same $x'$ connects the seed to every other dimension-$d$ generic $x_2$. Each divisor transfer uses the appropriate positive length constant for that local bridge; these constants need not agree across bridges. Only preservation of nonvanishing is used. Closedness then gives the whole component $V(x_2)$.

Thus the spectral $R$-support of $H^*(C)$ contains **every irreducible component of maximal dimension**. This is the P9 form of ACC Proposition 6.3.8, printed p.1052. It does not cover the permitted smaller components. If $R$ is additionally equidimensional, support is all of $\operatorname{Spec}R$, the kernel of $R\to T/I$ is nil, and the induced map on reduced quotients is an isomorphism. No zero-kernel, faithful-action or integral $R=T$ conclusion follows without extra hypotheses.

For a point on a supported top component, let $y$ be its contraction in $S$. The largest surviving localized cohomology degree $r$ persists after derived specialization to $\kappa(y)$. In the Tor spectral sequence the degree-$r$ edge has no other surviving contribution and identifies with $H^r(C_y)_x/yH^r(C_y)_x$, nonzero by Nakayama over the finite algebra localization. Lower-degree Tor contributions remain. This gives the support statement of ACC Corollary 6.3.9, printed pp.1052–1053; for a one-dimensional characteristic-zero contraction it also gives the claimed support after inverting $\pi$. The strict-chain-action spectral sequence in P7 is not silently promoted to a derived-action theorem: the native equivariant bridge is explicitly requested.

When the two input complexes have already concentrated in one degree, their derived residual comparison induces the comparison of top module quotients. The preceding reduction degree can be the uniformizer-torsion module. R03.6's module special-fibre near-faithfulness transfer applies with all its own conditions, including module regularity where required. This is the one-degree specialization of the complex comparison and the algebraic consumer of CG Proposition 6.6, arXiv v2 pp.69–70.

## Computations which separate the assertions

The acceptance suite computes both derived specialization and support after uniformizer inversion.

* **Integral torsion over a DVR.** In degrees $0,1$, $K=[\mathcal O\xrightarrow{\pi}\mathcal O]$ has $H^0=0$ and $H^1=k$. Its support is $V(\pi)$; its Tor-amplitude has width one while its ordinary cohomology has width zero. Derived reduction modulo $\pi$ has two adjacent copies of $k$. Rationalization is zero. This tests integral versus rational concentration and the sign cancellation of derived reduction.
* **Two-term Koszul over a power series ring.** For $S=\mathcal O[[x]]$, $K=[S\xrightarrow{x}S]$ in degrees $0,1$ has only $H^1=\mathcal O$, support $V(x)$, codimension one, projective dimension one and depth one. Derived augmentation at $x=0$ has $\mathcal O$ in both degrees. Inverting $\pi$ preserves the component $V(x)$ in $S[1/\pi]$. This ring is not identified with the entire $E[[x]]$: uniform denominator bounds need not hold for a general series over $E$.
* **One component of a reducible local ring.** In $B=k[[x,y]]/(xy)$, the finite free complex $[B\xrightarrow{x}B]$ has $H^0=(y)$ and $H^1=B/(x)$, both supported on $V(x)$. It is perfect and its support misses the other component. Derived specialization at the closed point gives $k$ in both degrees. This example checks that a singular reducible local base is not allowed in the regular-local concentration theorem. The module $B/(x)$ alone is not used as a perfect object. The separate projective-factor test over $k[\varepsilon]/(\varepsilon^2)\times k$ checks selection by an idempotent.
* **One-degree Taylor–Wiles algebra.** For $S=\mathcal O[[z_1,\ldots,z_r]]$ and $m>0$, $S^m[0]$ has Tor-amplitude $[0,0]$, full support and faithful scalar action. Derived augmentation, residual change and inversion give free stalks over $\mathcal O$, $k[[z_1,\ldots,z_r]]$ and $S[1/\pi]$, respectively. This is a genuine one-degree algebraic specialization; construction of an arithmetic patched system is a separate input.

A further test retains non-Cohen–Macaulay cohomology. Over $S=k[[x,y]]$, put $M=S/(x)\oplus S/(x,y)$. The stalk $M[0]$ is perfect with Tor-amplitude $[-2,0]$, support $V(x)$, depth zero, support dimension one and projective dimension two. The codimension–amplitude inequality is strict. Its derived closed fibre has dimensions $1,3,2$ in degrees $-2,-1,0$. It would invalidate a definition equating perfectness with Cohen–Macaulay cohomology, or ordinary width with Tor width.

## Definition APIs and discriminatory tests

The names below live in `TauCeti.PatchingSupport`. Each test is a specification a wrong definition would fail. The suggested file elaborates the test statements with omitted proofs; elaboration checks their types and hypotheses, not the assertions themselves.

### Support of a bounded derived complex

| API | Required behavior |
| --- | --- |
| `mem_support` | p is in support(C) iff some H^i(C)_p is nonzero. |
| `support_iso` | Derived isomorphisms preserve support. |
| `support_single` | The support of the stalk M in degree i is Module.support R M. |
| `support_shift` | Every integer shift has the same support. |

* `support_zero`: The zero derived object has empty support.
* `support_single_quotient`: For any ideal I, the degree-zero stalk of R/I has support V(I).
* `support_two_stalks`: For C=M[0]⊕N[−1], support(C)=Supp M∪Supp N, even when M=0 and N≠0.

### Annihilator of all cohomology

| API | Required behavior |
| --- | --- |
| `mem_cohomologyAnnihilator` | r belongs iff r kills every element of every cohomology module. |
| `cohomologyAnnihilator_iso` | The ideal is invariant under derived isomorphism. |
| `cohomologyAnnihilator_single` | On a stalk it is exactly Ann_R M. |
| `cohomologyAnnihilator_biprod` | On C⊕D it is the intersection of their cohomology annihilators. |

* `cohomologyAnnihilator_zero`: The annihilator of the zero object is the unit ideal.
* `cohomologyAnnihilator_quotient`: The annihilator of (R/I)[0] is I.
* `cohomologyAnnihilator_two_quotients`: The annihilator of (R/I)[0]⊕(R/J)[−1] is I∩J, not I+J.

### Finite algebra action in the derived category

| API | Required behavior |
| --- | --- |
| `DerivedAction.ext` | Actions agree when their ring homomorphisms agree on all elements. |
| `DerivedAction.homologyAction` | A ring homomorphism T→End_S H^i(C), giving the canonical T-module action. |
| `DerivedAction.scalar` | The induced S-action on H^i(C) is its original action. |
| `DerivedAction.transport` | An S-linear additive functor transports the action, compatibly with identity and composition. |
| `DerivedAction.single` | An S-compatible T-action on a module gives an action on its derived stalk. |

* `derivedAction_scalars`: For the scalar S-action on any C, the induced action on H^i(C) is scalar multiplication.
* `derivedAction_zero`: There is exactly one compatible T-action on the zero derived object.
* `derivedAction_stalk`: For a module M with T-action, the induced action of its degree-zero stalk agrees with the given action via the standard H^0 isomorphism.

### Euler length with finite cohomology lengths

| API | Required behavior |
| --- | --- |
| `eulerLength_range` | Two finite sets containing all nonzero degrees give the same value. |
| `eulerLength_iso` | A T-equivariant derived isomorphism preserves Euler length. |
| `eulerLength_single` | A stalk M in degree i has Euler length (−1)^i length_T M. |
| `eulerLength_shift` | eulerLength(C[n])=(−1)^n eulerLength(C), with H^i(C[n])=H^{i+n}(C). |
| `eulerLength_biprod` | Finite direct sums have the sum of the Euler lengths. |

* `eulerLength_zero`: Euler length of the zero object on any admissible range is zero.
* `eulerLength_field_stalk`: The field k placed in degree 1 with its scalar action has Euler length −1.
* `eulerLength_cancellation`: k in degrees 0 and 1 with zero differential is nonzero and has Euler length 0; Euler length does not detect acyclicity.

### Idempotent localization of a derived algebra action

| API | Required behavior |
| --- | --- |
| `genericLocalization_retract` | The inclusion and projection split precisely the specified generic idempotent. |
| `genericLocalization_homology` | H^i(C_p)≅H^i(C)_p as T_p-modules. |
| `genericLocalization_iso` | T-equivariant maps induce maps on the generic summands, preserving identities and composition. |
| `genericLocalization_choice` | Two splittings of the same idempotent are canonically isomorphic with the inclusion/projection maps respected. |

* `genericLocalization_zero`: Generic localization of the zero object is zero.
* `genericLocalization_scalar_domain`: For a domain S, T=S, p=(0), the idempotent is 1 and C_p is C⊗_S Frac(S).
* `genericLocalization_product`: For S=k, T=k×k acting on M1⊕M2, localization at the first-factor generic prime produces M1, not M1⊕M2.

## Planned interfaces still required

The packet records three concrete supplier contracts. They preserve ownership and give an implementer an exact interface to obtain before treating this prerequisite graph as closed.

1. **R03.3 ring theory.** Complete Noetherian local rings, their finite algebras and their localizations are excellent. An excellent one-dimensional local domain has finite normalization, whose semilocal Dedekind structure gives a PID. Finite integral spectral maps preserve dimensions of closed support images. Catenary regular-local height and dimension formulas control the characteristic-zero localization seed and the top-component divisor bridge. These inputs are not presently fine supplier nodes. The normalization calculation, its finite-length corrections and its consumers are nevertheless specified above.
2. **DGAInfinity, Part II.** Compare the native bounded derived category of finite modules with the existing DG derived-module/perfect-envelope model. Supply idempotent splittings preserving bounded finite cohomology, and the corresponding perfect summand when the original object is perfect. The native suggested interface asks for actual retract maps and an idempotent-completeness instance. It does not assume an unspecified strict lift of the algebra action.
3. **P7 derived actions.** Supply canonical truncations equivariant for actions in the derived category, the bounded ghost-nilpotence bound, finite generation of the derived endomorphism module of a perfect object, and comparison of the induced actions under exact derived base change. The coefficient spectral sequence must have a right-edge comparison compatible with these derived actions. The existing P7 spectral-action node uses strict chain actions, so it does not by itself provide this last interface.

These yield two recorded gaps: the missing fine excellence/normalization contracts and the native action/idempotent comparison bridges. All P9 targets have a statement and proof plan, but none is marked closed by pretending those contracts already exist. The complete ACC theorem is stated mathematically above. Its suggested `supportTransportAvoidingIhara` declaration is only the final component-graph consequence with explicit transfer inputs. Likewise, `derivedLengthIdentity` uses the concrete finite-module defect formula as an input; it does not replace excellence by an opaque proposition.

The native file covers the five definition/construction interfaces, their 22 API entries and 15 tests, together with support, concentration, projective dimension, regular-sequence depth, compatible Euler triangles and the two intermediate comparison forms. For generic localization it computes cohomology as the image of the acted idempotent. Identifying that image with localization as a module over the generic algebra factor is the mathematical API above and uses the recorded bridge. Its scalar test checks the unit summand after localization; the fraction-field change itself is supplied by P7. The complete `lengthDefectModuleIdentity` and ACC `localConditionSupport` signatures are omitted until their supplier interfaces can be expressed. `supportLocalConditionQuotient` states the general perfect quotient-support calculation used in the latter; it does not stand for the full ACC conclusion. This scope is deliberate and visible.

## Targets and atlas planets

The packet has 58 nodes: four definitions, forty lemmas, eight theorems, one construction and five applications. It retains the integrated P9 identifiers `codimension-amplitude-lemma`, `derived-length-identity` and `support-transport-avoiding-ihara`. The six planets are the support of a complex, codimension versus amplitude, balanced concentration, derived Euler length, idempotent localization and support transport avoiding Ihara. Every node's full hypotheses, prerequisite chain, proof steps and version-specific source locator are in the packet.

## Sources and source corrections

All statements and explanations here are in our own words. Sources were read on 10 October 2026; the packet records the source versions and content hashes where appropriate.

* Frank Calegari and David Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*, arXiv:1207.4224v2](https://arxiv.org/pdf/1207.4224v2), 16 July 2017: Lemmas 6.1–6.2, author pp.65–66; Theorems 6.3–6.4, pp.66–69; Proposition 6.6, pp.69–70. These page numbers belong to this version. The published author's copy has different pagination.
* Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack Thorne, [*Potential automorphy over CM fields*](https://math.uchicago.edu/~fcale/papers/Ramanujan.pdf), *Annals of Mathematics* 197 (2023), printed pp.897–1113. The maintainer-cleared author copy was read in place: §6.3 and Lemmas 6.3.2–6.3.4, pp.1047–1050; §6.3.5 and Assumption 6.3.6, pp.1050–1051; Lemma 6.3.7, p.1051; Proposition 6.3.8, p.1052; Corollary 6.3.9, pp.1052–1053; the §6.4.1 setup, p.1053. No copy or source passage is part of this submission.
* The Stacks project, [perfect complexes, tag 0656](https://stacks.math.columbia.edu/tag/0656), Definition 15.76.1 and Lemmas 15.76.2–15.76.15; [Lemma 15.80.1, tag 07LQ](https://stacks.math.columbia.edu/tag/07LQ); [Proposition 15.80.3, tag 07LT](https://stacks.math.columbia.edu/tag/07LT). These support the perfectness, coefficient-change and localization conventions.
* The pinned Mathlib and Tau Ceti sources listed in the packet baseline, plus the current upstream DGAInfinity Layer 5 and GrothendieckEulerForms documents for ownership and existing coverage.

Two source issues are recorded as paraphrased findings. CG Lemma 6.2 needs a nonzero object: the zero complex has empty support, and the proof starts at a first nonzero cohomology degree. This omission also appears in the published statement checked against the author's public copy. The ACC paragraph preceding Lemma 6.3.4 identifies a scalar cone with ordinary divisor reduction too generally; the identification needs the scalar to be a ring nonzerodivisor. Lemma 6.3.4 itself includes that condition, so its use here is valid. No separate correction resolving these points was found in the checked source versions or the public correction search. This does not assert that every later discussion has been searched.
