# FIX-PKG-PerfectoidQuotients~adv2

Completed by Codex (GPT-6), session `codex-SwcdeU`, 2026-10-17.
Refs #10202. Claim confirmation: [bot comment](https://github.com/CBirkbeck/tauceti-explorer/issues/10202#issuecomment-6235893748).

The manager's bundle-order finding is resolved. This is a complete package
fix, with no unfinished deliverable or mathematical blocker. The new results
are roadmap targets with proof routes, not formalized proofs.

## Finding → change

| Finding | Disposition |
| --- | --- |
| Reverse supplier `PR.0/perfectoid-tor-independence` | Owned in README §0.0 as `perfectoid_tor_independence`: derived p-completed tensor products, their discrete integral perfectoid ring and pushout property; corresponding perfect-prism calculation included. Proof uses BS Lemma 10.3, pp.78–79, with E1's existing perfect-characteristic-p Tor theorem. |
| The cotangent application had used the same supplier name for a different square | Added the exact local `fontaine_tor_independence`, with θ conventions and a two-term regular-generator proof (BMS1 Lemma 3.13, p.24). §0.3 now calls this result. The completed tensor theorem is not substituted for the Fontaine square. |
| Reverse supplier `PR.0/delta-etale-extension` | Owned in §0.0 as `delta_etale_extension`, with finite generation, p in I, derived completeness and complete étaleness. Supporting `completeEtale_algebraization`, `delta_witt2_etale`, `delta_derivedCompletion` and `perfectPrism_completeEtale_lift` have statements and proof routes. No assumption of p-torsion-freeness is added. |
| Hidden attribution to P4.15.1 of complete étale comparisons | Replaced by explicit local algebraization, δ-extension and perfect-prism lifting targets. P4.15.1 is used only for generic derived completion/tensor/descent, not as a supplier of either moved theorem. Checked its actual immutable contract, not just its section title. |
| Bundle order | All supplier occurrences of the three later bundle roadmaps removed from the package. Their names occur only under Downstream consumers, with the order PerfectoidQuotients → AInfCohomology → PrismaticCohomology → PadicHodgeTheory. |
| Earlier B1/B2 ownership findings | Their previous repairs are preserved: P1.24–P1.25 own the predicate and dictionary, P4.15.1–P4.15.6 own semiperfectoid perfectoidization. No duplicate predicate, universal carrier, or analytic quotient is restored. |

Only README.md, Suggested.lean, review.json and this handoff change. Existing
Checks, targets and source locators outside the dependency repair are retained.
No metadata, packet, upstream roadmap or generated atlas file changes.

## Dependency closure and existing-work audit

Read the worker/protocol/package-review instructions, prior package reviews and
prior fix handoff before editing. Checked the reviewed library-coverage file
(no matching PerfectoidQuotients review entry), pinned Mathlib and Tau Ceti,
and current TauCetiRoadmap including its additional roadmaps. No integral
perfectoid, δ-ring or general derived-pushout carrier implementing these full
statements was found at the pins/current library. The existing Witt vectors,
truncated Witt vectors, polynomial evaluation and perfect-ring interfaces are
used directly for the Lean examples.

- [PerfectoidSpaces at 3a308c7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3a308c7ea66cce055b429c79505eb97f1f02106c/TauCetiRoadmap/PerfectoidSpaces/README.md),
  P4.15.1: generic derived completion/descent and exchange, built from
  DerivedModuleAlgebra and Mathlib. Its contract does not require either moved
  lemma. P4.15.2: basic δ-algebra, distinguished elements, perfect-prism
  equivalence and the Cartier regularity criterion; these remain supplied.
- [EnhancedDerivedSheaves at b3ea60e](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b3ea60e3efc3bd4a0b541fb54469dcbf88772064/TauCetiRoadmap/EnhancedDerivedSheaves/README.md),
  Layer E1, `perfectRing_tor_eq_zero`: the perfect-characteristic-p Tor theorem
  already has this owner. It is cited, not replanned. Verified the read
  document's Git blob equals the public pinned blob
  `44c42f5cf6fc41c3803fcb538e7c3ca7259e83de`.
- P0.19 supplies the full cotangent complex; P4.15.3–P4.15.4 retain their
  existing Hodge–Tate and cover contracts. None is replaced by a dummy carrier.
