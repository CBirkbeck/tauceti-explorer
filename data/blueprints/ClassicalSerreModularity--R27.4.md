# Classical Serre modularity: removing the good-dihedral condition

This part plans **ClassicalSerreModularity:R27.4**. Its output is the level-raising implication of Khare–Wintenberger (KW), Theorem 3.4, and the exact classical weight-and-level conclusion of their Theorem 1.2. In particular, the characteristic-two conclusion includes representations whose **entire restriction** to a decomposition group at two is scalar.

The proof uses two changes of residual characteristic. Their purpose is to introduce a good-dihedral prime without losing the bound on the power of two dividing the conductor. Once modularity is known, a minimal crystalline lift gives the exact classical weight and conductor. These two operations have different inputs and are specified separately below.

The definitive specification is this document together with the [packet](../packets/ClassicalSerreModularity--R27.4.json). The [suggested file](../suggested/ClassicalSerreModularity--R27.4.lean) contains only arithmetic and matrix acceptance statements expressible at the pinned libraries. It does not introduce substitute carriers for residual modularity or compatible systems.

## Ownership, baseline and notation

The integrated node
**ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice**
is retained and refined. The [R27.3 packet](../packets/ClassicalSerreModularity--R27.3.json) already owns three further R27.4 targets:

- **auxiliary-characteristic-choice**;
- **strong-form-by-minimal-lifts**;
- **theorem-1-2**.

Those IDs are imported, not redeclared. The packet's `imports` records give the precise versions used here and the interfaces needed at assembly. They do not create additional declarations. The exact-weight refinement requires the supplier comparison **G1**, described below. The [R26.1 packet](../packets/ClassicalSerreModularity--R26.1.json) supplies the good-dihedral definition and the hypotheses $L_r,W_r,D_r$; in this checkout it has no R27.4 coverage entry. The scoped work therefore continues the integrated decomposition and the R27.3 targets.

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed library audit, AUDIT-31, marks all R27.4 targets as not built. At the Tau Ceti pin, **HeckeRing.GL2.Newform**, in *NumberTheory/ModularForms/Newforms/Newform*, already bundles a nonzero good-Hecke eigen cusp form on $\Gamma_1(N)$, its nebentypus, newspace membership and normalization $a_1=1$. This analytic newform is consumed, not planned again. Its attached arithmetic representation, residual realization and local compatibility are R19 inputs.

Current upstream Suggested files were also checked, including Local Galois Groups, Profinite Arithmetic, Integral Hecke and Galois Determinants, and Modular Forms. Their local Galois, determinant, Frobenius and analytic form interfaces remain with those roadmaps. Chebotarev Layer 10 already plans the density and complete-splitting theorem required here. No density theorem, determinant carrier or second analytic newform structure is introduced by this part.

Fix an algebraic closure of $\mathbb Q$, complex conjugations and embeddings defining decomposition groups. A residual representation is a continuous homomorphism
$$
\bar\rho:G_{\mathbb Q}\longrightarrow\operatorname{GL}_2(k),
$$
where $k$ is a finite field of prime characteristic $p$. **S-type**, imported from R15.6/s-type-arises-from-and-modular and KW §1.1, preprint p. 2, means odd and absolutely irreducible in addition to these conditions. KW Definition 2.1 instead defines good-dihedrality. At odd $p$, oddness means determinant $-1$ at complex conjugation. At two it is the characteristic-two convention of the source; no odd complex lift is inferred merely from that determinant condition.

Write $N(\bar\rho)$ for the **positive prime-to-$p$ Artin conductor**. It retains all tame and wild conductor exponents. In particular, it is automatically odd when $p=2$. Write $k(\bar\rho)$ for Serre's **classical weight at least two**, rather than the minimum Katz weight. In characteristic two its values are two and four, with weight two in the finite-flat case, as supplied by R15.4/dyadic-weight-two-or-four. The determinant normalization is
$$
\det\bar\rho=\varepsilon(\bar\rho)\bar\chi_p^{\,k(\bar\rho)-1}.
$$
Here the finite character is viewed through reciprocity; coefficients and their reductions are compared after specified embeddings. Arithmetic Frobenius is used for Hecke traces. All residual representations of a characteristic-zero member are stable-lattice reductions followed by semisimplification, independent of the lattice up to the imported residual comparison and common scalar extension.

