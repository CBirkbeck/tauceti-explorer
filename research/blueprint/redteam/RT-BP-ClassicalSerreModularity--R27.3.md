# Red team: Classical Serre modularity, part R27.3

Agent: Codex, session `codex-rtOQ9t`. Date: 1 October 2026. Refs #4431.

**Complete: two medium findings and one low finding.** The medium findings concern the integral local-type interface and conductor bookkeeping. Both admit local repairs without changing the modularity conclusions.

## Version and independence

The target is the accepted packet at commit
`062d65cc67a11eaed0c75373cc1662366e69ada5` (REV-FIX-RT-PAPER-KHARE-WINTENBERGER-09-I, PR #5275):
32 nodes, 14 requests, three recorded gaps. Its original author and reviewer were Claude Code sessions
`cc-39fac3` and `cc-fb70e5`; the accepted fix and its reviewer were `cc-f805bf` and `cc-c2c06b`.
I did not write or review those jobs.

At this checkout's base, `3655b944e937d0c3eaf2b708e7ad961e35018bd9`, the packet also contains the
pending area fix `99c17592cde0e5f0d5a690def23159e52f2a4d16` (PR #5282, Codex `codex-5ebb6f`).
That revision has 33 nodes and 16 requests. I compared it with the accepted version: it changes the
Chebotarev input, Hypothesis H explanation, compatible-system export, good-dihedral insertion, and adds
an odd-Artin node. None of the three findings below is corrected by that pending revision. I have not
treated its additions as independently accepted.

I read the original review and handoff, the accepted fix review, the prior KW-I red team, and the relevant
langlands-2 area findings. Existing reports about the early good-dihedral prerequisite, Hypothesis H,
weight-one ownership, strong-form untwisting, Savitt input, and wider stage cycles are not new findings here.

## Sources and extent of the check

Fresh copies matched the packet's hashes:

| Source | Version and pages read | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Author's 23-page preprint, all pages | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2) | arXiv v2, all 17 PDF pages including references | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [Khare–Wintenberger, Annals 169](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | Published version, printed pp. 249–251 | `154c0c2a2245e50cb2be3c82705f9176fe0e9b597424236ddca11299d38cdb22` |
| [Serre, Duke 54](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | Published scan, printed pp. 185–189 | `8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038` |

I visually checked DP pp. 6 and 13, KW I pp. 9 and 18, and Serre pp. 186, 188 and 189 to resolve
lattice, matrix and weight formulas obscured by extracted text. The UCLA download required disabling
certificate-chain verification; the exact recorded hash was reproduced. The Inventiones printing of
KW I was not collated, and no finding below is a newly asserted published-source erratum.

The check covered all accepted nodes, requests, coverage entries, existing source issues E3–E9, the reader
document, and suggested Lean file. All current nodes were compared as well. The mathematical checklist was:

- KW: the two inductions and their base cases; preservation of the good-dihedral type; bounded auxiliary
  characteristics; prime-field coefficients in Lemma 8.2; conductor tracking through raising levels;
  the dyadic weight-two argument; strong-form untwisting; the regular compatible-system export.
- DP: hypotheses of the imported lifting statements; the distinction between almost strict and strict
  compatibility; solvable termination; each of Pasos 1–6; local induction at the auxiliary prime;
  the prime-2 transition and odd ramification index; the level-one/Schoof terminal imports.
- Ownership: R01 local representations and conductors, R07 integral p-adic Hodge theory, R08 local
  lift conditions, R15 weights/eigenvalue lifting, R17 solvable modularity, R20 optimisation,
  R22/R32 modularity lifting, R24 compatible systems, and R25 terminal cases.

Every exact node named as a prerequisite exists in the repository packets. I inspected the 37 external
prerequisites against a fresh assembled atlas and the supplier packets. Eighteen exact supplier nodes
were absent from the assembled projection but present in their packets; a projection miss is not evidence
that their mathematics was never planned. The 32-node internal graph has 62 prerequisite edges and is
acyclic. This does not certify the entire atlas: the prior fix review already identifies a wider stage cycle,
and the pending area fix explicitly records remaining promotion work.

## 1. Medium: the order-three type needs an adapted stable lattice

**Location:** `R33.3/dp-dyadic-transition-and-the-order-three-type`,
especially `orderThreeType_reduction`, and its import `R33.2/dihedral-local-type-at-n`.

R33.2 chooses an integral induction and proves its reduction is the unramified representation
$1 ⊕ η$. R33.3 reuses the construction at coefficient prime 3 and local prime 2, then asserts that
its reduction agrees on inertia with the residual Steinberg representation. A residual Steinberg
extension can have nontrivial unipotent inertia. It therefore cannot be the reduction of that particular
split lattice.

DP p. 6 requires an actual stable integral lattice realizing the specified residual inertia module.
Semisimplified reduction and Frobenius trace do not discharge that hypothesis. DP's proof of Lemma 2.3
on p. 13 retains an off-diagonal extension entry; the blueprint must supply the corresponding integral
choice instead of applying the split-reduction API unchanged.

Here is an explicit calculation. Put $E=ℚ_3(ζ)$, where $ζ^2+ζ+1=0$, and
$π=ζ-1$. Let $𝒪$ be the ring of integers of $E$. On the standard lattice $L_0=𝒪e_1+𝒪e_2$, inertia and Frobenius act as

```text
D0 = [ ζ   0  ]       F0 = [ 0  1 ]
     [ 0   ζ² ]            [ 1  0 ].
```

The stable lattice $L_1=𝒪(e_1+e_2)+𝒪πe_2$ has change-of-basis matrix
$P=((1,0),(1,π))$, and the matrices become

```text
D1 = [ ζ   0  ]       F1 = [ 1   π ]
     [ ζ   ζ² ]            [ 0  -1 ].
```

For both choices, $D^3=F^2=1$ and $FDF^{-1}=D^2$, the tame relation at 2.
Both have Frobenius trace zero. But reduction modulo $π$ gives

```text
D0_bar = [ 1  0 ]     D1_bar = [ 1  0 ]     F1_bar = [ 1   0 ]
         [ 0  1 ]              [ 1  1 ]              [ 0  -1 ].
```

These inertia modules are not isomorphic: the first has a two-dimensional invariant space, the second
a one-dimensional invariant space. Swapping the basis displays the latter as the usual nonsplit
Steinberg-shaped extension. This is a local witness to the missing choice, not a purported global
counterexample satisfying all non-solvability hypotheses.

**Repair.** Make the R33.2 residual theorem explicitly refer to its standard integral lattice. Replace
R33.3's unqualified equality by existence of a stable lattice realizing the supplied residual module,
with separate split and nonzero-extension cases and the unramified twist retained. The special
existence statement is already available as a planned input: specialize KW I Theorem 5.1(4) at
$p=3,q=2$, through `R24.3/required-lift-types`. Its local supplier
`R08.6/export-away-from-p` explicitly calls for matrices satisfying the Frobenius relation.
This provides a repair without making the DP route depend on the final KW modularity conclusion.
If using DP's more general prescribed-type theorem, prove its compatibility hypothesis explicitly.

Add both lattices as tests: the standard lattice is a non-example when the target inertia extension is
nonzero. The existing order/divisibility tests cannot distinguish these cases. This is medium severity:
the construction is repairable and its final theorem remains true.

The following exact certificate was executed successfully. It verifies identities over
$ℤ[z]/(z^2+z+1)$, so it does not rely on floating-point computations.

```python
Z, O, z, z2, pi = (0, 0), (1, 0), (0, 1), (-1, -1), (-1, 1)

def add(x, y):
    return x[0] + y[0], x[1] + y[1]

def mul(x, y):
    a, b = x
    c, d = y
    return a*c - b*d, a*d + b*c - b*d

def mm(A, B):
    return tuple(tuple(add(mul(A[i][0], B[0][j]),
                           mul(A[i][1], B[1][j]))
                       for j in range(2)) for i in range(2))

I = ((O, Z), (Z, O))
P = ((O, Z), (O, pi))
D0, F0 = ((z, Z), (Z, z2)), ((Z, O), (O, Z))
D1, F1 = ((z, Z), (z, z2)), ((O, pi), (Z, (-1, 0)))
assert mm(D0, P) == mm(P, D1)
assert mm(F0, P) == mm(P, F1)
for D, F in [(D0, F0), (D1, F1)]:
    assert mm(mm(D, D), D) == I
    assert mm(F, F) == I
    assert mm(mm(F, D), F) == mm(D, D)

def red$A$:
    return tuple(tuple((a+b) % 3 for a, b in row) for row in A)

assert red(D0) == ((1, 0), (0, 1))
assert red(D1) == ((1, 0), (1, 1))
assert red(F1) == ((1, 0), (0, 2))
```

## 2. Medium: raising levels needs a conductor bound, not equality

**Location:** `R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`,
second hypothesis, fourth proof step and first acceptance condition.

The packet explains the new dyadic conductor by saying it has the same 2-part as the original
$N(ρ̄)$. For an original mod-2 representation, $N(ρ̄)$ is prime to 2 by definition.
When its weight is 4, KW I Theorem 5.1(2) instead constructs a weight-two lift that is Steinberg at 2.
Its conductor exponent is 1: the unramified semisimple rank-two Weil–Deligne representation has
nonzero rank-one monodromy, and $a_2=2-\dim\ker N=1$.

The packet's preceding hypothesis recognizes this exception, but the equality in the next hypothesis
does not account for it. Furthermore, minimality of the second lift concerns the intermediate
mod-$p'$ representation; reduction can lower conductor. It does not preserve an equality all the way
back to the original representation.

KW I §8.4 only needs the upper bound $v_2(N(ρ̄'_s))≤r$.
Write $A$ for the first system's dyadic conductor exponent:

| Original case | Bound on $A$ | Why it suffices |
| --- | --- | --- |
| $p>2$ | $A=v_2$N(ρ̄)$≤r$ | First lift is minimal at 2 |
| $p=2,k=2$ | $A=0$ | First lift is crystalline at 2 |
| $p=2,k=4$ | $A=1$ | The theorem excludes $r=0$, so $r≥1$ |

Reduction at $p'$ gives exponent at most $A$. Minimality at 2 of the second lift preserves that
intermediate exponent; reduction at $s$ can again decrease it. Thus the final exponent is at most
$A≤r$, exactly what $(D_r)$ requires.

**Repair.** Replace the equality by this case split and chain of inequalities, using the monodromy and
reduction-conductor comparison owned by ArithmeticGaloisRepresentations R01.3 through the existing
R24 interface. Add the boundary case $p=2,k=4,r=1$: the original prime-to-2 conductor has exponent
zero, while the first system has exponent one. Permit subsequent conductor drop. The statement of
Theorem 3.4 does not change.

## 3. Low: analytic modular forms are present at the pins

The suggested file's standard note says that modular forms are absent from the pinned libraries.
This is false at both pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  `Mathlib/NumberTheory/ModularForms/Basic.lean`: `ModularForm Γ k` and `CuspForm Γ k`
  bundle the slash action, holomorphy, and cusp conditions.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`,
  `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:102`:
  `HeckeRing.GL2.Newform N k` extends `EigenformAwayFromLevel` with membership in the new
  subspace and first Fourier coefficient 1.

I read those declaration bodies at the exact commits. Also present is Mathlib's
`Representation.ind` in `Mathlib/RepresentationTheory/Induced.lean`: induction along a group
homomorphism over a commutative ring. It is an algebraic starting point, not the local Galois/lattice
comparison in finding 1.

**Repair.** Narrow the note to the missing arithmetic interfaces and retain these analytic carriers as
reuse inputs. The proposed Galois comparison and modularity signatures still belong in planning
comments. This finding changes the baseline description, not the library audit's conclusion that the
Serre endpoint is unbuilt.

## Boundaries and checks

The three accepted gaps remain visible: the precise small-prime Skinner–Wiles input, primary-source
proofs behind the imported DP lifting/globalisation statements, and the KW-II proofs of the KW-I
interfaces. This red team reads those supplier contracts; it does not claim to reprove every supplier.

DP's usage of unramified type at the coefficient prime is explicitly crystalline (pp. 5–6).
I therefore do not flag the Paso 3 wording as a new false assertion that the p-adic representation
itself has trivial inertia. Likewise, the finite-flat weight-two export uses existing optimisation
inputs rather than duplicating their construction, and the DP terminal cases are imported from R25.

Validation:

- Exact matrix certificate above: passed.
- Internal prerequisite graph and repository-node resolution: passed with the projection caveat above.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-BP-ClassicalSerreModularity--R27.3.result.json`.
- `python3 research/blueprint/intake.py check-files` on the two deliverables.
- `git diff --cached --check` before submission.

No Lean compilation was attempted for this review-only submission. Historical compilation of the target
does not validate its uncompiled pending revision or prove its commented arithmetic statements.