- Current upstream roadmap main checked at
  `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
  `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Pinned build: Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474`.

The local proof dependencies are acyclic: perfect-prism equivalence plus E1
prove the completed tensor result; §0.2's regular Fontaine generator proves
the Fontaine square before its use in §0.3; basic δ-algebra plus the locally
stated algebraization and length-two Witt étale theorem prove δ-extension;
these feed §0.6 and §1.1. The source's later location of the tensor proof does
not import almost purity, Theorem 7.4, Proposition 8.5 or animated
perfectoidization into the proof.

## Adversarial pass on touched statements

| Statement/interface | Instances and negative controls tried | Result / change |
| --- | --- | --- |
| `perfectoid_tor_independence` | Identity leg; zero factor; two perfect polynomial algebras over Fp; both factors Fp over the imperfect base Fp[X]; arbitrary torsion-allowing integral perfectoid rings | Completed tensor scope explicit. The imperfect-base control has H^(−1)=Fp by the X-resolution. All three perfectoid hypotheses retained; no flatness assumption or uncompleted Tor claim. |
| Perfect-prism tensor calculation | I=(p) for perfect characteristic-p rings; zero factor; distinguished generator and its image | Cartier property obtained from the supplied distinguished-element regularity criterion, not assumed merely from a δ-ring structure. Derived quotient then becomes ordinary. |
| `fontaine_tor_independence` | Identity map; W(k)→W(l) for perfect characteristic-p algebras; product projection k×l→k; zero source/target | Multiplication-by-ξ resolution stays exact. Source and target zero cases separated from the nonzero generator criterion. Uses ordinary θ, no unannounced Frobenius twist. |
| `completeEtale_algebraization` | Identity; product; localization A[1/X]; unit ideal I=A | Lift only the finitely presented étale reduction, then use the derived nilpotent tower, formal étaleness and derived Nakayama/completeness, retaining unbounded-torsion generality. B′ need not be finite or unique; the completed lift is unique with specified reduction. For I=A the complete target is zero. |
| `delta_witt2_etale` and the Witt section | p=2; mixed characteristic C=Z; C=F2; rings with p-torsion | Ghost-image kernel is V(C[p]), not V(C). Over Z, V(1)² has coordinate one 2. Over F2, the nonzero element 2 in W₂(F2) squares to zero. No identification with a product of ghost coordinates. |
| `delta_etale_extension` | Identity; A×A; completed localization; zero ring/unit ideal; p=2; actual δ versus its Frobenius lift | Actual p-derivation is specified via Witt sections, without division by p. For Z₂, δ(2)=−1. Two lifts on Z₂⟨X⟩ agree mod 2 but give δ(X)=0 and 1: complete smoothness cannot replace complete étaleness. |
| `delta_derivedCompletion` and classical completion | I=(p) and (p²) on Z_(p); I=A; I=0; non-discrete derived completion possibility | Power-of-p hypothesis retained; (I,p) has the same radical. Classical and derived completions distinguished. Animated carrier stated explicitly when the derived completion is not discrete; no fabricated ordinary ring. If p=0 in a δ-ring, the δ-identities force the zero ring, so nonzero Fp is not used as a δ-ring test. |
| `perfectPrism_completeEtale_lift` | Identity reduction; product reduction; completed localization; zero reduction; θ versus shifted θ convention | Complete étale lifting, δ-extension and relative Frobenius give the perfect prism; complete flatness preserves Cartier ideal. ALB Remark 2.1.9 permits θ. Does not claim finite étaleness for every étale lift. |
| §0.3 cotangent supplier substitution | Regular generator resolution; shift [1] remains degree −1 | Only its Tor premise is redirected to the local Fontaine theorem. Full cotangent carrier and the earlier sign Checks retained. |
| §0.6 and §1.1 supplier substitutions | Completed étale and henselian routes; relative smooth-site cover | Exact local δ/algebraization contracts replace the removed suppliers. Generic completion and lower-tier cover contracts remain as before; no change to the hypotheses or end conclusions. |
| Seven new Lean examples | Polynomial X-injectivity and specialization; Witt p-injectivity; Frobenius fixes 2 with numerator −2; distinct polynomial lifts with identical mod-2 images; mixed-characteristic Verschiebung square; length-two F2 Witt nilpotent | All use real pinned carriers and type-check. Their scope is the concrete witnesses, not a Lean formalization of unavailable derived/δ theory. No new data definitions. |

Every new theorem has a versioned source locator and named Checks in the
README. The full statements stay there because their carriers are absent at
the pins; the Lean file mirrors the concrete sign/direction witnesses and
lists the corresponding README targets. Nothing claims proof completion from
`sorry` elaboration.

## Source reading receipts

Read the indicated results and their proofs directly; all mathematical prose
in the package is in our own words. No source excerpt or source-by-section
summary is included. Access date for these public PDFs: 2026-10-17.

| Source | Read locators | PDF SHA-256 |
| --- | --- | --- |
| [BS, arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4) | Lemmas 2.17–2.18, pp.17–18; proof of Lemma 10.3, pp.78–79 | `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a` |
| [BS17, arXiv:1507.06490v3](https://arxiv.org/pdf/1507.06490v3) | Lemma 3.16 and proof, p.14; verifies the E1 supplier | `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e` |
| [BMS1, arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3) | Lemmas 3.13–3.14 and proofs, p.24 | `285f7d2088607688365ca92222dcf44c0acd6c4788dd872fe6a6191b9c4e072a` |
| [ALB, arXiv:1907.10525v4](https://arxiv.org/pdf/1907.10525v4) | Proposition 2.1.8 and Remark 2.1.9, p.13; Corollary 2.1.10 and proof, p.14 | `6eb02c16c525360141b1c5d118ae04db070f3c0e9cb9fff0f1598fc889b50aec` |
| [Borger, The basic geometry of Witt vectors I](https://maths-people.anu.edu.au/~borger/papers/05/bgwvI.pdf) | Proposition 8.1, pp.35–36; Proposition 8.3 and Remark 8.4, pp.37–38; Theorem 9.2 and proof, pp.38–40 | `6f4faf9f70cd5ee2621fcfc595e5876ae569d01b26cc260d230a54156cf285f8` |

Also read [Stacks tag 04D1, Lemma 10.143.10](https://stacks.math.columbia.edu/tag/04D1),
including the standard smooth presentation/Jacobian proof of étale lifting
across a quotient. This supplies the precise algebraization input used here;
no general smooth-algebra algebraization theorem is silently imported.

## Validation

- `lean-check research/blueprint/packages/PerfectoidQuotients/Suggested.lean`:
  exit 0; 54 warnings, all `declaration uses sorry`; zero errors or other
  warnings. Seven new examples, no added data definitions. Memory was above
  the worker minimum; only the shared pinned build was used.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidQuotients.json`:
  exit 0, 0 errors and 0 warnings; 61 existing nodes, unchanged.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  exit 0, 0 problems.
