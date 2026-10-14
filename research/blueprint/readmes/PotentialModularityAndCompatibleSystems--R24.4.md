# Potential modularity and compatible systems: the KW lifting import

R24.4 applies KW I Theorem 4.1 to a **given lift of a modular residual
representation**. GL2ModularityLifting owns the lifting theorem and its proof:
R22.5 supplies the odd-prime statement and R22.6 the dyadic statement. Global
lift existence and deformation-ring finiteness are separate inputs to the
compatible-system construction, not inputs to this lifting theorem.

This is a target-level import plan. The existing
[R24.3 packet](../packets/PotentialModularityAndCompatibleSystems--R24.3.json)
contains both R24.4 targets. Use those IDs and their suppliers. This layer
introduces no additional definition, construction or lifting theorem. The full
specification below is definitive for the dedicated R24.4 suggested file.

## Conventions and supplied objects

Let p be prime, 𝔽 a finite field of characteristic p, E a finite extension of
ℚ_p and 𝒪 its ring of integers. Identify its residue field with 𝔽 after a
coefficient extension when necessary. A lift is a continuous representation
ρ : G_ℚ → GL₂(𝒪) whose reduction modulo the maximal ideal is isomorphic to
ρ̄ : G_ℚ → GL₂(𝔽). The residual representation is of S-type: continuous,
absolutely irreducible and odd in KW's convention. The residual and lifted
representations are required to have finite ramification where the theorem
specifies it.

For a characteristic-zero lift, oddness means det ρ(c) = −1 at complex
conjugation. Weight k means the Hodge–Tate multiset {0, k−1}, in the convention
of KW I §4, pp. 6–7. The integer k(ρ̄) is the classical Serre weight, not the
weight k of an arbitrary crystalline lift. At odd p work with the normalized
residual weight 2 ≤ k(ρ̄) ≤ p+1. A normalization by twisting must be performed
on the representations and their modularity witnesses together; changing an
integer label alone does not normalize a lifting problem. At p=2 the residual
weights are 2 and 4, with weight 2 exactly in the finite-at-2 case.

Residual modularity means that ρ̄ is obtained from the Galois representation of
a characteristic-zero cuspidal eigenform using a stable lattice and reduction;
it is not an arbitrary assertion about matching traces at a few primes. Lift
modularity means that, after coefficient extension, ρ is isomorphic to the
Galois representation of a characteristic-zero cuspidal eigenform. These
notions, the lattice comparison, local Hodge predicates and Serre weights belong
to the R01/R06/R15/R22 suppliers. This layer defines none of them again.

Sources for these conventions are KW I §1, p. 2, §1.5, p. 4, and the
paragraphs before Theorem 4.1, pp. 6–7. All page numbers in this document are
the printed pages of the author's preprints, not the Inventiones pagination.

## R24.4 — the full KW modularity-lifting interface

### Residual witnesses: imported API and checks

Reuse
`PotentialModularityAndCompatibleSystems:R24.4/alpha-beta-from-residual-modularity`.
Its exact supplier is
`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`.
The stable R22.5 identifiers of the following predicates have parent stage
R22.1: they are early residual inputs to lifting, not conclusions of lifting.

For a totally real field F unramified at p, the imported predicates are:

| Predicate and owner node | Witness required |
| --- | --- |
| ResidualModularAlpha, `GL2ModularityLifting:R22.5/kw-residual-modularity` | A cuspidal automorphic representation of GL₂(𝔸_F), of parallel weight k(ρ̄), unramified at every place above p, with attached residual representation isomorphic to ρ̄ restricted to G_F. |
| ResidualModularBeta, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta` | A cuspidal automorphic representation of parallel weight 2, with conductor exponent at most one at every place above p, and the same residual comparison. |

Their owner APIs give the existential predicates, the witness characterizations
`residualModularAlpha_iff` and `residualModularBeta_iff`, and constructors
`residualModularAlpha_of_witness` and `residualModularBeta_of_witness` in
`TauCeti.ModularityLifting`. An α-witness of weight 2 gives a β-witness because
its conductor exponent is zero. The two existential witnesses need not be the
same eigenform. Their use here is to discharge precisely the residual inputs
of the imported lifting theorem. Their definitions, API declarations and tests
remain in their owner packet.

For modular ρ̄ over ℚ, the weight/level supplier produces some prime-to-p level
N with a weight-k(ρ̄) witness, and a weight-two witness of level dividing Np,
at odd p. After soluble totally real base change unramified at p and preserving
residual absolute irreducibility, these give α and β. At p=2 it gives β for
residual weights 2 and 4, and α only for residual weight 2. The allowable
base-change supplier preserves nonsolvable image in the dyadic application and
cyclotomic absolute irreducibility in the odd-prime application; it also supplies
the splitting requirements of Theorem 9.7.

This is an import of the weight part of Serre's conjecture, not an application
of the full theorem asserting modularity of every S-type representation.
`SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem` supplies the
weight step; R20.4 supplies prime-to-p level and weight-two passage, and R20.6
is requested for their uncovered small-prime cases. R15.2 and R15.5 supply the
passage from a Katz eigenform to a characteristic-zero eigenform. R17.4 supplies
soluble base change. One may enlarge the prime-to-p level to meet N>4; this
interface makes no assertion of optimal level. KW II §8.2, p. 70, and §10.2,
p. 92, fix these witness requirements and qualifications.

**Checks of the imported definitions.** Each row is about a specified witness;
failure of that witness does not prove nonexistence of every other witness.

| Imported predicate | Three required checks |
| --- | --- |
| α | A modular elliptic curve with good reduction at p and residual weight 2 supplies an unramified weight-two witness. An unramified form of weight k(ρ̄)+p−1 is not itself an α-witness. A Steinberg component of conductor exponent one is not an α-witness. |
| β | A weight-two unramified component has conductor exponent zero and is allowed. A weight-two Steinberg component of exponent one is allowed. A weight-two component of exponent two is not a β-witness. |

These are the three tests of each existing R22 predicate, exposed here for the
consumer. Also check that at dyadic residual weight 4 the adapter does not
promise α, and that a characteristic-p Katz form is not passed directly as a
characteristic-zero automorphic witness. No new definition unit tests are
counted in this packet.

### KW I Theorem 4.1: imported theorem contract

Reuse `PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1`.
The following two exports are its mathematical prerequisites:

| Supplier | Residual hypotheses | Hypotheses on the supplied lift | Conclusion |
| --- | --- | --- | --- |
| `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic` | p=2, ρ̄ modular, image nonsolvable | ρ odd and finitely ramified; crystalline of weight 2, or semistable of weight 2 with k(ρ̄)=4 in that second branch | ρ modular |
| `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime` | p>2, ρ̄ modular, ρ̄ restricted to G_{ℚ(μ_p)} absolutely irreducible, normalized residual weight | ρ finitely ramified; crystalline of weight k with 2≤k≤p+1, or potentially semistable of weight 2 | ρ modular |

These are Theorem 4.1(1) and (2), KW I p. 7, with the standing conventions on
p. 6. At odd p, oddness of a characteristic-zero lift follows from oddness of
the residual representation: at c, its determinant is a sign, and reduction
in odd characteristic distinguishes the two signs. At p=2 it must be supplied
as a separate hypothesis on ρ.

The dyadic semistable branch retains k(ρ̄)=4. It does not admit an arbitrary
semistable lift with finite residual representation at 2. The crystalline
weight-two branch is an independent sufficient condition. The odd-prime branch
uses cyclotomic absolute irreducibility, which is stronger than irreducibility
over ℚ alone. General potentially semistable weight two is part of the full
odd-prime export; neither potentially Barsotti–Tate alone nor the narrower
Theorem 9.7 local types exhausts it.

**Proof route, owned by R22.** The residual adapter gives α/β witnesses.
Allowable base change puts the lift in the setting of KW II Theorem 9.7,
pp. 89–90. The R=T application there, followed by soluble descent, gives the
cases in its range. For the full odd-prime statement, the owner also imports
the lifting results specified in KW II §10.2, p. 92: Diamond–Flach–Guo for
the lower crystalline weights; Kisin and Diamond for the nonordinary and
ordinary weight-p+1 cases; Kisin for potentially Barsotti–Tate; and the
semistable weight-two results of Wiles, Taylor–Wiles and Diamond. The Remark
on p. 92 excludes crystalline k=p+1 with k(ρ̄)=2 from the self-contained route
and limits its potentially semistable assertion to the stated cyclotomic
local extension. The additional cases cannot be inferred just by renaming
Theorem 9.7.

The existing R22.5 packet records the nonordinary endpoint's Kisin Durham proof
as unread. Its ordinary R21.4 hypotheses and the finite-inertia twist reduction
for general potentially semistable weight two also require verification by the
supplier. This document imports the full statement while keeping those proof
boundaries visible. It does not reproduce or certify their proofs. No step
in this route invokes KW II Theorem 6.1, Theorem 10.1, or the existence of a
new global lift.

**Acceptance checks of the application.**

1. For p=2, a modular residual representation with nonsolvable image and a
   supplied odd crystalline weight-two lift passes the first branch. The
   consumer checks the image, oddness and local type separately.
2. A dyadic semistable lift with k(ρ̄)=2 fails the semistable branch. Test
   crystallinity separately; failure of one branch does not negate the other.
3. An even dyadic lift fails both branches. Modulo 2 the matrices diag(1,−1)
   and diag(1,1) coincide, as do their determinant signs. The suggested file
   gives three concrete matrix checks of this obstruction.
4. At p=5 the crystalline interval is 2 through 6. Weight 7 falls outside that
   interval. Weight 6 with residual weight 2 must invoke the full endpoint
   export, including its recorded proof leaf.
5. An odd-prime potentially semistable weight-two lift requires the full
   local-type export even if it is not in Theorem 9.7's displayed range.
6. The consumer accepts a lift as input. No construction of a lift, universal
   deformation ring or characteristic-zero point is an implicit argument.

These checks test whether an application is licensed by the theorem; failure
of a hypothesis is not a claim that the lift is nonmodular.

## Dependencies

The mathematical stage inputs to R24.4 are
`GL2ModularityLifting:R22.5`, `GL2ModularityLifting:R22.6` and
`SerreWeightAndLevelOptimisation:R20.3`, with R20.6 supplying the residual
small-prime leaves. R24.4 does not depend on R24.3.

R24.5 consumes R24.3 and R24.4 directly: lift existence and recognition of
modularity are distinct inputs to the system construction. The theorem outputs
and their two KW theorem planets remain with R22.5 and R22.6. The packet records
the corresponding graph proposal; this reader specifies the mathematical
dependency order.

## Library boundary and suggested file

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no
R24.4 record. Its related R19.3 and R26.1 records identify absent arithmetic
representation/weight and compatible-family interfaces; this is not a fabricated
audit verdict for R24.4.

Exact pinned source inspection confirms `Field.absoluteGaloisGroup`, with the
Krull topology, `Representation`, `Representation.IsIrreducible`, `Matrix.det`
and `ZMod`. Algebraic irreducibility over one coefficient field does not by
itself express absolute irreducibility of a cyclotomic restriction. The full
local crystalline/semistable, lattice reduction, Serre-weight and attached
newform Galois interfaces used above are supplied targets, not baseline
declarations.

The current Tau Ceti library also has newforms and coefficient fields.
The current upstream LocalGaloisGroups and ProfiniteArithmetic roadmaps already
plan the local/cyclotomic and topological infrastructure, and
IntegralHeckeAndGaloisDeterminants already plans continuous Frobenius witnesses
with semisimplicity and absolute irreducibility. This import pass creates no
competing carrier or recognition predicate. The inspected roadmap and library
commits are recorded in the packet.

[The suggested file](../suggested/PotentialModularityAndCompatibleSystems--R24.4.lean)
contains the concrete determinant/reduction example signatures. It explicitly
omits `TauCeti.CompatibleSystems.alpha_beta_from_residual_modularity` and
`TauCeti.CompatibleSystems.kw_theorem_4_1` until their arithmetic supplier
interfaces make the full statements expressible. No arbitrary proposition
fields stand in for modularity, Hodge conditions or the conclusion. Compiling
this file checks its three matrix signatures, not the omitted lifting theorem.

## Completion and sources

R24.4 is **planned**. Both targets are supplied by existing comparison nodes;
their chains terminate in named supplier nodes, exact requests and recorded
proof/signature gaps. This dedicated pass adds zero nodes, zero API items,
zero definition tests and zero planets. The six owner definition tests are
displayed above, and the suggested file has three matrix example signatures.
The packet remains complete with proof closure false. The remaining work is
the R22.5 endpoint/branch verification, small-prime residual witnesses and
realization of the arithmetic signatures by their owners.

- Khare–Wintenberger, [*Serre's modularity conjecture (I)*](https://www.math.ucla.edu/~shekhar/papers/results.pdf), author's preprint of Invent. Math. 178 (2009), 485–504: conventions in §1, p. 2, §1.5, p. 4, and §4, pp. 6–7; Theorem 4.1, p. 7.
- Khare–Wintenberger, [*Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), author's preprint of Invent. Math. 178 (2009), 505–586: §8.2, p. 70; Theorem 9.7, pp. 89–90; §10.2 and Remark, p. 92.

Both copies were read on 2026-10-14. Their SHA-256 hashes and inspected
locators are in the packet. No publisher collation or reading of Kisin's Durham
paper is claimed, and no new source error was established in this import check.
