# Euler systems revision 2

Issue [#10808](https://github.com/CBirkbeck/tauceti-explorer/issues/10808), job `BP-EulerSystemsAndKolyvaginSystems~2`.
Agent: Codex, session `codex-F2G2WN`, branch `codex-F2G2WN-euler-systems`.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/10808#issuecomment-6267367347).

This is a complete target-level revision pass, not a checkpoint or a formalization.
All nine stages are `planned`; none is `closed`. Every implementation status remains
`unchecked`. The earlier independent review is preserved as `previousReview`; the
current `review` is pending. This worker does not independently certify its changes.

## Deliverables and assembly

Only the whole [packet](../packets/EulerSystemsAndKolyvaginSystems.json),
[reader](../readmes/EulerSystemsAndKolyvaginSystems.md),
[suggested file](../suggested/EulerSystemsAndKolyvaginSystems.lean) and this handoff change.
There are **151 logical targets: 124 imported and 27 local**, with 427 API items,
223 checks and 45 planets. All 61 definitions/constructions have an API and at
least three discriminating checks. No layer has more than six planets.

The two imported parts remain unchanged and pinned:

- ES.0 part, 89 nodes: SHA-256 `7ce915210b8a29761cd15199968017928c6a1b6c2322daff12fc6b2f8789dcf2`.
- ES.8 part, 35 nodes: SHA-256 `eab9fb0a60fcbf40dee7bf007491b13612ac1719ea27d9125d4fa7c5ee25c395`.

Reconstruct by reading the imported records, applying string-leaf corrections,
field additions, prerequisite removals/additions, then stage assignments, and
adding the whole packet's local records. Stage assignments update `parentStageId`
and `realises`, preserving stable IDs. Whole `requests` replaces the parts' union.
Coverage now lists the actual assigned stages, including the seven placements
made by the preceding independent review. The reader preserves every unchanged
presentation and renders all new or changed target fields; its numbering and
prerequisite lists reflect this assembly.

## Repairs to the three returned targets

**Selected ring-class descent (ES.3).** Three new targets separate the argument:
`selected-bounded-descent`, `ring-class-uniform-restriction` and
`ring-class-local-operator`. If a kills kernel and cokernel of f, choose
f(b)=a x and define d(x)=a²b. Then f d=a³ and d f=a³. For f=s r, if a kills
ker(s) and s(z)=x, r(d(x))=a³z. This is a comparison of selected classes, with
no uniqueness claim about a whole fibre. Four checks include multiplication
by 5 and the nontrivial kernel of Z/25→Z/5.

The ramification-field intersection is contained in K_c. Thus the invariant
coefficient groups over every K_cn are bounded by the single finite W(K_c),
and inflation–restriction gives the same annihilator for every intermediate
K_cm→K_cn, independent of the number of auxiliary primes. For n=mℓ, compare
the selected descent with Nekovář's cyclic cocycle over K_cm *before*
localization. The factorization uses the inverse image of the global invariant
target in intermediate cohomology; it does not assume a bounded kernel of
restriction at the ramified auxiliary local prime.

For a general anticyclotomic character, retain the χ⁻¹ and χ coefficient
modules. Locally χ is trivial at an inert auxiliary prime. Rational Frobenius
Φ satisfies Φ²−hΦ+ℓ=0, with h=a_ℓℓ^(1−r); finite evaluation uses Φ².
The integral cocycle norm identity gives A v=B u, with
A=(h/π^M)Φ−((ℓ+1)/π^M) and
B=(a_ℓ/π^M)−((ℓ+1)/π^M)Φ. Divide integral coefficients before reduction.
For M>B₁ both operators have kernels/cokernels killed by π^B₁.
The operator relation replaces the scalar formula even in the quadratic case;
only the conjugation eigensign is restricted to χ²=1.

**Rational anticyclotomic descent (ES.4).** The proof now consumes those
comparisons. The χ-paired Chebotarev choices and duality are retained.
Bounded operator comparison costs at most B₁ for order and 2B₁ for a two-vector
span. Enlarge the fixed descent constants to absorb these losses and the
bottom factor p^(3ν); at most two auxiliary primes are needed. These constants
remain independent of M, which is the property used on passing to rational
coefficients. No exact equality with the printed scalar constant is claimed.

**Higher-weight integral coefficient-prime bound (ES.8).** Two new targets are
`residual-unramified-mu-zero` and `ordinary-coefficient-prime-comparison`.
The former transfers finite-character unramified μ=0 across the residual
extension, including locally 1/ω characters and finite trivial-character terms.
It uses H⁰(K,T/πT)=0 for the chosen lattice. It is explicitly a full/unramified
Selmer theorem, with a new arithmetic supplier contract, rather than an ordinary
Selmer theorem obtained by renaming a local condition.

For R=Λ_(π), O-finite and away-p μ=0 local corrections vanish. The full/zero
and zero/full duals vanish over R in both orientations. With the actual ordinary
filtration and its higher-weight twist, Poitou–Tate for (o,0)⊂(f,0) makes
X_(o,f),R free of rank one; the sequence for (o,0)⊂(o,o) then makes X_ord,R
free. The intervening local cokernel is torsion and maps to a free R-module,
so its map is zero. Consequently μ(M)=0 for X_ord∼Λ⊕M⊕M. This supplies the
missing coefficient-prime inequality. The argument does not divide an error
depending on coefficient rank along π+T^m by m.

## Ownership, package order and remaining work

The exact finite-character arithmetic input belongs to **CMAllPrimeMainConjectures
CZ.3**, extending its existing anticyclotomic θ-component target to locally 1/ω
and globally trivial θ. Its Coleman/image supplier is not yet verified in that
packet. The new request states the input precisely in both orientations;
SelmerIwasawaCohomology L3 receives the exact local and Poitou–Tate interface.
The ordinary μ=0 conclusion is proved here, not assumed in that interface.

This creates a package-order obligation that must be resolved before packaging:
generic ES.8 Rubin theory → CM CZ.2/CZ.3 → residual μ transfer → ordinary
comparison → late integral Eisenstein application. The packet proposes a bundle
for that late application and the CM input, or a later ES Part II. The generic
ES.8 theory has no reverse CM prerequisite. These targets form an acyclic
order, but unsplit roadmap names would form a cycle; do not add that cycle to
the campaign graph. CM keeps elliptic units, Katz measures and character μ=0;
ES keeps descent and the conditional ordinary comparison. No supplier packet
or campaign file is edited by this job.

The two older recorded gaps remain: the original Kolyvagin 1990 source has not
been read (the method used is Rubin's public replacement), and the classical
square-index constant uniform in K remains an arithmetic application request.
An annihilator exponent is not a substitute for that length formula. All other
stage refinements and supplier contracts remain explicit in `coverage.remaining`
and `requests`. The new proof routes and supplier/bundle decision need fresh
independent review; no claim of closure is made.

## Sources and library boundary

This revision directly read the following versions and relevant proof passages;
the packet records their hashes and locators. No source passage is reproduced.

- Castella–Hsieh, author version 2 July 2022: Lemma 4.7, pp.18–19; §7, pp.28–38.
- Nekovář, MPIM1990-78: §§6–10, printed pp.11–20, including page images for the
  cyclic/local comparison. The 1992 version of record was not compared.
- Keller–Yin, arXiv:2402.12781v2: §§1.2–1.5, pp.13–31, and §3, pp.34–40.
  Theorem 1.2.2 and Proposition 1.2.5 give the character input; Lemma 1.3.6 and
  Theorem 1.4.1 supply the exceptional local/residual comparisons.
- CGLS, arXiv:2008.02571v2: Proposition 1.4.2, p.11; Theorem 1.5.1, p.12;
  §3.4, pp.24–25; Proposition 4.2.1, pp.28–29. The last result is rational and
  is not cited as an integral ordinary μ theorem.

The preceding review's source verdicts remain historical; this revision adds no
independent erratum verdict about its own repairs. Source correction searches
found no applicable later correction to substitute for these comparisons.

The existing library audit and current read-only TauCetiRoadmap/TauCeti trees
were checked, including the newer roadmaps omitted from the atlas snapshot.
Generic Fitting ideals, module kernels/ranges and discrete cohomology are consumed,
not replanned. Nearby ProfiniteCohomology and ClassFieldTheory roadmaps were read.
Pinned mathematical statements use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Validation

- `scripts/check_blueprint.py`: zero errors, zero warnings.
- Separate assembly audit: both hashes, all overlay replacements, all 151 IDs,
  coverage/stage assignments, acyclic internal graph, no forward layer dependency,
  definition/construction APIs and checks, planet counts and unchecked status pass.
- Reader conservation: exactly 151 target headings, all 427 API names and all
  223 check names present; references and per-layer dependencies updated.
- `scripts/check_sorry_data.py`: no admitted data definitions.
- `lean-check research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`:
  exit 0 at the pins, 15 warnings, all `declaration uses sorry`, no errors.
  The 356-line file uses individual imports, nine light real-bodied definitions,
  selected-descent signatures/examples and an elementary exact-sequence milestone.
  It does not build the arithmetic carriers or prove the Selmer theorems.
- `research/blueprint/intake.py check-files` and `git diff --check`: pass.

The next worker starts with the fresh independent review of these three repaired
branches, especially the general-character local operator computation and the
ordinary coefficient-prime supplier dictionary. The durable packet and reader
contain the full statements, proof routes, source versions and remaining work.