- `git diff --check`: clean. Dependency-name search finds the three later
  bundle roadmaps only in Downstream consumers; no `PR.0` supplier remains.
- review.json is `accepted`, reviewer
  `fix-FIX-PKG-PerfectoidQuotients~adv2`, date `2026-10-17`.

## Downstream redirection for the manager

The following is bookkeeping for the downstream owners, outside this issue's
four allowed paths; those files are intentionally not edited here.

| Old downstream-owned node/reference | New supplier in this package |
| --- | --- |
| `PrismaticCohomology:PR.0/perfectoid-tor-independence` | §0.0 `perfectoid_tor_independence`, including its perfect-prism pushout calculation |
| `PrismaticCohomology:PR.0/delta-etale-extension` | §0.0 `delta_etale_extension` and `delta_derivedCompletion`; supporting `completeEtale_algebraization` and `delta_witt2_etale` are local to that proof |
| Fontaine-square uses previously attributed to the first node | §0.0 `fontaine_tor_independence` |
| Complete étale prism lifting previously attributed to P4.15.1 | §0.0 `perfectPrism_completeEtale_lift` |

The downstream packets/packages should import these statements from
PerfectoidQuotients when next updated, preserving the manager's bundle order.
No second job was claimed. No source file or scratch artifact is needed for a
successor: all locators, receipts, conclusions and redirections are above.
