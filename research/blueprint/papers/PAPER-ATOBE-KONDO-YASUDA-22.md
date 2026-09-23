# Atobe–Kondo–Yasuda (2022): extraction and routing

Issue [#1395](https://github.com/CBirkbeck/tauceti-explorer/issues/1395). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints (codex-a71f92 #1814, codex-c83e7a), whose reports follow below as history.
- **The paper.** H. Atobe, S. Kondo and S. Yasuda, *Local newforms for the general linear groups over a non-archimedean local field*, Forum Math. Pi 10 (2022), e24, 56 pp. It is open access, and the published PDF was read.
- **Items.** The result has **161 items: 8 library, 10 planned and 143 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Nineteen are recorded under `sourceIssues`. Three affect a stated result, including the main theorem in one case (E19).

## This continuation (cc-442dc5)

**What was read.** §§7.2–9 of the published article in full, and the other sections at the findings' locators. Pages 52–53 were checked as images.

**The main finding, E1 with E19.** Theorem 2.1 for a Speh representation σ = Sp(π, m) with L(s, π) = 1 is proved only in §9:
- Proposition 9.5 uses Corollary 9.4.
- Proposition 9.6 uses Lemma 9.3 and the uniqueness in Theorem 9.1.

All three proofs rest on one step: φ_Ze is (N′, Ψ)-equivariant, so that W∘ι ∈ Π.
- **Why the step fails (n = m = 2).** Here V′ = 1, V″ = V and Ψ(g) = ψ(g_12 + g_34).
  - Conjugating V by ι(u′) = 1 + zE_13 sends E_32 to E_32 − zE_12, so Ψ is not preserved.
  - If the step held, every W∘ι would be left N′-invariant and square-integrable on GL_2 by Theorem 8.2, hence zero.
  - That contradicts Lapid–Mao's Corollary 3.15, which the paper uses in its own existence proof.
- **Theorem 9.1's uniqueness is false (E1).** Take f = 1_{uK′} − 1_{K′} with u = [[1, ϖ^{−1}], [0, 1]].
  - Every test integral of f vanishes, since each W⁰ is left N′-invariant and det u = 1.
  - Lapid–Mao gives W in the Shalika model with W∘ι = f.
  - Adding W to an essential vector gives a second one.
- **The consequence (E19).** The paper does not establish Theorem 2.1 for Sp(π, m) with L(s, π) = 1 and n, m ≥ 2.
  - It needs another proof of Corollary 9.4, and another proof that σ^{K(c_π)} ≠ 0.
  - No counterexample to Theorem 2.1 is known. The items keep it as the target, with this recorded as open (`main-one`, `main-lex`, `speh-l1`, `speh-main`, `levi-separation`).

**Other findings checked.**
- **E3 (Lemma 8.10).** When n = m = 2, Ψ is trivial on N′. At repeated parameters (x, x), the t-derivative of W⁰_Ze(xe^t, xe^{−t}) is a second eigenfunction, H(g) = (a − b)q^{−(a−b)/2}x^{a+b}.
  - It is an eigenfunction because the eigenvalues are even in t.
  - H(1) = 0, while W⁰(1) = 1, so the lemma's span fails.
- **E2 (Lemma 7.1).** The escape claim fails only for λ = 0, where it matters only for an unramified character of GL_1, a case excluded under L(s, π) = 1.
- **E4.** Checked on the image: the factor is q^{−md}, not q^{−m}. It now affects nothing.

**The `known` field.** Every finding had `known` beginning "new (provisional …)", which `scripts/errata.py` would read as "corrected in print". All are now "new". Crossref records no update, and arXiv v4 is the latest version.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded, including the gap in the main theorem's Speh case (E19), which the extraction cannot close.
- What remains is suppliers' proofs and design work.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Published Theorem9.1/Definition9.2 pp48–50; arXiv v4 pp52–54. *Printed:* There exists a unique function *Correction:* Replace the unique-choice definition by a solution-set/existence interface pending a repaired theorem with extra conditions. The two printed test conditions alone do not determine a vector for n=m=2. Also remove the assertion that all restricted Speh vectors lie in Pi.
- **E2** (error; affects the proof), Published Lemma7.1 p38 and its compact-mod-center escape claim; v4 pp41–42. *Printed:* G_n ∩ ⋂_(m>=1) Z_n X_lambda^(>=m) = ∅ *Correction:* Require lambda≠0 for this escape argument. Handle lambda=0 separately in the ambient L(s,pi)=1 application via absence of spherical cuspidal vectors. Do not export the literal standalone lemma for all cuspidals and all lambda.
- **E3** (error; affects a stated result), Published proof of Lemma8.10 p47; v4 corresponding proof. *Printed:* Lemma8.10 says the entire Hecke eigenspace is spanned by the set of formal parameter assignments; its proof also counts assignments as a set after coincident parameters are identified. *Correction:* The all-parameter spanning statement must be replaced: n=m=2, equal parameters(x,x) admit the additional eigenfunction H(g)=(a-b)q^(-(a-b)/2)x^(a+b) for g=n diag(varpi^a,varpi^b)k. Distinct-parameter spanning and a confluent family at collisions require separate valid statements and proofs.
- **E4** (misprint; affects nothing), Published pp52–53, proof and statement of Proposition9.8; same q^-m in v4 pp56–57. *Printed:* q^(-m) X^(-d) *Correction:* Use q^(-m*d) X^(-d) in every transformed determinant-d summand.
- **E5** (misprint; affects nothing), Published p37, generating-series proof after equation(6.1). *Printed:* F=(-1)^n(1-t)/(1+Σ_(i=1)^n x_i t^i) *Correction:* Use the infinite sum in the denominator for equality in R[[t]], or declare congruence modulo t^(n+1).
- **E6** (misprint; affects nothing), Published p19 after Figure2 (visually checked). *Printed:* [a+1,a] to [a,1] *Correction:* The endpoint is (1,r), as in the path definition on p18.
- **E7** (misprint; affects nothing), Published §2.5 p11, truncated-dual diagram (visually checked). *Printed:* ((m_max)#)^-=(Delta'_1)^-+...+(Delta'_4)^- *Correction:* Retain indices2,3,4,5 from p10 after the singleton Delta'_1=[7,7] disappears; their truncations are[5,5],[4,4],[2,3],[0,2]. Alternatively rename them explicitly, but do not mix original and reset labels.
- **E8** (misprint; affects nothing), Published proof of Proposition4.6 p23. *Printed:* [M']+[M''] *Correction:* Use [M'] vee [M''] in the final strict-inequality display.
- **E9** (misprint; affects nothing), Published p25 immediately after Lemma5.1. *Printed:* L_1=o^n and L_1=⊕ p^lambda_i *Correction:* The second lattice is L_2.
- **E10** (misprint; affects nothing), Published Example6.4 p33, first raw count in continued display (visually checked). *Printed:* -N_(3,5,4,1)(M_pi) *Correction:* Use -N_(3,7,4,1)(M_pi).
- **E11** (gap; affects the proof), Published Lemma6.6 p34, converse proof. *Printed:* c=Card(m) *Correction:* Use the degree-one/type-chi specialization for the current proof. To export the full printed generality, replace c by degree-weighted derivative orders and justify constituent-wise equalities along each cuspidal line.
- **E12** (misprint; affects nothing), Published p50 near the end of uniqueness proof; v4 p54. *Printed:* D=V' iota(G') *Correction:* Use D=V iota(G').
- **E13** (gap; affects the proof), Published proof of Lemma9.3 p49; v4 p53. *Printed:* Pi ≃ ∫^⊕ pi' dmu(pi') *Correction:* Supply a disintegration with multiplicity fields and precisely defined evaluation/intertwining maps on an appropriate dense domain. Explain why the spherical test pairings determine the relevant spectral components, including singular Satake parameters.
- **E14** (misprint; affects the proof), Published proof of Proposition9.6 p53. *Printed:* W'_Sh(g)=W_Sh^ess(g·iota(a)) *Correction:* The right side must use an essential solution for the CONTRAGREDIENT representation and inverse psi, with a distinct label. Specify its existence before the comparison. This notation correction alone does not justify the uniqueness argument.
- **E15** (misprint; affects nothing), Published Section2.3 p7. *Printed:* cuspidal representation of G_d for some d>=0 *Correction:* Use d>=1 for nonempty cuspidal segments; G_0 occurs only as the empty representation after derivatives.
- **E16** (misprint; affects nothing), Published Proposition5.2 proof p27, final paragraph. *Printed:* span(eprime_1,...,eprime_(n_i))=span(e_1,...,e_(n_i)) *Correction:* Use prefix b_i=n_1+...+n_i in both spans.
- **E17** (misprint; affects nothing), Published Section6.4 p36, first Mackey display. *Printed:* The final tensor factor is labeled pi_r with level n_s and quotient Gr_s. *Correction:* Replace pi_r by pi_s.
- **E18** (misprint; affects nothing), Published proof of Corollary9.10 p54. *Printed:* By Lemma9.4 *Correction:* Read Corollary9.4.
- **E19** (gap; affects a stated result), Propositions 9.5 and 9.6 and the paragraph after the proof of Proposition 9.6, pp. 50–54, with Corollary 9.4 and the uniqueness proof of Theorem 9.1, pp. 49–50, in the published version (Forum Math. Pi 10 (2022) e24). *Printed:* Since K_{nm,λ_σ} is conjugate to K(c_π), by Propositions 9.5 and 9.6, we complete the proof of Theorem 2.1 for σ = Sp(π, m) such that L(s, π) = 1. *Correction:* For σ = Sp(π, m) with L(s, π) = 1 and n, m ≥ 2, the paper does not establish Theorem 2.1.
- Proposition 9.5 rests on Corollary 9.4.
- Proposition 9.6 rests on Lemma 9.3 and the uniqueness in Theorem 9.1.
All three proofs use the same step: W∘ι lies in Π because φ_Ze is (N′, Ψ)-equivariant. That step fails, and the uniqueness itself is false (E1).
What is needed:
- another proof of Corollary 9.4 (injectivity of W ↦ W|_L on right ι(K′)-invariant vectors);
- another proof that σ^{K(c_π)} ≠ 0.
No counterexample to Theorem 2.1 is known.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1** (recorded). E1 (Theorem 9.1's uniqueness is false) and E19 (the main theorem's Speh case with L(s, π) = 1 is not established by the paper) record it; the items state the targets without the false uniqueness. No repair is known.
- **G2** (deferred). Knight–Zelevinsky/Mœglin–Waldspurger, Lapid–Mínguez and JPSS/Matringe are cited suppliers.
- **G3** (deferred). Lapid–Mao's support, root-exchange and convergence results are cited suppliers.
- **G4** (recorded). Lemma 8.10 is false at repeated parameters (E3); the direct-integral step of Lemma 9.3 is E13.
- **G5** (deferred). Splitting bundled notions and theorem-level API promotion are design work.
- **G6** (deferred). Declaration-level library audit and adapters are design work.
- **G7** (deferred). Owner refresh before design activation is design work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result.

The following was also checked:
- **Items and routes.** Item ids are unique, and every missing item is routed exactly once.
- **The `known` field.** Every finding has `known` equal to "new".

No Lean deliverable is part of a paper job.

**For the reviewer.**
- Check E1 and E19 on pp. 48–54. The equivariance computation above is short.

## Checkpoint history (unchanged)

The reports of the earlier checkpoints follow as they were written. Where they say *partial* or call the findings provisional, this continuation supersedes them.

## Atobe–Kondo–Yasuda: local newforms, continuation checkpoint

**Status: partial.** Codex, session `codex-c83e7a`, issue #1395.
Continues [PR #1814](https://github.com/CBirkbeck/tauceti-explorer/pull/1814)
by Codex `codex-a71f92`. This is an extraction and routing plan, not a
formalization or an independent-review verdict.

There are 161 items (8 library, 10 planned,
143 missing), eight routes, 42 definition items with 126 named API
contracts and 126 mathematical tests, and 18 provisional source findings.
The previous item's IDs and four candidate roadmap IDs are preserved.

This continuation reread all 56 published pages, checked the exact compact-induction
input to the essential-vector counterexample, and found a direct counterexample
to the literal repeated-parameter spanning assertion in Lemma 8.10. It also
supplies direct foundational proofs and five additional narrow library credits.
The main newform theorem is **not** disproved by these auxiliary counterexamples.
A replacement analytic argument and recursive source closure remain necessary.

### Sources and reading scope

Primary: Hiraku Atobe, Satoshi Kondo and Seidai Yasuda,
[Local newforms for the general linear groups over a non-archimedean local field](https://doi.org/10.1017/fmp.2022.17),
Forum of Mathematics, Pi 10 (2022), e24, 1–56. All pages, including proofs,
examples and references, were reread from the published PDF in this continuation.
Current SHA256: `4f68b7378496513cd144e9e2ff345535ae93061072ca7717ba0239a07ce13ec7`.

The [final arXiv version, 2110.09070v4](https://arxiv.org/abs/2110.09070v4),
dated 28 September 2022, has 60 pages. Current SHA256:
`32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c`. This continuation checked pp.50–51,
including the formal spherical family and Lemma 8.10. The earlier worker's
other targeted comparisons are retained under `source.previousCheckpoint`;
this continuation does not claim to have reread all 60 arXiv pages. Visual-check labels retained in the source-finding locators refer to the previous worker; this continuation reread the extracted text.

The [Lapid–Mao source](https://doi.org/10.1112/S0010437X2000706X),
*Local Rankin–Selberg integrals for Speh representations*, Compositio 156
(2020), 908–945, was reread at printed pp.917–919 and 922–923: model conventions,
row stabilizers, root-exchange setup, and Corollaries 3.13 and 3.15.
Current PDF has 39 pages including a cover; its article has 38 pages.
SHA256: `9ac53cab98805703dcecca24a4df24c62eed9df7779477ddf270bacf0cd89d89`.
The full support/convergence proof chain has not been extracted here.

Cambridge adds retrieval-specific footers. The current primary and Lapid–Mao
hashes therefore differ from the previous downloads. Both sets of hashes and
the previous deliverable blob IDs are preserved; identical mathematics is not
inferred solely from a matching DOI. No raw source PDF or source text is published
in these deliverables.

### Mathematical scope and conventions

F is a nonarchimedean local field of characteristic zero. Representations are
smooth complex representations; psi has conductor o and abs(varpi)=q^-1.
Lambda_n consists of ascending nonnegative tuples. The group K_(n,lambda)
uses the depth of row i: k_ij-delta_ij lies in p^lambda_i. The highest derivative
is iterated; the superscript in pi^(i) is not an ordinary derivative order.
Cuspidal segment degree is positive. Z(segment) is the ascending-product
irreducible subrepresentation convention; for degree-one cuspidal data it is a
determinant character, not the generalized Steinberg quotient.

The tuple of an irreducible pi on GL_n is

    lambda_pi,k = c_(pi^(n-k)) - c_(pi^(n-k+1)),   1 <= k <= n.

The source's main targets assert membership in Lambda_n, dimension one of the
fixed space at lambda_pi, vanishing at lexicographically smaller lambda, and
separately vanishing whenever sum(lambda)<c_pi. The latter is not a consequence
of the former: (0,3)<lex(1,1), but its weight is larger. The conductor is the
minimal weight of a level supporting fixed vectors, conditional on these targets.

For finite DVR modules, vee is padded coordinate addition of invariant
sequences. It is not direct sum. Filtration counts count actual submodules,
not their isomorphism classes. The polynomial counting functional is Z-linear,
not a ring homomorphism. The quotient measure, inverse additive character and
s-m/2 shift are part of the integral interfaces. Formal spherical families at
arbitrary nonzero parameters are distinct from actual tempered Speh models.
An arbitrary spherical irreducible constituent can be nongeneric.

### Essential-vector uniqueness: the exact hypotheses match

This is a worker argument awaiting independent review. In the specialization
n=m=2, take G=GL4, G'=GL2 and K'=GL2(o). The primed block size is one, so V'=1,
the character on N' is trivial, and the primed transition transform is the
identity. Every formal test W_Sh^0(g;x) is therefore left-N'-invariant for every
allowed parameter matrix x, not only for actual Speh parameters.

For r>=1 set

    u_r = I + varpi^(-r) E12,
    f_r = 1_(u_r K') - 1_K'.

These functions are smooth, compactly supported and right-K'-invariant. The
right cosets u_r K' and K' are pairwise distinct: if r differs from s, the
valuation of varpi^-r-varpi^-s is negative. Every finite set of f_r is linearly
independent by evaluation on these separate cosets. The determinant has
valuation zero on their support.

For every s and every formal test, integration of f_r(g)W_Sh^0(g;x) times the
determinant weight is zero. Left translation by u_r converts the first coset
integral into the second. Haar measure, determinant and the formal test are all
unchanged. These are compact-support integrals; analytic continuation is not
needed for this cancellation.

For the unprimed group, V consists of matrices with free entries 12,14,32,34,
and D=V iota(G') with trivial intersection in this specialization. Define

    F_r(v iota(g)) = Psi(v) f_r(g).

Unique factorization makes this well-defined, left-V-equivariant and compactly
supported modulo V. Lapid–Mao Corollary 3.13 applies to every m-homogeneous
irreducible representation, including Sp(pi,m) for tempered pi, and says the
restriction image contains this compact induction. Its U' is AKY's V. The
row-vector description of D on printed p.918 agrees with AKY's last-row
stabilizer; there is no transpose discrepancy. Corollary 3.15 states the
corresponding inclusion for every transition model.

Choose a Shalika-model lift and average on the right over iota(K') with volume
one. Restriction remains F_r, since f_r is already right-K'-invariant. Thus the
lift is nonzero, obeys precisely Theorem 9.1(1), and is in the common kernel of
every integral in Theorem 9.1(2). Restriction proves that the lifted vectors are
linearly independent. The common kernel is infinite-dimensional.

For L(s,pi)=1, the separate compact-induction existence argument in AKY pp.48–49
produces a solution. Adding any of these perturbations gives further solutions.
The printed conditions cannot determine a unique vector. The correct interface
is an essential **solution set**, an affine translate of the common kernel when
nonempty. This argument does not give the perturbations K^(c_pi)-invariance.
It consequently does not refute the dimension-one main theorem.

The failed equivariance step is visible exactly in GL4:

    (I+tE13)(I+bE32)(I-tE13) = I+bE32+tbE12.

The conjugation preserves V and its measure but changes Psi by psi(tb). Taking
b=1 and t outside the conductor gives a nontrivial change. For n=m=2 the space
Pi on p.49 consists of the L2 closure of smooth left-N'-invariant functions on
G'. Such a nonzero smooth function cannot have finite norm: integration along
the noncompact N' fiber has infinite volume. Thus Pi=0, while the model
restriction contains nonzero compactly supported functions on G'. The printed
assertion that all the relevant restrictions lie in Pi cannot hold.

Lemma 9.3 restricted to Pi is vacuous in this specialization, so this argument
does not itself refute that restricted lemma. Its direct-integral proof still
needs multiplicity spaces and a legitimate dense domain for fiber evaluation.
Corollary 9.4, the proofs of Propositions 9.5–9.6, and the subsequent general
newform/essential-existence chain require replacement arguments.

### Lemma 8.10: a direct repeated-parameter counterexample

The previous checkpoint identified a geometric-lemma multiplicity defect but
did not claim to refute the final spanning assertion. The following continuation
argument strengthens that finding. Again n=m=2, so G'=GL2, N' is the upper
unipotent and its designated character is trivial. For x nonzero, use the
Iwasawa coordinates

    g = n diag(varpi^a,varpi^b) k.

The integers a,b are well-defined on N'\G'/K'. In particular b is determined
by the norm of the bottom row, and a+b by the determinant valuation. The
formal Section 8.5 family specializes to

    F_t(g) = q^(-(a-b)/2) x^(a+b) exp(t(a-b))
           = W_Ze^0(g; x exp(t), x exp(-t)).

For every spherical Hecke operator h, its eigenvalue lambda_h(t) is symmetric
in the two Satake parameters, hence even in t. Compactly supported Hecke
convolution acts by a finite sum on right-K'-fixed functions, so differentiation
commutes with that action. Differentiating at t=0 gives

    H(g) = (a-b) q^(-(a-b)/2) x^(a+b),
    h H = lambda_h(0) H.

Thus F_0 and H are both eigenfunctions with Satake parameters (x,x). They are
independent: F_0(1)=1 and H(1)=0, whereas H(diag(varpi,1))=q^-1/2 x is nonzero.
Only one parameter assignment occurs in the lemma's stated spanning set when
the two parameters coincide. It supplies F_0 alone.

There is also a concrete check using the generators. With vol(K')=1 and
T=1_(K' diag(varpi,1) K'), its q+1 right-coset representatives give

    (T f)(a,b) = q f(a+1,b) + f(a,b+1).

For both f=F_0 and f=H this equals 2 sqrt(q) x f(a,b). The central generator
translates (a,b) to (a+1,b+1) and acts by x^2. This agrees with the equal-parameter
Satake character. The argument concerns ordinary smooth induction with no
compact-mod-N' support requirement, exactly the space in the lemma.

A repair must prove a distinct-parameter theorem and retain confluent data at
collisions where required. Merely restoring two copies in the semisimplified
Jacquet module does not make the single printed function span this eigenspace.
This is still a provisional finding for independent review, not an author
correction or a claim that the full newform theorem is false.

### Foundational proofs and pinned-library reuse

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The exact declaration statements,
including their local typeclass contexts, were read. The eight library items
are narrow credits; the assembled DVR and analytic packages remain missing.

1. `Module.equiv_directSum_of_isTorsion` supplies existence of a finite primary
   cyclic decomposition over a PID. It does not assert a unique sorted DVR list.
2. `IsArtinianRing.isNilpotent_jacobson_bot` works for noncommutative Artinian
   rings; it is not the nil-ideal inclusion used in the Hecke argument.
3. `IsNonarchimedeanLocalField.isCompact_closedBall` supplies compact valuation
   balls, not the full compact-open matrix-group API.
4. `MvPolynomial.weightedHomogeneousSubmodule`, its multiplication theorem,
   `weightedDecomposition` and `weightedGradedAlgebra` already supply the
   countably generated weighted polynomial grading. Do not rebuild it.
5. `Module.Baer.extension_property` and `Module.Baer.injective` supply Baer's
   extension criterion. The F/o specialization is an assembly still to write.
6. `Ideal.mem_jacobson_iff` is the noncommutative left-ideal criterion
   x in J(I) iff for every y there is z with zyx+z-1 in I.
7. `IsNilpotent.isUnit_add_one` and `isUnit_one_add` supply finite geometric
   inverses over an arbitrary ring, without commutativity.
8. `LinearMap.surjective_of_surjective_comp_mkQ` supplies Nakayama's
   surjectivity criterion for a finitely generated target modulo an ideal
   contained in the Jacobson radical.

For sorted-sequence uniqueness, set r_j=dim_k(p^(j-1)M/p^j M), j>=1. On a cyclic
summand o/p^a, this dimension is one exactly when j<=a. Hence r_j-r_(j+1) is the
multiplicity of exponent j. Nakayama identifies r_1 with the minimal number
of generators. Adding n-r_1 zeros determines seq_n intrinsically.

For exact F/o duality over a PID, multiplication by each nonzero a on F/o is
surjective: divide a representative by a. An ideal is principal, so a map
(a)→F/o extends by choosing y with ay equal to the image of a and sending r to
ry. The zero ideal is immediate. Baer's theorem gives injectivity and therefore
surjectivity of restriction across any injection. Hom left exactness gives the
remaining exact-sequence identities. Evaluation gives biduality on o/p^a via
the pairing with p^-a o/o; finite direct sums prove the finite-length statement.

Lemma 4.9 has a direct proof over **any commutative local ring**, avoiding the
projective-cover citation. Reduce f:L→N and f':L'→N modulo the maximal ideal.
Their source dimensions are equal, so choose an invertible residue-field
matrix intertwining the two surjections. Lift it to A0. The error f-f'A0 has
image in mN=f'(mL'); lift each column of that error to mL' and form Delta.
Then A=A0+Delta satisfies f'A=f and remains invertible modulo m. Its determinant
is a unit in the local ring, so the adjugate gives an inverse over the ring.
This does not require finite length of N. The exact target of the source is a
DVR specialization; no new generic projective-cover roadmap is needed.

For the Hecke nil ideal, if x lies in it, every yx also lies in it and is
nilpotent. Invert 1+yx using the existing library theorem. Its inverse z obeys
zyx+z-1=0, so the pinned Jacobson criterion puts x in the radical. For a simple
submodule W, each nonzero w makes H→W a surjection with maximal left-ideal
kernel. The radical is in that kernel, so the nil ideal annihilates W. This
argument needs neither commutativity of H nor an unverified nilradical identity.

For nonzero lambda, the support-escape repair is explicit. Choose a row i
with lambda_i>0. If zg lies in X_lambda, then zg_ii is a unit, so
v(z)+v(g_ii)=0. On a compact subset C of GL_n(F), all entries have valuations
bounded below, while v(det g) is bounded above. Thus v(z) and then
v(det(zg))=n v(z)+v(det g) have uniform upper bounds. This proves escape from
compact sets modulo the center. At lambda=0 the argument fails, and the
unramified rank-one example disproves standalone nilpotence. The L=1 proof
must separately use the absence of spherical cuspidal vectors in that branch.

The reviewed coverage records for local-field layer0 and AL.0/AL.2/AL.3/R16.2
were reread. The source-stage statuses do not assert those packages are already
formalized. The input manifest records their current blobs and the precise
library read locators. Negative terminology searches remain bounded evidence.

### Ownership and dependency boundaries

The four existing source routes import the shared smooth category,
induction/Jacquet/derivative theory, GL_n classification, classical local factors
and rank-two newvectors. The four Part II IDs remain candidates, not accepted
stage IDs. All missing items are routed exactly once.

The continuation screened 122 other paper route inventories. In particular,
CH26's Aubert/unitary spherical direction, FINTZEN21's types, FENG24's mod-p
centers and base change, and ZHU17's parahoric centers remain separate suppliers.
SCHIFFMANN16's curve Hall algebra and global bundle counts do not already own
the characteristic-free finite-DVR convexity and unique actual filtration
statements. AKY uses elementary proofs rather than Hall-polynomial machinery.
Any future Hall-algebra consumer should import the local module facts once.

Generic induction, geometric-lemma multiplicities and Satake are imports from
SR.2 and SR.4. They are not new constructions inside the Speh continuation.
ET.6's early classification branch precedes its full LLC theorem. SR.5's early
complex derivative theory precedes the integral-family consumers. Model
transitions and compact restriction must precede essential/newform arguments,
so their proofs cannot assume essential uniqueness.

#### SmoothRepresentationsOfLocalGroups

Route: source. Reuse the existing smooth category, complex compact invariants, normalized induction, admissibility, Satake and BZ/Whittaker owners. SR.5 must expose an early complex derivative adapter independently of its late family/spectral branches. Finite-group InductionRestriction is not a substitute for p-adic Mackey theory.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`.

#### EndoscopicTransferAndUnitaryTraceComparison

Route: source. ET.6 explicitly owns characteristic-zero GL_n segment/Langlands classification and the full WD correspondence. Place the source-specific segment conventions, Speh constructor, constituent multiplicities, truncation and ladder determinantal adapters in that early local-classification branch; do not create a duplicate GL_n classification in GL2 or the newform extension.

Existing stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

#### AutomorphicLFunctionsAndLocalFactors

Route: source. AL.0/2/3 already own nonarchimedean Fourier theory, GJ standard factors and classical generic Rankin–Selberg factors. AKY supplies their normalization-sensitive consumer. The nongeneric Speh integral extension below imports these rather than treating their plans as existing Lean declarations.

Existing stages: `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

#### GL2AutomorphicRepresentationsAndTransfer

Route: source. R16.2 already owns the rank-two conductor/newvector result. The general-rank newform extension must compare to and import this specialization, not replan Casselman GL2 theory.

Existing stages: `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

#### LocalFieldsPartIIFiniteLengthModules

Route: part-ii. The upstream local-field substrate supplies DVRs and valuation normalization, but not the ordered module-class convexity/unique-filtration theory. Keep this characteristic-free finite-DVR algebra in one foundational owner, outside representation-specific newform proofs.

First prerequisite: Local fields and ramification (tauceti:TauCetiRoadmap/LocalFieldsRamification), especially its existing layer0 substrate; do not replan it. Start the algebra over an arbitrary DVR o with fraction field F. Add finite residue field only for finiteness/counting statements. Import Mathlib's Module.equiv_directSum_of_isTorsion for existence, then prove uniqueness of the sorted exponent sequence, the length/minimal-generator formulas and left-zero-padding compatibility. Define the lex ordered class monoid with vee equal to padded coordinate addition, emphatically not direct sum. Build exact Hom_o(-,F/o) duality and biduality, submodule/quotient inequalities, Proposition4.4 convexity, Proposition4.6 uniqueness of an actual equality-case submodule and its strict-deficit alternative, and Corollary4.7 for actual ordered filtrations. Prove the free-cover change-of-basis and prescribed generator/graded-basis lifting statements without importing finite-dimensional-algebra projective covers at the wrong base ring. Then define admissible filtrations, prove finite and permutation-invariant exact-generator counts, and build the Z-linear weighted polynomial functional and its length-vanishing ideal. Final exports are all §§4.1–4.3 results and Lemmas6.7–6.8 plus the corrected composition-polynomial degree bound. Every definition gets the attached APIs and zero/cyclic/equal-class tests. Consumers are the newform extension's Mackey formula, ladder cancellations and weight vanishing. This is a candidate owner: audit any new module/filtered-lattice roadmap added since this checkpoint before activation. Continuation: import the pinned weighted MvPolynomial grading, Baer extension and Nakayama surjectivity. Recover sorted exponents from dim_k(p^(j-1)M/p^jM), prove injectivity of F/o by the principal-ideal Baer argument, and use the direct residue-matrix proof of equivalent equal-rank free surjections over any commutative local ring. No new projective-cover theory is required for Lemma4.9. Keep the finite residue field assumption only where actual finite counts are used.

#### QuiverRepresentationsPartIIMultisegmentDuality

Route: part-ii. Finite type-A interval classification and Krull–Schmidt already belong to upstream QuiverRepresentations. Opposite-degree generic commuting operators, their image-restriction surjectivity and the Knight–Zelevinsky chain formula go beyond those layers.

First prerequisite: Quiver representations, path algebras, and Gabriel's theorem (tauceti:TauCetiRoadmap/RepresentationTheory/QuiverRepresentations), layers1,2,5. Import path-algebra/interval/Krull–Schmidt machinery; do not replan Gabriel's theorem. Over C construct finite-support Z-graded VN and WL pairs, shifts, images and opposite-degree centralizer spaces, with all ambient finite-dimensional/Zariski-topology hypotheses. Prove Lemmas3.1–3.4, separating the generic commuting-operator duality theorem from simultaneous genericity on all iterated images. State the elementary interval combinatorics independently; import only the representation-theoretic identification with Zelevinsky involution from the early classification part of Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison:ET.6). Do not duplicate the general Aubert duality contemplated in PAPER-CH26's SmoothRepresentationsPartIIUnitarySpherical candidate. Prove the right-truncation/ram commutation and the maximal-peeling identities with full multiplicities. Close Knight–Zelevinsky's adjacent-interval formula through monotone-grid paths and maximum weighted inclusion chains, then prove Proposition2.7 ram additivity for the special maximal split only. Final consumers are the newform tuple comparison and unipotent induction; no general additivity or finite-field version is asserted. The cited KZ/MW proofs remain a closure task, not an assumed generic-black-box theorem.

#### AutomorphicLFunctionsPartIISpehIntegrals

Route: part-ii. The existing AL.3 contract is classical generic Whittaker Rankin–Selberg theory. Degenerate Zelevinsky/Shalika models and unequal-rank Speh integrals need new layers; their analytic core can be built before newform existence, avoiding a cycle.

First prerequisite: Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors), AL.0, AL.2 and AL.3. Import Smooth representations of local groups (SmoothRepresentationsOfLocalGroups:SR.0–SR.5, early complex branches) and the Speh constructor from Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison:ET.6). Fix char(F)=0, conductor-o additive character, compatible quotient/self-dual Haar measures, tempered pi on GL_n and pi' on GL_(n-1), and m>=1. Construct the precise block groups, D as row stabilizer, character Psi, model Hom multiplicity-one theorems, Levi restriction, Lapid–Mao compact-induction restriction, unitary pairing and mutually inverse compact-support transforms. Define convergent I_m and Z_m separately from their rational continuations. Split Theorem8.5 into convergence, product-denominator bound and functional equation with every shift/sign; prove the test-vector-one lemma, gcd normalization and ONLY the divisibility of Proposition8.7. Construct the arbitrary-parameter spherical families, distinguish their actual-Speh specializations, and prove all four parts of Theorem8.11 rather than importing its omitted proof. Audit Lemma8.10 with multiplicities; it is not a usable theorem at singular parameters until repaired. Finally establish determinant slicing, lower bounds, finite support for L=1 and the corrected q^(-md) coefficient in Proposition9.8. Stop before essential-vector uniqueness or newforms. All analytic core exports must be independent of §9's newform line; the newform extension is a downstream consumer. Record the source errors and require independent confirmation, especially the compact-restriction input used in the counterexample. Continuation: the repeated-parameter Lemma8.10 is itself false, not only unproved by its display. Include the explicit GL2 derivative eigenfunction H=(a-b)q^(-(a-b)/2)x^(a+b), and replace spanning by statements that retain confluent data at Satake collisions. Do not use an unqualified all-parameter span as an input to spectral separation.

#### SmoothRepresentationsPartIIGeneralLinearNewforms

Route: part-ii. Neither the Newton/cocenter and parahoric-center candidates nor existing GL2 theory owns all-rank nongeneric row-depth newforms. This extension owns only their new level/tuple/Mackey/combinatorial/analytic assembly, importing each foundation once.

First prerequisite: Smooth representations of local groups (SmoothRepresentationsOfLocalGroups), with SR.0–SR.5 early complex exports. Import GL_n classification and WD conventions from Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison:ET.6), GL2 newvectors from GL2 Automorphic Representations And Transfer (GL2AutomorphicRepresentationsAndTransfer:R16.2), classical local factors from Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors:AL.0/2/3), and the three candidate foundations LocalFieldsPartIIFiniteLengthModules, QuiverRepresentationsPartIIMultisegmentDuality and AutomorphicLFunctionsPartIISpehIntegrals. Targets: for char-zero local F and every smooth complex irreducible pi on GL_n, lambda_pi,k=c_(pi^(n-k))-c_(pi^(n-k+1)) belongs to ascending Lambda_n; dim pi^(K_n,lambda_pi)=1; lambda<lambda_pi implies no fixed vectors; independently sum(lambda)<c_pi implies no fixed vectors. K uses row depths. Build lattice-pair conjugacy, actual-filtration Mackey decomposition, the two-case reduction, the ladder determinant/cancellation recurrence and arbitrary unipotent induction. Prove weight vanishing using the shared DVR counting functional and GJ Fourier support, explicitly repairing Lemma7.1 at lambda0. Compare mirahoric and generic specializations and all source examples. For tempered Speh, construct K^(a), determinant-support consequences and newform restriction to the Levi. IMPORTANT: the printed essential-vector uniqueness is contradicted by E1's n=m=2 compact-support kernel. Define a solution predicate, not a unique vector. The L=1 existence construction survives, but Cor9.4 and the proof chain9.5–9.10 need a new argument or corrected hypotheses. Do not activate a completed newform blueprint using those claims as axioms. General essential existence and the unramified-partner gcd equality are downstream targets only. The checkpoint is partial until this analytic repair and the remaining cited-input closure are independently checked. Continuation: E1 gives an infinite-dimensional common kernel using pairwise disjoint u_rKprime cosets. Keep the essential solution set affine over this kernel; neither uniqueness nor stronger K^(c_pi)-invariance follows from the printed two conditions. For Lemma7.1 use the nonzero-row compactness bound, and handle lambda=0 separately.

### Source findings

All findings remain provisional. None has a self-issued review object. Exact-title, author/erratum, essential-uniqueness and arXiv-correction searches found no correction in their bounded results. The prior journal/history/author-page searches are preserved with their actual limits. No authors have been contacted.

#### E1 — error

Published Theorem9.1/Definition9.2 pp48–50; arXiv v4 pp52–54. Reach: a stated result.

Printed: There exists a unique function

Correction or obligation: Replace the unique-choice definition by a solution-set/existence interface pending a repaired theorem with extra conditions. The two printed test conditions alone do not determine a vector for n=m=2. Also remove the assertion that all restricted Speh vectors lie in Pi.

Reason: For n=m=2, G'=GL2,V'=1,T'=id and all formal W^0 are left-N'-invariant. With u=[[1,varpi^-1],[0,1]], f=1_(uK')-1_K' is a nonzero right-K'-invariant compact function annihilated by every test integral by left translation (det u=1). Extend f to D=V iota(G') using Psi. Lapid–Mao20 Cor3.13/3.15 supplies a Shalika vector with this restriction; right averaging preserves f. Adding it to the L=1 essential vector gives a second solution. The proof's character claim fails explicitly: (I+tE13)(I+bE32)(I-tE13)=I+bE32+tbE12, so Psi changes by psi(tb). See report for full argument and limits. The continuation verifies the compact-induction hypothesis directly against Lapid–Mao Cor3.13/3.15 and obtains infinitely many independent perturbations using u_r=I+varpi^-r E12. These vectors satisfy precisely the printed right-iota(Kprime) condition; no K^(c_pi)-invariance is claimed.

#### E2 — error

Published Lemma7.1 p38 and its compact-mod-center escape claim; v4 pp41–42. Reach: the proof.

Printed: G_n ∩ ⋂_(m>=1) Z_n X_lambda^(>=m) = ∅

Correction or obligation: Require lambda≠0 for this escape argument. Handle lambda=0 separately in the ambient L(s,pi)=1 application via absence of spherical cuspidal vectors. Do not export the literal standalone lemma for all cuspidals and all lambda.

Reason: At n=1,lambda=0 and an unramified character pi, the Hecke function 1_(varpi o*) acts by pi(varpi)≠0 and is not nilpotent. For lambda=0 central scaling puts every g∈GL_n(F) in Z_n X_0^(>=m). The whole section concerns L=1, so the intended application may survive with the missing zero-level argument; this does not refute Theorem2.2.

#### E3 — error

Published proof of Lemma8.10 p47; v4 corresponding proof. Reach: a stated result.

Printed: Lemma8.10 says the entire Hecke eigenspace is spanned by the set of formal parameter assignments; its proof also counts assignments as a set after coincident parameters are identified.

Correction or obligation: The all-parameter spanning statement must be replaced: n=m=2, equal parameters(x,x) admit the additional eigenfunction H(g)=(a-b)q^(-(a-b)/2)x^(a+b) for g=n diag(varpi^a,varpi^b)k. Distinct-parameter spanning and a confluent family at collisions require separate valid statements and proofs.

Reason: Differentiate W_Ze^0(x exp(t),x exp(-t)) at t=0. Every spherical Hecke eigenvalue is even in t, so the derivative has the same eigenvalue; Hecke convolution is a finite sum on right-K-fixed functions. H(1)=0 but H(diag(varpi,1))=q^-1/2 x, while W_Ze^0(x,x)(1)=1. This directly disproves the literal span, beyond the earlier geometric-lemma multiplicity defect.

#### E4 — misprint

Published pp52–53, proof and statement of Proposition9.8; same q^-m in v4 pp56–57. Reach: a stated result.

Printed: q^(-m) X^(-d)

Correction or obligation: Use q^(-m*d) X^(-d) in every transformed determinant-d summand.

Reason: X=q^-s and replacing s by m-s sends (q^-s)^d to (q^(-(m-s)))^d=q^(-md)X^-d. Already d=0 distinguishes1 fromq^-m. Nonzero coefficient scaling leaves the support bounds unchanged, but the printed finite functional equation needs correction.

#### E5 — misprint

Published p37, generating-series proof after equation(6.1). Reach: nothing.

Printed: F=(-1)^n(1-t)/(1+Σ_(i=1)^n x_i t^i)

Correction or obligation: Use the infinite sum in the denominator for equality in R[[t]], or declare congruence modulo t^(n+1).

Reason: h contains all y_i t^i, so algebra gives denominator1+Σ_(i>=1)x_i t^i. Coefficient extraction at t^n is unaffected by truncating, but full-series equality is false.

#### E6 — misprint

Published p19 after Figure2 (visually checked). Reach: nothing.

Printed: [a+1,a] to [a,1]

Correction or obligation: The endpoint is (1,r), as in the path definition on p18.

Reason: The allowed steps (-1,0),(0,1) and both figures force the top-right endpoint(1,r); the printed reversed endpoint is inconsistent.

#### E7 — misprint

Published §2.5 p11, truncated-dual diagram (visually checked). Reach: nothing.

Printed: ((m_max)#)^-=(Delta'_1)^-+...+(Delta'_4)^-

Correction or obligation: Retain indices2,3,4,5 from p10 after the singleton Delta'_1=[7,7] disappears; their truncations are[5,5],[4,4],[2,3],[0,2]. Alternatively rename them explicitly, but do not mix original and reset labels.

Reason: The figure labels retained terms(Delta'_5)^-,...,(Delta'_2)^- correctly. The prose resets indices while also keeping the truncation superscript and changes the original Delta'_i values.

#### E8 — misprint

Published proof of Proposition4.6 p23. Reach: nothing.

Printed: [M']+[M'']

Correction or obligation: Use [M'] vee [M''] in the final strict-inequality display.

Reason: The entire proposition uses the padded-addition operation vee, not direct sum; the concluding equality follows from the hypothesis only for vee.

#### E9 — misprint

Published p25 immediately after Lemma5.1. Reach: nothing.

Printed: L_1=o^n and L_1=⊕ p^lambda_i

Correction or obligation: The second lattice is L_2.

Reason: The previous paragraph fixes L_2⊆L_1 and the following identity uses K_(L1,L2). The standard quotient must be o^n/(⊕p^lambda_i).

#### E10 — misprint

Published Example6.4 p33, first raw count in continued display (visually checked). Reach: nothing.

Printed: -N_(3,5,4,1)(M_pi)

Correction or obligation: Use -N_(3,7,4,1)(M_pi).

Reason: The ladder has x=(5,3,2,0),y=(7,6,5,3). The permutation w=(1,4,3,2) gives capacities(3,7,4,1) and negative sign. No permutation gives the printed(3,5,4,1). Capping all capacities at b=4 gives(3,4,4,1) in both cases, so the subsequent computation is unaffected.

#### E11 — gap

Published Lemma6.6 p34, converse proof. Reach: the proof.

Printed: c=Card(m)

Correction or obligation: Use the degree-one/type-chi specialization for the current proof. To export the full printed generality, replace c by degree-weighted derivative orders and justify constituent-wise equalities along each cuspidal line.

Reason: For one degree-d cuspidal segment, highest derivative drops rank d, not1. The derivative identified with truncation in the displayed proof is not the Card(m)-th ordinary derivative when d>1. The actual §6.3 application has d=1 and is unaffected.

#### E12 — misprint

Published p50 near the end of uniqueness proof; v4 p54. Reach: nothing.

Printed: D=V' iota(G')

Correction or obligation: Use D=V iota(G').

Reason: Lemma8.1(1) gives the latter identity. For n=m=2,V'=1 but D contains the four-dimensional V, so the displayed identity cannot hold. This typo is distinct from the substantive equivariance error E1.

#### E13 — gap

Published proof of Lemma9.3 p49; v4 p53. Reach: the proof.

Printed: Pi ≃ ∫^⊕ pi' dmu(pi')

Correction or obligation: Supply a disintegration with multiplicity fields and precisely defined evaluation/intertwining maps on an appropriate dense domain. Explain why the spherical test pairings determine the relevant spectral components, including singular Satake parameters.

Reason: A direct-integral decomposition does not in general supply bounded evaluation operators from the whole Hilbert space to almost every fiber. The proof writes such operators and omits multiplicities, then uses the flawed Lemma8.10 argument. The n=m=2 counterexample attacks membership in Pi, not this restricted lemma itself.

#### E14 — misprint

Published proof of Proposition9.6 p53. Reach: the proof.

Printed: W'_Sh(g)=W_Sh^ess(g·iota(a))

Correction or obligation: The right side must use an essential solution for the CONTRAGREDIENT representation and inverse psi, with a distinct label. Specify its existence before the comparison. This notation correction alone does not justify the uniqueness argument.

Reason: The left side is declared to lie in W_Sh^(psi^-1)(tilde sigma), while the existing W_Sh^ess belongs to W_Sh^psi(sigma). Right translation preserves its original representation/model and cannot change that type.

#### E15 — misprint

Published Section2.3 p7. Reach: nothing.

Printed: cuspidal representation of G_d for some d>=0

Correction or obligation: Use d>=1 for nonempty cuspidal segments; G_0 occurs only as the empty representation after derivatives.

Reason: Section2.1 on p6 explicitly requires positive d; allowing degree0 nonempty segments breaks the total-rank classification.

#### E16 — misprint

Published Proposition5.2 proof p27, final paragraph. Reach: nothing.

Printed: span(eprime_1,...,eprime_(n_i))=span(e_1,...,e_(n_i))

Correction or obligation: Use prefix b_i=n_1+...+n_i in both spans.

Reason: Membership in the standard parabolic is preservation of cumulative block flags; for partition(1,2), the second required prefix is3, not2.

#### E17 — misprint

Published Section6.4 p36, first Mackey display. Reach: nothing.

Printed: The final tensor factor is labeled pi_r with level n_s and quotient Gr_s.

Correction or obligation: Replace pi_r by pi_s.

Reason: Only pi_1,...,pi_s are defined in this reduction; each quotient indexed s must act on pi_s.

#### E18 — misprint

Published proof of Corollary9.10 p54. Reach: nothing.

Printed: By Lemma9.4

Correction or obligation: Read Corollary9.4.

Reason: The numbered result9.4 is explicitly a corollary on p50; no Lemma9.4 exists. This repairs the locator only, not the faulty separation argument.

### Item inventory and proof boundaries

The statements below preserve hypotheses and distinguish target theorems from proved library inputs. An item marked missing is planned mathematical work, not an assertion that it has been formalized.

#### `pid` — PID torsion-module decomposition

Status: library; §4.1 input; Mathlib/Algebra/Module/PID.lean, Module.equiv_directSum_of_isTorsion.

For a commutative domain R with IsPrincipalIdealRing R and a finitely generated torsion R-module M, there are finite indices, irreducibles p_i and natural e_i with M linearly equivalent to the direct sum of R/(p_i^e_i). This supplies existence, not uniqueness of a sorted DVR sequence.

Pinned declarations: `mathlib:Module.equiv_directSum_of_isTorsion`.

#### `radical` — Artinian Jacobson radical is nilpotent

Status: library; §7.1 input; Mathlib/RingTheory/Artinian/Ring.lean:54.

For any (not necessarily commutative) Artinian ring R, the Jacobson radical of the zero ideal is nilpotent.

Pinned declarations: `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`.

#### `compact-ball` — Compact valuation balls

Status: library; §2 local-field input; Mathlib/NumberTheory/LocalField/Basic.lean:68.

For a nonarchimedean local field K and gamma in its value group with zero, {x | valuation K x <= gamma} is compact.

Pinned declarations: `mathlib:IsNonarchimedeanLocalField.isCompact_closedBall`.

#### `smooth` — Smooth representation and compact fixed-space interface

Status: planned; §2.1; §§5–9.

Use the SR.0 smooth complex category. For compact open K define pi^K; compact averaging of Haar mass one projects onto it and is exact over C.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Use: Proposition5.2 and determinant formula: pass fixed vectors through exact sequences and conjugacy.

API contracts:

- `SmoothRep.average_fixed` (simp): For normalized Haar mass one, e_K(v)=v for v in pi^K and e_K squared=e_K.
- `SmoothRep.fixed_map` (functoriality): An intertwiner f restricts to pi^K→tau^K and commutes with e_K; restrictions preserve identity and composition.
- `SmoothRep.fixed_exact` (structure): A short exact sequence of smooth complex representations gives a short exact sequence of compact-open K-fixed spaces.

Mathematical acceptance tests (not Lean-executed):

- Trivial representation has a one-dimensional fixed space.
- Averaging a K-fixed vector returns it; averaging twice agrees with once.
- For a surjective intertwiner, lift a K-fixed vector and average the lift; its image is the original vector.

#### `induction` — Normalized parabolic induction and Jacquet modules

Status: planned; §2.1; §5.1.

For an ordered partition of n, pi_1×...×pi_r denotes normalized smooth induction from the corresponding standard parabolic, with modulus square root over C; use normalized Jacquet restriction.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.2`.

Use: Proposition5.2 and Theorem8.5: convert compact invariants and Levi restrictions into tensor products with the correct modulus.

API contracts:

- `SmoothRep.induced_eval` (characterisation): A normalized induced section obeys f(pg)=delta_P(p)^(1/2) pi_L(p)f(g).
- `SmoothRep.induced_map` (functoriality): A tensor product of Levi intertwiners induces a G-intertwiner, respecting identity and composition.
- `SmoothRep.induction_transitive` (compatibility): For nested standard parabolics, normalized induction in stages agrees with direct induction, with delta_P=delta_Q times the Levi modulus.

Mathematical acceptance tests (not Lean-executed):

- Single-block induction is identity.
- Borel induction for GL2 has two geometric-lemma pieces even when their characters coincide.
- On P∩K the modulus is one, so the Mackey summands acquire no scalar character twist.

#### `derivative` — Iterated highest derivative

Status: planned; §1.2; §2.2; Bernstein–Zelevinsky [4], Zelevinsky [42].

For pi irreducible, start pi^(0)=pi and iterate its nonzero derivative of greatest order; continue by G_0. Each highest derivative is irreducible in the GL_n setting.

Requires an early complex specialization of SR.5, not dependence on its late integral-family or spectral outputs.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.5`.

Use: Proposition2.4 and Lemma6.6: iterate highest derivatives while distinguishing ordinary derivative order.

API contracts:

- `SmoothRep.highestDerivative_order` (data): Record the greatest ordinary derivative order r with pi^(r) nonzero and the resulting GL_(n-r) representation.
- `SmoothRep.highestDerivative_iterate` (simp): The zeroth iterate is pi, the successor is the highest derivative of the preceding iterate, and G_0 remains G_0.
- `SmoothRep.highestDerivative_segment` (compatibility): For Z(m), the highest derivative is Z(m^-), losing sum of the cuspidal degrees of all segments.

Mathematical acceptance tests (not Lean-executed):

- A generic irreducible reaches G_0 after one highest derivative.
- An unramified determinant character in rank n>1 does not behave as generic.
- For a singleton degree2 cuspidal segment, the highest derivative has order2 and is G_0, while the first ordinary derivative is zero.

#### `conductor` — Analytic conductor exponent

Status: planned; §1.2; §2.2; [8],[14].

c_pi is the nonnegative integer characterized by epsilon(s,pi,psi)=epsilon(0,pi,psi) q^(-c_pi s), with psi of conductor o; conductor of G_0 is zero.

Existing stages: `AutomorphicLFunctionsAndLocalFactors:AL.2`.

Use: Definition2.3 and Proposition9.8: extract integral exponents and unramified twist behavior.

API contracts:

- `LocalFactor.conductor_spec` (characterisation): For conductor-o psi, epsilon(s,pi,psi)=epsilon(0,pi,psi)q^(-c_pi s), with unique c_pi in N.
- `LocalFactor.conductor_unramifiedTwist` (compatibility): Twisting pi by an unramified character preserves c_pi, although the epsilon scalar can change.
- `LocalFactor.conductor_induction` (relation): For irreducible normalized pi_1×...×pi_r, the conductor is the sum of the conductors of its factors.

Mathematical acceptance tests (not Lean-executed):

- Unramified character of GL1 has conductor zero.
- Generic conductor must not be defined by K-invariants before the newform theorem is proved.
- For a ramified GL1 character of conductor2, epsilon(s)/epsilon(0)=q^(-2s); the exponent is2, independent of an unramified twist.

#### `segment` — Cuspidal segments and linkedness

Status: planned; §2.1, pp5–6.

A nonempty segment [a,b]_rho has a,b real with b-a a nonnegative integer, rho irreducible cuspidal on G_d,d>=1. Equivalent cuspidal twisting presentations are identified. Linked segments have union a segment and neither contains the other; precedence uses the source order. On a fixed type-chi line use integral endpoints.

Existing stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Use: Sections2.1 and7.2: classify constituents and perform elementary operations.

API contracts:

- `Segment.rank` (data): The GL rank of [a,b]_rho is degree(rho)(b-a+1), while its interval length is b-a+1.
- `Segment.linked_iff` (characterisation): On the same cuspidal line, after ordering left endpoints a<c, linkedness is a<c<=b+1 and b<d.
- `Segment.elementaryOperation` (constructor): For a linked pair replace it by its union and its intersection, omitting an empty intersection; cuspidal support and total rank are preserved.

Mathematical acceptance tests (not Lean-executed):

- [0,1] and [1,2] on the same line are linked.
- [0,2] and [1,1] are not linked; different cuspidal lines are not linked.
- Adjacent singletons [0,0] and [1,1] are linked; their elementary replacement is [0,1] with no nonempty intersection.

#### `multisegment` — Multisegments and Zelevinsky classification

Status: planned; §2.1; [42].

A multisegment is a finite multiset of segments; Z(m) is the unique irreducible subobject of a product ordered so that earlier segments do not precede later ones. This gives all irreducibles of GL_n with total GL rank n; L(m) is the Langlands-quotient convention and m# satisfies L(m)=Z(m#).

Existing stages: `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Use: Propositions2.4 and2.7 and Section6.3: preserve multiplicities under classification and duality.

API contracts:

- `Multisegment.induction_order_independent` (compatibility): The allowed Zelevinsky ordered product has the same irreducible subobject up to isomorphism for every allowed ordering.
- `Multisegment.rank_add` (simp): Total rank is additive in the finite multiset sum, counting segment multiplicities and cuspidal degrees.
- `Multisegment.dual_involutive` (relation): The Zelevinsky multisegment dual preserves cuspidal support and has (m#)#=m.

Mathematical acceptance tests (not Lean-executed):

- For degree-one rho, Z([a,b]_rho) is a determinant character with its central twist, not Steinberg.
- Dualizing twice returns m, including multiplicities.
- Two identical segments have multiset cardinality2, even though the set of distinct segments has cardinality1.

#### `lambda` — Derivative conductor tuple

Status: missing; §2.2, p6.

For pi on G_n define lambda_pi,k=c_(pi^(n-k))-c_(pi^(n-k+1)), 1<=k<=n. Its membership in Lambda_n is a theorem, not a constructor assumption.

Use: Theorem2.1 and2.2: relate lex minimality and conductor weight.

API contracts:

- `Newform.conductorTuple_apply` (projection): The kth component is c_(pi^(n-k))-c_(pi^(n-k+1)), with the highest-derivative iteration convention.
- `Newform.conductorTuple_sum` (relation): The sum of the n components telescopes to c_pi, since the nth iterate is G_0 of conductor0.
- `Newform.conductorTuple_mem` (structure): Using Proposition2.4, the components are nonnegative and weakly increasing.

Mathematical acceptance tests (not Lean-executed):

- Generic pi has tuple (0,...,0,c_pi).
- Do not infer weight comparison from lex comparison: (0,3)<(1,1) but 3>2.
- Conductors 8,4,2,1,0 followed by zeros in rank17 give tail(1,1,2,4), with thirteen leading zeros.

#### `level` — Row-depth compact groups

Status: missing; §1.2; §2.2.

For lambda in Lambda_n, K_n,lambda={k in GL_n(o) | k_ij-delta_ij in p^lambda_i for every i,j}; Lambda_n, its lex order, weight and padded addition are part of this interface.

Use: Theorems2.1/2.2 and Fourier support: manipulate row congruences and padded tuple order.

API contracts:

- `Newform.rowLevel_mem` (characterisation): k is in K_n,lambda iff k is in GL_n(o) and each row i differs from identity by entries in p^lambda_i.
- `Newform.rowLevel_antitone` (relation): If lambda_i<=mu_i for every i then K_n,mu is a subgroup of K_n,lambda; lex order alone does not imply this inclusion.
- `Newform.rowLevel_compactOpen` (structure): K_n,lambda is a compact open subgroup, containing the principal congruence kernel of depth max_i lambda_i.

Mathematical acceptance tests (not Lean-executed):

- lambda=0 gives GL_n(o).
- For GL2, lambda=(0,c) restricts the second row, not the second column.
- For lambda=(0,2), mu=(1,1), neither subgroup contains the other: upper and lower elementary unipotents distinguish the row conditions.

#### `newform` — Newform line and nonzero vectors

Status: missing; §1.2 after Theorem1.1; §2.2.

A local newform of pi is any nonzero vector in pi^(K_n,lambda_pi). The line is canonical, but no canonical nonzero basis is asserted.

Use: Conductor characterization and Corollary9.10: use a line without choosing an unjustified canonical vector.

API contracts:

- `Newform.mem_iff` (characterisation): v is a newform iff v is nonzero and every k in K_n,lambda_pi fixes v.
- `Newform.map_equiv` (functoriality): An isomorphism of representations carries the newform subspace and its nonzero vectors bijectively to those of the target.
- `Newform.normalized_unique` (universal-property): Conditional on dimension one and a functional ell nonzero on the line, there is a unique newform v with ell(v)=1.

Mathematical acceptance tests (not Lean-executed):

- Scalar multiples by nonzero complex numbers remain newforms.
- A zero vector is never a newform.
- If ell vanishes on the newform line, the normalization ell(v)=1 has no solution; do not omit nonvanishing.

#### `main-one` — Newform multiplicity one

Status: missing; Theorem2.1, first assertion (also1.1(1)).

For every pi in Irr(G_n), dim_C pi^(K_n,lambda_pi)=1. This is the printed target; its proof closure is conditional on resolving the §9 separation defect.

OPEN proof obligation; do not mark formalized or use the false uniqueness theorem as an axiom.

#### `main-lex` — Lexicographic vanishing

Status: missing; Theorem2.1, second assertion.

For pi in Irr(G_n) and lambda in Lambda_n with lambda<lambda_pi in lex order, pi^(K_n,lambda)=0. The §9-dependent branch remains unclosed.

#### `main-weight` — Conductor-weight vanishing

Status: missing; Theorem2.2 (also1.1(2)).

For pi in Irr(G_n), if lambda in Lambda_n has sum(lambda_i)<c_pi=sum(lambda_pi,i), then pi^(K_n,lambda)=0. This criterion is separate from lex vanishing.

#### `min-conductor` — Conductor as minimal level weight

Status: missing; §1.2 following Theorem1.1.

Conditional on the main existence/vanishing statements, c_pi=min{|lambda| : pi^(K_n,lambda) is nonzero}.

#### `truncation` — Right truncation and ram operation

Status: missing; §2.3; §2.4.

Delta^-=[a,b-1]_rho with empty intervals removed; m^- is the multiset sum. On unipotent m put m^ram=((m#)^-)#. A type-chi line has chi unramified and integer twists.

Use: Proposition2.4, Proposition3.5 and Lemma6.6: relate images and derivative ranks.

API contracts:

- `Multisegment.truncate_add` (simp): Right truncation distributes over multiset sum and sends [a,a] to the empty multiset.
- `Multisegment.ram_def` (characterisation): For unipotent m, ram(m)=dual(truncate(dual(m))); no additivity for arbitrary sums is asserted.
- `Multisegment.truncate_rank` (relation): rank(m^-)=rank(m)-sum_Delta degree(rho_Delta).

Mathematical acceptance tests (not Lean-executed):

- Singleton segments truncate to empty.
- The degree-d rank loss is d per segment, not one unless d=1.
- For unipotent m=[0,0]+[1,1], each singleton has ram=empty, but ram(m)=[0,0]; arbitrary additivity would be false.

#### `lambda-combinatorial` — Multisegment conductor tuple

Status: missing; §2.3, pp7–8.

For nonunipotent segments Delta_i=[a_i,b_i]_rho_i sum the left-zero-padded tails c_rho_i repeated length(Delta_i). For unipotent m sum left-zero-padded tails of ones of lengths of the segments in m^ram. Split a general m into its unipotent and other parts and add.

Use: Proposition2.4 and maximal peeling: compute the target tuple without repeated analytic conductors.

API contracts:

- `Multisegment.conductorTuple_tail` (simp): A nonunipotent segment of length l contributes a padded length-l tail of c_rho.
- `Multisegment.conductorTuple_unipotent` (characterisation): For unipotent m, component k counts the ram-segments with length at least n-k+1.
- `Multisegment.conductorTuple_split` (compatibility): Splitting off the complete unipotent part gives the sum of its tuple and the tuple of the remaining nonunipotent part after common padding.

Mathematical acceptance tests (not Lean-executed):

- Example2.5 rank17 produces (0^13,1,1,2,4) with weight8.
- Do not multiply c_rho by degree(rho) in the tail formula.
- A degree2 cuspidal segment of length3 and conductor4 contributes (0,0,0,4,4,4) in rank6, of weight12.

#### `tuple-comparison` — Derivative and multisegment tuples agree

Status: missing; Proposition2.4.

For pi=Z(m) of rank n>=1, lambda_pi=lambda_m; in particular the derivative differences are ascending nonnegative integers.

#### `generic-example` — Generic specialization

Status: missing; §1.2 following Theorem1.1; §2.2.

For generic irreducible pi, lambda_pi=(0^(n-1),c_pi), and the groups/newform claim specialize to the JPSS generic theorem.

#### `ladder` — Ladder multisegments

Status: missing; Example2.5(2); §6.1.

A type-chi multisegment [x_1,y_1]+...+[x_t,y_t] is ladder when x_1>...>x_t and y_1>...>y_t; chi is unramified here.

Use: Section6.1: use adjacent overlap lengths and determinant capacities.

API contracts:

- `Multisegment.isLadder_iff` (characterisation): A presentation is ladder iff left endpoints and right endpoints are each strictly decreasing along the same list.
- `Multisegment.ladder_ram` (compatibility): For unramified chi, ladder ram is the multiset [x_(i-1)-1,y_i] for i=2..t, omitting empty intervals.
- `Multisegment.ladder_capacity` (data): For permutation w the ith determinant capacity is y_i-x_(w(i))+1; zero means G_0 and negative means zero contribution.

Mathematical acceptance tests (not Lean-executed):

- A nested pair with equal left endpoints is not a ladder in this convention.
- Zero capacity represents G_0; negative capacity contributes zero.
- For [1,2]+[0,1], the ram segment is [0,1], so the conductor tuple in rank4 is (0,0,1,1).

#### `ladder-tuple` — Explicit ladder tuple

Status: missing; Example2.5(2).

For a type-chi ladder [x_1,y_1]+...+[x_t,y_t] in decreasing endpoint order, lambda_pi is the SUM, for i=2,...,t, of the n-tuples with max(y_i-x_(i-1)+2,0) terminal ones and all other entries zero. These lengths are not themselves the coordinates of lambda.

#### `product-tuple` — Irreducible-product tuple addition

Status: missing; Example2.5(3).

If each pi_i is either in the L(s,pi_i)=1 class of Example2.5(1) or is a type-chi ladder of Example2.5(2), and pi_1×...×pi_r is irreducible, then lambda of the product is the sum of the lambda_pi_i after left-zero-padding.

#### `speh` — Tempered Speh representation

Status: missing; Example2.5(4); §8.2.

For irreducible tempered pi of G_n and m>=1, Sp(pi,m) is the unique irreducible subrepresentation of pi|.|^(-(m-1)/2) × ... × pi|.|^((m-1)/2).

Use: Sections8 and9: pass between models and compute levels.

API contracts:

- `Speh.of_tempered` (constructor): For m>=1 and irreducible tempered pi, construct the unique irreducible subrepresentation of the ascending normalized twist product in the source.
- `Speh.dual` (compatibility): The smooth contragredient of Sp(pi,m) is isomorphic to Sp(dual pi,m).
- `Speh.conductorTuple` (relation): The conductor tuple of Sp(pi,m) has (n-1)m leading zeros and m copies of c_pi.

Mathematical acceptance tests (not Lean-executed):

- m=1 returns pi.
- For n=1 this is a determinant character, not the generalized Steinberg convention.
- If pi is ramified tempered GL2 of conductor3, Sp(pi,2) has tuple(0,0,3,3), and total conductor6.

#### `speh-tuple` — Speh conductor tuple

Status: missing; Example2.5(4).

For sigma=Sp(pi,m), lambda_sigma=(0^((n-1)m),c_pi repeated m).

#### `max-split` — Maximal multisegment peeling

Status: missing; §2.4; §2.5.

For a type-chi multisegment m, m_max is the multisegment of distinct inclusion-maximal segments, each once; m^max=m-m_max.

Use: Proposition2.7 and recursive algorithm: peel one copy of each inclusion-maximal interval.

API contracts:

- `Multisegment.maximalPart_mem` (characterisation): A segment occurs in maximalPart(m) iff it occurs in m and no strictly larger segment of m contains it; its multiplicity there is one.
- `Multisegment.maximalPart_remainder` (relation): maximalPart(m)+remainder(m)=m as multisets, with nonnegative multiplicities.
- `Multisegment.maximalPart_length_lt` (relation): If m is nonempty then remainder(m) has strictly smaller total interval length, so repeated peeling terminates.

Mathematical acceptance tests (not Lean-executed):

- Two copies of one segment leave one copy after a peeling step.
- The rank17 example peels [3,7],[2,5],[1,2],[0,0] first.
- For [0,2]+[1,1]+[1,1], the first maximal part is [0,2] and the remainder retains both singleton copies.

#### `ram-split` — Ram additivity for maximal peeling

Status: missing; Proposition2.7.

For unipotent/type-chi m, m^ram=(m_max)^ram+(m^max)^ram; no unrestricted additivity is claimed.

#### `lambda-split` — Tuple additivity for maximal peeling

Status: missing; Corollary2.8.

Under the same hypotheses, lambda_m=lambda_(m_max)+lambda_(m^max), padded to the same rank.

#### `wd-ram` — Weil–Deligne interpretation of ram

Status: missing; Lemma2.9, §2.6.

For unipotent irreducible pi, under the GL_n LLC with geometric Frobenius, pi^ram corresponds to the WD quotient V/(V^I intersect ker N).

Imports ET.6 full WD/LLC including N. Quotient is not asserted to have no unramified subrepresentation.

#### `vn` — Graded nilpotent pairs

Status: missing; §3.1.

A VN-pair is a finite-dimensional Z-graded complex space V with a degree +1 endomorphism N; a WL-pair has a degree -1 operator L. Finite grading support implies nilpotence. Shift V(c)_a=V_(a-c).

Use: Lemmas3.1–3.4: compute restriction to images and degree shifts.

API contracts:

- `GradedNilpotentPair.map` (constructor): A morphism is degree-preserving linear f with fN=N'f; composition preserves that equation.
- `GradedNilpotentPair.shift_image` (compatibility): On an interval VN block [a,b], ImageN(-1) is the truncated interval [a,b-1]; for WL the unshifted ImageL is that interval.
- `GradedNilpotentPair.nilpotent_of_support` (relation): If grading support lies in [a,b], either degree-one or degree-minus-one operator has power b-a+1 equal to zero.

Mathematical acceptance tests (not Lean-executed):

- The interval [a,b] VN block has one basis vector in each degree a,...,b.
- Image N with shift -1 is [a,b-1]; Image L without a shift is [a,b-1].
- For a VN block [2,4], N^2 has rank1 and N^3=0; shifting by -1 does not change these ranks.

#### `vn-reconstruct` — Graded pair reconstruction

Status: missing; Lemma3.1.

Two VN-pairs are isomorphic iff their underlying graded spaces are isomorphic and their image pairs (Image N,N|Image N) are isomorphic.

#### `commuting` — Opposite-degree centralizer spaces

Status: missing; §3.1 preceding Lemma3.2.

For a VN-pair set S(V,N)={degree -1 maps L on V | LN=NL}; for a WL-pair reverse degrees. These are finite-dimensional complex vector spaces with Zariski topology.

Use: Lemmas3.2/3.4 and Proposition2.4: choose opposite operators generically on all relevant images.

API contracts:

- `GradedNilpotentPair.centralizerSubmodule` (structure): Degree-minus-one operators commuting with N form a complex linear subspace, hence an irreducible affine space.
- `GradedNilpotentPair.centralizer_restrict` (functoriality): Commutation makes ImageN stable under L; restriction to successive images respects composition of restrictions.
- `GradedNilpotentPair.centralizer_generic_intersection` (relation): A finite intersection of inverse images of nonempty open dense sets under surjective linear restriction maps is nonempty open dense over C.

Mathematical acceptance tests (not Lean-executed):

- N=0 gives all degree -1 maps.
- A single degree-support space has zero opposite-degree maps.
- For one interval of length2 with N the nonzero raising map, any commuting degree-minus-one L is zero; a nonzero lowering map fails LN=NL.

#### `centralizer-surj-plus` — Centralizers restrict surjectively to Image N

Status: missing; Lemma3.2, VN case.

S(V,N)→S(Image N,N|Image N), by restriction, is surjective.

#### `centralizer-surj-minus` — Centralizers restrict surjectively to Image L

Status: missing; Lemma3.2, WL case.

S(W,L)→S(Image L,L|Image L), by restriction, is surjective.

#### `truncate-vn` — VN image and segment truncation

Status: missing; Lemma3.3, VN case.

The VN-pair (Image N(-1),N restricted) corresponds to m^-.

#### `truncate-wl` — WL image and segment truncation

Status: missing; Lemma3.3, WL case.

The WL-pair (Image L,L restricted) corresponds to m^- with NO grading shift.

#### `generic-commuting` — Generic commuting operator and duality

Status: missing; §3.1, [43],[31]; Lemma3.4.

For a VN-pair of type m there is a dense open S^o(V,N) in S(V,N) whose operators L have WL type m#; the analogous opposite construction holds. One can choose L so that N is generic on (V,L) and on (Image L,L|Image L).

Split dense-open duality theorem from simultaneous-genericity proof in the next completion pass; cited-input proofs not yet fully audited.

#### `rank-conductor` — Ranks compute derivative conductors

Status: missing; Proof of Proposition2.4, pp15–16.

For unipotent m represented by (V,N), choose commuting L whose restrictions to every Image N^i are in the required generic opens. Then c_(Z(m)^(i))=rank(L N^i), and the rank differences produce the terminal-one formula for lambda.

#### `commute-ram` — Ram and right truncation commute

Status: missing; Proposition3.5.

For unipotent/type-chi m, (m^-)^ram=(m^ram)^-.

#### `truncate-max` — Maximal peeling commutes with truncation

Status: missing; Lemma3.6.

For type-chi m, (m^-)_max=(m_max)^- and (m^-)^max=(m^max)^-, after discarding empty intervals.

#### `chain` — Weighted inclusion chains and grid paths

Status: missing; Proposition3.7 and proof, pp17–19.

For integral type-chi m and integer a, take its full submultisegment m_a of intervals INTERSECTING [a,a+1]; E_a is the largest cardinality of a full submultisegment totally ordered by inclusion. Multiplicity counts in cardinality. The grid paths in the proof move (-1,0) or (0,1) from (a+1,a) to (1,r), after translating support to [1,r].

Use: Proposition3.7: retain all equal copies and maximize weighted chains.

API contracts:

- `Multisegment.fullSub_mem` (characterisation): A full submultisegment includes either every copy of a distinct interval or none of them.
- `Multisegment.chainWeight` (data): The weight of a chain of distinct intervals is the sum of their multiplicities in m_a.
- `Multisegment.chain_extend_path` (relation): Every inclusion chain meeting [a,a+1] is contained in the interval set visited by an allowed grid path; maximizing path weight equals maximizing full-chain cardinality.

Mathematical acceptance tests (not Lean-executed):

- Two equal intervals both count in a full chain.
- A grid path ends at (1,r), not (a,1).
- The intervals [0,1] and [1,2] each intersect [1,2] but are incomparable by inclusion; with multiplicities2 and3 the maximum chain weight is3, not5.

#### `chain-formula` — Adjacent dual interval count

Status: missing; Proposition3.7; Knight–Zelevinsky [16], Theorem1.2 and equation(1.6).

For m of type chi and integer a, the number of segments of m# containing [a,a+1] is Card(m_a)-E_a(m), with full multiplicities.

#### `dvr-class` — Finite-DVR-module classes and sorted sequences

Status: missing; §4.1, pp20–21.

For a DVR o, C_n consists of finite-length modules generated by at most n elements, up to o-linear isomorphism. seq_n([M]) is the unique ascending nonnegative n-tuple with M≅⊕ o/p^lambda_i. Embed C_n in C_(n+1) by left zero-padding.

Use: Propositions4.4/4.6: recover invariants without choosing a decomposition.

API contracts:

- `FiniteLengthDVR.seq_iso` (characterisation): Finite-length modules have equal equally padded sequences iff they are isomorphic over o.
- `FiniteLengthDVR.seq_padding` (compatibility): seq_(n+1)(M)=(0,seq_n(M)) for M generated by at most n elements.
- `FiniteLengthDVR.layerRank` (projection): dim_k(p^(j-1)M/p^jM) equals the number of sequence entries at least j, for j>=1.

Mathematical acceptance tests (not Lean-executed):

- Zero module has seq_n=(0,...,0).
- o/p^2 has seq_2=(0,2), not (1,1).
- For sequence(1,3), the successive layer dimensions are2,1,1,0; these distinguish it from sequence(2,2), whose dimensions are2,2,0.

#### `vee` — Padded additive monoid and lex order on classes

Status: missing; §4.1 before Lemma4.1.

Order finite-length DVR-module classes by lex order on equally padded sequences. Define [M] vee [N] by componentwise addition of equally padded sequences.

Use: Propositions4.4/4.6 and Corollary4.7: use ordered additive invariant sequences.

API contracts:

- `FiniteLengthDVR.vee_seq` (simp): The sequence of A vee B is the componentwise sum of sequences padded to the same length.
- `FiniteLengthDVR.vee_assoc_comm` (structure): Vee is associative and commutative with zero-module identity, and is independent of common padding.
- `FiniteLengthDVR.vee_strictMono` (relation): If A<B and C<=D in padded lex order, then A vee C<B vee D.

Mathematical acceptance tests (not Lean-executed):

- [o/p] vee [o/p]=[o/p^2].
- [o/p] direct-sum [o/p] is a different class.
- For sequences(1,2) and(0,3), vee gives(1,5), whereas direct sum gives(0,1,2,3) after padding.

#### `vee-mono` — Monotonicity of vee

Status: missing; Lemma4.1.

If [M]<=[N] and [M']<=[N'], then [M]vee[M']<=[N]vee[N']; equality holds only when both original inequalities are equalities.

#### `dvr-dual` — Finite-length DVR dual

Status: missing; §4.1; Lemma4.2.

For fraction field F of o, M^vee=Hom_o(M,F/o). This is contravariant, exact on finite-length modules, and noncanonically isomorphic to M.

Use: Lemma4.3 and Proposition4.4: turn injections into surjections and reverse flags.

API contracts:

- `FiniteLengthDVR.dual_map` (functoriality): For f:M→N, dual(f):Hom(N,F/o)→Hom(M,F/o) is precomposition; it reverses composition.
- `FiniteLengthDVR.dual_exact` (structure): A short exact finite-length sequence dualizes to a short exact sequence with arrows reversed, using injectivity of F/o.
- `FiniteLengthDVR.dual_cyclic` (equivalence): Hom(o/p^a,F/o) is p^-a o/o by evaluation at1; choosing a uniformizer identifies it noncanonically with o/p^a.

Mathematical acceptance tests (not Lean-executed):

- Dual of o/p^a is isomorphic to o/p^a.
- Duality swaps submodule and quotient in a short exact sequence.
- For 0→o/p→o/p^2→o/p→0, the dual sequence is again nonsplit; exactness does not assert a splitting.

#### `dvr-mono` — Submodule class inequality

Status: missing; Lemma4.3(1).

An injection of finite-length DVR modules M→M' implies [M]<=[M'].

#### `dvr-epi` — Quotient class inequality

Status: missing; Lemma4.3(2).

A surjection of finite-length DVR modules M→M' implies [M]>=[M'].

#### `convexity` — DVR convexity

Status: missing; Proposition4.4.

For a short exact sequence 0→M'→M→M''→0 of finite-length DVR modules, [M]>=[M']vee[M''].

#### `ideal-split` — Ideal-multiple equality

Status: missing; Lemma4.5.

For finite-length M and nonzero ideal I of o, [M]=[IM]vee[M/IM].

#### `unique-submodule` — Unique equality-case submodule

Status: missing; Proposition4.6, first assertion.

If [M]=[A]vee[B], there exists exactly one ACTUAL submodule N≤M with [N]=[A] and [M/N]=[B].

#### `submodule-deficit` — Strict deficit away from equality submodule

Status: missing; Proposition4.6, last assertion.

For that unique N and any other N'≤M, either [N']<[A] or [M/N']<[B].

#### `unique-filtration` — Unique equality-case filtration

Status: missing; Corollary4.7, existence/uniqueness.

If [M]=[M_1]vee...vee[M_r], there is exactly one ordered filtration 0=F_0≤...≤F_r=M whose graded quotient classes are [M_i].

#### `filtration-deficit` — Alternative filtration has a deficit

Status: missing; Corollary4.7, last assertion.

Under the preceding equality, every different ordered filtration has some i with [Gr_i F]<[M_i].

#### `simultaneous-lift` — Simultaneous quotient and surjection lifting

Status: missing; Lemma4.8.

For surjective f:M→N and submodule M'≤M, the map M→N ×_(N/f(M')) (M/M') is surjective.

#### `free-surjections` — Equal-rank free covers are equivalent

Status: missing; Lemma4.9.

For a commutative local ring o, an o-module N, and surjections f:L→N and fprime:Lprime→N from finite free modules of the same rank, there is an o-linear isomorphism alpha:L→Lprime with fprime alpha=f. The source needs the DVR finite-length specialization.

The direct local-ring proof below avoids the separate projective-cover citation. Its matrix and residue-field adapters remain planning work.

Proof route:

1. Reduce the two surjections modulo the maximal ideal m. Between equal-dimensional residue vector spaces choose an invertible map Abar intertwining their surjections onto N/mN, by choosing kernel bases and quotient complements.
2. Lift the matrix Abar to A0 over o. The error f-fprime A0 takes each basis vector to mN=fprime(mLprime), so choose a correction matrix Delta with entries in m whose image under fprime is exactly that error.
3. Then A=A0+Delta intertwines f and fprime and reduces to Abar. Its determinant is not in m, hence is a unit in the local ring; the adjugate gives the inverse. No projective cover or finite length of N is needed.

#### `basis-lift` — Ordered generators lift to a basis

Status: missing; Corollary4.10.

Given n generators x_i of finite-length N and a surjection f:L→N from a free rank-n module, there is a basis e_i of L with f(e_i)=x_i.

#### `admissible` — Admissible filtrations and compatible generators

Status: missing; Definition4.11.

For n=(n_1,...,n_r), n_i>=0 and sum n_i=n, an n-admissible filtration of M has endpoints0,M and each Gr_i generated by at most n_i elements. Ordered n generators are compatible when each prefix of length b_i=sum_(j<=i)n_j spans F_i.

Use: Lemma4.12 and Proposition5.2: transport actual filtrations and prescribed quotient bases.

API contracts:

- `DVRFiltration.admissible_iff` (characterisation): F has endpoints0,M and each F_i/F_(i-1) can be generated by at most n_i elements.
- `DVRFiltration.compatible_prefix` (characterisation): An ordered list of sum n_i generators is compatible iff its first b_i=sum_(j<=i)n_j entries span F_i.
- `DVRFiltration.transport` (functoriality): A module isomorphism sends every submodule in F to an admissible filtration with the same quotient generator bounds; transports compose.

Mathematical acceptance tests (not Lean-executed):

- A zero capacity forces its successive quotient to vanish.
- For capacities(1,2), F_2 uses the first3 generators, not the first2.
- With capacities(1,1) on k^2, the admissible intermediate submodules are its q+1 lines, so there are q+1 distinct filtrations.

#### `image-filtration` — Image of a free admissible flag

Status: missing; Lemma4.12(1).

For a free rank-n L surjecting onto finite-length M, an n-admissible filtration of L maps to one of M.

#### `flag-basis` — Compatible basis for a free flag

Status: missing; Lemma4.12(2).

Given an n-admissible flag of free rank-n L, a surjection L→M, and any compatible ordered generators x_1,...,x_n of the image flag, there are compatible generators y_1,...,y_n of L lifting the x_i (necessarily a basis since rank L=n).

#### `flag-lift` — Prescribed compatible generators lift through a free flag

Status: missing; Lemma4.12(3).

Given a free admissible flag and compatible generators of its image in M, there is a compatible basis lifting those generators, with the prescribed graded lifts of Lemma4.12(3).

#### `count-permute` — Exact-generator filtration counts are symmetric

Status: missing; Lemma4.13.

For finite-length M over o with FINITE residue field, the number of ordered filtrations whose successive quotients have exactly m_1,...,m_r minimal generators is invariant under permutation of the m_i.

#### `lattice-level` — Lattice-pair stabilizer

Status: missing; §5.1, p25.

For full o-lattices L_2⊆L_1⊆F^n, K_(L1,L2) stabilizes both and acts trivially on L_1/L_2. K_(n,[M]) denotes its conjugacy class, not a canonical subgroup.

Use: Lemma5.1 and Mackey decomposition: replace matrix levels by quotient lattices.

API contracts:

- `Newform.latticeLevel_mem` (characterisation): g preserves L1,L2 and induces identity on L1/L2 iff gL1=L1 and (g-1)L1 is contained in L2.
- `Newform.latticeLevel_conj` (functoriality): For h in GL_n(F), h K_(L1,L2) h^-1=K_(hL1,hL2).
- `Newform.latticeLevel_diagonal` (compatibility): For L1=o^n and L2=sum p^lambda_i e_i, this stabilizer is the row-depth K_n,lambda.

Mathematical acceptance tests (not Lean-executed):

- Equal lattices give their full stabilizer.
- Isomorphic quotients need conjugacy, not equality of the subgroups.
- With lambda=(0,2), e1 maps to a class of order1 (zero) and e2 to order p^2; the quotient is cyclic of length2.

#### `lattice-conjugacy` — Conjugacy depends only on quotient

Status: missing; Lemma5.1.

The conjugacy class of K_(L1,L2) depends only on n and the isomorphism class [L1/L2].

#### `coset-lattices` — Cosets as lattices with quotient maps

Status: missing; Lemma5.3(1).

For fixed finite-length M generated by <=n elements and a standard quotient o^n→M, G_n/K_(n,[M]) is G_n-equivariantly in bijection with pairs (L,f) of full lattice and surjection f:L→M.

#### `flag-variety` — Flags from parabolic cosets

Status: missing; Lemma5.3(2).

For the partition n=(n_1,...,n_r), G_n/P_n identifies with flags of F-subspaces of prefix dimensions b_i; intersecting such a flag with a lattice identifies it with n-admissible lattice filtrations.

#### `double-cosets` — Double cosets as actual quotient filtrations

Status: missing; Lemma5.3(3) and proof of Proposition5.2.

P_n\G_n/K_(n,[M]) is in bijection with actual n-admissible filtrations of M. In each Mackey summand, projection of P_n∩gKg^-1 to the Levi is the product of the corresponding smaller level groups, up to conjugacy.

#### `mackey` — Fixed vectors indexed by module filtrations

Status: missing; Proposition5.2.

For finite-length smooth complex pi_i of G_(n_i), n_i>=1 and sum n_i=n, (pi_1×...×pi_r)^(K_(n,[M])) is isomorphic to the direct sum over actual n-admissible filtrations F of M of ⊗_i pi_i^(K_(n_i,[Gr_i F])).

#### `reduction` — Reduction to unipotent and L=1 cases

Status: missing; §5.2, pp27–28.

Proving both main theorems for every type-chi irreducible with chi unramified, and for every irreducible with L(s,pi)=1, proves them for all Irr(G_n), via the irreducible cuspidal-support factorization of §5.2, tuple/conductor additivity and Proposition5.2.

#### `filtration-count` — Bounded and exact filtration counts

Status: missing; §6.1 preceding Proposition6.1; §6.4.

N_n(M) is the finite number of n-admissible filtrations of finite-length M, for a nonnegative capacity vector n. Negative capacities give zero; zero capacities are allowed. Exact-generator counts impose equality of generator numbers instead.

Use: Lemma4.13 and Proposition6.1: count actual intermediate submodules.

API contracts:

- `DVRFiltration.count_iso` (functoriality): An o-module isomorphism induces a bijection of admissible filtrations and preserves the finite count.
- `DVRFiltration.count_zero_capacity` (simp): Deleting a zero capacity and its forced repeated submodule leaves the count unchanged.
- `DVRFiltration.count_exact_sum` (relation): N_(n1,...,nr)(M) is the sum of exact-generator counts over all 0<=m_i<=n_i.

Mathematical acceptance tests (not Lean-executed):

- N_(0,n)(M) forces first step0.
- Counting filtration isomorphism classes in place of actual submodules gives the wrong invariant dimension.
- For M=o/p^2 and capacities(1,1), the intermediate submodules0,pM,M give count3; the exact(1,1) count is1.

#### `ladder-determinant` — Ladder determinantal character formula

Status: missing; §6.1 proof of Proposition6.1; [21].

In the Grothendieck group, Z([x_i,y_i]_(i=1..t)) for a type-chi ladder equals sum_(w in S_t) sgn(w) ⊗ind_i Z([x_w(i),y_i]_chi), with empty intervals giving G_0 and negative lengths giving zero.

#### `ladder-count` — Ladder invariant dimensions as alternating counts

Status: missing; Proposition6.1.

For that ladder pi of rank n and [M]∈C_n, dim pi^(K_(n,[M]))=sum_(w∈S_t) sgn(w) N_(y_i-x_w(i)+1)_i(M).

#### `generator-bound` — Subquotient generator bound at ladder level

Status: missing; Lemma6.2.

Put b=max_(2<=i<=t) max(y_i-x_(i-1)+2,0). If [M]<=[M_pi], then every graded quotient of every filtration of M is generated by at most b elements.

#### `cancellation-sets` — Five permutation subsets for ladder cancellation

Status: missing; Lemma6.3, pp29–30.

Choose a with y_a-x_(a-1)+2=b>0. X1={w | w(k)>=a-1 for k>=a}; X2={w∈X1 | w(k)>=a for k>a}; S={w | w(k)>=a for k>=a}; X3={(a-1,w(a))w | w∈S}; X4={w | w(a)=a-1 and some k>a has w(k)<a-1}; X5={w(a,i(w)) | w∈X4}, with i(w) attaining the largest value among w(1),...,w(a-1).

Use: Lemma6.3 and ladder recurrence: separate disjoint subsets before pairing signs.

API contracts:

- `LadderCancellation.first_pair` (constructor): On S_t minus X1, swap the positions of the two largest values among w(1),...,w(a-1).
- `LadderCancellation.second_pair` (constructor): On X1 minus X2, swap position a with the unique earlier position having value at least a.
- `LadderCancellation.remaining_partition` (relation): X2 is the disjoint union of the block-preserving subgroup S and X3; X3 disjoint-union X4 is {w:w(a)=a-1}.

Mathematical acceptance tests (not Lean-executed):

- Test t=2,a=2 with empty exceptional subsets.
- Enumerate t=4 and verify each involution has no fixed point and reverses sign.
- At t=3,a=2, the first exceptional subset is empty; verify the second pairing exchanges the two permutations with w(3)=1 and w(1)>=2.

#### `cancel-one` — First sign-reversing cancellation

Status: missing; Lemma6.3(1).

For [M]<=[M_pi], swapping the positions of the two largest values among w(1),...,w(a-1) defines a count-preserving sign-reversing involution on S_t\X1, so its signed sum is zero.

#### `cancel-two` — Second sign-reversing cancellation

Status: missing; Lemma6.3(2).

On X1\X2, swapping a with the unique position i<a having w(i)>=a defines a count-preserving sign-reversing involution and its signed sum is zero.

#### `cancel-three` — Remaining subset partition

Status: missing; Lemma6.3(3).

X2 is the disjoint union of S and X3.

#### `cancel-four` — X4 partition and stability

Status: missing; Lemma6.3(4).

X4⊆S_t\X1 is stable under the first involution, and X3 disjoint-union X4={w | w(a)=a-1}.

#### `cancel-five` — X5 stability

Status: missing; Lemma6.3(5).

X5⊆S_t\X1 is stable under the first involution.

#### `ladder-recurrence` — Ladder fixed-space recurrence

Status: missing; §6.1 following Lemma6.3.

For [M]<=[M_pi] and b>0 as above, replace the two adjacent segments at a-1,a by [x_a,y_(a-1)] to form pi'. Then dim pi^(K_(n,[M]))=sum_(N≤M, minimalGenerators N=b) dim pi'^(K_(n',[M/N])).

#### `ladder-main` — Newforms for type-chi ladders

Status: missing; §6.1 conclusion; Example6.4.

Theorem2.1 holds for every type-chi ladder; for b=0 use spherical invariants, and for b>0 use the recurrence and unique equality filtration.

#### `constituent-one` — Distinguished constituent multiplicity one

Status: missing; Lemma6.5; [38] Proposition2.3, [22] Proposition3.5(5).

Z(m1+m2) occurs with multiplicity one as a subquotient of Z(m1)×Z(m2).

#### `derivative-constituent` — Truncated constituent criterion

Status: missing; Lemma6.6.

For type-chi multisegments, if Z(m) occurs in Z(m1)×Z(m2), then Z(m^-) occurs in Z(m1^-)×Z(m2^-) iff Card(m)=Card(m1)+Card(m2). This is the degree-one form actually used in §6.3.

Printed lemma allows general multisegments; the c-th-derivative proof needs degree-weighted orders off a degree-one line. General extension remains a gap; see sourceIssues. The source proof uses the ordinary derivative of order Card(m); for general cuspidal degree this must be replaced by the sum of cuspidal degrees. The type-chi application has degree1 throughout.

#### `unipotent-main` — Newforms for arbitrary type-chi irreducibles

Status: missing; §6.3.

For chi unramified and pi=Z(m) of type chi, Theorem2.1 holds. Induct on (total segment length,number of linked pairs), use maximal peeling and compare all other constituents' tuples strictly.

#### `count-polynomial` — Weighted polynomial counting functional

Status: missing; §6.4, pp35–36.

Let R=Z[x_1,x_2,...], deg x_i=i, y_m=1+x_1+...+x_m. Define the Z-LINEAR functional xi_M on monomials by the exact-generator filtration count for their index multiset; xi_M(1)=1 if M=0 and0 otherwise.

Use: Lemmas6.7/6.8: turn the Steinberg alternating sum into a weighted-degree obstruction.

API contracts:

- `DVRFiltration.countLinear_monomial` (simp): xi_M(product x_(m_i)) is the exact-generator count with capacities m_i>0, independent of ordering by Lemma4.13.
- `DVRFiltration.countLinear_add` (structure): xi_M is Z-linear on MvPolynomial positiveNaturals Z, without any multiplicativity assertion.
- `DVRFiltration.countLinear_y` (compatibility): xi_M(product_i(1+sum_(j=1)^n_i x_j)) equals the bounded admissible-filtration count.

Mathematical acceptance tests (not Lean-executed):

- xi_M is not assumed multiplicative.
- For M=0, all nonconstant exact-positive-generator monomials evaluate to zero.
- For M=k, xi_M(x1)=1 but xi_M(x1^2)=0, disproving multiplicativity explicitly.

#### `count-y` — Bounded counts from y-polynomials

Status: missing; Lemma6.7.

xi_M(y_(m1)...y_(ms)) equals the number of (m1,...,ms)-admissible filtrations.

#### `count-degree` — Degree vanishing from module length

Status: missing; Lemma6.8.

If length_o(M)<m, then xi_M(I_m)=0.

#### `steinberg-polynomial` — Steinberg composition polynomial bound

Status: missing; §6.4 equation(6.1) and p37.

For n>=1, f_n=sum_(0=n0<...<nr=n) (-1)^(n-r) y_(n1-n0)...y_(nr-n(r-1)) belongs to I_(n-1). The generating-series equality must use the infinite denominator or equality modulo t^(n+1).

Corrects the finite/infinite series misprint; see sourceIssues.

#### `unipotent-weight` — Weight vanishing on type-chi lines

Status: missing; §6.4.

For unramified chi and pi=Z(m) of type chi, weight(lambda)<c_pi implies pi^(K_n,lambda)=0; reduce to unramified Steinberg constituents and apply the weighted polynomial bound.

#### `hecke-semigroup` — Congruence semigroup and nonunit Hecke ideal

Status: missing; §7.1, pp37–38.

X_lambda consists of integral n×n matrices with row i congruent to identity modulo p^lambda_i. H_lambda is the K_n,lambda-biinvariant Hecke subalgebra supported on X_lambda∩G_n; a_lambda is supported on its nonunits, i.e. outside K_n,lambda. Write their images on finite-dimensional V^K with a subscript V.

Use: Lemma7.1 and conductor-weight proof: track determinant valuation in convolution.

API contracts:

- `Newform.heckeNonunit_mul` (relation): The product of r nonunits of X_lambda has determinant valuation at least r.
- `Newform.heckeUnit` (simp): With vol(K_n,lambda)=1, the characteristic function of K is the convolution identity on K-biinvariant compactly supported functions.
- `Newform.heckeNonunit_ideal` (structure): Functions supported on the nonunits form a two-sided ideal because determinant valuations of integral matrices are nonnegative.

Mathematical acceptance tests (not Lean-executed):

- For n=1,lambda=0, 1_(varpi o*) acts by a nonzero scalar on an unramified character.
- For a nonzero depth tuple, powers of the nonunit support escape compact sets modulo center under the lemma's argument.
- For lambda=(1,1), every element of X_lambda is congruent to identity modulo p, hence invertible over o and the nonunit ideal is zero.

#### `hecke-nilpotent` — Correctly qualified cuspidal nilpotence

Status: missing; Lemma7.1 and proof, pp38–39.

For cuspidal pi and NONZERO lambda, every T in a_(lambda,V) is nilpotent by compact-mod-center matrix coefficient support and support escape. At lambda=0 the standalone statement is false for unramified GL1 characters; in the L(s,pi)=1 application require a separate proof V^GL_n(o)=0.

Source defect E2. The nonzero-depth repair and zero-depth spherical-cuspidal classification need an explicit proof contract.

Proof route:

1. Use nonzero-level-escape for the compact-mod-center support of each cuspidal matrix coefficient.
2. A power T^r has support with determinant valuation at least r, hence every matrix coefficient of T^r eventually vanishes.
3. Choose finite bases of V^K and its dual to make the vanishing threshold uniform; T is nilpotent. At lambda=0 handle nonspherical cuspidal representations separately.

#### `hecke-annihilator` — Nonunit ideal annihilates a simple subspace

Status: missing; §7.1 after Lemma7.1.

In the L=1 cuspidal application, after the preceding nilpotence qualification, the nonunit ideal lies in the Jacobson radical of the finite-dimensional image algebra and annihilates every simple submodule of V^K.

Nil-ideal-to-Jacobson inclusion in a noncommutative algebra is a separate unsupplied library adapter.

Proof route:

1. For x in the nil ideal a and any y in H, yx belongs to a and is nilpotent. The pinned noncommutative geometric-inverse lemma makes 1+yx invertible.
2. The inverse z satisfies z*y*x+z-1=0, so Ideal.mem_jacobson_iff puts x in the Jacobson radical.
3. For a simple submodule W and nonzero w, H→W, h↦hw, has maximal left-ideal kernel. The radical lies in this kernel for every nonzero w, so a annihilates W.

#### `fourier-depth` — Fourier support at column depths

Status: missing; §7.1 Godement–Jacquet calculation, pp38–39.

For the row-depth semigroup characteristic function used in §7.1 and the trace pairing, the Fourier transform is supported where column j has depth at least -lambda_j, hence determinant valuation is >=-|lambda|.

#### `ramified-weight` — Conductor bound for L=1 representations

Status: missing; §7.1 conclusion.

If L(s,pi)=1 and pi^(K_n,lambda)≠0, then |lambda|>=c_pi. Reduce to cuspidal support, use an a_lambda-annihilated vector and GJ functional equation with the Fourier depth estimate.

#### `segment-reduction` — L=1 reduction to single segments

Status: missing; Lemma7.2.

For pi=Z(Delta_1+...+Delta_r) with L(s,pi)=1, if Theorem2.1 holds for each single-segment Z(Delta_i), it holds for pi; use the unitriangular constituent transition and equality-case filtration.

#### `speh-groups` — Block groups and the row-stabilizer D

Status: missing; §8.1, pp40–42.

In G_nm use standard block Levi L=GL_n^m, its upper block unipotent U, full upper unipotent N, shuffled Levi S=GL_m^n, and V={g | each n×n block g_ij-delta_ij I is strictly upper triangular}. D fixes each last block ROW e_(ni) under right multiplication. iota:G_(n-1)m→G_nm inserts a last row/column identity in every block.

Use: Lemma8.1 and Theorem9.1: specify embeddings and quotients exactly.

API contracts:

- `SpehGroups.iota_mul` (functoriality): The block insertion map iota is an injective group homomorphism and maps K' into K.
- `SpehGroups.d_factor` (relation): D=V iota(G'), V intersect iota(G')=iota(V'), and V\D identifies with V'\G'.
- `SpehGroups.psi_restrict` (characterisation): Psi(g)=psi(sum of g_(i,i+1) for n not dividing i); its restrictions to N,V are homomorphisms but Psi on all G is not.

Mathematical acceptance tests (not Lean-executed):

- For n=m=2, V has free entries12,14,32,34 and V'=1.
- For m=1, D is the usual mirabolic subgroup.
- For n=m=2, iota(I+tE12)=I+tE13 normalizes V but does not preserve Psi on V; E32 conjugation adds tE12.

#### `d-quotient` — First quotient identification

Status: missing; Lemma8.1(1).

D=V iota(G') and V∩iota(G')=iota(V'); hence V\D≃V'\G'.

#### `n-quotient` — Second quotient identification

Status: missing; Lemma8.1(2).

N∩D=(N∩V)iota(N') and (N∩V)∩iota(N')=iota(N'∩V'); hence (N∩V)\(N∩D)≃(N'∩V')\N'.

#### `speh-models` — Zelevinsky and Shalika models

Status: missing; §8.2.

Psi(g)=psi(sum_(1<=i<nm,n does not divide i) g_(i,i+1)); its restrictions to N and V are characters. W_Ze^psi(sigma) and W_Sh^psi(sigma) are the images of nonzero maps sigma→Ind_N^G Psi and sigma→Ind_V^G Psi, respectively, when their Hom spaces are one-dimensional.

Use: Proposition8.3 and unitary pairing: work in concrete functional realizations.

API contracts:

- `SpehModel.left_equivariant` (characterisation): A model function satisfies W(ug)=Psi(u)W(g) for u in its designated group N or V.
- `SpehModel.right_translate` (structure): Right translation R_hW(g)=W(gh) preserves the model and commutes with its defining left equivariance.
- `SpehModel.realization_unique` (universal-property): A nonzero one-dimensional equivariant Hom space determines the image realization independently of scaling its functional.

Mathematical acceptance tests (not Lean-executed):

- m=1 gives the usual Whittaker model.
- When n-1=1, the primed N' character is trivial, NOT generic.
- Multiplying the chosen nonzero model functional by2 gives the same image space, although it doubles a specific matrix coefficient.

#### `ze-unique` — Zelevinsky-model multiplicity one

Status: missing; §8.2; [42] §8.3.

For tempered Speh sigma, dim Hom_G(sigma,Ind_N^G Psi)=1.

#### `sh-unique` — Shalika-model multiplicity one

Status: missing; §8.2; [32], [20] §3.1.

For tempered Speh sigma, dim Hom_G(sigma,Ind_V^G Psi)=1.

#### `model-levi` — Levi restriction of Zelevinsky functions

Status: missing; §8.2, p42.

Restriction to L lies in the tensor product over i=1,...,m of the Whittaker model of pi|.|^((m+1-2i)(n-1)/2).

#### `unitary-convergence` — Shalika pairing convergence

Status: missing; Theorem8.2, first assertion; [20] Propositions4.1,6.2.

For W1,W2 in W_Sh^psi(sigma), B(W1,W2,s)=integral_(V\D) W1(g) conjugate(W2(g)) |det g|^s dg converges for Re(s)>-1 and admits meromorphic continuation.

#### `unitary-pairing` — Shalika invariant inner product

Status: missing; Theorem8.2, second assertion; [20] Theorem4.3, Corollary4.4.

B(W1,W2,0) is a positive-definite G-invariant Hermitian form; in particular restriction to D is injective.

#### `transition` — Model transition transforms

Status: missing; Proposition8.3.

T^psi W(g)=integral_((V∩N)\V) W(ug)Psi(u)^-1 du. The inverse integrates a Shalika function over (N∩V)\(N∩D) with the same inverse character. Measures are the compatible ones of Lapid–Mao.

Use: Proposition8.9: change models without losing invariance or measure factors.

API contracts:

- `SpehTransition.right_translate` (functoriality): T(R_hW)=R_h(TW), and the inverse obeys the same identity.
- `SpehTransition.inverse` (equivalence): For the compatible quotient measures, the N-to-V and V-to-N integrals are mutually inverse on the Speh models.
- `SpehTransition.contragredient` (compatibility): T^(psi^-1)(tilde W)(g)=T^psi(W)(w_nm transpose(g)^-1 w'_n).

Mathematical acceptance tests (not Lean-executed):

- m=1 gives identity.
- For primed n-1=1, V'=1 and T' is identity.
- A right-H-invariant vector remains right-H-invariant under both transforms for any subgroup H, including K^(a).

#### `transition-support` — Compact support for both model transforms

Status: missing; Proposition8.3; [20] Lemmas3.8,3.11.

The Zelevinsky integrand is compactly supported on (V∩N)\V and the Shalika integrand on (N∩V)\(N∩D), for every right translate.

#### `transition-inverse` — Two-sided model isomorphism

Status: missing; Proposition8.3; [20] Proposition3.5.

With the compatible measures, the displayed T and inverse give mutually inverse G-equivariant isomorphisms of the two Speh models.

#### `compact-restriction` — Compact induction occurs in model restriction

Status: missing; §8.3 Lemma8.6 and §9.1 input; [20] Corollaries3.13,3.15, pp923–924.

Restriction of the Shalika model to D contains c-Ind_V^D Psi; the analogous assertion holds for every intermediate model, including Zelevinsky, under the generic Speh construction of Lapid–Mao.

Statements, row-vector D convention, and Lemma3.14 checked in the published cited source. Remaining surrounding proof closure recorded as a gap.

#### `im` — Unequal-rank Zelevinsky integral

Status: missing; §8.3.

For W in W_Ze^psi(sigma), W' in W_Ze^(psi^-1)(sigma'), define I_m(s,W,W')=integral_(N'\G') W(iota(g))W'(g)|det g|^(s-m/2) dg initially in an absolute-convergence half-plane.

Use: Theorem8.5 and Proposition8.7: normalize integrals and obtain Laurent module stability.

API contracts:

- `SpehIntegral.I_bilinear` (structure): In a common convergence half-plane, I_m is complex bilinear in the two model functions; rational continuation preserves this.
- `SpehIntegral.I_simultaneous_translate` (relation): I_m(s,R_iota(h)W,R_hW')=abs(det h)^(-(s-m/2))I_m(s,W,W').
- `SpehIntegral.I_levi` (compatibility): Iwasawa decomposition gives a finite sum of products of I_1(s-m+i,W_i,W'_i), followed by the compact quotient integral, with its modulus factor.

Mathematical acceptance tests (not Lean-executed):

- m=1 is the classical GL_n×GL_(n-1) Rankin–Selberg normalization.
- Using psi instead of psi^-1 for W' fails quotient descent.
- For det h of valuation1, simultaneous translation multiplies I_m by q^(s-m/2); the Laurent variable power is X^-1.

#### `im-iwasawa` — Levi decomposition of the integral

Status: missing; Lemma8.4.

I_m equals the iterated integral over P'\G' and (N'∩L')\L' of W(iota(lg))W'(lg)|det l|^(s-m/2)delta_P'(l)^-1, with the outer factor |det g|^(s-m/2). Interpret the formal identity first under absolute convergence.

#### `im-convergence` — Absolute convergence of Speh I_m

Status: missing; Theorem8.5(1).

For tempered pi,pi' and the indicated model vectors, I_m converges absolutely for Re(s) sufficiently large (bound may depend on the vectors).

#### `im-rational` — Denominator bound for I_m

Status: missing; Theorem8.5(2).

I_m(s,W,W') divided by product_(i=1..m)L(s-m+i,pi×pi') belongs to C[q^-s,q^s].

#### `tilde` — Contragredient model involution

Status: missing; Theorem8.5(3); Proposition8.9.

Define tilde W(g)=W(w_nm transpose(g)^-1 w'_n), where w_nm is the full antidiagonal permutation and w'_n the antidiagonal m×m block permutation with I_n blocks. Use the primed analogue for W'.

Use: Theorems8.5/8.11 and Proposition9.8: track the target representation and additive character.

API contracts:

- `SpehModel.tilde_target` (compatibility): Tilde maps the psi model of sigma to the psi^-1 model of its smooth contragredient.
- `SpehModel.tilde_involutive` (relation): Applying the displayed full and block Weyl transpose-inverse transform twice returns W.
- `SpehModel.tilde_translate` (functoriality): Tilde(R_hW)=R_(w'_n transpose(h)^-1 w'_n)(tilde W).

Mathematical acceptance tests (not Lean-executed):

- For m=1 recover the standard Whittaker contragredient transform.
- A vector of sigma cannot silently be used as a vector of its contragredient.
- A central translate h=aI becomes the central translate a^-1 I after tilde; it does not remain aI.

#### `im-fe` — Functional equation for I_m

Status: missing; Theorem8.5(3).

I_m(m-s,tilde W,tilde W')=omega_pi'(-1)^((n-1)m) product_(i=1..m) gamma(s-m+i,pi×pi',psi) I_m(s,W,W'). Here gamma=epsilon times L(1-s,tilde pi×tilde pi')/L(s,pi×pi').

#### `test-one` — Integral test vector equal to one

Status: missing; Lemma8.6.

For W' in the partner Zelevinsky model with W'(1)≠0, some W in the first model satisfies I_m(s,W,W')=1 identically.

#### `pm` — GCD polynomial of the integral family

Status: missing; Proposition8.7.

The C-span of all I_m is a fractional ideal in C[X,X^-1], X=q^-s, generated by 1/P_m(X) for unique P_m∈C[X] with P_m(0)=1.

Use: Proposition8.7 and Remark8.8: express the gcd without overstating its denominator.

API contracts:

- `SpehIntegral.gcdPolynomial_spec` (characterisation): The integral span equals P_m(X)^-1 C[X,X^-1], with P_m(0)=1.
- `SpehIntegral.gcdPolynomial_unique` (extensionality): Two normalized polynomials generating the same fractional ideal by reciprocals are equal.
- `SpehIntegral.gcdPolynomial_divides` (relation): P_m(X) divides product_(i=1)^m P_1(q^(m-i)X), and P_1(X)=L(s,pi times pi')^-1 at X=q^-s.

Mathematical acceptance tests (not Lean-executed):

- m=1 is the classical AL.3 polynomial.
- For m>1 and ramified partner, equality with the product is NOT a theorem of this paper.
- If all integrals are Laurent polynomials and one equals1, the normalized polynomial is P_m=1.

#### `pm-divides` — GCD divisibility bound

Status: missing; Proposition8.7; Remark8.8.

P_m(X) divides product_(i=1..m)P_1(q^(m-i)X). The paper only obtains equality for an unramified partner downstream of §9, not in general.

#### `zm` — Unequal-rank Shalika integral

Status: missing; §8.4.

Z_m(s,W,W')=integral_(V'\G') W(iota(g))W'(g)|det g|^(s-m/2) dg, with opposite additive characters on the two Shalika models.

Use: Proposition8.9 and Theorem9.1: compare models and define the test transform.

API contracts:

- `SpehIntegral.Z_bilinear` (structure): In a common absolute-convergence region the Shalika integral is bilinear, and continuation preserves bilinearity.
- `SpehIntegral.Z_eq_I` (compatibility): For W_Sh=T^psi W_Ze and W'_Sh=T^(psi^-1)W'_Ze, Z_m=I_m with the specified quotient measures.
- `SpehIntegral.Z_compact_support` (characterisation): If the first restricted function has compact support modulo V', the integral is an ordinary convergent integral whenever the second is smooth and the weight continuous.

Mathematical acceptance tests (not Lean-executed):

- m=1 agrees with I_1.
- For n=m=2, the quotient is the entire GL2(F), not N'\GL2(F).
- For n=m=2 and f=1_(uK')-1_K', integration against any left-N'-invariant smooth function times a determinant weight is zero.

#### `iz` — Model compatibility of integrals

Status: missing; Proposition8.9.

If W_Sh=T^psi W_Ze and W'_Sh=T^(psi^-1) W'_Ze, then Z_m(s,W_Sh,W'_Sh)=I_m(s,W_Ze,W'_Ze); the contragredient transforms commute with T in the stated conventions.

#### `formal-spherical` — Formal spherical test families

Status: missing; §8.5.

For an m×(n-1) matrix x of nonzero complex parameters, define W_Ze^0(ulk;x)=delta_P'(l)^(1/2) product_i W^0(l_i; x_i,*), with u∈U', l∈L', k∈K', and W^0 the normalized spherical Whittaker function with inverse psi. Put W_Sh^0=T'W_Ze^0.

Use: Lemma8.10 and Theorem8.11: distinguish full parameter families from actual Speh vectors.

API contracts:

- `SpehSpherical.formal_eval` (simp): For g=ulk, evaluate W_Ze^0 by delta_P'(l)^(1/2) times the product of normalized spherical Whittaker functions on its blocks.
- `SpehSpherical.formal_rowSymmetry` (relation): Permuting Satake parameters within each row leaves W_Ze^0 unchanged; arbitrary row permutations need not preserve the function.
- `SpehSpherical.formal_commonScale` (relation): On det valuation d, multiplying every x_ij by z multiplies W_Ze^0 and W_Sh^0 by z^d.

Mathematical acceptance tests (not Lean-executed):

- For n=2, W_Sh^0=W_Ze^0 is left N'-invariant for EVERY x.
- Coincident parameters must retain geometric-lemma multiplicities.
- For n=m=2 and equal parameters(x,x), the derivative in opposite parameter directions is a second Hecke eigenfunction, vanishing at1 and nonzero at diag(varpi,1).

#### `spherical-span` — Spherical spanning fails at coincident parameters

Status: missing; Lemma8.10.

The literal Lemma8.10 statement for all Satake parameter multisets is false in the n=m=2 specialization with parameters(x,x): spherical-collision supplies two independent eigenfunctions, while the stated family has a single member. A replacement theorem must retain confluent/derivative data at collisions; the generic distinct-parameter statement needs its own proof.

Strengthens the earlier proof-multiplicity finding using the explicit derivative eigenfunction. This is a provisional source finding, not an independent-review verdict.

Proof route:

1. Use the family F_t(g)=q^(-(a-b)/2)x^(a+b)exp(t(a-b)), exactly the formal W_Ze^0(x exp(t),x exp(-t)) of Section8.5. Iwasawa torus valuations are well-defined on N\G/K.
2. Every compactly supported spherical Hecke operator acts on this family by its symmetric Satake eigenvalue lambda_t. Symmetry gives lambda_t=lambda_-t and lambda_prime(0)=0. Its action is a finite sum on right-K-fixed functions, so differentiate termwise.
3. H=dF_t/dt at0 therefore has the same eigenvalue as F. The identity and diag(varpi,1) values prove independence. Alternatively for T=1_(K diag(varpi,1) K), use q F(a+1,b)+F(a,b+1)=2 sqrt(q)x F(a,b), and the same equation for H; the central generator acts by x^2.

#### `formal-convergence` — Formal-family convergence

Status: missing; Theorem8.11(1).

For W in the Zelevinsky model and every nonzero parameter matrix x, I_m(s,W,W_Ze^0(x)) converges absolutely for Re(s) sufficiently large.

#### `formal-rational` — Formal-family denominator bound

Status: missing; Theorem8.11(2).

Writing q^(-s_ij)=x_ij, divide I_m(s,W,W_Ze^0(x)) by product_(i,j)L(s+s_ij-(m-1)/2,pi); the result lies in C[q^-s,q^s] and is independent of choices of logarithms.

#### `formal-fe` — Formal-family functional equation

Status: missing; Theorem8.11(3).

I_m(m-s,tilde W,W_Ze^0(x^-1))=product_(i,j)gamma(s+s_ij-(m-1)/2,pi,psi) I_m(s,W,W_Ze^0(x)), with the changed additive-character convention understood.

#### `formal-iz` — Formal-family model compatibility

Status: missing; Theorem8.11(4).

For W_Sh=T W_Ze, I_m(s,W_Ze,W_Ze^0(x))=Z_m(s,W_Sh,W_Sh^0(x)).

#### `essential` — Essential test conditions as a solution set

Status: missing; Theorem9.1 and Definition9.2, corrected interface.

Define Ess(pi,m) to be the set of W∈W_Sh^psi(Sp(pi,m)) right iota(K')-invariant such that for all s and all nonzero x_ij, Z_m(s,W,W_Sh^0(x))=product_(i,j)L(s+s_ij-(m-1)/2,pi). Do NOT define a uniquely chosen vector from these conditions: E1 gives a nonzero common kernel for n=m=2.

Use: Theorem9.1 repair: encode the inhomogeneous test equations and their common kernel.

API contracts:

- `SpehEssential.mem_iff` (characterisation): W belongs to Ess(pi,m) iff it is right iota(K')-fixed and every formal test integral equals the specified product of L-factors.
- `SpehEssential.add_kernel` (relation): Adding a right-iota(K')-fixed model vector annihilated by every test preserves membership in Ess.
- `SpehEssential.sub_mem_kernel` (relation): The difference of two essential solutions belongs to the common kernel; if one solution exists then Ess is its affine translate by that kernel.

Mathematical acceptance tests (not Lean-executed):

- For n=m=2, adding the compact-induction perturbation in E1 preserves all test conditions.
- The printed two conditions cannot justify a unique-choice constructor.
- For the functions f_r=1_(u_rK')-1_K' with u_r=I+varpi^-r E12, r>=1, distinct right cosets make every finite subset linearly independent.

#### `essential-l1` — Existence when L=1

Status: missing; §9.1 existence proof, pp48–49.

If L(s,pi)=1, Ess(pi,m) is nonempty: extend the compactly induced function on D supported on V iota(K') with values Psi, then average under right iota(K').

#### `spectral-space` — Closed transform space Pi

Status: missing; §9.1, p49.

Pi is the closure inside L²(V'\G';Psi) of smooth functions obtained by the T' integral from smooth N'-equivariant functions, as specified before Lemma9.3.

Use: Lemma9.3 and its attempted application: distinguish a closure in L2 from all model restrictions.

API contracts:

- `SpehSpectrum.mem_closure` (characterisation): Pi consists of L2 limits of the stipulated smooth transformed functions, using the ambient quotient norm.
- `SpehSpectrum.closed_invariant` (structure): The closure is a closed right-G'-invariant subspace wherever the defining transform is justified and right translation is unitary.
- `SpehSpectrum.zero_blockSizeOne` (example): For primed block size1 and m>=2, T' is identity and its left-N'-invariant L2(G') smooth subspace is zero.

Mathematical acceptance tests (not Lean-executed):

- For n=m=2, V'=1 and the smooth left-N'-invariant L²(G') subspace is zero.
- Nonzero compactly supported functions on G' cannot all lie in this Pi.
- For m=1 the character is generic and the quotient is N'\G'; the zero-space argument for a noncompact N' fiber in G' must not be reused.

#### `spectral-separation` — Separation restricted to Pi remains an obligation

Status: missing; Lemma9.3.

The source claims a smooth right-K'-invariant phi in Pi with all formal spherical test integrals zero must vanish. A valid proof must handle measurable multiplicity spaces and the domains of the test integrals; it cannot be extended to all restricted Speh vectors.

Open proof audit. In the counterexample specialization Pi=0, so this lemma is vacuous rather than the location of the counterexample.

#### `essential-kernel` — Noninjectivity of the essential test transform

Status: missing; Diagnostic replacing the invalid uniqueness part of Theorem9.1; E1.

For n=m=2 and any tempered pi on GL2, let u=[[1,varpi^-1],[0,1]]. f=1_(uK')-1_K' is nonzero, right K'-invariant and compactly supported. Lapid–Mao restriction plus right averaging yields nonzero W in the Shalika model restricting to f. Every Z_m(s,W,W_Sh^0(x)) vanishes. Thus whenever Ess(pi,2) is nonempty it is not a singleton.

Worker argument, not a result attributed to AKY. Independent confirmation required; full proof in report.

#### `levi-separation` — Levi restriction injectivity requires repair

Status: missing; Corollary9.4.

The printed Corollary9.4 asserts that a right-iota(K')-invariant W in the Zelevinsky model with W|L=0 vanishes. Its stated proof invokes the failed §9.1 separation of all restricted vectors. Retain as an unresolved target, not an unconditional import.

#### `speh-lex` — Speh lex vanishing target

Status: missing; Proposition9.5.

For sigma=Sp(pi,m) and lambda<lambda_sigma, sigma^(K_nm,lambda)=0. The paper reduces to generic newforms via a conjugate level and Corollary9.4; a replacement for that separation step is required.

#### `speh-level` — Speh row-end level

Status: missing; §9.2 before Proposition9.6.

K^(a) consists of k∈GL_nm(o) whose row ni is congruent to row ni of 1 modulo p^a for every i=1,...,m. It is conjugate to K_nm,(0^((n-1)m),a^m).

Use: Propositions9.5/9.6: isolate the stronger level condition from the essential test condition.

API contracts:

- `SpehLevel.mem` (characterisation): Every last row in the n-by-n blocks is congruent to the corresponding identity row modulo p^a.
- `SpehLevel.conjugate_rowLevel` (compatibility): A permutation in GL_nm(o) conjugates K^(a) to K_nm,(0^((n-1)m),a^m).
- `SpehLevel.antitone` (relation): If a<=b then K^(b) is a subgroup of K^(a); each K^(a) contains iota(K').

Mathematical acceptance tests (not Lean-executed):

- a=0 gives GL_nm(o).
- Right iota(K')-invariance alone is strictly weaker than K^(a)-invariance.
- For n=m=2, I+E12 belongs to K^(a) for every a, while I+E21 belongs iff its entry has valuation at least a.

#### `det-slice` — Determinant-sliced test integral

Status: missing; §9.2, p51.

For d∈Z, Z_(m,d)(W;x) integrates W(iota(g))W_Sh^0(g;x)|det g|^(-m/2) over the part of V'\G' with |det g|=q^-d. Its generating variable is X=q^-s.

Use: Lemma9.7 and Proposition9.8: separate coefficients and compare support after the functional equation.

API contracts:

- `SpehIntegral.slice_scale` (relation): Z_(m,d)(W;z x)=z^d Z_(m,d)(W;x) for z nonzero.
- `SpehIntegral.slice_sum` (compatibility): In the convergence region, Z_m(s,W,W^0(x)) is the sum over d of X^d Z_(m,d)(W;x).
- `SpehIntegral.slice_reflect` (simp): Substitution s→m-s sends X^d to q^(-md) X^-d; the factor depends on d.

Mathematical acceptance tests (not Lean-executed):

- The E1 perturbation has only d=0 support and its test slice is zero.
- Replacing s by m-s sends X^d to q^(-md)X^(-d), not q^-m X^(-d).
- For m=2,d=0 the factor is1, and for d=2 it is q^-4; a constant q^-2 fails both checks.

#### `slice-lower` — Uniform lower support bound

Status: missing; Lemma9.7 and following paragraph.

For every Shalika vector W there exists integer d(W), independent of x, with Z_(m,d)(W;x)=0 for d<d(W). If W_Ze is right V''(p^ell)-invariant one may take d(W)=-(n-1)m ell.

#### `slice-level` — Level-dependent lower bounds

Status: missing; §9.2 paragraph after Lemma9.7.

For W fixed by K^(a), one may take d(W)=0 and d(tilde W)=-(n-1)ma in the determinant-slice bound.

#### `slice-finite` — Finite support when L=1

Status: missing; Proposition9.8, first assertion.

If L(s,pi)=1, put d'(W)=-c_pi m(n-1)-d(tilde W). Then Z_m(s,W,W_Sh^0(x))=sum_(d(W)<=d<=d'(W)) X^d Z_(m,d)(W;x).

#### `slice-fe` — Corrected finite Laurent functional equation

Status: missing; Proposition9.8, second assertion, corrected q exponent.

For L=1, epsilon(s,pi,psi)=epsilon_0 q^(-c_pi s), the sum over tilde-W support of q^(-md)X^(-d) Z_(m,d)(tilde W;x^-1) equals epsilon_0^(m(n-1)) q^(c_pi*m*(m-1)*(n-1)/2) X^(c_pi*m*(n-1)) product_(i,j)x_ij^c_pi times the sum over W support of X^d Z_(m,d)(W;x).

See E4; this correction does not repair the independent §9 uniqueness defect.

#### `speh-l1` — L=1 Speh newform line target

Status: missing; Proposition9.6.

For L(s,pi)=1, the K^(c_pi)-fixed Shalika space is one-dimensional and admits an element satisfying the essential test conditions. The printed claim that an arbitrarily unique essential vector spans it must be replaced; proof currently unclosed.

#### `speh-main` — General tempered Speh newform line target

Status: missing; Corollary9.9.

For tempered pi, dim Sp(pi,m)^(K^(c_pi))=1. This is the source's Corollary9.9 after the reduction chain; do not deduce it from invalid essential uniqueness.

#### `newform-restriction` — Restriction of Speh newform line to Levi

Status: missing; Corollary9.10.

Conditional on repaired preceding proofs, restriction identifies W_Ze(sigma)^(K^(c_pi)) with the tensor over i of the generic K_(n,(0^(n-1),c_pi))-newform lines for pi|.|^((m+1-2i)(n-1)/2).

#### `essential-general` — General essential existence target

Status: missing; §9.3, existence part of Theorem9.1.

For every tempered pi, Ess(pi,m) is nonempty, constructed by normalized generic essential functions on the Levi and the newform restriction isomorphism. This is an existence claim only; the uniqueness claim is rejected pending independent review of E1.

#### `unramified-gcd` — Unramified partner GCD equality target

Status: missing; Remark8.8 and §9.3.

When pi' is unramified, the source obtains P_m(X)=product_(i=1..m)P_1(q^(m-i)X) from essential existence. Its analytic proof branch is presently conditional on repaired §9 existence.

#### `mirahoric` — Mirahoric representations

Status: missing; Remark2.6; Kondo–Yasuda [17], AppendixA.

Segments are tightly linked when linked and either nonunipotent or with nonempty intersection. L(m) is mirahoric if no pair in m is tightly linked; equivalently c_(pi^highest)=0, equivalently lambda_pi has at most one positive entry.

Use: Remark2.6: compare the older newvector class with the all-rank tuple.

API contracts:

- `Mirahoric.tightlyLinked` (characterisation): A linked pair is tightly linked iff it is nonunipotent or its intersection is nonempty.
- `Mirahoric.langlands_iff` (characterisation): L(m) is mirahoric iff no pair of segments of m is tightly linked.
- `Mirahoric.conductorTuple_iff` (compatibility): Mirahoric is equivalent to zero conductor of the highest derivative and to a tuple with at most one positive component.

Mathematical acceptance tests (not Lean-executed):

- L([0,1]_chi+[2,3]_chi) with chi unramified is mirahoric but not generic.
- Use L(m), not Z(m), for the no-tightly-linked test.
- For unramified chi, [0,1] and [1,2] overlap and are tightly linked; L of their sum is not mirahoric.

#### `fourier` — Nonarchimedean Schwartz–Bruhat Fourier interface

Status: planned; §7.1 and model-transition inputs.

Use compactly supported locally constant functions on finite-dimensional F-spaces, trace/additive pairing psi and compatible self-dual Haar measures; Fourier inversion includes reflection.

Existing stages: `AutomorphicLFunctionsAndLocalFactors:AL.0`.

Use: Section7.1: compute support of the transform of a row-depth coset.

API contracts:

- `LocalFourier.translate` (relation): Fourier transforming a translate by a multiplies the transform by the additive pairing with a, with the sign fixed by the chosen kernel.
- `LocalFourier.indicator_lattice` (simp): For an additive lattice L with self-dual measure, Fourier(1_L)=vol(L)1_(L-perp).
- `LocalFourier.inversion` (relation): Applying the self-dual Fourier transform twice gives f(-x).

Mathematical acceptance tests (not Lean-executed):

- For conductor-o psi, the annihilator of o is o.
- The trace pairing transposes row and column depth constraints.
- For a scalar lattice p^r, the annihilator is p^-r and the volume product vol(p^r)vol(p^-r)=1.

#### `classical-factors` — Classical local L, epsilon and gamma factors

Status: planned; §§1.2,7.1,8.3; [8],[14],[15].

Import Godement–Jacquet standard factors and JPSS Whittaker Rankin–Selberg factors, with rationality, normalized fractional ideals, functional equations and dependence on psi; gamma(s)=epsilon(s)L(1-s,dual)/L(s).

Existing stages: `AutomorphicLFunctionsAndLocalFactors:AL.2`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

Use: Sections1,7,8: import analytic local constants rather than reconstructing them.

API contracts:

- `LocalFactor.gamma_eq` (characterisation): gamma(s,pi,psi)=epsilon(s,pi,psi)L(1-s,dual pi)/L(s,pi), with the analogous pair formula.
- `LocalFactor.unramifiedTwist` (compatibility): Twisting by abs(det)^t shifts the standard factor from s to s+t and shifts the first argument of its epsilon factor accordingly.
- `LocalFactor.induction_product` (relation): The standard L and epsilon factors multiply for irreducible normalized parabolic products, with the standing local-field and character conventions.

Mathematical acceptance tests (not Lean-executed):

- GJ rank one agrees with Tate theory.
- Product denominator bounds do not alone prove equality with the gcd polynomial.
- If L(s,pi)=L(s,dual pi)=1, then gamma(s,pi,psi)=epsilon(s,pi,psi), the reduction used in the finite-slice functional equation.

#### `spherical` — Normalized spherical Whittaker functions

Status: planned; §8.5.

For a nonzero Satake multiset, use the normalized K-fixed Whittaker function of the unramified principal-series family. When the parameters have unit modulus, it specializes to the irreducible tempered spherical representation. An arbitrary unramified irreducible constituent can be nongeneric, so it need not itself have a Whittaker model.

Existing stages: `SmoothRepresentationsOfLocalGroups:SR.4`, `SmoothRepresentationsOfLocalGroups:SR.5`.

Use: Section8.5: normalize Whittaker functions on principal-series families.

API contracts:

- `SphericalWhittaker.value_one` (simp): The normalized K-fixed Whittaker function of the unramified principal-series family has value1 at identity.
- `SphericalWhittaker.satake_symmetric` (relation): Its value depends symmetrically on the nonzero Satake parameters, with the fixed inverse-psi convention.
- `SphericalWhittaker.tempered_specialization` (compatibility): For unit-modulus Satake parameters it belongs to the Whittaker model of the irreducible tempered spherical representation; arbitrary unramified constituents need not be generic.

Mathematical acceptance tests (not Lean-executed):

- Rank one W^0 is the unramified character.
- Repeated parameters must not collapse Weyl double-coset multiplicities.
- The trivial GL2 representation is unramified but nongeneric; it must not be assigned a nonzero generic Whittaker model merely because it is spherical.

#### `generic-newform` — Generic GL_n newform and essential Whittaker inputs

Status: missing; §§8–9; [14] with correction [13], also [26].

For generic irreducible pi of GL_n(F), the K_(n,(0^(n-1),c_pi))-fixed space is one-dimensional, lower conductor levels vanish, and normalized essential Whittaker functions give the classical unramified test integrals. The exact corrected JPSS theorem and normalization must be audited with Jacquet2012 before closure.

GL2 specialization is already owned by R16.2; general GL_n extension imports and compares it, without replanning the rank-two result.

#### `gl2-input` — Existing GL2 generic newvector theorem

Status: planned; Rank-two specialization of §1.2.

For generic irreducible GL2(F) representations, import the local conductor/newvector theorem planned by R16.2 and compare the row-depth (0,c) subgroup with its K1 convention.

Existing stages: `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

#### `nonunipotent-tuple` — L=1 multisegment tuple

Status: missing; Example2.5(1).

For pi=Z(sum Delta_i) with L(s,pi)=1, no Delta_i is unipotent and lambda_pi is the sum of padded tails c_rho_i repeated length(Delta_i); c_rho_i>0.

#### `weighted-grading` — Existing weighted multivariate polynomial grading

Status: library; Mathlib/RingTheory/MvPolynomial/WeightedHomogeneous.lean:128–149,173–182,677–706.

For a commutative semiring R, any variable set sigma and weight w:sigma→M to a decidable additive commutative monoid, MvPolynomial sigma R decomposes into its weighted homogeneous submodules as a graded algebra. Apply to positive natural variables over Z with weight i; no finiteness of the variable set is required.

Pinned declarations: `mathlib:MvPolynomial.weightedHomogeneousSubmodule`, `mathlib:MvPolynomial.weightedHomogeneousSubmodule_mul`, `mathlib:MvPolynomial.weightedDecomposition`, `mathlib:MvPolynomial.weightedGradedAlgebra`.

#### `baer-extension` — Existing Baer extension criterion

Status: library; Mathlib/Algebra/Module/Injective.lean:68–72,384–403.

For a ring R and R-module Q satisfying Module.Baer R Q, every linear map M→Q extends along every injective linear map M→N. In particular Q is injective.

Pinned declarations: `mathlib:Module.Baer.extension_property`, `mathlib:Module.Baer.injective`.

#### `jacobson-criterion` — Existing noncommutative Jacobson membership criterion

Status: library; Mathlib/RingTheory/Jacobson/Ideal.lean:59–65,99–115.

For any ring R and left ideal I, x belongs to I.jacobson iff for every y there exists z such that z*y*x+z-1 belongs to I. This statement does not assume commutativity.

Pinned declarations: `mathlib:Ideal.mem_jacobson_iff`.

#### `nilpotent-unit` — Existing geometric inverse for a nilpotent element

Status: library; Mathlib/RingTheory/Nilpotent/Basic.lean:64–81.

For any ring R, if r is nilpotent then 1+r is a unit; its inverse is the finite alternating geometric sum through any vanishing power. No commutativity assumption on R is needed.

Pinned declarations: `mathlib:IsNilpotent.isUnit_add_one`, `mathlib:IsNilpotent.isUnit_one_add`.

#### `nakayama-surjection` — Existing surjectivity form of Nakayama

Status: library; Mathlib/RingTheory/Nakayama.lean:45–49,229–235.

For commutative R, an R-linear f:M→N with N finitely generated, and I contained in the Jacobson radical, surjectivity after composing with N→N/IN implies surjectivity of f.

Pinned declarations: `mathlib:LinearMap.surjective_of_surjective_comp_mkQ`.

#### `dvr-sequence-unique` — Intrinsic uniqueness of the finite-DVR sequence

Status: missing; Section4.1 classification input; continuation proof from cyclic decomposition.

For a DVR o with residue field k and finite-length M, put r_j=dim_k(p^(j-1)M/p^jM) for j>=1. In any cyclic decomposition r_j counts the exponents at least j. Hence multiplicity of exponent j is r_j-r_(j+1), the minimal number of generators is r_1, and the unique ascending n-term sequence is obtained by padding with n-r_1 zeros.

Proof route:

1. Use the pinned PID decomposition and the fact that all irreducibles of a DVR generate its maximal ideal.
2. Compute the jth quotient of o/p^a: it is k for j<=a and zero otherwise. Finite direct sums preserve this quotient.
3. Subtract successive layer dimensions to recover every positive exponent multiplicity. Nakayama identifies r_1 with the minimal generator number; padding recovers the zero entries.

#### `fraction-quotient-injective` — Injectivity of the fraction-field quotient over a PID

Status: missing; Input to Lemma4.3(1); continuation Baer proof.

For a PID o with fraction field F, the o-module F/o is injective. Consequently restriction Hom_o(M,F/o)→Hom_o(N,F/o) is surjective for every injection N→M, without a finite-length hypothesis.

Proof route:

1. For nonzero a in o, multiplication by a on F/o is surjective: the class of z/a maps to the class of z.
2. For an ideal (a) and a map g:(a)→F/o, choose y with ay=g(a), and extend by r↦ry. For a=0 use the zero map. The PID domain hypothesis makes the prescription on (a) well-defined.
3. Apply Module.Baer.extension_property or Module.Baer.injective.

#### `dvr-dual-exact` — Exactness and biduality for finite-DVR duals

Status: missing; Lemmas4.2–4.3 and duality use in Proposition4.4; continuation proof.

Over a DVR o with fraction field F, Hom_o(-,F/o) is exact contravariantly on finite-length modules; the evaluation M→Hom_o(Hom_o(M,F/o),F/o) is a natural isomorphism. It preserves finite length and cyclic exponents.

Proof route:

1. Left exactness of Hom gives the kernel identity; fraction-quotient injectivity supplies surjectivity at the right end.
2. For o/p^a, evaluation at1 identifies its dual with p^-a o/o; evaluating twice is a perfect cyclic pairing.
3. Finite cyclic decomposition extends biduality and length preservation to M; naturality follows directly from evaluation and precomposition.

#### `spherical-collision` — A second eigenfunction at coincident GL2 parameters

Status: missing; Published Lemma8.10 p47; arXiv v4 p51; worker continuation argument E3.

In the n=m=2 primed setup, fix x nonzero and write g=n diag(varpi^a,varpi^b)k. Set F(g)=q^(-(a-b)/2)x^(a+b) and H(g)=(a-b)F(g). Both are smooth left-N-invariant right-K-invariant Hecke eigenfunctions with the same Satake character (x,x). They are linearly independent since F(1)=1,H(1)=0,H(diag(varpi,1))=q^-1/2 x. The single formal assignment (x,x) spans only F, refuting the literal Lemma8.10 spanning assertion in this specialization.

Proof route:

1. Use the family F_t(g)=q^(-(a-b)/2)x^(a+b)exp(t(a-b)), exactly the formal W_Ze^0(x exp(t),x exp(-t)) of Section8.5. Iwasawa torus valuations are well-defined on N\G/K.
2. Every compactly supported spherical Hecke operator acts on this family by its symmetric Satake eigenvalue lambda_t. Symmetry gives lambda_t=lambda_-t and lambda_prime(0)=0. Its action is a finite sum on right-K-fixed functions, so differentiate termwise.
3. H=dF_t/dt at0 therefore has the same eigenvalue as F. The identity and diag(varpi,1) values prove independence. Alternatively for T=1_(K diag(varpi,1) K), use q F(a+1,b)+F(a,b+1)=2 sqrt(q)x F(a,b), and the same equation for H; the central generator acts by x^2.

#### `essential-infinite-kernel` — Infinite-dimensional common kernel in the rank-two Speh test

Status: missing; Theorem9.1 obstruction E1; continuation of essential-kernel.

For n=m=2 and tempered pi on GL2, the common kernel of all essential test integrals on right-iota(Kprime)-fixed Shalika vectors is infinite-dimensional. For r>=1 put u_r=I+varpi^-r E12 and f_r=1_(u_rKprime)-1_Kprime. Every finite collection has linearly independent restrictions, and each has a model lift after right averaging.

Proof route:

1. For r≠s, varpi^-r-varpi^-s has negative valuation; u_rKprime,u_sKprime,Kprime are pairwise disjoint. Evaluation on these cosets proves linear independence.
2. Each f_r pairs to zero with every left-Nprime-invariant test and determinant weight by left translation with u_r.
3. The Lapid–Mao compact-induction inclusion lifts each f_r and averaging over iota(Kprime) preserves it. Any linear relation of lifts restricts to a relation of the f_r.

#### `nonzero-level-escape` — Uniform escape of nonunits at nonzero row depth

Status: missing; Repair of support-escape step in Lemma7.1.

Let lambda≠0 and C⊂GL_n(F) be compact. There is B(C,lambda) such that for z central and g∈C with zg∈X_lambda, the determinant valuation v(det(zg))<=B. Thus X_lambda with determinant valuation tending to infinity escapes every compact subset modulo the center.

Proof route:

1. Choose i with lambda_i>0. Then (zg)_ii belongs to 1+p, so v(z)+v(g_ii)=0.
2. On compact C, every matrix entry has valuation bounded below, so v(z) is bounded above whenever zg belongs to X_lambda.
3. The continuous nonzero determinant on C has valuation bounded above. Hence n v(z)+v(det g) has a uniform upper bound. A compact-mod-center support can be represented by ZC.

### Validation and handoff

Six fresh exact-arithmetic diagnostic groups pass:

- GL2 collision eigenfunction: 648 cases. Exact spherical-generator and central-generator recurrences for q=4,9 and x=2,3/2; analytic family proof is in report.
- GL4 character mismatch: 9 cases. Conjugation creates tb E12, changing the designated character when psi(tb) is nontrivial.
- Independent unipotent cosets: 84 cases. Finite r<=8 examples of the valuation argument; infinite independence proved in report.
- DVR layer-rank reconstruction: 126 cases. All ascending length4 exponent lists with entries0..5.
- Equal-rank free-surjection equivalence: 2610 cases. Exhaustive primitive-row orbits over Z/4 and Z/8; general residue-matrix proof supplied separately.
- Determinant-slice reflection: 189 cases. Exact correction q^(-md)X^-d.

The old permutation/finite-subgroup diagnostics remain prior-checkpoint evidence; this continuation does not claim to have rerun their unsupplied scripts. The six fresh groups above support examples and expose normalization mistakes; they are not formal proofs of the general statements.

The current paper checker and authorized-path intake check pass with zero problems. Item/route references, definition API/test coverage, all464 input hashes and the302-edge prerequisite DAG also pass. No Lean deliverable is requested, and no Lean compilation is claimed.

- **G1 (critical):** Independent verification of E1 and a replacement for the failed separation/uniqueness chain. Main newform targets are not disproved merely by this defect. Do not paper over it with a stronger unproved uniqueness axiom.
- **G2 (high):** Finish exact cited-input readings: KZ/MW generic duality and path formula, Lapid–Mínguez determinant/constituents, and corrected JPSS/Matringe essential functions. This checkpoint is not a proof-closed extraction of those papers.
- **G3 (high):** Finish Lapid–Mao root-exchange/support/convergence closure. The exact compact-induction hypotheses used by E1 have now been reread and matched; the full source and its own cited prerequisites remain unextracted.
- **G4 (high):** Replace the false all-parameter Lemma8.10, using a correctly proved generic statement and, if needed, confluent spherical functions at repeated parameters. The continuation gives an explicit counterexample. Lemma9.3 still needs a genuine direct-integral multiplicity/domain argument and cannot be applied to all Speh restrictions.
- **G5 (medium):** Every one of the42 definition items now has three named role/statement API contracts, use records and three tests. Split remaining bundled notions and multi-part cited suppliers, promote every consumed nontrivial API lemma to a theorem node, and finish all theorem proof outlines before declaring recursive closure.
- **G6 (medium):** The weighted grading, Baer extension, Nakayama surjectivity, nilpotent inverse and noncommutative Jacobson criterion are now direct pinned-library credits. Explicit proofs supply DVR exponent uniqueness, exact F/o duality and equal-rank free-cover equivalence. Remaining work is the complete declaration-level audit and adapters for these assemblies, plus recursive closure of the rest of the paper.
- **G7 (medium):** The continuation refreshed464 input blobs and screened122 peer paper route inventories; existing candidate identities are retained. Before design activation refresh again and give shared ring/module and generic representation ingredients their finest existing supplier nodes.

Resume with independent review of the two explicit counterexamples and a valid replacement analytic proof. Then extract the KZ/MW, Lapid–Mínguez and corrected JPSS/Matringe inputs to the same statement depth. A schema pass is not mathematical closure.

## Review (REV-PAPER-ATOBE-KONDO-YASUDA-22, 23 September 2026)

An independent review by Claude Code, session cc-d67081, for issue
[#1396](https://github.com/CBirkbeck/tauceti-explorer/issues/1396). **Verdict: accept.**
No item, status or route changed.

- **Mistakes: 18 of 19 confirmed, 1 rejected.** E3 is rejected: its claimed second Hecke
  eigenfunction `h_k = k·q^{−k/2}x^k` satisfies the interior recursion `c_{k+1} = 2c_k −
  c_{k−1}` but violates the boundary condition `w_{−1} = 0` — it is exactly the solution the
  Whittaker support condition excludes, which is why the eigenspace is one-dimensional, as
  Lemma 8.10 says. Its alternative route also fails, the family `W^0(xe^t, xe^{−t})` being
  even in `t`.
- **Two findings amended.** E13's appeal to "the flawed Lemma 8.10 argument" is withdrawn.
  E19's flat assertion that "the uniqueness itself is false" is softened to a statement about
  the printed proof, matching E19's own reason field.
- **E1/E19 confirmed at the level of the proof**, on the page image: Corollary 9.4,
  Propositions 9.5–9.6 and the uniqueness of Theorem 9.1 all run through one step on p. 50
  justified only by measure-invariance, and `(1+tE₁₃)(1+bE₃₂)(1−tE₁₃) = 1 + bE₃₂ + tbE₁₂`
  shows `Ψ` is not preserved.
- **E2 confirmed more strongly than recorded:** for `λ = 0` the defining congruence is
  vacuous, so `X_0 = M_n(o)` and central scaling puts *all* of `G_n` in every
  `Z_n X_0^{≥m}` — for every `n`.
- **Provenance corrected:** the published PDF's `sha256` is **not reproducible** — Cambridge
  stamps each download, and two downloads eleven seconds apart gave different hashes. The
  arXiv hash was re-verified byte for byte, and a reproducible stamp-stripped text hash
  (`c8beb4ee…1866`) was recorded.
- **Items and routes:** 8 library citations read at the pinned commits, 10 planned items
  resolving, 143 missing items routed exactly once, four Part II titles exact prefix
  extensions with free names. Run-together numbering repaired in 295 places.

Full report: `research/blueprint/reviews/REV-PAPER-ATOBE-KONDO-YASUDA-22.md`.