“Modular” initially means that some cuspidal eigenform realizes the residual representation. It does not include the optimal weight or level in its definition. An exact realization includes a coefficient number field, a place above $p$, a stable lattice and a common residue-field embedding. A form's nebentypus reduces to the finite determinant factor above; this document does not impose an unwarranted exact Teichmüller lift of that character in every dyadic branch.

## The imported hypothesis $D_r$

The definition belongs to
**ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr**.
For a natural number $r$, $D_r$ is the assertion that every S-type residual representation satisfying all of

1. it is locally good-dihedral at some auxiliary prime;
2. its residual characteristic is odd;
3. $2^{r+1}\nmid N(\bar\rho)$;

is modular. There is no weight-two condition in $D_r$. There is no restriction on the number of odd prime divisors of its conductor. Both restrictions would confuse $D_r$ with $L_r$ or $W_r$.

For completeness, the good-dihedral predicate is also imported. At a prime $q\ne p$, inertia is diagonal with characters $\psi,\psi^q$, where $\psi$ has nontrivial odd-prime-power order $t^a$, $t\mid q+1$, and
$$
 t>\max(5,p,Q(N/q^2)),\qquad q\equiv1\pmod8.
$$
The necessary congruences $q\equiv1\pmod\ell$ hold at every prime $\ell\le\max(p,Q(N/q^2))$. Here $Q(m)$ is the largest prime divisor and $Q(1)=1$. These bounds, rather than the phrase “large auxiliary prime,” are what make the changed-characteristic member good-dihedral. The image and preservation theorem is R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved.

The imported public API is **HypD** with its elimination at a qualifying residual representation, invariance under compatible coefficient extension, and **hypD_mono**: if $r\le s$, $D_s\Rightarrow D_r$. The direction follows because the conductor range grows with $r$. These are uses of R27.2's definition, not a new definition or API owned here. The level-raising theorem consumes elimination; R27.3 supplies $D_0$; R27.5 supplies the further $D_r$.

The discriminating checks for this imported predicate are:

- For $N=13^2$, the conductor condition of $D_0$ holds. For $N=2\cdot13^2$, it fails at $r=0$ and holds at $r=1$.
- For $N=4\cdot13^2$, it fails at $r=1$ and holds at $r=2$. Passing only the conductor's radical would give the wrong answer.
- A characteristic-two representation never satisfies the odd-characteristic premise of $D_r$, even when its conductor is odd and its weight is two. It enters the conclusion of Theorem 3.4 through a characteristic switch.
- A conductor with many odd prime factors is admitted whenever the dyadic bound holds. Counting those factors is irrelevant here.

Mathlib's **padicValNat_dvd_iff_le**, read with its explicit nonzero-natural hypothesis and prime instance, gives for positive $N$
$$
2^{r+1}\nmid N\quad\Longleftrightarrow\quad v_2(N)\le r.
$$
Do not extend this equivalence to $N=0$: every positive power of two divides zero, although the natural-valued valuation at zero is zero. The conductor carrier excludes that case.

## Auxiliary characteristic with prime-field coefficients

**Imported target:** R27.4/auxiliary-characteristic-choice. Source: KW I §8.4, preprint p. 17. Its residual-irreducibility input is the bounded-conductor/fixed-weight argument cited again at §10.1, p. 20; the modularity conclusion of Theorem 10.1 is not used.

Let $\bar\rho$ have normalized weight in $[2,p+1]$ if $p$ is odd, with absolutely irreducible cyclotomic restriction in that case; at two assume nonsolvable image. Let $S$ be its finite ramification set away from $p$, with $\max\varnothing=0$. Type-(2) lifting gives an $E$-rational, odd, irreducible, almost strictly compatible weight-two system $C=(\rho_\lambda)$, with common support in $S\cup\{p\}$.

