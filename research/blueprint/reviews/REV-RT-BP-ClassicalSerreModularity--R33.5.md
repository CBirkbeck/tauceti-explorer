# Independent verification of RT-BP-ClassicalSerreModularity--R33.5

Job: `REV-RT-BP-ClassicalSerreModularity--R33.5` (issue #4432). Verifier: Claude Code, session
`cc-f805bf`. Date: 2026-09-30. Inspection base: atlas `main` at `65a02762`.

## Verdicts

| Finding | Severity | Verdict | Fix scope |
|---|---|---|---|
| /1 export imports the classical proof | medium | confirmed | the fix is stated more precisely: conditional corollary in this packet, no new StrongSerre node |
| /2 cross-characteristic irreducibility step | medium | confirmed | corrected fix: restrict to the KW I Theorem 5.1 system |
| /3 stage edges where finer nodes exist | medium | confirmed | node ids fixed below; R17.6/R20.6 stay |
| /4 stale README wording | low | confirmed | extended: README intro, node title, summary, E3–E9 |
| /5 Lean preamble absence claim | low | confirmed | as proposed |

All five findings are confirmed. Three are medium and go to `FIX-RT-BP-ClassicalSerreModularity--R33.5`.
This review creates only its two deliverables. It changes no target file.

## Independence and disclosure

The packet was written by cc-39fac3 (PR #3860) and reviewed by cc-fb70e5 (PR #3863). The red team was
Codex codex-J6LwjP. This session did none of the three: `cc-f805bf` appears in none of the red-team
files, the packet or its review. Disclosure: this session earlier reviewed the paper extraction
PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01, which routes to ClassicalSerreModularity R26.1/R27.6. It also red-teamed
KW09-I/II, with findings about the owners of R27.6, R24.x and R20.x. None of that work touched this packet
or R33.5–R33.6.

## Sources and baseline

- Dieulefait–Pacetti, arXiv:2108.07577v2, <https://arxiv.org/pdf/2108.07577v2>. SHA-256
  `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` reproduced on 2026-09-30.
- Khare–Wintenberger, *Serre's modularity conjecture (I)*, authors' preprint,
  <https://www.math.ucla.edu/~shekhar/papers/results.pdf>. SHA-256
  `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` reproduced on 2026-09-30.
- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`, read in source and in the declaration index. No Lean was
  compiled or run.

## 1. The export's prerequisites import the classical induction (confirmed, medium)

`R33.6/elliptic-curve-export-via-either-route` says its proof "only uses the statement" of R27.6, but it
lists two prerequisites from R27.6:

- `R27.6/finite-flat-weight-two-export`, which is unconditional and whose own first prerequisite is
  `R27.6/full-classical-serre-theorem`;
- `R27.6/full-classical-serre-theorem` itself.

The unconditional export does not yield the conditional one, so the planned graph imports the classical
proof. The inputs the conditional proof actually needs are not listed: Serre's Proposition 4 and Carayol's
change of nebentypus.

I recomputed the closures independently over the integrated decomposition and the three
ClassicalSerreModularity packets:

| Node | Closure size | R26/R27.2–R27.6 nodes in it |
|---|---|---|
| qualitative theorem | 44 | none |
| modern strong form | 52 | only `R27.4/strong-form-by-minimal-lifts` |
| export | 116 | 34, e.g. `R27.4/theorem-1-2 → R27.3/double-induction-assembly` |

The graph has no cycle. R33.6's stage text asks for the R29 theorem "through a theorem parameter or a
separate corollary".

**Authorized fix.** Make the changes in this packet only:

- State the node as a conditional corollary. Its hypothesis is the strong-form conclusion for the
  given ρ̄ (it arises from a newform of weight k(ρ̄), level N(ρ̄) and character lifting ε(ρ̄)), phrased
  with `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`.
- Give it these prerequisites:
  - that node;
  - `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p` (Serre's Proposition 4);
  - `SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character`;
  - `R33.6/strong-form-by-the-modern-route`, for the instantiation.
- Delete both R27.6 edges.
- Add an acceptance check on the closure: no R26/R27.2–R27.6 node other than
  `R27.4/strong-form-by-minimal-lifts` may appear.
- Update the suggested signature to match.

Do not add a StrongSerre definition node here, because the full statement belongs to R27.6. Do not edit
the R27.3 packet. The fixes note may tell the maintainer that R27.6's export is an instance of this
corollary.

## 2. Irreducibility of every member of an arbitrary system (confirmed, medium, fix corrected)

The source passages:

- DP p. 7, Definition 1.10(4): the members are semisimple representations over K_𝔭.
- DP Remark 4: DP first build Deligne's system for f, then compare the two representations at the *same*
  prime by Brauer–Nesbitt.
- DP §3 (p. 15): DP use members' irreducibility and oddness silently.

The node's second proof step goes from a reducible p-adic member to a reducible 2-adic lift "by Chebotarev
and Brauer–Nesbitt". Its fourth hypothesis asserts that det ρ_ℓ = ψχ_ℓ with ψ independent of ℓ, and uses
this for oddness. Both claims need companions:

1. A reducible ρ_p is χ₁ ⊕ χ₂ with Hodge–Tate, finitely ramified characters.
2. Each such character is ψᵢχ_p^{nᵢ} with ψᵢ of finite order. This is the classification of Hodge–Tate
   characters of G_ℚ.
3. Only then does ψ₁χ₂^{n₁} ⊕ ψ₂χ₂^{n₂} exist at 2 for Brauer–Nesbitt to compare with ρ₂.

The classification is a named fact, and it is missing as a prerequisite (PROTOCOL §2). The conclusion
itself is true.

The red team missed that the reducibility bridge is already planned:
`PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda` (Taylor 2006,
Lemma 6.5). That node does not give oddness. The simpler fix is the red team's first option:

- KW I p. 9, Theorem 5.1, gives "an E-rational almost strictly compatible, irreducible, odd system"
  whose 2-adic member is the Theorem 5.1(1) or (2) lift.
- KW I p. 8 defines "irreducible" and "odd" member by member.
- DP's Theorem 1.9(1)–(2) is exactly that theorem ("The first three cases are due to
  Khare-Wintenberger ([KW09b, Theorem 5.1]…").

**Authorized fix.**

- Restrict the lemma to that system, with prerequisite
  `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`.
- Take oddness and irreducibility of every member from that theorem.
- Delete the Chebotarev/Brauer–Nesbitt step and the ψ claim.
- Take crystallinity at odd p outside the ramification set from KW's almost-strict clause ("ℓ ≠ 2 and r_q
  unramified").
- Add a hypothesis saying that DP's Theorem 1.9 cites this theorem.
- Keep the reducible-residual branch.
- Add no request for rank-one companions.

## 3. Stage prerequisites where finer supplier nodes exist (confirmed, medium)

Every supplier node below was added after this packet (all on 29 September), and none of their packets is
reviewed yet. This is a current-snapshot update.

| Need | Current edge | Supplying node |
|---|---|---|
| DP Theorem 1.9(1)–(2) at p = 2 | `R24.3` | `R24.3/theorem-5-1-part-1-minimal-crystalline`, `/theorem-5-1-part-2-weight-two` (or `R24.5/kw-theorem-5-1-systems`, after /2) |
| DP Theorem 1.11 | `R24.6` | `R24.5/dieulefait-families` (stage R24.5 owns the construction of a system with a prescribed member) |
| DP Remark 4 | `R24.6` | `R24.6/linked-systems-modularity-transfer` |
| globalisation audit | `GL2ModularityLifting:R32.6` | `R32.6/globalisation-dependency-audit`, which still lists unaudited inputs (Tung's global inputs, Gee's Theorem 4.4.12) |
| "arises from", N, k, ε | `AlgebraicModularFormsAndSerreWeights:R15.6` | `R15.6/s-type-arises-from-and-modular`, which leaves the eigenform comparison open |

The R24.6 request therefore merges an R24.5 need with an R24.6 one.

**Authorized fix.** Make the changes in this packet only:

- In the five consuming nodes, replace these stage edges with the node ids.
- Delete each request whose need one of these nodes states exactly.
- Split what remains so that no request names a stage for another stage's result.
- Restate the gap as the unaudited items of the R32.6 audit node, citing it.
- Keep `R33.6/modern-and-classical-modularity-agree` as the eigenform/newform comparison.
- Keep the R17.6 and R20.6 edges and requests. No R20.6 node supplies the p = 2, k = 4 step from weight
  two to weight four; the case table of `R20.6/strong-form-case-table` is not that statement.
- Do not change the supplier packets.

## 4. README wording rejected in review (confirmed, low, scope extended)

README lines 63–65 still say that the modern route "stops being independent of KW exactly" at the scalar
dyadic case, which the accepted review corrected in the node. The same stale claim appears in three more
places the red team did not list:

- README lines 12–13;
- the title of `R33.6/two-routes-comparison` ("where the modern route stops being independent of
  Khare–Wintenberger");
- the packet summary.

Also, the R27.3 packet records E3–E9, including E8, so "E3–E7" at line 72 is stale by two ids, not one.

**Authorized fix.** Rewrite README lines 12–13 and 63–65 to keep these four claims distinct:

1. the qualitative argument is independent of KW's induction;
2. both routes share KW I Theorem 5.1;
3. both use `R27.4/strong-form-by-minimal-lifts` for p odd and for p = 2 with k = 2;
4. that argument is indispensable only in the scalar dyadic case with non-dihedral projective image.

Then:

- retitle the node (for example "…: what each route uses from Khare–Wintenberger");
- reword the summary to match;
- change line 72 to "E3–E9" and keep "no new source issue".

This is presentation only.

## 5. Lean preamble says modular forms are absent (confirmed, low)

What the pinned libraries contain:

- At Mathlib `082e2d3`, `Mathlib/NumberTheory/ModularForms/Basic.lean` lines 74–84 define the structures
  `ModularForm` and `CuspForm`.
- At Tau Ceti `f790474`:
  - `TauCeti.cuspFormsOld` is defined at `Newforms/Basic.lean:103`;
  - `structure Newform` is at `Newforms/Newform.lean:102`;
  - `HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` is at
    `Newforms/StrongMultiplicityOne.lean:87`.

The Galois half of the sentence stands. The index has no carrier for representations of G_ℚ; the only Tau
Ceti hit is a cocharacter action of algebraic tori.

**Authorized fix.** In the standard note only:

- say that residual Galois representations of G_ℚ and the Serre-modularity interface are missing;
- say that the modular-form and newform carriers exist and are to be reused.

Leave the signatures commented and the examples unchanged. The same sentence in other parts' suggested files
is outside this red team's scope.
