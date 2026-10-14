# Handoff: BP-PadicDifferentialEquationsAndRigidCohomology--RD.2

Job: follow-up plan of layer RD.2 (local monodromy with Frobenius) of *P-adic differential equations, rigid cohomology and p-adic weights* (issue #9744). Worker: Claude (session claude-VjNCXF), 2026-10-14.

Deliverables:
- `research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology--RD.2.json`: 20 nodes, status `complete`, RD.2 coverage `planned`.
- `research/blueprint/readmes/PadicDifferentialEquationsAndRigidCohomology--RD.2.md`: the reader, rendered from the packet.
- `research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.2.lean`: the suggested Lean file.

The first-pass packet `PadicDifferentialEquationsAndRigidCohomology.json` (accepted) is cited, not edited. Its 30 RD.2 nodes stay as they are.

## What is closed

Every open item of the first pass's RD.2 coverage record has a disposition. They are listed in the packet's `firstPassResponse` and in §7 of the reader.

- **Tsuzuki's unit-root theorem** is now planned from public sources, no longer imported. The source is Kedlaya, *p-adic Differential Equations*, Chapter 19, from the author's posted PDF. Nine nodes:
  - `unramified-extensions-of-amice-rings`;
  - `c-constant-unit-root-module`;
  - `lang-trivialisation-of-unit-root-modules`. This supplies the extension with v_p(A − I) > 1/(p − 1) that Kedlaya's Proposition 6.11 assumes;
  - `galois-representation-to-differential-module`;
  - `fontaine-katz-unit-root-equivalence`;
  - `unit-root-matrix-normal-form`;
  - `dwork-transfer-to-the-centre-of-a-disc`;
  - `small-constant-unit-root-module-is-trivial`. This is the key lemma, and its bound is sharp by Dwork's module;
  - `tsuzuki-equivalence-finite-local-monodromy`.
- **Overview Chapter 4**, which the RD.1 pass assigned here, is planned in two nodes:
  - `quasi-constant-modules-are-semilinear-representations`;
  - `matsuda-decomposition`, with local duality for quasi-unipotent modules as part (a).
- **Irr = Swan** is planned in three nodes:
  - `highest-break-under-finite-etale-pullback`;
  - `matsuda-highest-break-theorem`, which is Kedlaya's overview Theorem 5.4.10;
  - `irregularity-equals-swan-conductor`.
  - The Galois side is ArithmeticGaloisRepresentations R01.3 (tier 7).
- **André's MC/MCF Tannakian form** (Xu–Zhu §2.9.1) is planned in four nodes:
  - `quasi-unipotent-modules-admit-frobenius-structures`. Over K̄, MCF is exactly the category of quasi-unipotent modules. Frobenius structures are taken at a finite, discretely valued level so that the local monodromy theorem applies;
  - `differential-modules-with-algebraic-constants`;
  - `unipotent-solutions-and-residues`;
  - `andre-local-monodromy-group`. Its Tannakian group I × G_a comes from Tau Ceti's `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`, not from a general reconstruction theorem.
- **Berger's form** needs no move-down. `local-monodromy-over-finite-etale-robba-extensions` states the theorem over every R^L and for any ring presented as one. Berger's B†_rig,K = B†_rig,F ⊗ B†_K (Lemme 3.13) is such an R^L. The field-of-norms identification belongs to the consumer, PadicHodgeTheory R06.3 with its own P7.
- **Characteristic-p completion lemma**: `RD.0/completed-algebraic-closure-is-algebraically-closed`, from Conrad's handout, Theorem 1.1. It is placed in layer RD.0 because RD.0/extended-robba-ring consumes it. Mathlib's `IsAlgClosed.of_denseRange` covers characteristic 0 only.
- **Documenta version and erratum of Slope filtrations revisited**: both read.
  - `locatorConcordance` maps every cited label from arXiv v4 to the Documenta pages. The numbering is identical. Only Remark 6.2.3 is reworded.
  - The erratum's corrections are recorded as source issues E-RD2-3 to E-RD2-7. E-RD2-4 is the first pass's E72, which is now a known correction.

## Source issues recorded (E-RD2-1 to E-RD2-9)

- Kedlaya's book, Theorem 19.4.1 and Corollary 19.4.2: the printed R should be IR (R = ρ^{b+1}). Also, b may lie in (0, 1). This is not in either errata list.
- Xu–Zhu (2.9.2.2): Sol(M) is (Coker N)^∨, not Coker N.
- Five corrections already published in the Documenta erratum, recorded as known.
- Kedlaya's overview, Lemma 5.4.6: a missing "≥".
- Kedlaya's overview, proof of Lemma 5.4.7: a sign in the Artin–Schreier presentation. Not in the overview errata file.

## What remains (precisely)

- Mebkhout's proof (Invent. Math. 148 (2002)) is not read. No free copy was found. No alternative proof is planned.
- The relative local monodromy theorem over dagger algebras belongs to RD.5's follow-up (#9747).
- Tsuzuki's equivalence (b) is stated for k perfect only. For imperfect k, only the trivialisation is planned.
- Gap (inherited): over an infinite perfect residue field, the ramification interface rests on R01.3's recorded tier-(P) gap.

## Requests, moves down, restructure

- No requests. No upward citation: every cross-roadmap prerequisite is in a lower tier.
- No notion moved down into RD.2 from a higher roadmap.
- `restructure` proposals:
  1. **Assembly edits** to first-pass nodes:
     - tsuzuki-unit-root-finite-monodromy and monodromy-representation-equivalence gain prerequisites here;
     - berger-form-of-local-monodromy cites the R^L node, and its P7/PG.0 hypothesis is dropped;
     - RD.0/extended-robba-ring cites the completion lemma;
     - E72 becomes a known correction.
  2. **Sub-layers RD.2a/b/c**, with a planet allocation. RD.2 now has 8 planet candidates: 6 from the first pass and 2 here, "Irregularity equals Swan conductor" and "André's local monodromy group".
  3. **Berger ownership**: the identification stays with PadicHodgeTheory.
  4. **Local duality**: the RD.1 continuation (merged 2026-10-14 while this job ran) planned `RD.1/robba-residue-duality` (book Proposition 20.4.2). Its proof cites three RD.2 nodes, which inverts the layer order. Its gap G5 asks for the public descent proof that `RD.2/matsuda-decomposition` (a) gives, from overview Proposition 4.4.3. Proposal: at assembly, move that theorem's parentStageId to RD.2 and add matsuda-decomposition to its prerequisites; `RD.1/residue-duality-pairing` can stay in RD.1.
  5. **Completion lemma**: it is general field theory. PerfectoidSpaces P4 records the same characteristic-p gap, and Mathlib has it as a TODO.
  6. **FiniteFlatGroups overlap**: the accepted FiniteFlatGroups package moved down §R07.4.7–4.8 (Robba ring, slope filtration theorem). That is the k perfect, q = p, unramified special case of the first pass's RD.2 slope filtration nodes. The RD assembly or package should cite it and keep only the generalisation.
  7. **Dwork transfer**: Dwork's transfer theorem to the centre of a disc may move to RD.1.
- **Concurrency.** The RD.0 (#9742), RD.1 (#9743) and RD.5 (#9747) follow-ups were claimed by other workers while this job ran. The RD.1 and RD.7 continuations merged before this pull request; this packet was rebased on them and checked against their node lists.
  - No node duplicates theirs, except the local duality noted in proposal 4.
  - Source-issue ids do not collide: theirs are E301–E309 and E701–E704; these are E-RD2-1 to E-RD2-9.
  - `c-constant-unit-root-module` now cites `RD.1/dwork-overconvergence-proof` for the coefficient bound of Dwork's exponential.
  - Still to watch at assembly: the completion lemma, placed in RD.0 here (the RD.0 follow-up is still open), and Dwork's transfer theorem.
- **Access of Kedlaya's book.** The RD.1 continuation treated Kedlaya's *p-adic Differential Equations* as not cleared. The author posts the first edition on his own page. `research/blueprint/sources/ACCESS.json` counts an author's page as free access, and its KEDLAYA-NOTES entry matches `kskedlaya.org`. This job therefore reads it as a free source, cited by URL and SHA-256. The book is not in `~/atlas-library` and is not marked there as not cleared.

## Suggested Lean file

The file follows the first pass's compact shape: only statements over carriers at the pins, and the other targets are listed in a closing comment. It contains:
- the characteristic-free `isAlgClosed_of_denseRange`, with ℂ_p as a test;
- the matrix condition of c-constancy and its Kronecker-product closure;
- the exponent inequality where p^{−1/(p−1)} enters Tsuzuki's key lemma, and its equality case;
- conjugacy of a nilpotent N with qN, and existence of h with m ∣ p^h − 1;
- the Artin–Schreier Herbrand function and its inverse;
- formal solutions of a unipotent connection;
- `#check`s of the Tau Ceti Galois-descent and Tannaka declarations used.

`lean-check` (Tau Ceti f790474, Mathlib 082e2d3) elaborates the file with `sorry` as the only warning. A `run_cmd` audit over the 17 declarations, run on a scratch copy, found no `sorry` in any statement and no sorry'd data.

## Checks run

- `python3 scripts/check_blueprint.py <packet> --index ~/tauceti-swarm/workers/baseline/declarations.tsv`: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files <packet>`: 0 problems.
- `scripts/check_errata.py` run directly on the packet reports only the "must start with <file>/E" id-format message that every packet gets.
- In-memory `merge_blueprints` with and without the first-pass packet: no error and no skipped links.
- A Sonnet locator cross-check of all 60 source references against the downloaded texts found one page error, now fixed: book Definition 24.2.7 is on p. 360.

## Sources

All were read on 2026-10-14. URLs and SHA-256 hashes are in the packet's `sources` and `sourceVersions`.

- Read:
  - Kedlaya, *p-adic Differential Equations* (author PDF), with its errata;
  - Kedlaya's overview (arXiv:math/0501361v2), with its errata file;
  - Kedlaya, arXiv:math/0110124v4;
  - Slope filtrations revisited: arXiv v4, Documenta, and the Documenta erratum;
  - André, arXiv:math/0203248v1;
  - Xu–Zhu, arXiv:1910.13391 (page images checked);
  - Berger, arXiv:math/0102179;
  - Conrad, Math 248A handout;
  - Kedlaya, Notes on isocrystals (arXiv:1606.01321v6).
- Not read:
  - Tsuzuki, Amer. J. Math. 1998. No longer needed.
  - Christol, *About a Tsuzuki theorem* (2001).
  - Mebkhout 2002.
  - Matsuda, Compositio 2002.