For every bound $B$, either the original $\bar\rho$ is already modular, or there is a prime
$$
p'>\max(B,5,p,\max S),\qquad p'\equiv1\pmod4,
$$
splitting completely in $E$, and a place $\lambda'\mid p'$, such that $\bar\rho_{\lambda'}$ is $\mathbb F_{p'}$-valued, absolutely irreducible, of classical weight two, nonsolvable, and absolutely irreducible on $G_{\mathbb Q(\mu_{p'})}$.

The necessary interfaces are exact:

- R24.5/kw-theorem-5-1-systems gives the system through the prescribed lift. Almost strict compatibility gives crystallinity at an odd coefficient prime outside the common support, even before residual irreducibility is known there; irreducibility is needed for the full coefficient-prime compatibility clause.
- R24.6/residual-members supplies a finite exceptional set for residual absolute irreducibility in this situation. This is stronger than a density-one statement. A positive-density splitting set cannot simply be intersected with an unspecified infinite set of irreducible primes.
- R15.4/fontaine-laffaille-weight-comparison, with Hodge weights $\{0,1\}$ and $p'>5$, gives classical weight two. Its ordinary inertial ratio has order $p'-1$, or its niveau-two ratio has order $p'+1$.
- Complete splitting puts the residual Frobenius characteristic polynomials in $\mathbb F_{p'}$. Chebotarev on the finite residual image gives this property for every image element. R15.6/realizability-over-the-field-of-characteristic-polynomials then supplies a prime-field model of the semisimple representation. A splitting prime alone is not a chosen matrix realization.
- The bad-dihedral normalized-weight constraint would instead force weight $(p'+1)/2$ or $(p'+3)/2$. Thus the cyclotomic restriction is absolutely irreducible.
- Dickson classification excludes the solvable exceptional projective groups because the inertial ratio has order at least six. A remaining solvable projective image is dihedral. Its modularity follows from the solvable residual theorem; the crystalline weight-two branch of KW I Theorem 4.1 makes that member modular. Equality of good Frobenius polynomials and Chebotarev–Brauer–Nesbitt then make the system modular, giving the first alternative.

If no such termination occurs, all eligible candidates are nonsolvable. Apply the **existing Chebotarev Layer 10** to the normal closure of $E(i)$. Its identity Frobenius class has positive density. Those primes split in $E$ and are $1\bmod4$. Remove the finite exceptional set and choose beyond $B$. This works even if $E/\mathbb Q$ is not Galois.

**Check.** The smallest possible prime with $p'>5$ and $p'\equiv1\bmod4$ is 13. The local order alternatives are 12 and 14. Although 7 gives orders 6 and 8, it fails the congruence needed by Lemma 8.2. Residue degree greater than one is another failure: absolute irreducibility over a larger finite field alone does not supply the prime-field hypothesis of the imported Chebotarev lemma.

## Theorem 3.4: removing good-dihedrality

**Retained target:** R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice. Source: KW I Theorem 3.4 and following Remark, p. 6; proof §8.4, pp. 17–18.

**Theorem.** Fix $r\ge0$ and assume $D_r$. Every S-type $\bar\rho$ with
$2^{r+1}\nmid N(\bar\rho)$ is modular, with the additional condition $k(\bar\rho)=2$ only when $p=2$ and $r=0$. The input need not be good-dihedral. At $r\ge1$, both classical dyadic weights are allowed.

First handle cyclotomic-reducible odd-characteristic representations using the dihedral induction criterion and solvable residual modularity. At two, handle solvable image through R17.6/qualitative-residual-modularity. For a remaining odd-characteristic representation, normalize its weight by a cyclotomic twist. R15.4's twisting recipe supplies weight in $[2,p+1]$ without assuming modularity; the prime-to-$p$ conductor and projective image do not change. Once the normalized twist is modular, R20.4/strip-ell-power-from-level supplies a witness at tame level. R15.3/theta-operator-filtration-and-hecke-commutation then realizes inverse cyclotomic twisting by a nonnegative exponent modulo $p-1$. Its iterates are nonzero because the normalized first coefficient remains one. R15.6/modularity-formulations-and-determinant permits a controlled weight shift to recover a classical modularity witness. This qualitative step does not require same-weight lifting or gap G1.

Build the first type-(2) system $C$ and choose $p'$ by the preceding target. Apply **R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes** to its prime-field residual representation. Choose $q>p'$ unramified there, deleting the finite set of smaller primes, with projective Frobenius conjugate to complex conjugation, $q\equiv1\bmod8$, $q\equiv1\bmod\ell$ for all primes $\ell\le p'-1$, and $q\equiv-1\bmod p'$. The local shape meets **R24.3/theorem-5-1-part-4-level-two-type-at-q**; combine that lift with **R24.5/kw-theorem-5-1-systems** to construct $C'$, sharing the residual member at $p'$ with $C$. At $q$ its nontrivial niveau-two character has $p'$-power order. The support bound below concerns the common WD conductor. The residual representation may ramify at its coefficient prime.

### The full dyadic conductor calculation

Put $A=a(\operatorname{WD}_2(C))$, including monodromy in the conductor. The type-(2) lift determines it as follows.

| Original characteristic and weight | Dyadic WD input | Resulting exponent |
| --- | --- | --- |
| $p\ne2$ | Minimal at two | $A=v_2(N(\bar\rho))\le r$ |
| $p=2, k=2$ | Trivial inertial type, zero monodromy | $A=0\le r$ |
| $p=2, k=4$ | Trivial inertial type, nonzero rank-one monodromy | $A=2-\dim\ker N_{\rm mon}=1\le r$ |

The last inequality uses $r\ge1$, forced by the theorem's weight hypothesis. The original prime-to-two conductor still has exponent zero; that fact does not force $A=0$.

Now put $b=v_2(N(\bar\rho_{p'}))$ and $A'=a(\operatorname{WD}_2(C'))$. Reduction at $p'\ne2$ cannot increase the local conductor, so $b\le A$. The type-(4) lift is minimal at two, which differs from $p'$ and $q$; hence $A'=b$. Let $s$ be the largest prime below $p'$. Reduction at $s\ne2$ gives
$$
v_2(N(\bar\rho'_s))\ \le\ A'\ =\ b\ \le\ A\ \le\ r.
$$
This invokes R01.3's WD conductor and reduction comparison, and R24.6/residual-members. Both reductions permit conductor drop. The second minimality comparison is with the **intermediate** $\bar\rho_{p'}$, not with the original representation.

Since $p'>5$, $s>2$. Every prime in the common WD conductor other than $q$ is below $p'$; the $p'$-member is crystalline of weight two, so it adds no $p'$-factor to that conductor. A characteristic-$s$ member may additionally ramify at $s$. The inserted distinct $p'$-power inertia characters at $q$ survive reduction modulo $s$, and Frobenius interchanges their eigenspaces. This gives local absolute irreducibility and hence global absolute irreducibility. Oddness and continuity come from $C'$. Lemma 8.2's congruences cover all primes needed for the good-dihedral bound, with auxiliary order prime $t=p'$. Thus $\bar\rho'_s$ is S-type and good-dihedral with the displayed conductor bound. Apply $D_r$.

The resulting residual modularity lifts at $s$ using the exact **R22.5/kw-i-theorem-4-1-odd-prime** export. Good-dihedrality gives nonsolvable image and hence the needed cyclotomic irreducibility. The odd, finitely ramified member $C'_s$ is potentially semistable of weight two, and crystalline of weight two if $s$ is outside the common support; these are the export's permitted branches. Transfer modularity to all of $C'$ by good Frobenius polynomials. At the shared nonsolvable residual member in characteristic $p'$, apply the crystalline weight-two branch to $C_{p'}$. Transfer through $C$, reduce back to the original characteristic and undo the initial twist as above. No lifting theorem at the original characteristic is necessary for this return.

**Checks.** At $p=2,k=4,r=1$, the calculation gives $A=1$ and admits the final characteristic-$s$ member under $D_1$. The same proof cannot use $D_0$. At $p=2,k=2,r=0$, all dyadic exponents in the chain are zero. For an original odd-characteristic conductor with $v_2(N)=2$, the bound passes at $r=2$ and fails at $r=1$. Keeping only ramification support would miss both distinctions.

## Exact classical weight and level, including the dyadic scalar case

**Imported target:** R27.4/strong-form-by-minimal-lifts. Sources: KW I Theorem 1.2 and §1.1, pp. 2–3; Theorems 4.1 and 5.1(1), pp. 7, 9; Lemma 6.2(i), pp. 10–11. Buzzard and Wiese identify the branches to which the preceding optimization applies.

**Theorem.** Let $\bar\rho$ be modular and S-type. If $p$ is odd, or $p=2$ and $k(\bar\rho)=2$, then it has an exact classical realization by a normalized primitive cuspidal eigenform of weight $k(\bar\rho)$ and level $N(\bar\rho)$. The coefficient and lattice data are part of the conclusion. This includes scalar dyadic restrictions.

### The conditional dyadic input

R20.5 owns Buzzard's definition of multiplicity one, its nonscalar criterion, the integral level-raising and conductor-lowering machinery. Multiplicity one is the universal condition over the permissible levels, intermediate groups and full Hecke ideals, with the relevant residual Jacobian factor of dimension two over its residue field. It cannot be supplied by checking one occurrence at one level.

For the non-$\mathbb Q(i)$-induced branch, the imported **Buzzard Theorem 2.8** requires a weight-two eigenform at $\Gamma_1(M)\cap\Gamma_0(q)$, $q\nmid2M$, an absolutely irreducible residual representation **unramified at $q$**, multiplicity one, and the prescribed dyadic normalization of $M$: odd if finite flat at two, exactly one factor of two otherwise. It lowers to level $M$, preserving the relevant $a_2$ congruence. Residual unramifiedness at the removed prime is the correction already registered as **SerreWeightAndLevelOptimisation/E1**; it is required by the proof on Buzzard p. 105 and by the conductor obstruction. This part uses that corrected supplier statement.

Buzzard Theorem 3.1 applies the local descent cases to reach weight two at level $N$ if finite flat at two, and $2N$ otherwise. Theorem 3.2, with the dyadic bridge, gives weight two at $N$ in the finite-flat case and weight three in the nonfinite case. The classical even-weight-four convention requires the additional weight-change and character bookkeeping already owned by R20.5. It is not a new conclusion of this stage.

The nonscalar criterion concerns the full local representation. A nontrivial Jordan block with equal eigenvalues is nonscalar and belongs to that branch. Distinct Frobenius roots are sufficient in some applications, but they are not the definition of nonscalar.

Representations induced from $\mathbb Q(i)$ are separated before invoking Theorem 2.8. Buzzard's §3 proof of Theorem 3.2, pp. 108–109, lifts the odd-order inducing character to a classical weight-one form of level $4N$ and uses the dyadic bridge directly. It does not extend the hypotheses of Theorem 2.8 by assertion.

### The dihedral and scalar branches

The exact dihedral conclusion is the **Lemma 6.2(i) projection** of the existing R27.1/dickson-and-the-dyadic-solvable-refinement node. Its component mathematics stays with R17.5, R17.6, R20.5 and R15. In characteristic two, the crucial imported Wiese Theorem 9 produces a **Katz** weight-one eigenform at the prime-to-two conductor when the dihedral representation is unramified at two. It applies even in the scalar exceptional local case. It need not produce a characteristic-zero weight-one eigenform of the same level.

Multiplication by the characteristic-two Hasse invariant changes Katz weight one to two while preserving the q-expansion and residual good-prime eigenvalues. Multiplication alone does not prove integral liftability. The dihedral classical Serre-weight conclusion is supplied by the imported Lemma 6.2(i), with Wiese's consequence in the Introduction, p. 124. An explicit geometric derivation of its same-weight bridge must meet G1 below; it is not inferred from the algebraic Deligne–Serre lemma alone. The primitive associate has level dividing the stated level, and the residual conductor supplies the reverse divisibility. The ramified dihedral branch uses dihedral automorphy and the nonscalar optimization. Wiese Theorem 10 and the proof of Theorem 1, pp. 131–132, explain this distinction.

For an **actually scalar** dyadic restriction, write it as $\alpha\oplus\alpha$. The continuous scalar character has finite odd-order image. Local reciprocity identifies the abelian inertia image over $\mathbb Q_2$ with $\mathbb Z_2^\times$, a pro-two group, so $\alpha$ is unramified. The local representation has a finite étale, hence finite-flat, model and classical weight two. This is precisely **R20.6/scalar-dyadic-restriction-is-unramified**. Wiese's proof also gives the global argument using the unique odd-order square root of the determinant. Being unramified only after an unspecified twist would not justify finite flatness of the actual representation.

### Minimal lifts supply the remaining exact realization

For nondihedral image in odd characteristic, choose $i$ with
$2\le k(\bar\rho\otimes\bar\chi_p^i)\le p+1$. Its conductor away from $p$ stays $N(\bar\rho)$, and its cyclotomic restriction is absolutely irreducible. At two set $i=0$; nondihedral image is nonsolvable. Apply **R24.3/theorem-5-1-part-1-minimal-crystalline**, followed by the exact odd or dyadic KW I Theorem 4.1 export. In the dyadic case the lift is crystalline of weight two. That lifting theorem has no local nonscalar or multiplicity-one hypothesis. It therefore covers scalar restrictions with nonsolvable global image.

The modular lift's primitive newform has the required normalized weight from its Hodge weights. At every $q\ne p$, full local–global compatibility and local minimality give the exact conductor exponent. Minimality uses KW's local definition, including the exceptional induced characteristic-two condition at odd primes; mere absence of new ramified primes would not suffice. At the coefficient prime, the **full WD comparison**, including monodromy, is needed in the reverse direction: the lift is crystalline, so the automorphic local parameter is unramified with zero monodromy. **R16.3/conductor-epsilon-comparison** identifies that Artin exponent zero with the automorphic newvector exponent. R16.2/newvector-conductor then gives a spherical component, so $p$ does not divide the primitive level. The full WD input is R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime.

In odd characteristic, undo the cyclotomic twist on mod-$p$ eigensystems through **R15.3/theta-operator-filtration-and-hecke-commutation**. A nonnegative exponent representing $-i\bmod p-1$ gives the inverse twist without changing tame level; each iterate retains first coefficient one. Edixhoven's theorem then gives a Katz eigensystem in the original classical Serre weight at that level. The passage to a characteristic-zero eigenform of this **same weight and level** requires the requested comparison G1. Once that input is supplied, the integral Deligne–Serre interface applies. If its primitive associate has level $M$, then $M\mid N$, while the residual conductor bound gives $N\mid M$; hence $M=N$. No inverse theta operator as an analytic operator is asserted.

**G1: same-weight Katz-to-integral eigensystem comparison.** R15.2/integral-lattice-and-reduction-image defines the actual reduction image; R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform requires an eigenvector in an integral reduction module. Neither supplies unconditional same-weight lifting for all Katz forms. R15 already records its character-lattice and low-level cusp base-change gap. The outstanding request to **R15.2** is precise: for a normalized tame-level cuspidal Katz eigensystem with absolutely irreducible residual representation in its classical Serre weight, supply a characteristic-zero eigensystem at that same weight and level, preserving the reduced good-prime and diamond eigenvalues. Odd characteristic is needed generally; at two only weight two is needed. Coefficient extension and an integral character lifting the residual character are allowed. The proof must address the actual reduction eigenvector or a sufficient non-Eisenstein eigensystem comparison, including low levels, cusp twists and diamond groups of noninvertible order. A weight shift would lose the exact-weight conclusion. Wiese's dihedral consequence does not establish this general geometric input. This is an explicit dependency gap for the exact refinement and Theorem 1.2, not a gap in Theorem 3.4's qualitative argument.

**Checks.** Normalizing a weight above $p+1$ must be followed by untwisting and restoration of the original weight. A primitive form only at some level with the same support is insufficient. A scalar nondihedral dyadic representation must pass through the crystalline weight-two lifting theorem without a multiplicity-one premise. The dyadic weight-four case is excluded from this exact-refinement target.

## Theorem 1.2 and the outgoing interface

**Imported target:** R27.4/theorem-1-2. Source: KW I Theorem 1.2, p. 2; Remark after Theorem 3.4, p. 6.

1. If $p$ is odd and $N(\bar\rho)$ is odd, every S-type $\bar\rho$ arises from a normalized characteristic-zero newform of exact level $N(\bar\rho)$ and exact weight $k(\bar\rho)$.
2. If $p=2$ and $k(\bar\rho)=2$, the same conclusion holds in weight two at its necessarily odd conductor.

Import **R27.3/d0-from-all-lr**. Apply Theorem 3.4 with $r=0$, then the exact refinement above. This is the full dependency of the conclusion: the induction producing $D_0$ is not repeated here. R27.5 consumes the general $D_r$-to-modularity implication for the remaining conductor ranges and dyadic weight four. R27.6 and R33.6 consume the exact classical weight-two completion. None is a prerequisite of the argument here.

The result does not assert that every scalar unramified dyadic representation has a Katz weight-one realization. Its classical weight-two conclusion is exactly the refinement needed at this boundary. The Wiese weight-one input is restricted to its dihedral hypotheses.

## Dependency and acceptance ledger

| Input | Existing owner and precise use |
| --- | --- |
| Residual objects and classical weight | Exact R15.6 S-type, witness and formulation nodes; R15.4 twisting, Fontaine–Laffaille and bad-dihedral application |
| Good-dihedrality and insertion | R27.1 definition, image theorem and Lemma 8.2; direct R24 type-(4) and systems suppliers |
| Induction hypotheses | R27.2/HypD and R27.3/d0-from-all-lr |
| Three lift types | R24.3 type-(1), type-(2), type-(4); R24.5 systems theorem |
| Residual members and transfer | R24.6/residual-members and linked-systems-modularity-transfer; the classical projection only |
| Local conductor | R01.3 WD conductor and reduction inequality; minimality of the selected R24 lifts |
| Lifting modularity | Exact KW I Theorem 4.1 exports R22.5 and R22.6 |
| Dyadic optimization | Conditional R20.5 Buzzard statements and Wiese import; local scalar lemma R20.6 |
| Exact newform level | Existing analytic Newform; R19.4 conductor, R19.5 coefficient-prime compatibility, R16.3 conductor comparison and R16.2 newvectors |
| Untwisting and integral realization | R15.3 theta; R20.4 odd-prime stripping for qualitative witnesses; R15.5 conditional lifting; G1 requests the missing same-weight R15.2 comparison |
| Coefficient-prime choice | Existing upstream Chebotarev Layer 10 |

The imported R27.1 mixed-source node is used solely for the dihedral exact-refinement statement. R20.5's scalar obstruction is not a proof of general scalar modularity and is not used to supply it. The early lifting and optimization suppliers do not consume R27.4's scalar completion. In particular, there is no R27.4 → final Serre theorem → general system modularity → R27.4 route. Compatible-family transfer means equality with the family of **one already modular member**, not the classification of all systems.

The suggested file states the conductor-range examples, the zero-conductor guard, the local monodromy dimension arithmetic, the smallest eligible prime, the order estimates and the nonscalar Jordan-block checks. These are acceptance signatures, not proofs of modularity. Definitions and constructions introduced here: **none**. The $D_r$ API and tests above are checks of the already-owned imported definition. The packet has one retained theorem node, three imported targets, one local planet and two imported planets: **Raising levels**, **Weight and level from minimal lifts**, and **Khare–Wintenberger Theorem 1.2**.

Coverage is **planned**, with **one recorded gap and one open R15.2 request**, G1. Upstream Chebotarev Layer 10 supplies complete splitting, the non-Galois corollary through a Galois closure, infinitude and finite symmetric-difference invariance. Exact R15.6 nodes supply the residual conventions. The missing Lean carriers are implementation boundaries. Assembly carries these interfaces into the sibling-owned targets and retains G1 until its supplier comparison is established.

## Sources and versions

All statements above are paraphrases organized by the targets they serve. Locators refer to the following versions, independently checked 16 October 2026; file hashes are recorded in the packet. The publisher served different watermark-bearing Buzzard bytes to the input worker and reviewer; both hashes are retained as provenance, without a claim of a different mathematical edition.

- Khare–Wintenberger, [*Serre's modularity conjecture (I)*, author's preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf), published in *Inventiones Mathematicae* 178 (2009), 485–504. The locators here use the preprint's running pages, not journal pagination. Theorem 1.2 and conventions: pp. 2–6; Theorems 4.1 and 5.1 and local conditions: pp. 6–10; Lemmas 6.1–6.3: pp. 10–12; Theorem 3.4 proof: §8.4, pp. 17–18; residual-irreducibility argument: §10.1, p. 20. The KW II proofs of the lifting inputs remain with R22/R24.
- Buzzard, [*On level-lowering for mod 2 representations*](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), *Mathematical Research Letters* 7 (2000), 95–110. Definitions and criterion: pp. 100–102; Theorem 2.8 and proof: pp. 103–107; Theorems 3.1–3.2 and their separate induction branch: pp. 107–109. Use the existing R20 source correction E1 at Theorem 2.8.
- Wiese, [*Dihedral Galois representations and Katz modular forms*](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), *Documenta Mathematica* 9 (2004), 123–133. Theorem 1: pp. 123–124; Theorem 9: pp. 130–131; Theorem 10 and the proof of Theorem 1: pp. 131–132; Lemma 11: p. 132.

Two inherited source findings are independently confirmed in the packet: **SerreWeightAndLevelOptimisation/E1**, the missing unramifiedness hypothesis in published Buzzard Theorem 2.8, and **ClassicalSerreModularity/E15**, the author-preprint Theorem 5.1(2) misprint placing a nonzero nilpotent monodromy operator in $\operatorname{GL}_2$. The intended operator lies in the endomorphism algebra. The latter was checked on the preprint page image; no claim is made about the journal printing. The [review report](../reviews/REV-ClassicalSerreModularity--R27.4.md) records the corrections and validation.
